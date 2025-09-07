#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class OBO_TOKEN extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Pointer<INetCfgComponent>}
     */
    pncc {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    pszwManufacturer{
        get {
            if(!this.HasProp("__pszwManufacturer"))
                this.__pszwManufacturer := PWSTR(this.ptr + 16)
            return this.__pszwManufacturer
        }
    }

    /**
     * @type {PWSTR}
     */
    pszwProduct{
        get {
            if(!this.HasProp("__pszwProduct"))
                this.__pszwProduct := PWSTR(this.ptr + 24)
            return this.__pszwProduct
        }
    }

    /**
     * @type {PWSTR}
     */
    pszwDisplayName{
        get {
            if(!this.HasProp("__pszwDisplayName"))
                this.__pszwDisplayName := PWSTR(this.ptr + 32)
            return this.__pszwDisplayName
        }
    }

    /**
     * @type {Integer}
     */
    fRegistered {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }
}
