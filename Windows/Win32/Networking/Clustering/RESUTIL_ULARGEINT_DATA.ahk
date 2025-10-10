#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the default, maximum, and minimum values allowed for an unsigned large integer.
 * @see https://docs.microsoft.com/windows/win32/api//resapi/ns-resapi-resutil_ulargeint_data
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class RESUTIL_ULARGEINT_DATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The default value.
     * @type {Integer}
     */
    Default {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The minimum value.
     * @type {Integer}
     */
    Minimum {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The maximum value.
     * @type {Integer}
     */
    Maximum {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
