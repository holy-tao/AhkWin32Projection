#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset Unicode
 */
class JOB_INFO_1W extends Win32Struct
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
    pMachineName{
        get {
            if(!this.HasProp("__pMachineName"))
                this.__pMachineName := PWSTR(this.ptr + 16)
            return this.__pMachineName
        }
    }

    /**
     * @type {PWSTR}
     */
    pUserName{
        get {
            if(!this.HasProp("__pUserName"))
                this.__pUserName := PWSTR(this.ptr + 24)
            return this.__pUserName
        }
    }

    /**
     * @type {PWSTR}
     */
    pDocument{
        get {
            if(!this.HasProp("__pDocument"))
                this.__pDocument := PWSTR(this.ptr + 32)
            return this.__pDocument
        }
    }

    /**
     * @type {PWSTR}
     */
    pDatatype{
        get {
            if(!this.HasProp("__pDatatype"))
                this.__pDatatype := PWSTR(this.ptr + 40)
            return this.__pDatatype
        }
    }

    /**
     * @type {PWSTR}
     */
    pStatus{
        get {
            if(!this.HasProp("__pStatus"))
                this.__pStatus := PWSTR(this.ptr + 48)
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
