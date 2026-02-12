#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SmsEncodedLength.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\SmsSendMessageResult.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class ISmsDevice2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmsDevice2
     * @type {Guid}
     */
    static IID => Guid("{bd8a5c13-e522-46cb-b8d5-9ead30fb6c47}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SmscAddress", "put_SmscAddress", "get_DeviceId", "get_ParentDeviceId", "get_AccountPhoneNumber", "get_CellularClass", "get_DeviceStatus", "CalculateLength", "SendMessageAndGetResultAsync", "add_DeviceStatusChanged", "remove_DeviceStatusChanged"]

    /**
     * @type {HSTRING} 
     */
    SmscAddress {
        get => this.get_SmscAddress()
        set => this.put_SmscAddress(value)
    }

    /**
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * @type {HSTRING} 
     */
    ParentDeviceId {
        get => this.get_ParentDeviceId()
    }

    /**
     * @type {HSTRING} 
     */
    AccountPhoneNumber {
        get => this.get_AccountPhoneNumber()
    }

    /**
     * @type {Integer} 
     */
    CellularClass {
        get => this.get_CellularClass()
    }

    /**
     * @type {Integer} 
     */
    DeviceStatus {
        get => this.get_DeviceStatus()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SmscAddress() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SmscAddress(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ParentDeviceId() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AccountPhoneNumber() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CellularClass() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DeviceStatus() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {ISmsMessageBase} message 
     * @returns {SmsEncodedLength} 
     */
    CalculateLength(message) {
        value := SmsEncodedLength()
        result := ComCall(13, this, "ptr", message, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {ISmsMessageBase} message 
     * @returns {IAsyncOperation<SmsSendMessageResult>} 
     */
    SendMessageAndGetResultAsync(message) {
        result := ComCall(14, this, "ptr", message, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SmsSendMessageResult, asyncInfo)
    }

    /**
     * 
     * @param {TypedEventHandler<SmsDevice2, IInspectable>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_DeviceStatusChanged(eventHandler) {
        eventCookie := EventRegistrationToken()
        result := ComCall(15, this, "ptr", eventHandler, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return eventCookie
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_DeviceStatusChanged(eventCookie) {
        eventCookie := eventCookie is Win32Handle ? NumGet(eventCookie, "ptr") : eventCookie

        result := ComCall(16, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
