#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the similarity data for a file.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/ns-msrdc-similaritydata
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 */
export default struct SimilarityData {
    #StructPack 1

    /**
     * The similarity data for the file.
     */
    m_Data : Int8[16]

}
