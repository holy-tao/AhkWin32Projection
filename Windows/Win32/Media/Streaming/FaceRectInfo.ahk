#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * The FaceRectInfo structure describes the blob format for the MF_CAPTURE_METADATA_FACEROIS attribute.
 * @remarks
 * The <b>MF_CAPTURE_METADATA_FACEROIS</b> attribute contains the face rectangle info detected by the driver.   By default driver\MFT0 should provide the face information on preview stream.  If the driver advertises the capability on other streams, driver\MFT must provide the face info on the corresponding streams if the application enables face detection on those streams.  When video stabilization is enabled on the driver, the face information should be provided post-video stabilization. The dominate face must be the first <b>FaceRectInfo</b> in the blob.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/ns-mfapi-facerectinfoblobheader">FaceRectInfoBlobHeader</a> and <b>FaceRectInfo</b> structures only describe the blob format for the <b>MF_CAPTURE_METADATA_FACEROIS</b> attribute.  The metadata item structure for face ROIs (<a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-tagkscamera_metadata_itemheader">KSCAMERA_METADATA_ITEMHEADER</a> + face ROIs metadata payload) is up to driver and must be 8-byte aligned.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-facerectinfo
 * @namespace Windows.Win32.Media.Streaming
 * @version v4.0.30319
 */
class FaceRectInfo extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Relative coordinates on the frame that face detection is running (Q31 format).
     * @type {RECT}
     */
    Region{
        get {
            if(!this.HasProp("__Region"))
                this.__Region := RECT(0, this)
            return this.__Region
        }
    }

    /**
     * Confidence level of the region being a face (0 - 100).
     * @type {Integer}
     */
    confidenceLevel {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
