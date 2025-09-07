#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class PRINTPROCESSOROPENDATA extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Pointer<DEVMODEA>}
     */
    pDevMode {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pDatatype{
        get {
            if(!this.HasProp("__pDatatype"))
                this.__pDatatype := PWSTR(this.ptr + 8)
            return this.__pDatatype
        }
    }

    /**
     * @type {PWSTR}
     */
    pParameters{
        get {
            if(!this.HasProp("__pParameters"))
                this.__pParameters := PWSTR(this.ptr + 16)
            return this.__pParameters
        }
    }

    /**
     * @type {PWSTR}
     */
    pDocumentName{
        get {
            if(!this.HasProp("__pDocumentName"))
                this.__pDocumentName := PWSTR(this.ptr + 24)
            return this.__pDocumentName
        }
    }

    /**
     * @type {Integer}
     */
    JobId {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {PWSTR}
     */
    pOutputFile{
        get {
            if(!this.HasProp("__pOutputFile"))
                this.__pOutputFile := PWSTR(this.ptr + 40)
            return this.__pOutputFile
        }
    }

    /**
     * @type {PWSTR}
     */
    pPrinterName{
        get {
            if(!this.HasProp("__pPrinterName"))
                this.__pPrinterName := PWSTR(this.ptr + 48)
            return this.__pPrinterName
        }
    }
}
