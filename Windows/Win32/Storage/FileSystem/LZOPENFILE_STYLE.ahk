#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class LZOPENFILE_STYLE extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt16)}
     */
    static OF_CANCEL => 2048

    /**
     * @type {Integer (UInt16)}
     */
    static OF_CREATE => 4096

    /**
     * @type {Integer (UInt16)}
     */
    static OF_DELETE => 512

    /**
     * @type {Integer (UInt16)}
     */
    static OF_EXIST => 16384

    /**
     * @type {Integer (UInt16)}
     */
    static OF_PARSE => 256

    /**
     * @type {Integer (UInt16)}
     */
    static OF_PROMPT => 8192

    /**
     * @type {Integer (UInt16)}
     */
    static OF_READ => 0

    /**
     * @type {Integer (UInt16)}
     */
    static OF_READWRITE => 2

    /**
     * @type {Integer (UInt16)}
     */
    static OF_REOPEN => 32768

    /**
     * @type {Integer (UInt16)}
     */
    static OF_SHARE_DENY_NONE => 64

    /**
     * @type {Integer (UInt16)}
     */
    static OF_SHARE_DENY_READ => 48

    /**
     * @type {Integer (UInt16)}
     */
    static OF_SHARE_DENY_WRITE => 32

    /**
     * @type {Integer (UInt16)}
     */
    static OF_SHARE_EXCLUSIVE => 16

    /**
     * @type {Integer (UInt16)}
     */
    static OF_WRITE => 1

    /**
     * @type {Integer (UInt16)}
     */
    static OF_SHARE_COMPAT => 0

    /**
     * @type {Integer (UInt16)}
     */
    static OF_VERIFY => 1024
}
