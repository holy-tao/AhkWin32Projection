#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DBLITERALENUM20 {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static DBLITERAL_CUBE_NAME => 21

    /**
     * @type {Integer (Int32)}
     */
    static DBLITERAL_DIMENSION_NAME => 22

    /**
     * @type {Integer (Int32)}
     */
    static DBLITERAL_HIERARCHY_NAME => 23

    /**
     * @type {Integer (Int32)}
     */
    static DBLITERAL_LEVEL_NAME => 24

    /**
     * @type {Integer (Int32)}
     */
    static DBLITERAL_MEMBER_NAME => 25

    /**
     * @type {Integer (Int32)}
     */
    static DBLITERAL_PROPERTY_NAME => 26

    /**
     * @type {Integer (Int32)}
     */
    static DBLITERAL_SCHEMA_SEPARATOR => 27

    /**
     * @type {Integer (Int32)}
     */
    static DBLITERAL_QUOTE_SUFFIX => 28
}
