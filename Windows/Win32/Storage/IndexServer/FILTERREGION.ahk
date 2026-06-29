#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the position and extent of a specified portion of text within an object.
 * @remarks
 * The <b>cwcExtent</b> member might specify a number of characters (starting from a position the <b>cwcStart</b> member specifies) that extends beyond the end of the chunk. In that case, the region should be continued into the next chunk, which should have the same attribute as the current region.
 * @see https://learn.microsoft.com/windows/win32/api/filter/ns-filter-filterregion
 * @namespace Windows.Win32.Storage.IndexServer
 */
export default struct FILTERREGION {
    #StructPack 4

    /**
     * The chunk identifier.
     */
    idChunk : UInt32

    /**
     * The beginning of the region, specified as an offset from the beginning of the chunk.
     */
    cwcStart : UInt32

    /**
     * The extent of the region, specified as the number of Unicode characters.
     */
    cwcExtent : UInt32

}
