#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com
 */
class URI_CREATE_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: Uri_CREATE_ALLOW_RELATIVE
     * @type {Integer (UInt32)}
     */
    static ALLOW_RELATIVE => 1

    /**
     * Native name: Uri_CREATE_ALLOW_IMPLICIT_WILDCARD_SCHEME
     * @type {Integer (UInt32)}
     */
    static ALLOW_IMPLICIT_WILDCARD_SCHEME => 2

    /**
     * Native name: Uri_CREATE_ALLOW_IMPLICIT_FILE_SCHEME
     * @type {Integer (UInt32)}
     */
    static ALLOW_IMPLICIT_FILE_SCHEME => 4

    /**
     * Native name: Uri_CREATE_NOFRAG
     * @type {Integer (UInt32)}
     */
    static NOFRAG => 8

    /**
     * Native name: Uri_CREATE_NO_CANONICALIZE
     * @type {Integer (UInt32)}
     */
    static NO_CANONICALIZE => 16

    /**
     * Native name: Uri_CREATE_CANONICALIZE
     * @type {Integer (UInt32)}
     */
    static CANONICALIZE => 256

    /**
     * Native name: Uri_CREATE_FILE_USE_DOS_PATH
     * @type {Integer (UInt32)}
     */
    static FILE_USE_DOS_PATH => 32

    /**
     * Native name: Uri_CREATE_DECODE_EXTRA_INFO
     * @type {Integer (UInt32)}
     */
    static DECODE_EXTRA_INFO => 64

    /**
     * Native name: Uri_CREATE_NO_DECODE_EXTRA_INFO
     * @type {Integer (UInt32)}
     */
    static NO_DECODE_EXTRA_INFO => 128

    /**
     * Native name: Uri_CREATE_CRACK_UNKNOWN_SCHEMES
     * @type {Integer (UInt32)}
     */
    static CRACK_UNKNOWN_SCHEMES => 512

    /**
     * Native name: Uri_CREATE_NO_CRACK_UNKNOWN_SCHEMES
     * @type {Integer (UInt32)}
     */
    static NO_CRACK_UNKNOWN_SCHEMES => 1024

    /**
     * Native name: Uri_CREATE_PRE_PROCESS_HTML_URI
     * @type {Integer (UInt32)}
     */
    static PRE_PROCESS_HTML_URI => 2048

    /**
     * Native name: Uri_CREATE_NO_PRE_PROCESS_HTML_URI
     * @type {Integer (UInt32)}
     */
    static NO_PRE_PROCESS_HTML_URI => 4096

    /**
     * Native name: Uri_CREATE_IE_SETTINGS
     * @type {Integer (UInt32)}
     */
    static IE_SETTINGS => 8192

    /**
     * Native name: Uri_CREATE_NO_IE_SETTINGS
     * @type {Integer (UInt32)}
     */
    static NO_IE_SETTINGS => 16384

    /**
     * Native name: Uri_CREATE_NO_ENCODE_FORBIDDEN_CHARACTERS
     * @type {Integer (UInt32)}
     */
    static NO_ENCODE_FORBIDDEN_CHARACTERS => 32768

    /**
     * Native name: Uri_CREATE_NORMALIZE_INTL_CHARACTERS
     * @type {Integer (UInt32)}
     */
    static NORMALIZE_INTL_CHARACTERS => 65536

    /**
     * Native name: Uri_CREATE_CANONICALIZE_ABSOLUTE
     * @type {Integer (UInt32)}
     */
    static CANONICALIZE_ABSOLUTE => 131072
}
