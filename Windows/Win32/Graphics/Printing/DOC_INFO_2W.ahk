#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset Unicode
 */
class DOC_INFO_2W extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pDocName{
        get {
            if(!this.HasProp("__pDocName"))
                this.__pDocName := PWSTR(this.ptr + 0)
            return this.__pDocName
        }
    }

    /**
     * @type {PWSTR}
     */
    pOutputFile{
        get {
            if(!this.HasProp("__pOutputFile"))
                this.__pOutputFile := PWSTR(this.ptr + 8)
            return this.__pOutputFile
        }
    }

    /**
     * @type {PWSTR}
     */
    pDatatype{
        get {
            if(!this.HasProp("__pDatatype"))
                this.__pDatatype := PWSTR(this.ptr + 16)
            return this.__pDatatype
        }
    }

    /**
     * @type {Integer}
     */
    dwMode {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    JobId {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
