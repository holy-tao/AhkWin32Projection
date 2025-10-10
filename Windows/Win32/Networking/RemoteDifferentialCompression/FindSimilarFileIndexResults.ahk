#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the file index information that the ISimilarityTraitsTable::FindSimilarFileIndex method returned for a matching file.
 * @see https://docs.microsoft.com/windows/win32/api//msrdc/ns-msrdc-findsimilarfileindexresults
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class FindSimilarFileIndexResults extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The index of the matching file in the similarity traits table.
     * @type {Integer}
     */
    m_FileIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of traits that were matched. The valid range is from <b>MSRDC_MINIMUM_MATCHESREQUIRED</b> to 
     *       <b>MSRDC_MAXIMUM_MATCHESREQUIRED</b>.
     * @type {Integer}
     */
    m_MatchCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
