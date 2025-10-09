#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Storage\IndexServer\DBID.ahk
#Include ..\Com\CY.ahk
#Include ..\..\Foundation\DECIMAL.ahk
#Include ..\Variant\VARIANT.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class DBPROP extends Win32Struct
{
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
    colid{
        get {
            if(!this.HasProp("__colid"))
                this.__colid := DBID(this.ptr + 16)
            return this.__colid
        }
    }

    /**
     * @type {VARIANT}
     */
    vValue{
        get {
            if(!this.HasProp("__vValue"))
                this.__vValue := VARIANT(this.ptr + 48)
            return this.__vValue
        }
    }
}
