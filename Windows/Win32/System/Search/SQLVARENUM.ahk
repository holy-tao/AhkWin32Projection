#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct SQLVARENUM {
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
    static VT_SS_EMPTY => 0

    /**
     * @type {Integer (Int32)}
     */
    static VT_SS_NULL => 1

    /**
     * @type {Integer (Int32)}
     */
    static VT_SS_UI1 => 17

    /**
     * @type {Integer (Int32)}
     */
    static VT_SS_I2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static VT_SS_I4 => 3

    /**
     * @type {Integer (Int32)}
     */
    static VT_SS_I8 => 20

    /**
     * @type {Integer (Int32)}
     */
    static VT_SS_R4 => 4

    /**
     * @type {Integer (Int32)}
     */
    static VT_SS_R8 => 5

    /**
     * @type {Integer (Int32)}
     */
    static VT_SS_MONEY => 6

    /**
     * @type {Integer (Int32)}
     */
    static VT_SS_SMALLMONEY => 200

    /**
     * @type {Integer (Int32)}
     */
    static VT_SS_WSTRING => 201

    /**
     * @type {Integer (Int32)}
     */
    static VT_SS_WVARSTRING => 202

    /**
     * @type {Integer (Int32)}
     */
    static VT_SS_STRING => 203

    /**
     * @type {Integer (Int32)}
     */
    static VT_SS_VARSTRING => 204

    /**
     * @type {Integer (Int32)}
     */
    static VT_SS_BIT => 11

    /**
     * @type {Integer (Int32)}
     */
    static VT_SS_GUID => 72

    /**
     * @type {Integer (Int32)}
     */
    static VT_SS_NUMERIC => 131

    /**
     * @type {Integer (Int32)}
     */
    static VT_SS_DECIMAL => 205

    /**
     * @type {Integer (Int32)}
     */
    static VT_SS_DATETIME => 135

    /**
     * @type {Integer (Int32)}
     */
    static VT_SS_SMALLDATETIME => 206

    /**
     * @type {Integer (Int32)}
     */
    static VT_SS_BINARY => 207

    /**
     * @type {Integer (Int32)}
     */
    static VT_SS_VARBINARY => 208

    /**
     * @type {Integer (Int32)}
     */
    static VT_SS_UNKNOWN => 209
}
