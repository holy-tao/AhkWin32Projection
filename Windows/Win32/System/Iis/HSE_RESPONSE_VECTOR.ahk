#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class HSE_RESPONSE_VECTOR extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PSTR}
     */
    pszStatus{
        get {
            if(!this.HasProp("__pszStatus"))
                this.__pszStatus := PSTR(this.ptr + 8)
            return this.__pszStatus
        }
    }

    /**
     * @type {PSTR}
     */
    pszHeaders{
        get {
            if(!this.HasProp("__pszHeaders"))
                this.__pszHeaders := PSTR(this.ptr + 16)
            return this.__pszHeaders
        }
    }

    /**
     * @type {Integer}
     */
    nElementCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Pointer<HSE_VECTOR_ELEMENT>}
     */
    lpElementArray {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
