#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains read-only information on the available bandwidth estimates and associated variance as determined by the TCP/IP stack.
 * @remarks
 * The  <b>NL_BANDWIDTH_INFORMATION</b> structure is defined in the <i>Nldef.h</i> header file which is automatically included by the <i>Iptypes.h</i> header file which is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Nldef.h</i> and <i>Iptypes.h</i> header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/nldef/ns-nldef-nl_bandwidth_information
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class NL_BANDWIDTH_INFORMATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The estimated maximum available bandwidth, in bits per second.
     * @type {Integer}
     */
    Bandwidth {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A measure of the variation based on recent bandwidth samples, in bits per second.
     * @type {Integer}
     */
    Instability {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A value that indicates if the bandwidth estimate in the <b>Bandwidth</b> member has peaked and reached its maximum value for the given network conditions. 
     * 
     * The TCP/IP stack uses a heuristic to set this variable. Until this variable is set, there is no guarantee that the true available maximum bandwidth is not higher than the estimated bandwidth in the <b>Bandwidth</b> member. However, it is safe to assume that maximum available bandwidth is not lower than the estimate reported in the <b>Bandwidth</b> member.
     * @type {BOOLEAN}
     */
    BandwidthPeaked {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }
}
