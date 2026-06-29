#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The CapturedMetadataISOGains structure describes the blob format for MF_CAPTURE_METADATA_ISO_GAINS.
 * @remarks
 * The <b>CapturedMetadataISOGains</b> structure only describes the blob format for the <b>MF_CAPTURE_METADATA_ISO_GAINS</b> attribute.  The metadata item structure for ISO gains (<a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-tagkscamera_metadata_itemheader">KSCAMERA_METADATA_ITEMHEADER</a> + ISO gains metadata payload) is up to driver and must be 8-byte aligned.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-capturedmetadataisogains
 * @namespace Windows.Win32.Media.Streaming
 */
export default struct CapturedMetadataISOGains {
    #StructPack 4

    AnalogGain : Float32

    DigitalGain : Float32

}
