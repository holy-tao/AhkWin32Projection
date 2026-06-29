#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The FaceCharacterizationBlobHeader structure describes the size and count information of the blob format for the MF_CAPTURE_METADATA_FACEROICHARACTERIZATIONS attribute.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-facecharacterizationblobheader
 * @namespace Windows.Win32.Media.Streaming
 */
export default struct FaceCharacterizationBlobHeader {
    #StructPack 4

    /**
     * Size of this header + all following <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/ns-mfapi-facecharacterization">FaceCharacterization</a> structures.
     */
    Size : UInt32

    /**
     * Number of <b>FaceCharacterization</b> structures in the blob. Must match the number of <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/ns-mfapi-facerectinfo">FaceRectInfo</a> structures in <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/ns-mfapi-facerectinfoblobheader">FaceRectInfoBlobHeader</a>.
     */
    Count : UInt32

}
