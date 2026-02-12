#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\XboxLiveEndpointPairCreationResult.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\XboxLiveEndpointPair.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.XboxLive
 * @version WindowsRuntime 1.4
 */
class IXboxLiveEndpointPairTemplate extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXboxLiveEndpointPairTemplate
     * @type {Guid}
     */
    static IID => Guid("{6b286ecf-3457-40ce-b9a1-c0cfe0213ea7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_InboundEndpointPairCreated", "remove_InboundEndpointPairCreated", "CreateEndpointPairDefaultAsync", "CreateEndpointPairWithBehaviorsAsync", "CreateEndpointPairForPortsDefaultAsync", "CreateEndpointPairForPortsWithBehaviorsAsync", "get_Name", "get_SocketKind", "get_InitiatorBoundPortRangeLower", "get_InitiatorBoundPortRangeUpper", "get_AcceptorBoundPortRangeLower", "get_AcceptorBoundPortRangeUpper", "get_EndpointPairs"]

    /**
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {Integer} 
     */
    SocketKind {
        get => this.get_SocketKind()
    }

    /**
     * @type {Integer} 
     */
    InitiatorBoundPortRangeLower {
        get => this.get_InitiatorBoundPortRangeLower()
    }

    /**
     * @type {Integer} 
     */
    InitiatorBoundPortRangeUpper {
        get => this.get_InitiatorBoundPortRangeUpper()
    }

    /**
     * @type {Integer} 
     */
    AcceptorBoundPortRangeLower {
        get => this.get_AcceptorBoundPortRangeLower()
    }

    /**
     * @type {Integer} 
     */
    AcceptorBoundPortRangeUpper {
        get => this.get_AcceptorBoundPortRangeUpper()
    }

    /**
     * @type {IVectorView<XboxLiveEndpointPair>} 
     */
    EndpointPairs {
        get => this.get_EndpointPairs()
    }

    /**
     * 
     * @param {TypedEventHandler<XboxLiveEndpointPairTemplate, XboxLiveInboundEndpointPairCreatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_InboundEndpointPairCreated(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
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
    remove_InboundEndpointPairCreated(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {XboxLiveDeviceAddress} deviceAddress 
     * @returns {IAsyncOperation<XboxLiveEndpointPairCreationResult>} 
     */
    CreateEndpointPairDefaultAsync(deviceAddress) {
        result := ComCall(8, this, "ptr", deviceAddress, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(XboxLiveEndpointPairCreationResult, operation)
    }

    /**
     * 
     * @param {XboxLiveDeviceAddress} deviceAddress 
     * @param {Integer} behaviors 
     * @returns {IAsyncOperation<XboxLiveEndpointPairCreationResult>} 
     */
    CreateEndpointPairWithBehaviorsAsync(deviceAddress, behaviors) {
        result := ComCall(9, this, "ptr", deviceAddress, "uint", behaviors, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(XboxLiveEndpointPairCreationResult, operation)
    }

    /**
     * 
     * @param {XboxLiveDeviceAddress} deviceAddress 
     * @param {HSTRING} initiatorPort 
     * @param {HSTRING} acceptorPort 
     * @returns {IAsyncOperation<XboxLiveEndpointPairCreationResult>} 
     */
    CreateEndpointPairForPortsDefaultAsync(deviceAddress, initiatorPort, acceptorPort) {
        if(initiatorPort is String) {
            pin := HSTRING.Create(initiatorPort)
            initiatorPort := pin.Value
        }
        initiatorPort := initiatorPort is Win32Handle ? NumGet(initiatorPort, "ptr") : initiatorPort
        if(acceptorPort is String) {
            pin := HSTRING.Create(acceptorPort)
            acceptorPort := pin.Value
        }
        acceptorPort := acceptorPort is Win32Handle ? NumGet(acceptorPort, "ptr") : acceptorPort

        result := ComCall(10, this, "ptr", deviceAddress, "ptr", initiatorPort, "ptr", acceptorPort, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(XboxLiveEndpointPairCreationResult, operation)
    }

    /**
     * 
     * @param {XboxLiveDeviceAddress} deviceAddress 
     * @param {HSTRING} initiatorPort 
     * @param {HSTRING} acceptorPort 
     * @param {Integer} behaviors 
     * @returns {IAsyncOperation<XboxLiveEndpointPairCreationResult>} 
     */
    CreateEndpointPairForPortsWithBehaviorsAsync(deviceAddress, initiatorPort, acceptorPort, behaviors) {
        if(initiatorPort is String) {
            pin := HSTRING.Create(initiatorPort)
            initiatorPort := pin.Value
        }
        initiatorPort := initiatorPort is Win32Handle ? NumGet(initiatorPort, "ptr") : initiatorPort
        if(acceptorPort is String) {
            pin := HSTRING.Create(acceptorPort)
            acceptorPort := pin.Value
        }
        acceptorPort := acceptorPort is Win32Handle ? NumGet(acceptorPort, "ptr") : acceptorPort

        result := ComCall(11, this, "ptr", deviceAddress, "ptr", initiatorPort, "ptr", acceptorPort, "uint", behaviors, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(XboxLiveEndpointPairCreationResult, operation)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SocketKind() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InitiatorBoundPortRangeLower() {
        result := ComCall(14, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InitiatorBoundPortRangeUpper() {
        result := ComCall(15, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AcceptorBoundPortRangeLower() {
        result := ComCall(16, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AcceptorBoundPortRangeUpper() {
        result := ComCall(17, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<XboxLiveEndpointPair>} 
     */
    get_EndpointPairs() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(XboxLiveEndpointPair, value)
    }
}
