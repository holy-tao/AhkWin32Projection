#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class GOPHER_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_TYPE_ASK => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_TYPE_BINARY => 512

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_TYPE_BITMAP => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_TYPE_CALENDAR => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_TYPE_CSO => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_TYPE_DIRECTORY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_TYPE_DOS_ARCHIVE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_TYPE_ERROR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_TYPE_GIF => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_TYPE_GOPHER_PLUS => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_TYPE_HTML => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_TYPE_IMAGE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_TYPE_INDEX_SERVER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_TYPE_INLINE => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_TYPE_MAC_BINHEX => 16

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_TYPE_MOVIE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_TYPE_PDF => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_TYPE_REDUNDANT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_TYPE_SOUND => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_TYPE_TELNET => 256

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_TYPE_TEXT_FILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_TYPE_TN3270 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_TYPE_UNIX_UUENCODED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static GOPHER_TYPE_UNKNOWN => 536870912
}
