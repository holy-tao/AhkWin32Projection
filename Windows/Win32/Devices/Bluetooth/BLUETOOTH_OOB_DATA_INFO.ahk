#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * BLUETOOTH_OOB_DATA_INFO structure contains data used to authenticate prior to establishing an Out-of-Band device pairing.
 * @remarks
 * For more details regarding the creation of keys for OOB authentication, see the [Bluetooth Core Specification](https://www.bluetooth.com/specifications/specs/core-specification-5-3/).
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_oob_data_info
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BLUETOOTH_OOB_DATA_INFO {
    #StructPack 1

    /**
     * A 128-bit cryptographic key used for two-way authentication.
     */
    C : Int8[16]

    /**
     * A randomly generated number used for one-way authentication. If this number is not provided by the device initiating the OOB session, this value is 0.
     */
    R : Int8[16]

}
