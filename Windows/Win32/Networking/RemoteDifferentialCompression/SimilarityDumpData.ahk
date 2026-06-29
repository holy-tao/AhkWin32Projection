#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SimilarityData.ahk" { SimilarityData }

/**
 * Contains the similarity information that was returned for a file by the ISimilarityTableDumpState::GetNextData method.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/ns-msrdc-similaritydumpdata
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 */
export default struct SimilarityDumpData {
    #StructPack 4

    /**
     * The index of the <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-similaritydata">SimilarityData</a> structure in the similarity traits table.
     */
    m_FileIndex : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-similaritydata">SimilarityData</a> structure that contains the similarity data for the file.
     */
    m_Data : SimilarityData

}
