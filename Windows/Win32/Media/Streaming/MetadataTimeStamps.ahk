#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MetadataTimeStamps structure describes the blob format for the MF_CAPTURE_METADATA_FACEROITIMESTAMPS attribute.
 * @remarks
 * The <b>MF_CAPTURE_METADATA_FACEROITIMESTAMPS</b> attribute contains the time stamp information for the face ROIs identified in <b>MF_CAPTURE_METADATA_FACEROIS</b>.  For a  device that cannot provide the time stamp for face ROIs, this attribute should be omitted.
 * 
 * For the <b>Flags</b> field, the following bit flags  indicate which time stamp is valid:
 * 
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-metadatatimestamps
 * @namespace Windows.Win32.Media.Streaming
 */
export default struct MetadataTimeStamps {
    #StructPack 8

    /**
     * Bitwise OR of the <b>MF_METADATATIMESTAMPS_*</b> flags.
     */
    Flags : UInt32

    /**
     * QPC time for the sample  the face rectangle is derived from (in 100ns).
     */
    Device : Int64

    /**
     * PTS for the sample  the face rectangle is derived from (in 100ns).
     */
    Presentation : Int64

}
