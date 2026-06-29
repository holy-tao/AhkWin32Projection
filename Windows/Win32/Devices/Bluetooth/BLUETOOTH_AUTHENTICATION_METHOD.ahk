#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * BLUETOOTH_AUTHENTICATION_METHOD enumeration defines the supported authentication types during device pairing.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/ne-bluetoothapis-bluetooth_authentication_method
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BLUETOOTH_AUTHENTICATION_METHOD {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
