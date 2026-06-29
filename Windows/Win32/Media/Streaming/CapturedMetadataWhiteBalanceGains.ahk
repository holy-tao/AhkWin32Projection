#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * This structure describes the blob format for the MF_CAPTURE_METADATA_WHITEBALANCE_GAINS attribute.
 * @remarks
 * The <b>MF_CAPTURE_METADATA_WHITEBALANCE_GAINS</b> attribute contains the white balance gains applied to R, G, B by the sensor or ISP when the preview frame was captured. This is a unitless.
 * 
 * The <b>CapturedMetadataWhiteBalanceGains</b> structure only describes the blob format for the <b>MF_CAPTURE_METADATA_WHITEBALANCE_GAINS</b> attribute.  The metadata item structure for white balance gains (<a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-tagkscamera_metadata_itemheader">KSCAMERA_METADATA_ITEMHEADER</a> + white balance gains metadata payload) is up to driver and must be 8-byte aligned.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-capturedmetadatawhitebalancegains
 * @namespace Windows.Win32.Media.Streaming
 */
export default struct CapturedMetadataWhiteBalanceGains {
    #StructPack 4

    /**
     * The  <b>R</b> value of the blob.
     */
    R : Float32

    /**
     * The  <b>G</b> value of the blob.
     */
    G : Float32

    /**
     * The  <b>B</b> value of the blob.
     */
    B : Float32

}
