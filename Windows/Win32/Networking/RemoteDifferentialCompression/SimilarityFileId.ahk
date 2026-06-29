#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the similarity file ID for a file.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/ns-msrdc-similarityfileid
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 */
export default struct SimilarityFileId {
    #StructPack 1

    /**
     * The similarity file ID for the file.
     */
    m_FileId : Int8[32]

}
