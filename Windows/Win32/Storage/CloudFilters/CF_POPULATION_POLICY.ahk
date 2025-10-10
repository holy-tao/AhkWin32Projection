#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the primary population policy and its modifier.
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ns-cfapi-cf_population_policy
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_POPULATION_POLICY extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * The primary population policy.
     * @type {Integer}
     */
    Primary {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The population policy modifier.
     * @type {Integer}
     */
    Modifier {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
