#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\..\Win32\Foundation\UNICODE_STRING.ahk

/**
 * @namespace Windows.Wdk.Foundation
 * @version v4.0.30319
 */
class DRIVER_EXTENSION extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Pointer<DRIVER_OBJECT>}
     */
    DriverObject {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<DRIVER_ADD_DEVICE>}
     */
    AddDevice {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {UNICODE_STRING}
     */
    ServiceKeyName{
        get {
            if(!this.HasProp("__ServiceKeyName"))
                this.__ServiceKeyName := UNICODE_STRING(24, this)
            return this.__ServiceKeyName
        }
    }
}
