#Requires AutoHotkey v2.0.0 64-bit

/**
 * BLUETOOTH_AUTHENTICATION_METHOD enumeration defines the supported authentication types during device pairing.
 * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/ne-bluetoothapis-bluetooth_authentication_method
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BLUETOOTH_AUTHENTICATION_METHOD{

    /**
     * The Bluetooth device supports authentication via a PIN.
     * @type {Integer (Int32)}
     */
    static BLUETOOTH_AUTHENTICATION_METHOD_LEGACY => 1

    /**
     * The Bluetooth device supports authentication via out-of-band data.
     * @type {Integer (Int32)}
     */
    static BLUETOOTH_AUTHENTICATION_METHOD_OOB => 2

    /**
     * The Bluetooth device supports authentication via numeric comparison.
     * @type {Integer (Int32)}
     */
    static BLUETOOTH_AUTHENTICATION_METHOD_NUMERIC_COMPARISON => 3

    /**
     * The Bluetooth device supports authentication via passkey notification.
     * @type {Integer (Int32)}
     */
    static BLUETOOTH_AUTHENTICATION_METHOD_PASSKEY_NOTIFICATION => 4

    /**
     * The Bluetooth device supports authentication via  passkey.
     * @type {Integer (Int32)}
     */
    static BLUETOOTH_AUTHENTICATION_METHOD_PASSKEY => 5
}
