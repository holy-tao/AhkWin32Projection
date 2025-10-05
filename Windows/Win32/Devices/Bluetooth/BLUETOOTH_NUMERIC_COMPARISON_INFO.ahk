#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * BLUETOOTH_NUMERIC_COMPARISON_INFO structure contains the numeric value used for authentication via numeric comparison.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_numeric_comparison_info
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BLUETOOTH_NUMERIC_COMPARISON_INFO extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The numeric  value.
     * @type {Integer}
     */
    NumericValue {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
