#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the default, maximum, and minimum values allowed for a signed large integer.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ns-resapi-resutil_largeint_data
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class RESUTIL_LARGEINT_DATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The default value.
     * @type {Integer}
     */
    Default {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * The minimum value.
     * @type {Integer}
     */
    Minimum {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * The maximum value.
     * @type {Integer}
     */
    Maximum {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }
}
