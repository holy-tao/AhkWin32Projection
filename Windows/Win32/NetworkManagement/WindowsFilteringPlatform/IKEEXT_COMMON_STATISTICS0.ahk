#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IKEEXT_IP_VERSION_SPECIFIC_COMMON_STATISTICS0.ahk

/**
 * Various statistics common to IKE and Authip.
 * @see https://docs.microsoft.com/windows/win32/api//iketypes/ns-iketypes-ikeext_common_statistics0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_COMMON_STATISTICS0 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * IPv4 common statistics.
     * 
     * See <a href="https://docs.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_ip_version_specific_common_statistics0">IKEEXT_IP_VERSION_SPECIFIC_COMMON_STATISTICS0</a> for more information.
     * @type {IKEEXT_IP_VERSION_SPECIFIC_COMMON_STATISTICS0}
     */
    v4Statistics{
        get {
            if(!this.HasProp("__v4Statistics"))
                this.__v4Statistics := IKEEXT_IP_VERSION_SPECIFIC_COMMON_STATISTICS0(this.ptr + 0)
            return this.__v4Statistics
        }
    }

    /**
     * IPv6 common statistics.
     * 
     * See <a href="https://docs.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_ip_version_specific_common_statistics0">IKEEXT_IP_VERSION_SPECIFIC_COMMON_STATISTICS0</a> for more information.
     * @type {IKEEXT_IP_VERSION_SPECIFIC_COMMON_STATISTICS0}
     */
    v6Statistics{
        get {
            if(!this.HasProp("__v6Statistics"))
                this.__v6Statistics := IKEEXT_IP_VERSION_SPECIFIC_COMMON_STATISTICS0(this.ptr + 8)
            return this.__v6Statistics
        }
    }

    /**
     * Total number of packets received.
     * @type {Integer}
     */
    totalPacketsReceived {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Total number of invalid packets received.
     * @type {Integer}
     */
    totalInvalidPacketsReceived {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Current number of work items that are queued and waiting to be processed.
     * @type {Integer}
     */
    currentQueuedWorkitems {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
