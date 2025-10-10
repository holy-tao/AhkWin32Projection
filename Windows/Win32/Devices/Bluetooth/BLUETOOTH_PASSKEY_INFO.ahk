#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * BLUETOOTH_PASSKEY_INFO structure contains a passkey value used for authentication. A passkey is similar to a password, except that a passkey value is used for authentication only once.
 * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/ns-bluetoothapis-bluetooth_passkey_info
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BLUETOOTH_PASSKEY_INFO extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The passkey used for authentication.
     * @type {Integer}
     */
    passkey {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
