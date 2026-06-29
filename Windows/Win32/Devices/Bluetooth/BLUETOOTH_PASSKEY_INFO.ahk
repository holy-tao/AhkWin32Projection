#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * BLUETOOTH_PASSKEY_INFO structure contains a passkey value used for authentication. A passkey is similar to a password, except that a passkey value is used for authentication only once.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_passkey_info
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BLUETOOTH_PASSKEY_INFO {
    #StructPack 4

    /**
     * The passkey used for authentication.
     */
    passkey : UInt32

}
