#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDVIDEOPORTCONNECT.ahk

/**
 * The DDVIDEOPORTDESC structure describes the video port extensions (VPE) object being created.
 * @see https://learn.microsoft.com/windows/win32/api/dvp/ns-dvp-ddvideoportdesc
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDVIDEOPORTDESC extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Specifies the size in bytes of the DDVIDEOPORTDESC structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the width in pixels of the incoming video stream.
     * @type {Integer}
     */
    dwFieldWidth {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the width, in number of samples, of the <a href="https://docs.microsoft.com/windows-hardware/drivers/">VBI</a> data in the incoming video stream.
     * @type {Integer}
     */
    dwVBIWidth {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the field height in scan lines of the incoming video stream.
     * @type {Integer}
     */
    dwFieldHeight {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Specifies the time interval in microseconds between live video VSYNCs. This number should be rounded up to the nearest whole microsecond.
     * @type {Integer}
     */
    dwMicrosecondsPerField {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the maximum pixel rate per second.
     * @type {Integer}
     */
    dwMaxPixelsPerSecond {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Specifies the ID of the hardware video port to be used. This ID should range from 0 to (<b>dwMaxVideoPorts</b> -1), where <b>dwMaxVideoPorts</b> is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawi/ns-ddrawi-ddcorecaps">DDCORECAPS</a> structure.
     * @type {Integer}
     */
    dwVideoPortID {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Reserved for system use and should be ignored by the driver.
     * @type {Integer}
     */
    dwReserved1 {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-_ddvideoportconnect">DDVIDEOPORTCONNECT</a> structure describing the connection characteristics of the hardware video port.
     * @type {DDVIDEOPORTCONNECT}
     */
    VideoPortType{
        get {
            if(!this.HasProp("__VideoPortType"))
                this.__VideoPortType := DDVIDEOPORTCONNECT(32, this)
            return this.__VideoPortType
        }
    }

    /**
     * Reserved for future use and should be ignored by the driver.
     * @type {Pointer}
     */
    dwReserved2 {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Reserved for future use and should be ignored by the driver.
     * @type {Pointer}
     */
    dwReserved3 {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
