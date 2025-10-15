#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * TBD.
 * @see https://docs.microsoft.com/windows/win32/api//resapi/ns-resapi-cluster_health_fault
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_HEALTH_FAULT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * TBD
     * @type {PWSTR}
     */
    Id{
        get {
            if(!this.HasProp("__Id"))
                this.__Id := PWSTR(this.ptr + 0)
            return this.__Id
        }
    }

    /**
     * 
     * @type {Integer}
     */
    ErrorType {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * TBD
     * @type {Integer}
     */
    ErrorCode {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * TBD
     * @type {PWSTR}
     */
    Description{
        get {
            if(!this.HasProp("__Description"))
                this.__Description := PWSTR(this.ptr + 16)
            return this.__Description
        }
    }

    /**
     * TBD
     * @type {PWSTR}
     */
    Provider{
        get {
            if(!this.HasProp("__Provider"))
                this.__Provider := PWSTR(this.ptr + 24)
            return this.__Provider
        }
    }

    /**
     * TBD
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * TBD
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
