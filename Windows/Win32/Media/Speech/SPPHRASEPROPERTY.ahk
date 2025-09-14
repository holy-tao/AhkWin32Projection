#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\System\Com\CY.ahk
#Include ..\..\Foundation\DECIMAL.ahk
#Include ..\..\System\Variant\VARIANT.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPPHRASEPROPERTY extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Pointer<PWSTR>}
     */
    pszName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
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
     * @type {Pointer<PWSTR>}
     */
    pszValue {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
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
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    ulCountOfElements {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Pointer<SPPHRASEPROPERTY>}
     */
    pNextSibling {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<SPPHRASEPROPERTY>}
     */
    pFirstChild {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Float}
     */
    SREngineConfidence {
        get => NumGet(this, 64, "float")
        set => NumPut("float", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    Confidence {
        get => NumGet(this, 68, "char")
        set => NumPut("char", value, this, 68)
    }
}
