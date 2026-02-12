#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include .\VpnPacketBuffer.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\VpnCredential.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnChannel2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnChannel2
     * @type {Guid}
     */
    static IID => Guid("{2255d165-993b-4629-ad60-f1c3f3537f50}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartWithMainTransport", "StartExistingTransports", "add_ActivityStateChange", "remove_ActivityStateChange", "GetVpnSendPacketBuffer", "GetVpnReceivePacketBuffer", "RequestCustomPromptAsync", "RequestCredentialsWithCertificateAsync", "RequestCredentialsWithOptionsAsync", "RequestCredentialsSimpleAsync", "TerminateConnection", "StartWithTrafficFilter"]

    /**
     * 
     * @param {IVectorView<HostName>} assignedClientIPv4list 
     * @param {IVectorView<HostName>} assignedClientIPv6list 
     * @param {VpnInterfaceId} vpnInterfaceId_ 
     * @param {VpnRouteAssignment} assignedRoutes 
     * @param {VpnDomainNameAssignment} assignedDomainName 
     * @param {Integer} mtuSize 
     * @param {Integer} maxFrameSize 
     * @param {Boolean} Reserved 
     * @param {IInspectable} mainOuterTunnelTransport 
     * @returns {HRESULT} 
     */
    StartWithMainTransport(assignedClientIPv4list, assignedClientIPv6list, vpnInterfaceId_, assignedRoutes, assignedDomainName, mtuSize, maxFrameSize, Reserved, mainOuterTunnelTransport) {
        result := ComCall(6, this, "ptr", assignedClientIPv4list, "ptr", assignedClientIPv6list, "ptr", vpnInterfaceId_, "ptr", assignedRoutes, "ptr", assignedDomainName, "uint", mtuSize, "uint", maxFrameSize, "int", Reserved, "ptr", mainOuterTunnelTransport, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IVectorView<HostName>} assignedClientIPv4list 
     * @param {IVectorView<HostName>} assignedClientIPv6list 
     * @param {VpnInterfaceId} vpnInterfaceId_ 
     * @param {VpnRouteAssignment} assignedRoutes 
     * @param {VpnDomainNameAssignment} assignedDomainName 
     * @param {Integer} mtuSize 
     * @param {Integer} maxFrameSize 
     * @param {Boolean} Reserved 
     * @returns {HRESULT} 
     */
    StartExistingTransports(assignedClientIPv4list, assignedClientIPv6list, vpnInterfaceId_, assignedRoutes, assignedDomainName, mtuSize, maxFrameSize, Reserved) {
        result := ComCall(7, this, "ptr", assignedClientIPv4list, "ptr", assignedClientIPv6list, "ptr", vpnInterfaceId_, "ptr", assignedRoutes, "ptr", assignedDomainName, "uint", mtuSize, "uint", maxFrameSize, "int", Reserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<VpnChannel, VpnChannelActivityStateChangedArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ActivityStateChange(handler) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ActivityStateChange(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VpnPacketBuffer} 
     */
    GetVpnSendPacketBuffer() {
        result := ComCall(10, this, "ptr*", &vpnSendPacketBuffer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VpnPacketBuffer(vpnSendPacketBuffer)
    }

    /**
     * 
     * @returns {VpnPacketBuffer} 
     */
    GetVpnReceivePacketBuffer() {
        result := ComCall(11, this, "ptr*", &vpnReceivePacketBuffer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VpnPacketBuffer(vpnReceivePacketBuffer)
    }

    /**
     * 
     * @param {IVectorView<IVpnCustomPromptElement>} customPromptElement 
     * @returns {IAsyncAction} 
     */
    RequestCustomPromptAsync(customPromptElement) {
        result := ComCall(12, this, "ptr", customPromptElement, "ptr*", &action := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(action)
    }

    /**
     * 
     * @param {Integer} credType 
     * @param {Integer} credOptions 
     * @param {Certificate} certificate_ 
     * @returns {IAsyncOperation<VpnCredential>} 
     */
    RequestCredentialsWithCertificateAsync(credType, credOptions, certificate_) {
        result := ComCall(13, this, "int", credType, "uint", credOptions, "ptr", certificate_, "ptr*", &credential := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(VpnCredential, credential)
    }

    /**
     * 
     * @param {Integer} credType 
     * @param {Integer} credOptions 
     * @returns {IAsyncOperation<VpnCredential>} 
     */
    RequestCredentialsWithOptionsAsync(credType, credOptions) {
        result := ComCall(14, this, "int", credType, "uint", credOptions, "ptr*", &credential := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(VpnCredential, credential)
    }

    /**
     * 
     * @param {Integer} credType 
     * @returns {IAsyncOperation<VpnCredential>} 
     */
    RequestCredentialsSimpleAsync(credType) {
        result := ComCall(15, this, "int", credType, "ptr*", &credential := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(VpnCredential, credential)
    }

    /**
     * 
     * @param {HSTRING} message 
     * @returns {HRESULT} 
     */
    TerminateConnection(message) {
        if(message is String) {
            pin := HSTRING.Create(message)
            message := pin.Value
        }
        message := message is Win32Handle ? NumGet(message, "ptr") : message

        result := ComCall(16, this, "ptr", message, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IVectorView<HostName>} assignedClientIpv4List 
     * @param {IVectorView<HostName>} assignedClientIpv6List 
     * @param {VpnInterfaceId} vpnInterfaceId_ 
     * @param {VpnRouteAssignment} assignedRoutes 
     * @param {VpnDomainNameAssignment} assignedNamespace 
     * @param {Integer} mtuSize 
     * @param {Integer} maxFrameSize 
     * @param {Boolean} reserved 
     * @param {IInspectable} mainOuterTunnelTransport 
     * @param {IInspectable} optionalOuterTunnelTransport 
     * @param {VpnTrafficFilterAssignment} assignedTrafficFilters 
     * @returns {HRESULT} 
     */
    StartWithTrafficFilter(assignedClientIpv4List, assignedClientIpv6List, vpnInterfaceId_, assignedRoutes, assignedNamespace, mtuSize, maxFrameSize, reserved, mainOuterTunnelTransport, optionalOuterTunnelTransport, assignedTrafficFilters) {
        result := ComCall(17, this, "ptr", assignedClientIpv4List, "ptr", assignedClientIpv6List, "ptr", vpnInterfaceId_, "ptr", assignedRoutes, "ptr", assignedNamespace, "uint", mtuSize, "uint", maxFrameSize, "int", reserved, "ptr", mainOuterTunnelTransport, "ptr", optionalOuterTunnelTransport, "ptr", assignedTrafficFilters, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
