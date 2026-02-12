#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\VpnRoute.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Factory to create [VpnRoute](vpnroute.md) objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpnroutefactory
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnRouteFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnRouteFactory
     * @type {Guid}
     */
    static IID => Guid("{bdeab5ff-45cf-4b99-83fb-db3bc2672b02}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateVpnRoute"]

    /**
     * Creates [VpnRoute](vpnroute.md) objects.
     * @param {HostName} address_ Represents the ID or the address of the subnet under the route control.
     * @param {Integer} prefixSize The size (in bits) to be considered by the subnet.
     * @returns {VpnRoute} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpnroutefactory.createvpnroute
     */
    CreateVpnRoute(address_, prefixSize) {
        result := ComCall(6, this, "ptr", address_, "char", prefixSize, "ptr*", &route := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VpnRoute(route)
    }
}
