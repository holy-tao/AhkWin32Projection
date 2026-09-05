#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
class BINDSTRING extends Win32Enum {

    /**
     * Native name: BINDSTRING_HEADERS
     * @type {Integer (Int32)}
     */
    static HEADERS => 1

    /**
     * Native name: BINDSTRING_ACCEPT_MIMES
     * @type {Integer (Int32)}
     */
    static ACCEPT_MIMES => 2

    /**
     * Native name: BINDSTRING_EXTRA_URL
     * @type {Integer (Int32)}
     */
    static EXTRA_URL => 3

    /**
     * Native name: BINDSTRING_LANGUAGE
     * @type {Integer (Int32)}
     */
    static LANGUAGE => 4

    /**
     * Native name: BINDSTRING_USERNAME
     * @type {Integer (Int32)}
     */
    static USERNAME => 5

    /**
     * Native name: BINDSTRING_PASSWORD
     * @type {Integer (Int32)}
     */
    static PASSWORD => 6

    /**
     * Native name: BINDSTRING_UA_PIXELS
     * @type {Integer (Int32)}
     */
    static UA_PIXELS => 7

    /**
     * Native name: BINDSTRING_UA_COLOR
     * @type {Integer (Int32)}
     */
    static UA_COLOR => 8

    /**
     * Native name: BINDSTRING_OS
     * @type {Integer (Int32)}
     */
    static OS => 9

    /**
     * Native name: BINDSTRING_USER_AGENT
     * @type {Integer (Int32)}
     */
    static USER_AGENT => 10

    /**
     * Native name: BINDSTRING_ACCEPT_ENCODINGS
     * @type {Integer (Int32)}
     */
    static ACCEPT_ENCODINGS => 11

    /**
     * Native name: BINDSTRING_POST_COOKIE
     * @type {Integer (Int32)}
     */
    static POST_COOKIE => 12

    /**
     * Native name: BINDSTRING_POST_DATA_MIME
     * @type {Integer (Int32)}
     */
    static POST_DATA_MIME => 13

    /**
     * Native name: BINDSTRING_URL
     * @type {Integer (Int32)}
     */
    static URL => 14

    /**
     * Native name: BINDSTRING_IID
     * @type {Integer (Int32)}
     */
    static IID => 15

    /**
     * Native name: BINDSTRING_FLAG_BIND_TO_OBJECT
     * @type {Integer (Int32)}
     */
    static FLAG_BIND_TO_OBJECT => 16

    /**
     * Native name: BINDSTRING_PTR_BIND_CONTEXT
     * @type {Integer (Int32)}
     */
    static PTR_BIND_CONTEXT => 17

    /**
     * Native name: BINDSTRING_XDR_ORIGIN
     * @type {Integer (Int32)}
     */
    static XDR_ORIGIN => 18

    /**
     * Native name: BINDSTRING_DOWNLOADPATH
     * @type {Integer (Int32)}
     */
    static DOWNLOADPATH => 19

    /**
     * Native name: BINDSTRING_ROOTDOC_URL
     * @type {Integer (Int32)}
     */
    static ROOTDOC_URL => 20

    /**
     * Native name: BINDSTRING_INITIAL_FILENAME
     * @type {Integer (Int32)}
     */
    static INITIAL_FILENAME => 21

    /**
     * Native name: BINDSTRING_PROXY_USERNAME
     * @type {Integer (Int32)}
     */
    static PROXY_USERNAME => 22

    /**
     * Native name: BINDSTRING_PROXY_PASSWORD
     * @type {Integer (Int32)}
     */
    static PROXY_PASSWORD => 23

    /**
     * Native name: BINDSTRING_ENTERPRISE_ID
     * @type {Integer (Int32)}
     */
    static ENTERPRISE_ID => 24

    /**
     * Native name: BINDSTRING_DOC_URL
     * @type {Integer (Int32)}
     */
    static DOC_URL => 25

    /**
     * Native name: BINDSTRING_SAMESITE_COOKIE_LEVEL
     * @type {Integer (Int32)}
     */
    static SAMESITE_COOKIE_LEVEL => 26
}
