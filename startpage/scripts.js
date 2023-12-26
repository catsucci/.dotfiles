/* eslint-disable no-undef */
/* eslint-disable no-unused-vars */

/**
 * Search function
 */

const searchInput = document.querySelector("#searchbar > input")
const searchButton = document.querySelector("#searchbar > button")

const lookup = {"/":"/","deepl":"https://deepl.com/","reddit":"https://reddit.com/","maps":"https://maps.google.com/"}
const engine = "duckduckgo"
const engineUrls = {
  deepl: "https://www.deepl.com/translator#-/-/{query}",
  duckduckgo: "https://duckduckgo.com/?q={query}",
  ecosia: "https://www.ecosia.org/search?q={query}",
  google: "https://www.google.com/search?q={query}",
  startpage: "https://www.startpage.com/search?q={query}",
  youtube: "https://www.youtube.com/results?q={query}",
}

const isWebUrl = value => {
  try {
    const url = new URL(value)
    return url.protocol === "http:" || url.protocol === "https:"
  } catch {
    return false
  }
}

const getTargetUrl = value => {
  if (isWebUrl(value)) return value
  if (lookup[value]) return lookup[value]
  const url = engineUrls[engine] ?? engine
  return url.replace("{query}", value)
}

const search = () => {
  const value = searchInput.value
  const targetUrl = getTargetUrl(value)
  window.open(targetUrl, "_self")
}

searchInput.onkeyup = event => event.key === "Enter" && search()
searchButton.onclick = search

/**
 * inject bookmarks into html
 */

const bookmarks = [{"id":"ECMIpL8cxzmPVHBZ","label":"Arch","bookmarks":[{"id":"1gKcIIwUJ2lD0Y4G","label":"website","url":"https://archlinux.org/"},{"id":"eJnabeBOAT2SP414","label":"Wiki","url":"https://wiki.archlinux.org/"},{"id":"YoQLjmBPArO1VFqh","label":"Packages","url":"https://archlinux.org/packages/"}]},{"id":"YWG3lCn5WMV5Epma","label":"Navigation","bookmarks":[{"id":"srV2C1d2jxDuA1DB","label":"Github","url":"https://github.com/catsucci/"},{"id":"yRrPHICSBvJh2bXf","label":"Youtube","url":"https://www.youtube.com/"},{"id":"isXo4nS0tIfAZspE","label":"ChatGPT","url":"https://chat.openai.com/"}]},{"id":"PXZwvsN5pi3t0iOq","label":"Contact","bookmarks":[{"id":"SVR8bHBxJiXg0Old","label":"Skiff","url":"https://app.skiff.com/mail/inbox"},{"id":"1ixloGU2PfOi3tgl","label":"WhatsApp","url":"https://web.whatsapp.com/"},{"id":"TjYODD2fw3VpYTXW","label":"Gmail","url":"https://mail.google.com/mail/u/0/#inbox"}]},{"id":"cBn8NHlnmZhAoMpx","label":"Fun","bookmarks":[{"id":"4RhhbhSE9aTNvuDm","label":"Discord","url":"https://discord.com/channels/@me"},{"id":"57aO4Qh8aoxnePlv","label":"Pinterest","url":"https://www.pinterest.com/"},{"id":"9WGJTZpEWJJYfzes","label":"Twitch","url":"https://www.twitch.tv/"}]}]

const createGroupContainer = () => {
  const container = document.createElement("div")
  container.className = "bookmark-group"
  return container
}

const createGroupTitle = title => {
  const h2 = document.createElement("h2")
  h2.innerHTML = title
  return h2
}

const createBookmark = ({ label, url }) => {
  const li = document.createElement("li")
  const a = document.createElement("a")
  a.href = url
  a.innerHTML = label
  li.append(a)
  return li
}

const createBookmarkList = bookmarks => {
  const ul = document.createElement("ul")
  bookmarks.map(createBookmark).forEach(li => ul.append(li))
  return ul
}

const createGroup = ({ label, bookmarks }) => {
  const container = createGroupContainer()
  const title = createGroupTitle(label)
  const bookmarkList = createBookmarkList(bookmarks)
  container.append(title)
  container.append(bookmarkList)
  return container
}

const injectBookmarks = () => {
  const bookmarksContainer = document.getElementById("bookmarks")
  bookmarksContainer.append()
  bookmarks.map(createGroup).forEach(group => bookmarksContainer.append(group))
}

injectBookmarks()
