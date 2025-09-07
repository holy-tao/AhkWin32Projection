#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Various statistics common to IKE and Authip. (IKEEXT_IP_VERSION_SPECIFIC_COMMON_STATISTICS0)
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_ip_version_specific_common_statistics0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_IP_VERSION_SPECIFIC_COMMON_STATISTICS0 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Total number of UDP 500/4500 socket receive failures.
     * @type {Integer}
     */
    totalSocketReceiveFailures {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Total number of UDP 500/4500 socket send failures.
     * @type {Integer}
     */
    totalSocketSendFailures {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
