#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset ANSI
 */
class DOC_INFO_1A extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    pDocName{
        get {
            if(!this.HasProp("__pDocName"))
                this.__pDocName := PSTR(this.ptr + 0)
            return this.__pDocName
        }
    }

    /**
     * @type {PSTR}
     */
    pOutputFile{
        get {
            if(!this.HasProp("__pOutputFile"))
                this.__pOutputFile := PSTR(this.ptr + 8)
            return this.__pOutputFile
        }
    }

    /**
     * @type {PSTR}
     */
    pDatatype{
        get {
            if(!this.HasProp("__pDatatype"))
                this.__pDatatype := PSTR(this.ptr + 16)
            return this.__pDatatype
        }
    }
}
