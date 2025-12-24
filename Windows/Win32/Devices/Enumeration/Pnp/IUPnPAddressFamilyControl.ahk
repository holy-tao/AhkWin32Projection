#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IUPnPAddressFamilyControl interface accesses the address family flag of the Device Finder object.
 * @see https://docs.microsoft.com/windows/win32/api//upnp/nn-upnp-iupnpaddressfamilycontrol
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPAddressFamilyControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUPnPAddressFamilyControl
     * @type {Guid}
     */
    static IID => Guid("{e3bf6178-694e-459f-a5a6-191ea0ffa1c7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAddressFamily", "GetAddressFamily"]

    /**
     * The SetAddressFamily method sets the address family flag of the Device Finder object, which uses this flag to filter the devices found.
     * @param {Integer} dwFlags Integer (4-byte value) that specifies the address family to be used by the Device Finder object to filter the devices found.
     * 
     * The following values are valid.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UPNP_ADDRESSFAMILY_IPv4"></a><a id="upnp_addressfamily_ipv4"></a><a id="UPNP_ADDRESSFAMILY_IPV4"></a><dl>
     * <dt><b>UPNP_ADDRESSFAMILY_IPv4</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IPv4 (IP version 4)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UPNP_ADDRESSFAMILY_IPv6"></a><a id="upnp_addressfamily_ipv6"></a><a id="UPNP_ADDRESSFAMILY_IPV6"></a><dl>
     * <dt><b>UPNP_ADDRESSFAMILY_IPv6</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IPv6 (IP version 6)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UPNP_ADDRESSFAMILY_BOTH"></a><a id="upnp_addressfamily_both"></a><dl>
     * <dt><b>UPNP_ADDRESSFAMILY_BOTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IPv4 and IPv6
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpaddressfamilycontrol-setaddressfamily
     */
    SetAddressFamily(dwFlags) {
        result := ComCall(3, this, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * The GetAddressFamily method retrieves the current value of the address family flag of the Device Finder object.
     * @returns {Integer} Pointer to an integer (4-byte value) that indicates the address family.
     * 
     * The following values are valid.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UPNP_ADDRESSFAMILY_IPv4"></a><a id="upnp_addressfamily_ipv4"></a><a id="UPNP_ADDRESSFAMILY_IPV4"></a><dl>
     * <dt><b>UPNP_ADDRESSFAMILY_IPv4</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IPv4 (IP version 4)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UPNP_ADDRESSFAMILY_IPv6"></a><a id="upnp_addressfamily_ipv6"></a><a id="UPNP_ADDRESSFAMILY_IPV6"></a><dl>
     * <dt><b>UPNP_ADDRESSFAMILY_IPv6</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IPv6 (IP version 6)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="UPNP_ADDRESSFAMILY_BOTH"></a><a id="upnp_addressfamily_both"></a><dl>
     * <dt><b>UPNP_ADDRESSFAMILY_BOTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IPv4 and IPv6
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//upnp/nf-upnp-iupnpaddressfamilycontrol-getaddressfamily
     */
    GetAddressFamily() {
        result := ComCall(4, this, "int*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }
}
