#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CF_HYDRATION_POLICY.ahk
#Include .\CF_POPULATION_POLICY.ahk

/**
 * Defines the sync policies used by a sync root.
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ns-cfapi-cf_sync_policies
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_SYNC_POLICIES extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * The size of the CF_SYNC_POLICIES structure.
     * @type {Integer}
     */
    StructSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The hydration policy.
     * @type {CF_HYDRATION_POLICY}
     */
    Hydration{
        get {
            if(!this.HasProp("__Hydration"))
                this.__Hydration := CF_HYDRATION_POLICY(this.ptr + 4)
            return this.__Hydration
        }
    }

    /**
     * The population policy.
     * @type {CF_POPULATION_POLICY}
     */
    Population{
        get {
            if(!this.HasProp("__Population"))
                this.__Population := CF_POPULATION_POLICY(this.ptr + 8)
            return this.__Population
        }
    }

    /**
     * The in-sync policy.
     * @type {Integer}
     */
    InSync {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The hard link policy.
     * @type {Integer}
     */
    HardLink {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    PlaceholderManagement {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
