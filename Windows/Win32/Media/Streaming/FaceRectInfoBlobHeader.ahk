#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The FaceRectInfoBlobHeader structure describes the size and count information of the blob format for the MF_CAPTURE_METADATA_FACEROIS attribute.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-facerectinfoblobheader
 * @namespace Windows.Win32.Media.Streaming
 */
export default struct FaceRectInfoBlobHeader {
    #StructPack 4

    /**
     * Size of this header + all following <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/ns-mfapi-facerectinfo">FaceRectInfo</a> structures.
     */
    Size : UInt32

    /**
     * Number of <b>FaceRectInfo</b> structures in the blob.
     */
    Count : UInt32

}
