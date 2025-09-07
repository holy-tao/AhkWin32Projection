#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BLUETOOTH_ADDRESS.ahk

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BLUETOOTH_LOCAL_SERVICE_INFO extends Win32Struct
{
    static sizeof => 1040

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Enabled {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {BLUETOOTH_ADDRESS}
     */
    btAddr{
        get {
            if(!this.HasProp("__btAddr"))
                this.__btAddr := BLUETOOTH_ADDRESS(this.ptr + 8)
            return this.__btAddr
        }
    }

    /**
     * @type {String}
     */
    szName {
        get => StrGet(this.ptr + 16, 255, "UTF-16")
        set => StrPut(value, this.ptr + 16, 255, "UTF-16")
    }

    /**
     * @type {String}
     */
    szDeviceString {
        get => StrGet(this.ptr + 528, 255, "UTF-16")
        set => StrPut(value, this.ptr + 528, 255, "UTF-16")
    }
}
