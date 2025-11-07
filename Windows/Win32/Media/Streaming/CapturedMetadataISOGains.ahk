#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CapturedMetadataISOGains structure describes the blob format for MF_CAPTURE_METADATA_ISO_GAINS.
 * @remarks
 * 
 * The <b>CapturedMetadataISOGains</b> structure only describes the blob format for the <b>MF_CAPTURE_METADATA_ISO_GAINS</b> attribute.  The metadata item structure for ISO gains (<a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-tagkscamera_metadata_itemheader">KSCAMERA_METADATA_ITEMHEADER</a> + ISO gains metadata payload) is up to driver and must be 8-byte aligned.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfapi/ns-mfapi-capturedmetadataisogains
 * @namespace Windows.Win32.Media.Streaming
 * @version v4.0.30319
 */
class CapturedMetadataISOGains extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * 
     * @type {Float}
     */
    AnalogGain {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * 
     * @type {Float}
     */
    DigitalGain {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }
}
