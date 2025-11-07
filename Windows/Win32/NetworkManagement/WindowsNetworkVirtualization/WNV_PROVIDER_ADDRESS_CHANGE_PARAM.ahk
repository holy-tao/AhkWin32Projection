#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk
#Include .\WNV_IP_ADDRESS.ahk

/**
 * Specifies the provider address's DAD (duplicate address detection) status change, which causes the Windows Network Virtualization (WNV) driver to generate a WnvObjectChangeType notification that specifies the WnvProviderAddressType object type containing this structure.
 * @remarks
 * 
 * For a detailed description of network virtualization concepts and terminology, refer to <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/jj134230(v=ws.11)">Hyper-V Network Virtualization Overview</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wnvapi/ns-wnvapi-wnv_provider_address_change_param
 * @namespace Windows.Win32.NetworkManagement.WindowsNetworkVirtualization
 * @version v4.0.30319
 */
class WNV_PROVIDER_ADDRESS_CHANGE_PARAM extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>ADDRESS_FAMILY</b>
     * 
     * The address family (<b>AF_INET</b> or <b>AF_INET6</b>) for the provider address.
     * @type {Integer}
     */
    PAFamily {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wnvapi/ns-wnvapi-wnv_ip_address">WNV_IP_ADDRESS</a></b>
     * 
     * The IP address object for the provider address, which is the matching IP address used on the physical network for the customer address.
     * @type {WNV_IP_ADDRESS}
     */
    PA{
        get {
            if(!this.HasProp("__PA"))
                this.__PA := WNV_IP_ADDRESS(8, this)
            return this.__PA
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff568758(v=vs.85)">NL_DAD_STATE</a></b>
     * 
     * A value of the <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff568758(v=vs.85)">NL_DAD_STATE</a> enumeration that represents the new DAD state. Duplicate address detection is applicable to both IPv4 and IPv6 addresses.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IpDadStateInvalid"></a><a id="ipdadstateinvalid"></a><a id="IPDADSTATEINVALID"></a><dl>
     * <dt><b>IpDadStateInvalid</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DAD state is not valid. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IpDadStateTentative"></a><a id="ipdadstatetentative"></a><a id="IPDADSTATETENTATIVE"></a><dl>
     * <dt><b>IpDadStateTentative</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DAD state is tentative. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IpDadStateDuplicate"></a><a id="ipdadstateduplicate"></a><a id="IPDADSTATEDUPLICATE"></a><dl>
     * <dt><b>IpDadStateDuplicate</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A duplicate IP address has been detected. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IpDadStateDeprecated"></a><a id="ipdadstatedeprecated"></a><a id="IPDADSTATEDEPRECATED"></a><dl>
     * <dt><b>IpDadStateDeprecated</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IP address has been deprecated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IpDadStatePreferred"></a><a id="ipdadstatepreferred"></a><a id="IPDADSTATEPREFERRED"></a><dl>
     * <dt><b>IpDadStatePreferred</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IP address is the preferred address. 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    AddressState {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
