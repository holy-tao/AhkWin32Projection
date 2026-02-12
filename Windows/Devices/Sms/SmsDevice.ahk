#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmsDevice.ahk
#Include .\ISmsDeviceStatics.ahk
#Include .\ISmsDeviceStatics2.ahk
#Include .\SmsMessageReceivedEventHandler.ahk
#Include .\SmsDevice.ahk
#Include .\SmsMessageReceivedEventArgs.ahk
#Include .\SmsDeviceStatusChangedEventHandler.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Supports the operation of a mobile broadband SMS device.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
  * 
  * > [!NOTE]
  * > This class and its methods are supported for the maintenance of legacy desktop apps that used it in earlier versions of Windows. If you do use this class, then you must specify the **Windows.Devices.Sms.LegacySmsApiContract** in your app's manifest. Don't use this class if you're developing a new app for Windows. Instead, use the APIs in this namespace that don't require the **Windows.Devices.Sms.LegacySmsApiContract**.
 * @remarks
 * Apps that use the [Windows.Devices.Sms](ismsdevice.md) API to send or receive text messages fail with **E_ACCESS_DENIED** if the user revokes access.
 * 
 * If access to the SMS device has been given to an app:
 * + Calling [GetDefaultAsync](smsdevice_getdefaultasync_1549573963.md) or [FromIdAsync](smsdevice_fromidasync_1322863552.md) triggers a consent prompt the first time the app is run.
 * + The error handlers for the asynchronous methods of [GetDefaultAsync](smsdevice_getdefaultasync_1549573963.md) and [FromIdAsync](smsdevice_fromidasync_1322863552.md) receive **E_ACCESS_DENIED** if the user did not grant permission in the consent prompt or if permission is revoked.
 * + If the user re-enables access to SMS after revoking it, call [GetDefaultAsync](smsdevice_getdefaultasync_1549573963.md) or [FromIdAsync](smsdevice_fromidasync_1322863552.md) again to access SMS. For example, the error handler for **E_ACCESS_DENIED** error could display UI to instruct the user to re-enable SMS using the settings charm and to then tap a button to retry accessing SMS. The code behind the button should call [GetDefaultAsync](smsdevice_getdefaultasync_1549573963.md) or [FromIdAsync](smsdevice_fromidasync_1322863552.md) before making any other calls.
 * + If the app is registering for the SMS background event ([Windows.ApplicationModel.Background.SystemTriggerType.SmsReceived](../windows.applicationmodel.background/systemtriggertype.md)), the app has to first call [GetDefaultAsync](smsdevice_getdefaultasync_1549573963.md) or [FromIdAsync](smsdevice_fromidasync_1322863552.md) again to access SMS to ensure the app has access. Calling [GetDefaultAsync](smsdevice_getdefaultasync_1549573963.md) or [FromIdAsync](smsdevice_fromidasync_1322863552.md) from the background task will not trigger a consent prompt. If it is a first time run or if the user did not grant permission or if permission is revoked then it will receive an **E_ACCESS_DENIED**.
 * 
 * 
 * The first use of the [SmsDevice](ismsdevice.md) object to call [FromIdAsync](smsdevice_fromidasync_1322863552.md) or [GetDefaultAsync](smsdevice_getdefaultasync_1549573963.md) by applications written in C# or C++ should be on the single-threaded apartment (STA) thread. Calls from a multi-threaded apartment (MTA) thread may result in undefined behavior.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevice
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class SmsDevice extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmsDevice

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmsDevice.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves the class selection string that can be used to enumerate SMS devices.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevice.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!SmsDevice.HasProp("__ISmsDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sms.SmsDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmsDeviceStatics.IID)
            SmsDevice.__ISmsDeviceStatics := ISmsDeviceStatics(factoryPtr)
        }

        return SmsDevice.__ISmsDeviceStatics.GetDeviceSelector()
    }

    /**
     * Creates an instance of [SmsDevice](ismsdevice.md) for the device that received the SMS message.
     * @remarks
     * The [SmsReceivedEventDetails](smsreceivedeventdetails.md) interface handles the details of a received message; you can pass the [DeviceInformation](smsreceivedeventdetails_deviceid.md) ID from that interface to this method to activate the device and retrieve additional message details, such as the sender and the body of the message. Because the device might be busy, the operation executes asynchronously. The asynchronous operation object returns immediately.
     * @param {HSTRING} deviceId A string representation of the [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) ID of the SMS device that received the SMS message.
     * @returns {IAsyncOperation<SmsDevice>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevice.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!SmsDevice.HasProp("__ISmsDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sms.SmsDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmsDeviceStatics.IID)
            SmsDevice.__ISmsDeviceStatics := ISmsDeviceStatics(factoryPtr)
        }

        return SmsDevice.__ISmsDeviceStatics.FromIdAsync(deviceId)
    }

    /**
     * Creates an instance of an [SmsDevice](ismsdevice.md) object associated with the default SMS device. Because the device might be busy, the operation executes asynchronously. The asynchronous operation object returns immediately.
     * @returns {IAsyncOperation<SmsDevice>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevice.getdefaultasync
     */
    static GetDefaultAsync() {
        if (!SmsDevice.HasProp("__ISmsDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sms.SmsDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmsDeviceStatics.IID)
            SmsDevice.__ISmsDeviceStatics := ISmsDeviceStatics(factoryPtr)
        }

        return SmsDevice.__ISmsDeviceStatics.GetDefaultAsync()
    }

    /**
     * Creates an instance of [SmsDevice](ismsdevice.md) for the specified Mobile Broadband network account ID.
     * @param {HSTRING} networkAccountId The Mobile Broadband network account ID to use to select the corresponding mobile broadband device to use for the SMS device
     * @returns {IAsyncOperation<SmsDevice>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevice.fromnetworkaccountidasync
     */
    static FromNetworkAccountIdAsync(networkAccountId) {
        if (!SmsDevice.HasProp("__ISmsDeviceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sms.SmsDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmsDeviceStatics2.IID)
            SmsDevice.__ISmsDeviceStatics2 := ISmsDeviceStatics2(factoryPtr)
        }

        return SmsDevice.__ISmsDeviceStatics2.FromNetworkAccountIdAsync(networkAccountId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Returns the phone number associated with the SMS device. The phone number can be used to associate incoming messages with the account and possibly an external storage mechanism such as an account inbox.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevice.accountphonenumber
     * @type {HSTRING} 
     */
    AccountPhoneNumber {
        get => this.get_AccountPhoneNumber()
    }

    /**
     * Returns the cellular class of the SMS device. The class can be used to determine which encodings are appropriate or which device limitations are in effect.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevice.cellularclass
     * @type {Integer} 
     */
    CellularClass {
        get => this.get_CellularClass()
    }

    /**
     * Accesses the on-device message store. The store holds messages until a client can retrieve them. On some devices, for example, the store may correspond to the SIM storage for SMS messages.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevice.messagestore
     * @type {SmsDeviceMessageStore} 
     */
    MessageStore {
        get => this.get_MessageStore()
    }

    /**
     * Returns the SMS device's status, which indicates whether the device is ready, or not. It also indicates what type of problem exists if the device is not ready.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevice.devicestatus
     * @type {Integer} 
     */
    DeviceStatus {
        get => this.get_DeviceStatus()
    }

    /**
     * Sets an event handler to be called when the device receives a new text message.
     * @type {SmsMessageReceivedEventHandler}
    */
    OnSmsMessageReceived {
        get {
            if(!this.HasProp("__OnSmsMessageReceived")){
                this.__OnSmsMessageReceived := WinRTEventHandler(
                    SmsMessageReceivedEventHandler,
                    SmsMessageReceivedEventHandler.IID,
                    SmsDevice,
                    SmsMessageReceivedEventArgs
                )
                this.__OnSmsMessageReceivedToken := this.add_SmsMessageReceived(this.__OnSmsMessageReceived.iface)
            }
            return this.__OnSmsMessageReceived
        }
    }

    /**
     * Sets an event handler to be called when the status of the SMS device changes.
     * @type {SmsDeviceStatusChangedEventHandler}
    */
    OnSmsDeviceStatusChanged {
        get {
            if(!this.HasProp("__OnSmsDeviceStatusChanged")){
                this.__OnSmsDeviceStatusChanged := WinRTEventHandler(
                    SmsDeviceStatusChangedEventHandler,
                    SmsDeviceStatusChangedEventHandler.IID,
                    SmsDevice
                )
                this.__OnSmsDeviceStatusChangedToken := this.add_SmsDeviceStatusChanged(this.__OnSmsDeviceStatusChanged.iface)
            }
            return this.__OnSmsDeviceStatusChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSmsMessageReceivedToken")) {
            this.remove_SmsMessageReceived(this.__OnSmsMessageReceivedToken)
            this.__OnSmsMessageReceived.iface.Dispose()
        }

        if(this.HasProp("__OnSmsDeviceStatusChangedToken")) {
            this.remove_SmsDeviceStatusChanged(this.__OnSmsDeviceStatusChangedToken)
            this.__OnSmsDeviceStatusChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Asynchronously sends a message using the SMS device. The method is asynchronous because the send operation might not occur instantaneously. The message operation object is returned immediately.
     * @param {ISmsMessage} message A reference to an [ISmsMessage](ismsmessage.md) object. The message can be in text or binary format.
     * @returns {SendSmsMessageOperation} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevice.sendmessageasync
     */
    SendMessageAsync(message) {
        if (!this.HasProp("__ISmsDevice")) {
            if ((queryResult := this.QueryInterface(ISmsDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsDevice := ISmsDevice(outPtr)
        }

        return this.__ISmsDevice.SendMessageAsync(message)
    }

    /**
     * Estimates the transmitted message length of the specified text message. The estimate can be useful to clients who want to give an indication of how many messages will be sent on the network to carry the text of the full message.
     * @param {SmsTextMessage} message A reference to the SMS text message to measure.
     * @returns {SmsEncodedLength} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevice.calculatelength
     */
    CalculateLength(message) {
        if (!this.HasProp("__ISmsDevice")) {
            if ((queryResult := this.QueryInterface(ISmsDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsDevice := ISmsDevice(outPtr)
        }

        return this.__ISmsDevice.CalculateLength(message)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AccountPhoneNumber() {
        if (!this.HasProp("__ISmsDevice")) {
            if ((queryResult := this.QueryInterface(ISmsDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsDevice := ISmsDevice(outPtr)
        }

        return this.__ISmsDevice.get_AccountPhoneNumber()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CellularClass() {
        if (!this.HasProp("__ISmsDevice")) {
            if ((queryResult := this.QueryInterface(ISmsDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsDevice := ISmsDevice(outPtr)
        }

        return this.__ISmsDevice.get_CellularClass()
    }

    /**
     * 
     * @returns {SmsDeviceMessageStore} 
     */
    get_MessageStore() {
        if (!this.HasProp("__ISmsDevice")) {
            if ((queryResult := this.QueryInterface(ISmsDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsDevice := ISmsDevice(outPtr)
        }

        return this.__ISmsDevice.get_MessageStore()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DeviceStatus() {
        if (!this.HasProp("__ISmsDevice")) {
            if ((queryResult := this.QueryInterface(ISmsDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsDevice := ISmsDevice(outPtr)
        }

        return this.__ISmsDevice.get_DeviceStatus()
    }

    /**
     * 
     * @param {SmsMessageReceivedEventHandler} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_SmsMessageReceived(eventHandler) {
        if (!this.HasProp("__ISmsDevice")) {
            if ((queryResult := this.QueryInterface(ISmsDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsDevice := ISmsDevice(outPtr)
        }

        return this.__ISmsDevice.add_SmsMessageReceived(eventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_SmsMessageReceived(eventCookie) {
        if (!this.HasProp("__ISmsDevice")) {
            if ((queryResult := this.QueryInterface(ISmsDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsDevice := ISmsDevice(outPtr)
        }

        return this.__ISmsDevice.remove_SmsMessageReceived(eventCookie)
    }

    /**
     * 
     * @param {SmsDeviceStatusChangedEventHandler} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_SmsDeviceStatusChanged(eventHandler) {
        if (!this.HasProp("__ISmsDevice")) {
            if ((queryResult := this.QueryInterface(ISmsDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsDevice := ISmsDevice(outPtr)
        }

        return this.__ISmsDevice.add_SmsDeviceStatusChanged(eventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_SmsDeviceStatusChanged(eventCookie) {
        if (!this.HasProp("__ISmsDevice")) {
            if ((queryResult := this.QueryInterface(ISmsDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsDevice := ISmsDevice(outPtr)
        }

        return this.__ISmsDevice.remove_SmsDeviceStatusChanged(eventCookie)
    }

;@endregion Instance Methods
}
