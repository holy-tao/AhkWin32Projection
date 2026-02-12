#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Documentation varies per use. Refer to each: <see href="https://learn.microsoft.com/windows/win32/api//content/memoryapi/nf-memoryapi-mapviewoffile">MapViewOfFile</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/memoryapi/nf-memoryapi-mapviewoffileex">MapViewOfFileEx</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-mapviewoffileexnuma">MapViewOfFileExNuma</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/memoryapi/nf-memoryapi-mapviewoffilefromapp">MapViewOfFileFromApp</see>.
 * @see 
 * @namespace Windows.Win32.System.Memory
 * @version v4.0.30319
 */
class FILE_MAP extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_MAP_WRITE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_MAP_READ => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_MAP_ALL_ACCESS => 983071

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_MAP_EXECUTE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_MAP_COPY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_MAP_RESERVE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_MAP_TARGETS_INVALID => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_MAP_LARGE_PAGES => 536870912
}
