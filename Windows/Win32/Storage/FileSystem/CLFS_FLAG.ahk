#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Documentation varies per use. Refer to each: <see href="https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-reserveandappendlog">ReserveAndAppendLog</see>, <see href="https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-reserveandappendlogaligned">ReserveAndAppendLogAligned</see>.
 * @see 
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CLFS_FLAG extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static CLFS_FLAG_FORCE_APPEND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLFS_FLAG_FORCE_FLUSH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CLFS_FLAG_NO_FLAGS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CLFS_FLAG_USE_RESERVATION => 4
}
