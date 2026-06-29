#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct PARSEACTION {
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
    static PARSE_CANONICALIZE => 1

    /**
     * @type {Integer (Int32)}
     */
    static PARSE_FRIENDLY => 2

    /**
     * @type {Integer (Int32)}
     */
    static PARSE_SECURITY_URL => 3

    /**
     * @type {Integer (Int32)}
     */
    static PARSE_ROOTDOCUMENT => 4

    /**
     * @type {Integer (Int32)}
     */
    static PARSE_DOCUMENT => 5

    /**
     * @type {Integer (Int32)}
     */
    static PARSE_ANCHOR => 6

    /**
     * @type {Integer (Int32)}
     */
    static PARSE_ENCODE_IS_UNESCAPE => 7

    /**
     * @type {Integer (Int32)}
     */
    static PARSE_DECODE_IS_ESCAPE => 8

    /**
     * @type {Integer (Int32)}
     */
    static PARSE_PATH_FROM_URL => 9

    /**
     * @type {Integer (Int32)}
     */
    static PARSE_URL_FROM_PATH => 10

    /**
     * @type {Integer (Int32)}
     */
    static PARSE_MIME => 11

    /**
     * @type {Integer (Int32)}
     */
    static PARSE_SERVER => 12

    /**
     * @type {Integer (Int32)}
     */
    static PARSE_SCHEMA => 13

    /**
     * @type {Integer (Int32)}
     */
    static PARSE_SITE => 14

    /**
     * @type {Integer (Int32)}
     */
    static PARSE_DOMAIN => 15

    /**
     * @type {Integer (Int32)}
     */
    static PARSE_LOCATION => 16

    /**
     * @type {Integer (Int32)}
     */
    static PARSE_SECURITY_DOMAIN => 17

    /**
     * @type {Integer (Int32)}
     */
    static PARSE_ESCAPE => 18

    /**
     * @type {Integer (Int32)}
     */
    static PARSE_UNESCAPE => 19
}
