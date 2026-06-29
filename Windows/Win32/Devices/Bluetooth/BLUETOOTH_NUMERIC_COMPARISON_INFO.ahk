#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * BLUETOOTH_NUMERIC_COMPARISON_INFO structure contains the numeric value used for authentication via numeric comparison.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_numeric_comparison_info
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BLUETOOTH_NUMERIC_COMPARISON_INFO {
    #StructPack 4

    /**
     * The numeric  value.
     */
    NumericValue : UInt32

}
