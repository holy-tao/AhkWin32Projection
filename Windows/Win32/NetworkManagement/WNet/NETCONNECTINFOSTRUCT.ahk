#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The NETCONNECTINFOSTRUCT structure contains information about the performance of a network. It is used by the NPGetConnectionPerformance function.
 * @see https://docs.microsoft.com/windows/win32/api//winnetwk/ns-winnetwk-netconnectinfostruct
 * @namespace Windows.Win32.NetworkManagement.WNet
 * @version v4.0.30319
 */
class NETCONNECTINFOSTRUCT extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * The size of the <b>NETCONNECTINFOSTRUCT</b> structure, in bytes. This is filled in by the caller to indicate the size of the structure passed in. The network provider should leave this field unchanged and can assume that the structure is large enough to contain all fields up to and including <b>dwOptDataSize</b>.
     * @type {Integer}
     */
    cbStructure {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This is a bitmask which may have one or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WNCON_FORNETCARD"></a><a id="wncon_fornetcard"></a><dl>
     * <dt><b>WNCON_FORNETCARD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, the information returned is for the performance of the netcard used for the connection. This information is returned if information about the actual connection is not available. 
     * 
     * 
     * 
     * 
     * If not set, the information returned is for the current connection with the resource, with any routing degradation taken into consideration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WNCON_NOTROUTED"></a><a id="wncon_notrouted"></a><dl>
     * <dt><b>WNCON_NOTROUTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, the connection is not treated as being routed. In other words, routing is not taken into account when estimating the performance. This means actual performance may be much less than the information returned. 
     * 
     * 
     * 
     * 
     * If not set, the connection may be going through routers that limit performance.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WNCON_SLOWLINK"></a><a id="wncon_slowlink"></a><dl>
     * <dt><b>WNCON_SLOWLINK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, the connection is known at some point to be over a medium that is typically slow (for example, a modem using a normal quality phone line). 
     * 
     * 
     * 
     * 
     * Providers that return a value in <b>dwSpeed</b> do not have to set this bit.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WNCON_DYNAMIC"></a><a id="wncon_dynamic"></a><dl>
     * <dt><b>WNCON_DYNAMIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, some of the information returned is dynamically recalculated. If that is the case, reissuing this request on the connection may return different, more current, information.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The speed of the media to the network resource in units of 100bps. For example, a 1,200 baud point-to-point link returns 12.
     * @type {Integer}
     */
    dwSpeed {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The delay introduced by the network when sending information, in milliseconds. In other words, the time between when the network starts to send data and the time it is received. This is in addition to any latency that was incorporated into the calculation of <b>dwSpeed</b>, so the value returned will be zero for accessing most resources.
     * @type {Integer}
     */
    dwDelay {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A recommendation for the size of data, in bytes, that is most efficiently sent through the network when an application makes a single request to the network resource. For example, for a disk network resource, this value might be 2048 or 512 when writing a block of data.
     * @type {Integer}
     */
    dwOptDataSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
