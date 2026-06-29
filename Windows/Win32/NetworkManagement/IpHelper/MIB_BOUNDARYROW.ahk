#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the IPv4 group address value and mask for a multicast boundary.
 * @remarks
 * Note that the <i>Iprtrmib.h</i> header file is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Iprtrmib.h</i> header file should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/iprtrmib/ns-iprtrmib-mib_boundaryrow
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_BOUNDARYROW {
    #StructPack 4

    /**
     * The 32-bit integer representation of the IPv4 group address which, when combined with the corresponding value in <b>dwGroupMask</b>, identifies the group range for which the scoped boundary exists. 
     * 
     * <div class="alert"><b>Note</b>  Scoped addresses must come from the range 239.*.*.* as specified in <a href="https://www.ietf.org/rfc/rfc2365.txt">RFC 2365</a>.</div>
     * <div> </div>
     */
    dwGroupAddress : UInt32

    /**
     * The 32-bit integer representation of the IPv4 group address mask which, when combined with the corresponding value in <b>dwGroupAddress</b>, identifies the group range for which the scoped boundary exists.
     */
    dwGroupMask : UInt32

}
