#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RTM_PREF_INFO structure contains the information used when comparing any two routes. The value of the Preference member is given more weight than the value of the Metric member.
 * @remarks
 * Preference is more important than metric. The metric is only  checked if the preferences are equal.
 * @see https://learn.microsoft.com/windows/win32/api/rtmv2/ns-rtmv2-rtm_pref_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RTM_PREF_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies a metric. The metric is specific to a particular routing protocol.
     * @type {Integer}
     */
    Metric {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies a preference. The preference is determined by the router policy.
     * @type {Integer}
     */
    Preference {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
