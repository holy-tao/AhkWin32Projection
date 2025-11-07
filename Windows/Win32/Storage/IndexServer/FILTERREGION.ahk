#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the position and extent of a specified portion of text within an object.
 * @remarks
 * 
 * The <b>cwcExtent</b> member might specify a number of characters (starting from a position the <b>cwcStart</b> member specifies) that extends beyond the end of the chunk. In that case, the region should be continued into the next chunk, which should have the same attribute as the current region.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//filter/ns-filter-filterregion
 * @namespace Windows.Win32.Storage.IndexServer
 * @version v4.0.30319
 */
class FILTERREGION extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The chunk identifier.
     * @type {Integer}
     */
    idChunk {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The beginning of the region, specified as an offset from the beginning of the chunk.
     * @type {Integer}
     */
    cwcStart {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The extent of the region, specified as the number of Unicode characters.
     * @type {Integer}
     */
    cwcExtent {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
