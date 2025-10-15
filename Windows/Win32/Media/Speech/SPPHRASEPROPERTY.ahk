#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\VARIANT_BOOL.ahk
#Include ..\..\System\Com\CY.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\Foundation\CHAR.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Foundation\DECIMAL.ahk
#Include ..\..\System\Variant\VARIANT.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPPHRASEPROPERTY extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pszName{
        get {
            if(!this.HasProp("__pszName"))
                this.__pszName := PWSTR(this.ptr + 0)
            return this.__pszName
        }
    }

    /**
     * @type {Integer}
     */
    ulId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    bType {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    bReserved {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * @type {Integer}
     */
    usArrayIndex {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * @type {PWSTR}
     */
    pszValue{
        get {
            if(!this.HasProp("__pszValue"))
                this.__pszValue := PWSTR(this.ptr + 16)
            return this.__pszValue
        }
    }

    /**
     * @type {VARIANT}
     */
    vValue{
        get {
            if(!this.HasProp("__vValue"))
                this.__vValue := VARIANT(this.ptr + 24)
            return this.__vValue
        }
    }

    /**
     * @type {Integer}
     */
    ulFirstElement {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    ulCountOfElements {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Pointer<SPPHRASEPROPERTY>}
     */
    pNextSibling {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<SPPHRASEPROPERTY>}
     */
    pFirstChild {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Float}
     */
    SREngineConfidence {
        get => NumGet(this, 72, "float")
        set => NumPut("float", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    Confidence {
        get => NumGet(this, 76, "char")
        set => NumPut("char", value, this, 76)
    }
}
