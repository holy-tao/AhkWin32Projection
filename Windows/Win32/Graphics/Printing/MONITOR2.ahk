#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class MONITOR2 extends Win32Struct
{
    static sizeof => 184

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<PFN_PRINTING_ENUMPORTS2>}
     */
    pfnEnumPorts {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PFN_PRINTING_OPENPORT2>}
     */
    pfnOpenPort {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<PFN_PRINTING_OPENPORTEX2>}
     */
    pfnOpenPortEx {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<PFN_PRINTING_STARTDOCPORT2>}
     */
    pfnStartDocPort {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PFN_PRINTING_WRITEPORT2>}
     */
    pfnWritePort {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<PFN_PRINTING_READPORT2>}
     */
    pfnReadPort {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<PFN_PRINTING_ENDDOCPORT2>}
     */
    pfnEndDocPort {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<PFN_PRINTING_CLOSEPORT2>}
     */
    pfnClosePort {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<PFN_PRINTING_ADDPORT2>}
     */
    pfnAddPort {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<PFN_PRINTING_ADDPORTEX2>}
     */
    pfnAddPortEx {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer<PFN_PRINTING_CONFIGUREPORT2>}
     */
    pfnConfigurePort {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<PFN_PRINTING_DELETEPORT2>}
     */
    pfnDeletePort {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<PFN_PRINTING_GETPRINTERDATAFROMPORT2>}
     */
    pfnGetPrinterDataFromPort {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Pointer<PFN_PRINTING_SETPORTTIMEOUTS2>}
     */
    pfnSetPortTimeOuts {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<PFN_PRINTING_XCVOPENPORT2>}
     */
    pfnXcvOpenPort {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<PFN_PRINTING_XCVDATAPORT2>}
     */
    pfnXcvDataPort {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * @type {Pointer<PFN_PRINTING_XCVCLOSEPORT2>}
     */
    pfnXcvClosePort {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * @type {Pointer<PFN_PRINTING_SHUTDOWN2>}
     */
    pfnShutdown {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * @type {Pointer<PFN_PRINTING_SENDRECVBIDIDATAFROMPORT2>}
     */
    pfnSendRecvBidiDataFromPort {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * @type {Pointer<PFN_PRINTING_NOTIFYUSEDPORTS2>}
     */
    pfnNotifyUsedPorts {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * @type {Pointer<PFN_PRINTING_NOTIFYUNUSEDPORTS2>}
     */
    pfnNotifyUnusedPorts {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * @type {Pointer<PFN_PRINTING_POWEREVENT2>}
     */
    pfnPowerEvent {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 184
    }
}
