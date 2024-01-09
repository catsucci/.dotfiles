# Mounting a USB

Run the following command to see your device and it's file type:

```bash
sudo parted -l
```

If ntfs, Install:

```bash
sudo pacman -S ntfs-3g
```

Then Run:

```bash
sudo mount /dev/sda1 ~/mnt/my_usb/
```

To unmount run the following command:

```bash
sudo umount ~/mnt/my_usb/```
