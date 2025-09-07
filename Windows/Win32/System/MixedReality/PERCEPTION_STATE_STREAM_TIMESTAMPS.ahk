#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.MixedReality
 * @version v4.0.30319
 */
class PERCEPTION_STATE_STREAM_TIMESTAMPS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    InputTimestampInQpcCounts {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    AvailableTimestampInQpcCounts {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }
}
