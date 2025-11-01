#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\Com\CY.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\Foundation\DECIMAL.ahk
#Include ..\..\Variant\VARIANT.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class ExtendedDebugPropertyInfo extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwValidFields {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pszName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    pszType {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {PWSTR}
     */
    pszValue {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {PWSTR}
     */
    pszFullName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    dwAttrib {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {IDebugProperty}
     */
    pDebugProp {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    nDISPID {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    nType {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {VARIANT}
     */
    varValue{
        get {
            if(!this.HasProp("__varValue"))
                this.__varValue := VARIANT(64, this)
            return this.__varValue
        }
    }

    /**
     * @type {ILockBytes}
     */
    plbValue {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {IDebugExtendedProperty}
     */
    pDebugExtProp {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }
}
