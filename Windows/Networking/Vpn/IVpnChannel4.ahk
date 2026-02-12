#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnChannel4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnChannel4
     * @type {Guid}
     */
    static IID => Guid("{d7266ede-2937-419d-9570-486aebb81803}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddAndAssociateTransport", "StartWithMultipleTransports", "ReplaceAndAssociateTransport", "StartReconnectingTransport", "GetSlotTypeForTransportContext", "get_CurrentRequestTransportContext"]

    /**
     * @type {IInspectable} 
     */
    CurrentRequestTransportContext {
        get => this.get_CurrentRequestTransportContext()
    }

    /**
     * 
     * @param {IInspectable} transport 
     * @param {IInspectable} context_ 
     * @returns {HRESULT} 
     */
    AddAndAssociateTransport(transport, context_) {
        result := ComCall(6, this, "ptr", transport, "ptr", context_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IIterable<HostName>} assignedClientIpv4Addresses 
     * @param {IIterable<HostName>} assignedClientIpv6Addresses 
     * @param {VpnInterfaceId} vpninterfaceId_ 
     * @param {VpnRouteAssignment} assignedRoutes 
     * @param {VpnDomainNameAssignment} assignedNamespace 
     * @param {Integer} mtuSize 
     * @param {Integer} maxFrameSize 
     * @param {Boolean} reserved 
     * @param {IIterable<IInspectable>} transports 
     * @param {VpnTrafficFilterAssignment} assignedTrafficFilters 
     * @returns {HRESULT} 
     */
    StartWithMultipleTransports(assignedClientIpv4Addresses, assignedClientIpv6Addresses, vpninterfaceId_, assignedRoutes, assignedNamespace, mtuSize, maxFrameSize, reserved, transports, assignedTrafficFilters) {
        result := ComCall(7, this, "ptr", assignedClientIpv4Addresses, "ptr", assignedClientIpv6Addresses, "ptr", vpninterfaceId_, "ptr", assignedRoutes, "ptr", assignedNamespace, "uint", mtuSize, "uint", maxFrameSize, "int", reserved, "ptr", transports, "ptr", assignedTrafficFilters, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} transport 
     * @param {IInspectable} context_ 
     * @returns {HRESULT} 
     */
    ReplaceAndAssociateTransport(transport, context_) {
        result := ComCall(8, this, "ptr", transport, "ptr", context_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} transport 
     * @param {IInspectable} context_ 
     * @returns {HRESULT} 
     */
    StartReconnectingTransport(transport, context_) {
        result := ComCall(9, this, "ptr", transport, "ptr", context_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} context_ 
     * @returns {Integer} 
     */
    GetSlotTypeForTransportContext(context_) {
        result := ComCall(10, this, "ptr", context_, "int*", &slotType := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return slotType
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_CurrentRequestTransportContext() {
        result := ComCall(11, this, "ptr*", &context_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(context_)
    }
}
