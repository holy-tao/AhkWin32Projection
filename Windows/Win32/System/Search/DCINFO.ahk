#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Variant\VARENUM.ahk
#Include ..\Com\CY.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\Com\IDispatch.ahk
#Include ..\Com\SAFEARRAY.ahk
#Include ..\..\Foundation\DECIMAL.ahk
#Include ..\Ole\IRecordInfo.ahk

/**
 * @namespace Windows.Win32.System.Search
 */
class DCINFO extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    eInfoType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {VARIANT}
     */
    vData {
        get {
            if(!this.HasProp("__vData"))
                this.__vData := VARIANT(8, this)
            return this.__vData
        }
    }
}
