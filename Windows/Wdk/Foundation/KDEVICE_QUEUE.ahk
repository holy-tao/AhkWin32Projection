#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\..\Win32\System\Kernel\LIST_ENTRY.ahk

/**
 * @namespace Windows.Wdk.Foundation
 * @version v4.0.30319
 */
class KDEVICE_QUEUE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 2, "short")
        set => NumPut("short", value, this, 2)
    }

    /**
     * @type {LIST_ENTRY}
     */
    DeviceListHead{
        get {
            if(!this.HasProp("__DeviceListHead"))
                this.__DeviceListHead := LIST_ENTRY(8, this)
            return this.__DeviceListHead
        }
    }

    /**
     * @type {Pointer}
     */
    Lock {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {BOOLEAN}
     */
    Busy {
        get => NumGet(this, 32, "char")
        set => NumPut("char", value, this, 32)
    }
}
