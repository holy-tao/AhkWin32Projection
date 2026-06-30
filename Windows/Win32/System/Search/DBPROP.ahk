#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\DECIMAL.ahk
#Include ..\Ole\IRecordInfo.ahk
#Include ..\Variant\VARENUM.ahk
#Include ..\..\Foundation\VARIANT_BOOL.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IDispatch.ahk
#Include ..\Com\CY.ahk
#Include ..\Com\SAFEARRAY.ahk
#Include ..\..\Storage\IndexServer\DBID.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\..\Foundation\CHAR.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @architecture X64, Arm64
 */
class DBPROP extends Win32Struct {
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwPropertyID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwOptions {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwStatus {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {DBID}
     */
    colid {
        get {
            if(!this.HasProp("__colid"))
                this.__colid := DBID(16, this)
            return this.__colid
        }
    }

    /**
     * @type {VARIANT}
     */
    vValue {
        get {
            if(!this.HasProp("__vValue"))
                this.__vValue := VARIANT(48, this)
            return this.__vValue
        }
    }
}
