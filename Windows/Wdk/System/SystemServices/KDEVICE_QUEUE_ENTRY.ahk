#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\System\Kernel\LIST_ENTRY.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class KDEVICE_QUEUE_ENTRY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {LIST_ENTRY}
     */
    DeviceListEntry{
        get {
            if(!this.HasProp("__DeviceListEntry"))
                this.__DeviceListEntry := LIST_ENTRY(0, this)
            return this.__DeviceListEntry
        }
    }

    /**
     * @type {Integer}
     */
    SortKey {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {BOOLEAN}
     */
    Inserted {
        get => NumGet(this, 20, "char")
        set => NumPut("char", value, this, 20)
    }
}
