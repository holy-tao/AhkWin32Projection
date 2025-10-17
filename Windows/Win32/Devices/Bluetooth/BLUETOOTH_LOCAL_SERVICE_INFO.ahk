#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BLUETOOTH_ADDRESS.ahk

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BLUETOOTH_LOCAL_SERVICE_INFO extends Win32Struct
{
    static sizeof => 1048

    static packingSize => 8

    /**
     * @type {BOOL}
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
                this.__btAddr := BLUETOOTH_ADDRESS(8, this)
            return this.__btAddr
        }
    }

    /**
     * @type {String}
     */
    szName {
        get => StrGet(this.ptr + 24, 255, "UTF-16")
        set => StrPut(value, this.ptr + 24, 255, "UTF-16")
    }

    /**
     * @type {String}
     */
    szDeviceString {
        get => StrGet(this.ptr + 536, 255, "UTF-16")
        set => StrPut(value, this.ptr + 536, 255, "UTF-16")
    }
}
