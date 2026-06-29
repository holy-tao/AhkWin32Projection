#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct BINDSTRING {
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
    static BINDSTRING_HEADERS => 1

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTRING_ACCEPT_MIMES => 2

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTRING_EXTRA_URL => 3

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTRING_LANGUAGE => 4

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTRING_USERNAME => 5

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTRING_PASSWORD => 6

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTRING_UA_PIXELS => 7

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTRING_UA_COLOR => 8

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTRING_OS => 9

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTRING_USER_AGENT => 10

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTRING_ACCEPT_ENCODINGS => 11

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTRING_POST_COOKIE => 12

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTRING_POST_DATA_MIME => 13

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTRING_URL => 14

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTRING_IID => 15

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTRING_FLAG_BIND_TO_OBJECT => 16

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTRING_PTR_BIND_CONTEXT => 17

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTRING_XDR_ORIGIN => 18

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTRING_DOWNLOADPATH => 19

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTRING_ROOTDOC_URL => 20

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTRING_INITIAL_FILENAME => 21

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTRING_PROXY_USERNAME => 22

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTRING_PROXY_PASSWORD => 23

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTRING_ENTERPRISE_ID => 24

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTRING_DOC_URL => 25

    /**
     * @type {Integer (Int32)}
     */
    static BINDSTRING_SAMESITE_COOKIE_LEVEL => 26
}
