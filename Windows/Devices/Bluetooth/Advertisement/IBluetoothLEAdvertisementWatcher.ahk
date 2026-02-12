#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\TimeSpan.ahk
#Include ..\BluetoothSignalStrengthFilter.ahk
#Include .\BluetoothLEAdvertisementFilter.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.Advertisement
 * @version WindowsRuntime 1.4
 */
class IBluetoothLEAdvertisementWatcher extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothLEAdvertisementWatcher
     * @type {Guid}
     */
    static IID => Guid("{a6ac336f-f3d3-4297-8d6c-c81ea6623f40}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MinSamplingInterval", "get_MaxSamplingInterval", "get_MinOutOfRangeTimeout", "get_MaxOutOfRangeTimeout", "get_Status", "get_ScanningMode", "put_ScanningMode", "get_SignalStrengthFilter", "put_SignalStrengthFilter", "get_AdvertisementFilter", "put_AdvertisementFilter", "Start", "Stop", "add_Received", "remove_Received", "add_Stopped", "remove_Stopped"]

    /**
     * @type {TimeSpan} 
     */
    MinSamplingInterval {
        get => this.get_MinSamplingInterval()
    }

    /**
     * @type {TimeSpan} 
     */
    MaxSamplingInterval {
        get => this.get_MaxSamplingInterval()
    }

    /**
     * @type {TimeSpan} 
     */
    MinOutOfRangeTimeout {
        get => this.get_MinOutOfRangeTimeout()
    }

    /**
     * @type {TimeSpan} 
     */
    MaxOutOfRangeTimeout {
        get => this.get_MaxOutOfRangeTimeout()
    }

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {Integer} 
     */
    ScanningMode {
        get => this.get_ScanningMode()
        set => this.put_ScanningMode(value)
    }

    /**
     * @type {BluetoothSignalStrengthFilter} 
     */
    SignalStrengthFilter {
        get => this.get_SignalStrengthFilter()
        set => this.put_SignalStrengthFilter(value)
    }

    /**
     * @type {BluetoothLEAdvertisementFilter} 
     */
    AdvertisementFilter {
        get => this.get_AdvertisementFilter()
        set => this.put_AdvertisementFilter(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_MinSamplingInterval() {
        value := TimeSpan()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_MaxSamplingInterval() {
        value := TimeSpan()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_MinOutOfRangeTimeout() {
        value := TimeSpan()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_MaxOutOfRangeTimeout() {
        value := TimeSpan()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ScanningMode() {
        result := ComCall(11, this, "int*", &value := 0, "int")
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
    put_ScanningMode(value) {
        result := ComCall(12, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BluetoothSignalStrengthFilter} 
     */
    get_SignalStrengthFilter() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BluetoothSignalStrengthFilter(value)
    }

    /**
     * 
     * @param {BluetoothSignalStrengthFilter} value 
     * @returns {HRESULT} 
     */
    put_SignalStrengthFilter(value) {
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BluetoothLEAdvertisementFilter} 
     */
    get_AdvertisementFilter() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BluetoothLEAdvertisementFilter(value)
    }

    /**
     * 
     * @param {BluetoothLEAdvertisementFilter} value 
     * @returns {HRESULT} 
     */
    put_AdvertisementFilter(value) {
        result := ComCall(16, this, "ptr", value, "int")
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
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/TaskSchd/taskschedulerschema-startboundary-triggerbasetype-element
     */
    Start() {
        result := ComCall(17, this, "int")
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
        result := ComCall(18, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<BluetoothLEAdvertisementWatcher, BluetoothLEAdvertisementReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Received(handler) {
        token := EventRegistrationToken()
        result := ComCall(19, this, "ptr", handler, "ptr", token, "int")
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
    remove_Received(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(20, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<BluetoothLEAdvertisementWatcher, BluetoothLEAdvertisementWatcherStoppedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Stopped(handler) {
        token := EventRegistrationToken()
        result := ComCall(21, this, "ptr", handler, "ptr", token, "int")
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
    remove_Stopped(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(22, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
