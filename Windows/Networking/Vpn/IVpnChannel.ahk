#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\VpnPickedCredential.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\VpnChannelConfiguration.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include .\VpnSystemHealth.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides static functions for VPN plug-ins.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpnchannelstatics
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnChannel extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnChannel
     * @type {Guid}
     */
    static IID => Guid("{4ac78d07-d1a8-4303-a091-c8d2e0915bc3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AssociateTransport", "Start", "Stop", "RequestCredentials", "RequestVpnPacketBuffer", "LogDiagnosticMessage", "get_Id", "get_Configuration", "add_ActivityChange", "remove_ActivityChange", "put_PlugInContext", "get_PlugInContext", "get_SystemHealth", "RequestCustomPrompt", "SetErrorMessage", "SetAllowedSslTlsVersions"]

    /**
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {VpnChannelConfiguration} 
     */
    Configuration {
        get => this.get_Configuration()
    }

    /**
     * @type {IInspectable} 
     */
    PlugInContext {
        get => this.get_PlugInContext()
        set => this.put_PlugInContext(value)
    }

    /**
     * @type {VpnSystemHealth} 
     */
    SystemHealth {
        get => this.get_SystemHealth()
    }

    /**
     * 
     * @param {IInspectable} mainOuterTunnelTransport 
     * @param {IInspectable} optionalOuterTunnelTransport 
     * @returns {HRESULT} 
     */
    AssociateTransport(mainOuterTunnelTransport, optionalOuterTunnelTransport) {
        result := ComCall(6, this, "ptr", mainOuterTunnelTransport, "ptr", optionalOuterTunnelTransport, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies the date and time when the trigger is activated.
     * @remarks
     * The **&lt;StartBoundary&gt;** element is a required element for time and calendar triggers ([**&lt;TimeTrigger&gt;**](taskschedulerschema-timetrigger-triggergroup-element.md) and [**&lt;CalendarTrigger&gt;**](taskschedulerschema-calendartrigger-triggergroup-element.md)).
     * 
     * For scripting development, the end boundary is specified using the [**Trigger.StartBoundary**](trigger-startboundary.md) property that is inherited by the all trigger objects.
     * 
     * For C++ development, the end boundary is specified using the [**ITrigger::StartBoundary**](/windows/desktop/api/taskschd/nf-taskschd-itrigger-get_startboundary) property that is inherited by the all trigger interfaces.
     * @param {IVectorView<HostName>} assignedClientIPv4list 
     * @param {IVectorView<HostName>} assignedClientIPv6list 
     * @param {VpnInterfaceId} vpnInterfaceId_ 
     * @param {VpnRouteAssignment} routeScope 
     * @param {VpnNamespaceAssignment} namespaceScope 
     * @param {Integer} mtuSize 
     * @param {Integer} maxFrameSize 
     * @param {Boolean} optimizeForLowCostNetwork 
     * @param {IInspectable} mainOuterTunnelTransport 
     * @param {IInspectable} optionalOuterTunnelTransport 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/TaskSchd/taskschedulerschema-startboundary-triggerbasetype-element
     */
    Start(assignedClientIPv4list, assignedClientIPv6list, vpnInterfaceId_, routeScope, namespaceScope, mtuSize, maxFrameSize, optimizeForLowCostNetwork, mainOuterTunnelTransport, optionalOuterTunnelTransport) {
        result := ComCall(7, this, "ptr", assignedClientIPv4list, "ptr", assignedClientIPv6list, "ptr", vpnInterfaceId_, "ptr", routeScope, "ptr", namespaceScope, "uint", mtuSize, "uint", maxFrameSize, "int", optimizeForLowCostNetwork, "ptr", mainOuterTunnelTransport, "ptr", optionalOuterTunnelTransport, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies that a running instances of the task is stopped at the end of the repetition pattern duration.
     * @remarks
     * For scripting development, this setting is specified using the [**RepetitionPattern.StopAtDurationEnd**](repetitionpattern-stopatdurationend.md) property.
     * 
     * For C++ development, this setting is specified using the [**IRepetitionPattern::StopAtDurationEnd**](/windows/win32/api/taskschd/nf-taskschd-irepetitionpattern-get_stopatdurationend) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/TaskSchd/taskschedulerschema-stopatdurationend-repetitiontype-element
     */
    Stop() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} credType 
     * @param {Boolean} isRetry 
     * @param {Boolean} isSingleSignOnCredential 
     * @param {Certificate} certificate_ 
     * @returns {VpnPickedCredential} 
     */
    RequestCredentials(credType, isRetry, isSingleSignOnCredential, certificate_) {
        result := ComCall(9, this, "int", credType, "int", isRetry, "int", isSingleSignOnCredential, "ptr", certificate_, "ptr*", &credential := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VpnPickedCredential(credential)
    }

    /**
     * 
     * @param {Integer} type 
     * @param {Pointer<VpnPacketBuffer>} vpnPacketBuffer_ 
     * @returns {HRESULT} 
     */
    RequestVpnPacketBuffer(type, vpnPacketBuffer_) {
        result := ComCall(10, this, "int", type, "ptr", vpnPacketBuffer_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} message 
     * @returns {HRESULT} 
     */
    LogDiagnosticMessage(message) {
        if(message is String) {
            pin := HSTRING.Create(message)
            message := pin.Value
        }
        message := message is Win32Handle ? NumGet(message, "ptr") : message

        result := ComCall(11, this, "ptr", message, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        result := ComCall(12, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {VpnChannelConfiguration} 
     */
    get_Configuration() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VpnChannelConfiguration(value)
    }

    /**
     * 
     * @param {TypedEventHandler<VpnChannel, VpnChannelActivityEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ActivityChange(handler) {
        token := EventRegistrationToken()
        result := ComCall(14, this, "ptr", handler, "ptr", token, "int")
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
    remove_ActivityChange(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(15, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_PlugInContext(value) {
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_PlugInContext() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @returns {VpnSystemHealth} 
     */
    get_SystemHealth() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VpnSystemHealth(value)
    }

    /**
     * 
     * @param {IVectorView<IVpnCustomPrompt>} customPrompt 
     * @returns {HRESULT} 
     */
    RequestCustomPrompt(customPrompt) {
        result := ComCall(19, this, "ptr", customPrompt, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} message 
     * @returns {HRESULT} 
     */
    SetErrorMessage(message) {
        if(message is String) {
            pin := HSTRING.Create(message)
            message := pin.Value
        }
        message := message is Win32Handle ? NumGet(message, "ptr") : message

        result := ComCall(20, this, "ptr", message, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInspectable} tunnelTransport 
     * @param {Boolean} useTls12 
     * @returns {HRESULT} 
     */
    SetAllowedSslTlsVersions(tunnelTransport, useTls12) {
        result := ComCall(21, this, "ptr", tunnelTransport, "int", useTls12, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
