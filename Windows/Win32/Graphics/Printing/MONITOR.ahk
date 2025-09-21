#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class MONITOR extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * @type {Pointer<PFN_PRINTING_ENUMPORTS>}
     */
    pfnEnumPorts {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<PFN_PRINTING_OPENPORT>}
     */
    pfnOpenPort {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PFN_PRINTING_OPENPORTEX>}
     */
    pfnOpenPortEx {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<PFN_PRINTING_STARTDOCPORT>}
     */
    pfnStartDocPort {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<PFN_PRINTING_WRITEPORT>}
     */
    pfnWritePort {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PFN_PRINTING_READPORT>}
     */
    pfnReadPort {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<PFN_PRINTING_ENDDOCPORT>}
     */
    pfnEndDocPort {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<PFN_PRINTING_CLOSEPORT>}
     */
    pfnClosePort {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<PFN_PRINTING_ADDPORT>}
     */
    pfnAddPort {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<PFN_PRINTING_ADDPORTEX>}
     */
    pfnAddPortEx {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<PFN_PRINTING_CONFIGUREPORT>}
     */
    pfnConfigurePort {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer<PFN_PRINTING_DELETEPORT>}
     */
    pfnDeletePort {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<PFN_PRINTING_GETPRINTERDATAFROMPORT>}
     */
    pfnGetPrinterDataFromPort {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<PFN_PRINTING_SETPORTTIMEOUTS>}
     */
    pfnSetPortTimeOuts {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Pointer<PFN_PRINTING_XCVOPENPORT>}
     */
    pfnXcvOpenPort {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<PFN_PRINTING_XCVDATAPORT>}
     */
    pfnXcvDataPort {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<PFN_PRINTING_XCVCLOSEPORT>}
     */
    pfnXcvClosePort {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }
}
