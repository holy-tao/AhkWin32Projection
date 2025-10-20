#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/emi/ns-emi-emi_channel_measurement_data
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class EMI_CHANNEL_MEASUREMENT_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    AbsoluteEnergy {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    AbsoluteTime {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
