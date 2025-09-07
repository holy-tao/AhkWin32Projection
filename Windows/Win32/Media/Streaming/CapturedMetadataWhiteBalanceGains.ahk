#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This structure describes the blob format for the MF_CAPTURE_METADATA_WHITEBALANCE_GAINS attribute.
 * @remarks
 * The <b>MF_CAPTURE_METADATA_WHITEBALANCE_GAINS</b> attribute contains the white balance gains applied to R, G, B by the sensor or ISP when the preview frame was captured. This is a unitless.
  * 
  * The <b>CapturedMetadataWhiteBalanceGains</b> structure only describes the blob format for the <b>MF_CAPTURE_METADATA_WHITEBALANCE_GAINS</b> attribute.  The metadata item structure for white balance gains (<a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-tagkscamera_metadata_itemheader">KSCAMERA_METADATA_ITEMHEADER</a> + white balance gains metadata payload) is up to driver and must be 8-byte aligned.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-capturedmetadatawhitebalancegains
 * @namespace Windows.Win32.Media.Streaming
 * @version v4.0.30319
 */
class CapturedMetadataWhiteBalanceGains extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The  <b>R</b> value of the blob.
     * @type {Float}
     */
    R {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * The  <b>G</b> value of the blob.
     * @type {Float}
     */
    G {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * The  <b>B</b> value of the blob.
     * @type {Float}
     */
    B {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }
}
