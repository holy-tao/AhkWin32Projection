#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about a similarity mapped view.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/ns-msrdc-similaritymappedviewinfo
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 */
export default struct SimilarityMappedViewInfo {
    #StructPack 8

    /**
     * The mapped view information.
     */
    m_Data : IntPtr

    /**
     * Size, in bytes, of the mapped view information.
     */
    m_Length : UInt32

}
