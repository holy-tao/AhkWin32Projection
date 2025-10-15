#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset ANSI
 */
class JOB_INFO_1A extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {Integer}
     */
    JobId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
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
    pMachineName{
        get {
            if(!this.HasProp("__pMachineName"))
                this.__pMachineName := PSTR(this.ptr + 16)
            return this.__pMachineName
        }
    }

    /**
     * @type {PSTR}
     */
    pUserName{
        get {
            if(!this.HasProp("__pUserName"))
                this.__pUserName := PSTR(this.ptr + 24)
            return this.__pUserName
        }
    }

    /**
     * @type {PSTR}
     */
    pDocument{
        get {
            if(!this.HasProp("__pDocument"))
                this.__pDocument := PSTR(this.ptr + 32)
            return this.__pDocument
        }
    }

    /**
     * @type {PSTR}
     */
    pDatatype{
        get {
            if(!this.HasProp("__pDatatype"))
                this.__pDatatype := PSTR(this.ptr + 40)
            return this.__pDatatype
        }
    }

    /**
     * @type {PSTR}
     */
    pStatus{
        get {
            if(!this.HasProp("__pStatus"))
                this.__pStatus := PSTR(this.ptr + 48)
            return this.__pStatus
        }
    }

    /**
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    Priority {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    Position {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    TotalPages {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    PagesPrinted {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {SYSTEMTIME}
     */
    Submitted{
        get {
            if(!this.HasProp("__Submitted"))
                this.__Submitted := SYSTEMTIME(this.ptr + 80)
            return this.__Submitted
        }
    }
}
