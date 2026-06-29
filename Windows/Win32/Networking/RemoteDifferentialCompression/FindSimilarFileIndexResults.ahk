#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the file index information that the ISimilarityTraitsTable::FindSimilarFileIndex method returned for a matching file.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/ns-msrdc-findsimilarfileindexresults
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 */
export default struct FindSimilarFileIndexResults {
    #StructPack 4

    /**
     * The index of the matching file in the similarity traits table.
     */
    m_FileIndex : UInt32

    /**
     * The number of traits that were matched. The valid range is from <b>MSRDC_MINIMUM_MATCHESREQUIRED</b> to 
     *       <b>MSRDC_MAXIMUM_MATCHESREQUIRED</b>.
     */
    m_MatchCount : UInt32

}
