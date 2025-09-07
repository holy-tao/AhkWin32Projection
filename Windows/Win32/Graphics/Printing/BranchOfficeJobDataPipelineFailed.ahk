#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class BranchOfficeJobDataPipelineFailed extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pDocumentName{
        get {
            if(!this.HasProp("__pDocumentName"))
                this.__pDocumentName := PWSTR(this.ptr + 0)
            return this.__pDocumentName
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
    pExtraErrorInfo{
        get {
            if(!this.HasProp("__pExtraErrorInfo"))
                this.__pExtraErrorInfo := PWSTR(this.ptr + 16)
            return this.__pExtraErrorInfo
        }
    }
}
