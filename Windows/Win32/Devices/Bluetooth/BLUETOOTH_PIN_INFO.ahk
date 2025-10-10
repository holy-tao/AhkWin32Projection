#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * BLUETOOTH_PIN_INFO structure contains information used for authentication via PIN.
 * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/ns-bluetoothapis-bluetooth_pin_info
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BLUETOOTH_PIN_INFO extends Win32Struct
{
    static sizeof => 17

    static packingSize => 1

    /**
     * The PIN  used for authentication.
     * @type {Array<Byte>}
     */
    pin{
        get {
            if(!this.HasProp("__pinProxyArray"))
                this.__pinProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__pinProxyArray
        }
    }

    /**
     * The length of <i>pin</i>.
     * @type {Integer}
     */
    pinLength {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }
}
