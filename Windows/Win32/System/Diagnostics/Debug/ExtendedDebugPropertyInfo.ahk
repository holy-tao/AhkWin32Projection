#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include ..\..\..\Foundation\VARIANT_BOOL.ahk
#Include ..\..\Com\CY.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\Foundation\CHAR.ahk
#Include ..\..\..\Foundation\PSTR.ahk
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
    pszName{
        get {
            if(!this.HasProp("__pszName"))
                this.__pszName := PWSTR(this.ptr + 8)
            return this.__pszName
        }
    }

    /**
     * @type {PWSTR}
     */
    pszType{
        get {
            if(!this.HasProp("__pszType"))
                this.__pszType := PWSTR(this.ptr + 16)
            return this.__pszType
        }
    }

    /**
     * @type {PWSTR}
     */
    pszValue{
        get {
            if(!this.HasProp("__pszValue"))
                this.__pszValue := PWSTR(this.ptr + 24)
            return this.__pszValue
        }
    }

    /**
     * @type {PWSTR}
     */
    pszFullName{
        get {
            if(!this.HasProp("__pszFullName"))
                this.__pszFullName := PWSTR(this.ptr + 32)
            return this.__pszFullName
        }
    }

    /**
     * @type {Integer}
     */
    dwAttrib {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Pointer<IDebugProperty>}
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
                this.__varValue := VARIANT(this.ptr + 64)
            return this.__varValue
        }
    }

    /**
     * @type {Pointer<ILockBytes>}
     */
    plbValue {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<IDebugExtendedProperty>}
     */
    pDebugExtProp {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }
}
