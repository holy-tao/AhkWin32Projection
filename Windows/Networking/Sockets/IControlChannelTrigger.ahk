#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\ApplicationModel\Background\IBackgroundTrigger.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * An object instantiated by the background broker infrastructure that is used to differentiate control channel triggers.
 * @remarks
 * The background broker infrastructure instantiates an object of this type when a background task is initialized. Applications receive a reference to this object in the [Run](../windows.applicationmodel.background/ibackgroundtask_run_2017283929.md) method of the [IBackgroundTask](../windows.applicationmodel.background/ibackgroundtask.md). Applications can use the ControlChannelTrigger property on the IControlChannelTriggerEventDetails object to retrieve the [ControlChannelTrigger](controlchanneltrigger.md) object associated with the control channel trigger event. This allows an application to map a specific control channel trigger event to a specific [ControlChannelTrigger](controlchanneltrigger.md) object and any other associated objects such as the [StreamSocket](streamsocket.md) object on which an application has registered to enable real-time network status and triggers.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.icontrolchanneltriggereventdetails
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IControlChannelTrigger extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IControlChannelTrigger
     * @type {Guid}
     */
    static IID => Guid("{7d1431a7-ee96-40e8-a199-8703cd969ec3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ControlChannelTriggerId", "get_ServerKeepAliveIntervalInMinutes", "put_ServerKeepAliveIntervalInMinutes", "get_CurrentKeepAliveIntervalInMinutes", "get_TransportObject", "get_KeepAliveTrigger", "get_PushNotificationTrigger", "UsingTransport", "WaitForPushEnabled", "DecreaseNetworkKeepAliveInterval", "FlushTransport"]

    /**
     * @type {HSTRING} 
     */
    ControlChannelTriggerId {
        get => this.get_ControlChannelTriggerId()
    }

    /**
     * @type {Integer} 
     */
    ServerKeepAliveIntervalInMinutes {
        get => this.get_ServerKeepAliveIntervalInMinutes()
        set => this.put_ServerKeepAliveIntervalInMinutes(value)
    }

    /**
     * @type {Integer} 
     */
    CurrentKeepAliveIntervalInMinutes {
        get => this.get_CurrentKeepAliveIntervalInMinutes()
    }

    /**
     * @type {IInspectable} 
     */
    TransportObject {
        get => this.get_TransportObject()
    }

    /**
     * @type {IBackgroundTrigger} 
     */
    KeepAliveTrigger {
        get => this.get_KeepAliveTrigger()
    }

    /**
     * @type {IBackgroundTrigger} 
     */
    PushNotificationTrigger {
        get => this.get_PushNotificationTrigger()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ControlChannelTriggerId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServerKeepAliveIntervalInMinutes() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ServerKeepAliveIntervalInMinutes(value) {
        result := ComCall(8, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentKeepAliveIntervalInMinutes() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_TransportObject() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @returns {IBackgroundTrigger} 
     */
    get_KeepAliveTrigger() {
        result := ComCall(11, this, "ptr*", &trigger := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBackgroundTrigger(trigger)
    }

    /**
     * 
     * @returns {IBackgroundTrigger} 
     */
    get_PushNotificationTrigger() {
        result := ComCall(12, this, "ptr*", &trigger := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBackgroundTrigger(trigger)
    }

    /**
     * 
     * @param {IInspectable} transport 
     * @returns {HRESULT} 
     */
    UsingTransport(transport) {
        result := ComCall(13, this, "ptr", transport, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    WaitForPushEnabled() {
        result := ComCall(14, this, "int*", &channelTriggerStatus := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return channelTriggerStatus
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DecreaseNetworkKeepAliveInterval() {
        result := ComCall(15, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FlushTransport() {
        result := ComCall(16, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
