#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class BranchOfficeJobDataError extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {Integer}
     */
    LastError {
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
    pPrinterName{
        get {
            if(!this.HasProp("__pPrinterName"))
                this.__pPrinterName := PWSTR(this.ptr + 24)
            return this.__pPrinterName
        }
    }

    /**
     * @type {PWSTR}
     */
    pDataType{
        get {
            if(!this.HasProp("__pDataType"))
                this.__pDataType := PWSTR(this.ptr + 32)
            return this.__pDataType
        }
    }

    /**
     * @type {Integer}
     */
    TotalSize {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    PrintedSize {
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

    /**
     * @type {Integer}
     */
    PrintedPages {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {PWSTR}
     */
    pMachineName{
        get {
            if(!this.HasProp("__pMachineName"))
                this.__pMachineName := PWSTR(this.ptr + 64)
            return this.__pMachineName
        }
    }

    /**
     * @type {PWSTR}
     */
    pJobError{
        get {
            if(!this.HasProp("__pJobError"))
                this.__pJobError := PWSTR(this.ptr + 72)
            return this.__pJobError
        }
    }

    /**
     * @type {PWSTR}
     */
    pErrorDescription{
        get {
            if(!this.HasProp("__pErrorDescription"))
                this.__pErrorDescription := PWSTR(this.ptr + 80)
            return this.__pErrorDescription
        }
    }
}
