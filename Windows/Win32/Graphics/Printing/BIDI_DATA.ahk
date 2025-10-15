#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\BINARY_CONTAINER.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class BIDI_DATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwBidiType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {BOOL}
     */
    bData{
        get {
            if(!this.HasProp("__bData"))
                this.__bData := BOOL(this.ptr + 8)
            return this.__bData
        }
    }

    /**
     * @type {Integer}
     */
    iData {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    sData{
        get {
            if(!this.HasProp("__sData"))
                this.__sData := PWSTR(this.ptr + 8)
            return this.__sData
        }
    }

    /**
     * @type {Float}
     */
    fData {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * @type {BINARY_CONTAINER}
     */
    biData{
        get {
            if(!this.HasProp("__biData"))
                this.__biData := BINARY_CONTAINER(this.ptr + 8)
            return this.__biData
        }
    }
}
