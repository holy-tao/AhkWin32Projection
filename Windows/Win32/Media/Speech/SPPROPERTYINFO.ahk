#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\DECIMAL.ahk
#Include ..\..\System\Ole\IRecordInfo.ahk
#Include ..\..\System\Variant\VARENUM.ahk
#Include ..\..\Foundation\VARIANT_BOOL.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include ..\..\System\Com\CY.ahk
#Include ..\..\System\Com\SAFEARRAY.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\Foundation\CHAR.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class SPPROPERTYINFO extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {PWSTR}
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
     * @type {PWSTR}
     */
    pszValue {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {VARIANT}
     */
    vValue {
        get {
            if(!this.HasProp("__vValue"))
                this.__vValue := VARIANT(24, this)
            return this.__vValue
        }
    }
}
