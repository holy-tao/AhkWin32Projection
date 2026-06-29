#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The RTM_PREF_INFO structure contains the information used when comparing any two routes. The value of the Preference member is given more weight than the value of the Metric member.
 * @remarks
 * Preference is more important than metric. The metric is only  checked if the preferences are equal.
 * @see https://learn.microsoft.com/windows/win32/api/rtmv2/ns-rtmv2-rtm_pref_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RTM_PREF_INFO {
    #StructPack 4

    /**
     * Specifies a metric. The metric is specific to a particular routing protocol.
     */
    Metric : UInt32

    /**
     * Specifies a preference. The preference is determined by the router policy.
     */
    Preference : UInt32

}
