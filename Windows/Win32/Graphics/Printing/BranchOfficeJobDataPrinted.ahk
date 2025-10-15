#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class BranchOfficeJobDataPrinted extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pDocumentName{
        get {
            if(!this.HasProp("__pDocumentName"))
                this.__pDocumentName := PWSTR(this.ptr + 8)
            return this.__pDocumentName
        }
    }

    /**
     * @type {PWSTR}
     */
    pUserName{
        get {
            if(!this.HasProp("__pUserName"))
                this.__pUserName := PWSTR(this.ptr + 16)
            return this.__pUserName
        }
    }

    /**
     * @type {PWSTR}
     */
    pMachineName{
        get {
            if(!this.HasProp("__pMachineName"))
                this.__pMachineName := PWSTR(this.ptr + 24)
            return this.__pMachineName
        }
    }

    /**
     * @type {PWSTR}
     */
    pPrinterName{
        get {
            if(!this.HasProp("__pPrinterName"))
                this.__pPrinterName := PWSTR(this.ptr + 32)
            return this.__pPrinterName
        }
    }

    /**
     * @type {PWSTR}
     */
    pPortName{
        get {
            if(!this.HasProp("__pPortName"))
                this.__pPortName := PWSTR(this.ptr + 40)
            return this.__pPortName
        }
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 48, "int64")
        set => NumPut("int64", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    TotalPages {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
