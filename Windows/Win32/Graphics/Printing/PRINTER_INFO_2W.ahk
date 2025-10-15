#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Security\PSECURITY_DESCRIPTOR.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset Unicode
 */
class PRINTER_INFO_2W extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pServerName{
        get {
            if(!this.HasProp("__pServerName"))
                this.__pServerName := PWSTR(this.ptr + 0)
            return this.__pServerName
        }
    }

    /**
     * @type {PWSTR}
     */
    pPrinterName{
        get {
            if(!this.HasProp("__pPrinterName"))
                this.__pPrinterName := PWSTR(this.ptr + 8)
            return this.__pPrinterName
        }
    }

    /**
     * @type {PWSTR}
     */
    pShareName{
        get {
            if(!this.HasProp("__pShareName"))
                this.__pShareName := PWSTR(this.ptr + 16)
            return this.__pShareName
        }
    }

    /**
     * @type {PWSTR}
     */
    pPortName{
        get {
            if(!this.HasProp("__pPortName"))
                this.__pPortName := PWSTR(this.ptr + 24)
            return this.__pPortName
        }
    }

    /**
     * @type {PWSTR}
     */
    pDriverName{
        get {
            if(!this.HasProp("__pDriverName"))
                this.__pDriverName := PWSTR(this.ptr + 32)
            return this.__pDriverName
        }
    }

    /**
     * @type {PWSTR}
     */
    pComment{
        get {
            if(!this.HasProp("__pComment"))
                this.__pComment := PWSTR(this.ptr + 40)
            return this.__pComment
        }
    }

    /**
     * @type {PWSTR}
     */
    pLocation{
        get {
            if(!this.HasProp("__pLocation"))
                this.__pLocation := PWSTR(this.ptr + 48)
            return this.__pLocation
        }
    }

    /**
     * @type {Pointer<DEVMODEW>}
     */
    pDevMode {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {PWSTR}
     */
    pSepFile{
        get {
            if(!this.HasProp("__pSepFile"))
                this.__pSepFile := PWSTR(this.ptr + 64)
            return this.__pSepFile
        }
    }

    /**
     * @type {PWSTR}
     */
    pPrintProcessor{
        get {
            if(!this.HasProp("__pPrintProcessor"))
                this.__pPrintProcessor := PWSTR(this.ptr + 72)
            return this.__pPrintProcessor
        }
    }

    /**
     * @type {PWSTR}
     */
    pDatatype{
        get {
            if(!this.HasProp("__pDatatype"))
                this.__pDatatype := PWSTR(this.ptr + 80)
            return this.__pDatatype
        }
    }

    /**
     * @type {PWSTR}
     */
    pParameters{
        get {
            if(!this.HasProp("__pParameters"))
                this.__pParameters := PWSTR(this.ptr + 88)
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
