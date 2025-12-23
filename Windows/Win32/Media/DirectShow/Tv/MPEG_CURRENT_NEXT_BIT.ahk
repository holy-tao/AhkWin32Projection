#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * The MPEG_CURRENT_NEXT_BIT enumeration type specifies the value of the current_next_indicator bit.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ne-mpeg2structs-mpeg_current_next_bit
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class MPEG_CURRENT_NEXT_BIT extends Win32Enum{

    /**
     * Indicates that the table is current applicable.
     * @type {Integer (Int32)}
     */
    static MPEG_SECTION_IS_NEXT => 0

    /**
     * Indicates that the table is not yet applicable, and will be the next valid table.
     * @type {Integer (Int32)}
     */
    static MPEG_SECTION_IS_CURRENT => 1
}
