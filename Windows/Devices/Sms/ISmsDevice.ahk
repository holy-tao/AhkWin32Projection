#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SendSmsMessageOperation.ahk
#Include .\SmsEncodedLength.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SmsDeviceMessageStore.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * This interface controls a mobile broadband SMS device. It is the primary entry point to SMS services on the device.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.ismsdevice
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class ISmsDevice extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmsDevice
     * @type {Guid}
     */
    static IID => Guid("{091791ed-872b-4eec-9c72-ab11627b34ec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SendMessageAsync", "CalculateLength", "get_AccountPhoneNumber", "get_CellularClass", "get_MessageStore", "get_DeviceStatus", "add_SmsMessageReceived", "remove_SmsMessageReceived", "add_SmsDeviceStatusChanged", "remove_SmsDeviceStatusChanged"]

    /**
     * Returns the phone number associated with the SMS device. The phone number can be used to associate incoming messages with the account and possibly an external storage mechanism such as an account inbox.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.ismsdevice.accountphonenumber
     * @type {HSTRING} 
     */
    AccountPhoneNumber {
        get => this.get_AccountPhoneNumber()
    }

    /**
     * Returns the cellular class of the SMS device. The class can be used to determine which encodings are appropriate or which device limitations are in effect.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.ismsdevice.cellularclass
     * @type {Integer} 
     */
    CellularClass {
        get => this.get_CellularClass()
    }

    /**
     * Accesses the on-device message store. The store holds messages until a client can retrieve them. On some devices, for example, the store may correspond to the SIM storage for SMS messages.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.ismsdevice.messagestore
     * @type {SmsDeviceMessageStore} 
     */
    MessageStore {
        get => this.get_MessageStore()
    }

    /**
     * Returns the SMS device's status, which indicates whether the device is ready, or not. It also indcates what type of problem exists if the device is not ready.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.ismsdevice.devicestatus
     * @type {Integer} 
     */
    DeviceStatus {
        get => this.get_DeviceStatus()
    }

    /**
     * Asynchronously sends a message using the SMS device. The method is asynchronous because the send operation might not occur instantaneously. The asynchronous operation object is returned immediately.
     * @param {ISmsMessage} message A reference to an SmsMessage object. The message can be in text or binary format.
     * @returns {SendSmsMessageOperation} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.ismsdevice.sendmessageasync
     */
    SendMessageAsync(message) {
        result := ComCall(6, this, "ptr", message, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SendSmsMessageOperation(asyncInfo)
    }

    /**
     * Estimates the transmitted message length of the specified text message. The estimate can be useful to clients who want to give an indication of how many messages will be sent on the network to carry the text of the full message.
     * @param {SmsTextMessage} message A reference to the SMS text message to measure.
     * @returns {SmsEncodedLength} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.ismsdevice.calculatelength
     */
    CalculateLength(message) {
        encodedLength := SmsEncodedLength()
        result := ComCall(7, this, "ptr", message, "ptr", encodedLength, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return encodedLength
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AccountPhoneNumber() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
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
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SmsDeviceMessageStore} 
     */
    get_MessageStore() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SmsDeviceMessageStore(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DeviceStatus() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {SmsMessageReceivedEventHandler} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_SmsMessageReceived(eventHandler) {
        eventCookie := EventRegistrationToken()
        result := ComCall(12, this, "ptr", eventHandler, "ptr", eventCookie, "int")
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
    remove_SmsMessageReceived(eventCookie) {
        eventCookie := eventCookie is Win32Handle ? NumGet(eventCookie, "ptr") : eventCookie

        result := ComCall(13, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {SmsDeviceStatusChangedEventHandler} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_SmsDeviceStatusChanged(eventHandler) {
        eventCookie := EventRegistrationToken()
        result := ComCall(14, this, "ptr", eventHandler, "ptr", eventCookie, "int")
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
    remove_SmsDeviceStatusChanged(eventCookie) {
        eventCookie := eventCookie is Win32Handle ? NumGet(eventCookie, "ptr") : eventCookie

        result := ComCall(15, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
