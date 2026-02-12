#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\WiFiDirectServiceSession.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.WiFiDirect.Services
 * @version WindowsRuntime 1.4
 */
class IWiFiDirectServiceAdvertiser extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiFiDirectServiceAdvertiser
     * @type {Guid}
     */
    static IID => Guid("{a4aa1ee1-9d8f-4f4f-93ee-7ddea2e37f46}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ServiceName", "get_ServiceNamePrefixes", "get_ServiceInfo", "put_ServiceInfo", "get_AutoAcceptSession", "put_AutoAcceptSession", "get_PreferGroupOwnerMode", "put_PreferGroupOwnerMode", "get_PreferredConfigurationMethods", "get_ServiceStatus", "put_ServiceStatus", "get_CustomServiceStatusCode", "put_CustomServiceStatusCode", "get_DeferredSessionInfo", "put_DeferredSessionInfo", "get_AdvertisementStatus", "get_ServiceError", "add_SessionRequested", "remove_SessionRequested", "add_AutoAcceptSessionConnected", "remove_AutoAcceptSessionConnected", "add_AdvertisementStatusChanged", "remove_AdvertisementStatusChanged", "ConnectAsync", "ConnectAsyncWithPin", "Start", "Stop"]

    /**
     * @type {HSTRING} 
     */
    ServiceName {
        get => this.get_ServiceName()
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    ServiceNamePrefixes {
        get => this.get_ServiceNamePrefixes()
    }

    /**
     * @type {IBuffer} 
     */
    ServiceInfo {
        get => this.get_ServiceInfo()
        set => this.put_ServiceInfo(value)
    }

    /**
     * @type {Boolean} 
     */
    AutoAcceptSession {
        get => this.get_AutoAcceptSession()
        set => this.put_AutoAcceptSession(value)
    }

    /**
     * @type {Boolean} 
     */
    PreferGroupOwnerMode {
        get => this.get_PreferGroupOwnerMode()
        set => this.put_PreferGroupOwnerMode(value)
    }

    /**
     * @type {IVector<Integer>} 
     */
    PreferredConfigurationMethods {
        get => this.get_PreferredConfigurationMethods()
    }

    /**
     * @type {Integer} 
     */
    ServiceStatus {
        get => this.get_ServiceStatus()
        set => this.put_ServiceStatus(value)
    }

    /**
     * @type {Integer} 
     */
    CustomServiceStatusCode {
        get => this.get_CustomServiceStatusCode()
        set => this.put_CustomServiceStatusCode(value)
    }

    /**
     * @type {IBuffer} 
     */
    DeferredSessionInfo {
        get => this.get_DeferredSessionInfo()
        set => this.put_DeferredSessionInfo(value)
    }

    /**
     * @type {Integer} 
     */
    AdvertisementStatus {
        get => this.get_AdvertisementStatus()
    }

    /**
     * @type {Integer} 
     */
    ServiceError {
        get => this.get_ServiceError()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ServiceName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_ServiceNamePrefixes() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_ServiceInfo() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_ServiceInfo(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoAcceptSession() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AutoAcceptSession(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PreferGroupOwnerMode() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_PreferGroupOwnerMode(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_PreferredConfigurationMethods() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServiceStatus() {
        result := ComCall(15, this, "int*", &value := 0, "int")
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
    put_ServiceStatus(value) {
        result := ComCall(16, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CustomServiceStatusCode() {
        result := ComCall(17, this, "uint*", &value := 0, "int")
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
    put_CustomServiceStatusCode(value) {
        result := ComCall(18, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_DeferredSessionInfo() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_DeferredSessionInfo(value) {
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AdvertisementStatus() {
        result := ComCall(21, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServiceError() {
        result := ComCall(22, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<WiFiDirectServiceAdvertiser, WiFiDirectServiceSessionRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SessionRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(23, this, "ptr", handler, "ptr", token, "int")
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
    remove_SessionRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(24, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<WiFiDirectServiceAdvertiser, WiFiDirectServiceAutoAcceptSessionConnectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AutoAcceptSessionConnected(handler) {
        token := EventRegistrationToken()
        result := ComCall(25, this, "ptr", handler, "ptr", token, "int")
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
    remove_AutoAcceptSessionConnected(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(26, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<WiFiDirectServiceAdvertiser, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AdvertisementStatusChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(27, this, "ptr", handler, "ptr", token, "int")
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
    remove_AdvertisementStatusChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(28, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DeviceInformation} deviceInfo 
     * @returns {IAsyncOperation<WiFiDirectServiceSession>} 
     */
    ConnectAsync(deviceInfo) {
        result := ComCall(29, this, "ptr", deviceInfo, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WiFiDirectServiceSession, result_)
    }

    /**
     * 
     * @param {DeviceInformation} deviceInfo 
     * @param {HSTRING} pin 
     * @returns {IAsyncOperation<WiFiDirectServiceSession>} 
     */
    ConnectAsyncWithPin(deviceInfo, pin) {
        if(pin is String) {
            pin := HSTRING.Create(pin)
            pin := pin.Value
        }
        pin := pin is Win32Handle ? NumGet(pin, "ptr") : pin

        result := ComCall(30, this, "ptr", deviceInfo, "ptr", pin, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(WiFiDirectServiceSession, result_)
    }

    /**
     * Specifies the date and time when the trigger is activated.
     * @remarks
     * The **&lt;StartBoundary&gt;** element is a required element for time and calendar triggers ([**&lt;TimeTrigger&gt;**](taskschedulerschema-timetrigger-triggergroup-element.md) and [**&lt;CalendarTrigger&gt;**](taskschedulerschema-calendartrigger-triggergroup-element.md)).
     * 
     * For scripting development, the end boundary is specified using the [**Trigger.StartBoundary**](trigger-startboundary.md) property that is inherited by the all trigger objects.
     * 
     * For C++ development, the end boundary is specified using the [**ITrigger::StartBoundary**](/windows/desktop/api/taskschd/nf-taskschd-itrigger-get_startboundary) property that is inherited by the all trigger interfaces.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/TaskSchd/taskschedulerschema-startboundary-triggerbasetype-element
     */
    Start() {
        result := ComCall(31, this, "int")
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
        result := ComCall(32, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
