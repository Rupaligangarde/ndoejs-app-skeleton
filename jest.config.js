module.exports = {
    "jest": {
        "testPathIgnorePatterns": [
            "<rootDir>/node_modules/",
            "<rootDir>/dist/"
        ],
        "collectCoverage": true,
        "coverageReporters": [
            "html",
            "text"
        ],
        "verbose": true,
        "coverageThreshold": {
            "global": {
                "statements": 100,
                "branches": 100,
                "functions": 100,
                "lines": 100
            }
        }
    }
};