const eslintPluginPrettierRecommended = require('eslint-plugin-prettier/recommended');

module.exports = [
    // Any other config imports go at the top

    // Customize ESLint configuration
    {
        ...eslintPluginPrettierRecommended,

        // Add your own rules or override existing ones
        rules: {
            // Example rule: Allow console statements
            'no-console': 'off',

            // Add your own rules here
            // ...

            // Set the indentation width to 4 spaces
            indent: [
                'warn',
                4,
                {
                    // Specify indentation for different constructs
                    SwitchCase: 1,
                    VariableDeclarator: 'first',
                    MemberExpression: 1,
                    FunctionDeclaration: { parameters: 'first' },
                    FunctionExpression: { parameters: 'first' },
                    CallExpression: { arguments: 'first' },
                    ArrayExpression: 'first',
                    ObjectExpression: 'first',
                    ImportDeclaration: 'first',
                    flatTernaryExpressions: false,
                },
            ],

            // Additional rules can be added here
        },
    },
];

