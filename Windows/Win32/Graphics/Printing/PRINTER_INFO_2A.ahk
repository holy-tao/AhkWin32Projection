#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Security\PSECURITY_DESCRIPTOR.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset ANSI
 */
class PRINTER_INFO_2A extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    pServerName{
        get {
            if(!this.HasProp("__pServerName"))
                this.__pServerName := PSTR(this.ptr + 0)
            return this.__pServerName
        }
    }

    /**
     * @type {PSTR}
     */
    pPrinterName{
        get {
            if(!this.HasProp("__pPrinterName"))
                this.__pPrinterName := PSTR(this.ptr + 8)
            return this.__pPrinterName
        }
    }

    /**
     * @type {PSTR}
     */
    pShareName{
        get {
            if(!this.HasProp("__pShareName"))
                this.__pShareName := PSTR(this.ptr + 16)
            return this.__pShareName
        }
    }

    /**
     * @type {PSTR}
     */
    pPortName{
        get {
            if(!this.HasProp("__pPortName"))
                this.__pPortName := PSTR(this.ptr + 24)
            return this.__pPortName
        }
    }

    /**
     * @type {PSTR}
     */
    pDriverName{
        get {
            if(!this.HasProp("__pDriverName"))
                this.__pDriverName := PSTR(this.ptr + 32)
            return this.__pDriverName
        }
    }

    /**
     * @type {PSTR}
     */
    pComment{
        get {
            if(!this.HasProp("__pComment"))
                this.__pComment := PSTR(this.ptr + 40)
            return this.__pComment
        }
    }

    /**
     * @type {PSTR}
     */
    pLocation{
        get {
            if(!this.HasProp("__pLocation"))
                this.__pLocation := PSTR(this.ptr + 48)
            return this.__pLocation
        }
    }

    /**
     * @type {Pointer<DEVMODEA>}
     */
    pDevMode {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {PSTR}
     */
    pSepFile{
        get {
            if(!this.HasProp("__pSepFile"))
                this.__pSepFile := PSTR(this.ptr + 64)
            return this.__pSepFile
        }
    }

    /**
     * @type {PSTR}
     */
    pPrintProcessor{
        get {
            if(!this.HasProp("__pPrintProcessor"))
                this.__pPrintProcessor := PSTR(this.ptr + 72)
            return this.__pPrintProcessor
        }
    }

    /**
     * @type {PSTR}
     */
    pDatatype{
        get {
            if(!this.HasProp("__pDatatype"))
                this.__pDatatype := PSTR(this.ptr + 80)
            return this.__pDatatype
        }
    }

    /**
     * @type {PSTR}
     */
    pParameters{
        get {
            if(!this.HasProp("__pParameters"))
                this.__pParameters := PSTR(this.ptr + 88)
            return this.__pParameters
        }
    }

    /**
     * @type {PSECURITY_DESCRIPTOR}
     */
    pSecurityDescriptor{
        get {
            if(!this.HasProp("__pSecurityDescriptor"))
                this.__pSecurityDescriptor := PSECURITY_DESCRIPTOR(this.ptr + 96)
            return this.__pSecurityDescriptor
        }
    }

    /**
     * @type {Integer}
     */
    Attributes {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    Priority {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * @type {Integer}
     */
    DefaultPriority {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    StartTime {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * @type {Integer}
     */
    UntilTime {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * @type {Integer}
     */
    cJobs {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    AveragePPM {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }
}
