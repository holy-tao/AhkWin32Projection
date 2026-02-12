#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmsDevice2.ahk
#Include .\ISmsDevice2Statics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\SmsDevice2.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Extends the [SmsDevice](smsdevice.md) class, and supports the operation of a mobile broadband SMS device.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
 * @remarks
 * Use this class as you would use the [SmsDevice](smsdevice.md) class, when you need the additional properties and methods this class provides.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevice2
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class SmsDevice2 extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmsDevice2

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmsDevice2.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves the class selection string that can be used to enumerate SMS devices.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevice2.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!SmsDevice2.HasProp("__ISmsDevice2Statics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sms.SmsDevice2")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmsDevice2Statics.IID)
            SmsDevice2.__ISmsDevice2Statics := ISmsDevice2Statics(factoryPtr)
        }

        return SmsDevice2.__ISmsDevice2Statics.GetDeviceSelector()
    }

    /**
     * Creates an instance of [SmsDevice2](smsdevice2.md) for a device that received an SMS message.
     * @param {HSTRING} deviceId A string representation of the device ID of the device that received an SMS message.
     * @returns {SmsDevice2} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevice2.fromid
     */
    static FromId(deviceId) {
        if (!SmsDevice2.HasProp("__ISmsDevice2Statics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sms.SmsDevice2")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmsDevice2Statics.IID)
            SmsDevice2.__ISmsDevice2Statics := ISmsDevice2Statics(factoryPtr)
        }

        return SmsDevice2.__ISmsDevice2Statics.FromId(deviceId)
    }

    /**
     * Creates an instance of [SmsDevice2](smsdevice2.md) associated with the default SMS device.
     * @returns {SmsDevice2} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevice2.getdefault
     */
    static GetDefault() {
        if (!SmsDevice2.HasProp("__ISmsDevice2Statics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sms.SmsDevice2")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmsDevice2Statics.IID)
            SmsDevice2.__ISmsDevice2Statics := ISmsDevice2Statics(factoryPtr)
        }

        return SmsDevice2.__ISmsDevice2Statics.GetDefault()
    }

    /**
     * Creates an instance of [SmsDevice2](smsdevice2.md) for a device, given the device ID of the parent device.
     * @param {HSTRING} parentDeviceId The device ID of the parent device.
     * @returns {SmsDevice2} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevice2.fromparentid
     */
    static FromParentId(parentDeviceId) {
        if (!SmsDevice2.HasProp("__ISmsDevice2Statics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sms.SmsDevice2")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmsDevice2Statics.IID)
            SmsDevice2.__ISmsDevice2Statics := ISmsDevice2Statics(factoryPtr)
        }

        return SmsDevice2.__ISmsDevice2Statics.FromParentId(parentDeviceId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the SMSC address of this device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevice2.smscaddress
     * @type {HSTRING} 
     */
    SmscAddress {
        get => this.get_SmscAddress()
        set => this.put_SmscAddress(value)
    }

    /**
     * The device ID of the device represented by this instance.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevice2.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * The parent device ID of this device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevice2.parentdeviceid
     * @type {HSTRING} 
     */
    ParentDeviceId {
        get => this.get_ParentDeviceId()
    }

    /**
     * Gets the phone number associated with the SMS device. The phone number can be used to associate incoming messages with the account and possibly an external storage mechanism such as an account inbox.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevice2.accountphonenumber
     * @type {HSTRING} 
     */
    AccountPhoneNumber {
        get => this.get_AccountPhoneNumber()
    }

    /**
     * Returns the cellular class of the SMS device. The class can be used to determine which encodings are appropriate or which device limitations are in effect.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevice2.cellularclass
     * @type {Integer} 
     */
    CellularClass {
        get => this.get_CellularClass()
    }

    /**
     * Returns the SMS device's status, which indicates whether the device is ready, or not. It also indicates what type of problem exists if the device is not ready.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevice2.devicestatus
     * @type {Integer} 
     */
    DeviceStatus {
        get => this.get_DeviceStatus()
    }

    /**
     * Sets an event handler to be called when the status of the SMS device changes.
     * @type {TypedEventHandler<SmsDevice2, IInspectable>}
    */
    OnDeviceStatusChanged {
        get {
            if(!this.HasProp("__OnDeviceStatusChanged")){
                this.__OnDeviceStatusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{3f3808e6-3dee-57a6-a88d-bacfb066c7fb}"),
                    SmsDevice2,
                    IInspectable
                )
                this.__OnDeviceStatusChangedToken := this.add_DeviceStatusChanged(this.__OnDeviceStatusChanged.iface)
            }
            return this.__OnDeviceStatusChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnDeviceStatusChangedToken")) {
            this.remove_DeviceStatusChanged(this.__OnDeviceStatusChangedToken)
            this.__OnDeviceStatusChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SmscAddress() {
        if (!this.HasProp("__ISmsDevice2")) {
            if ((queryResult := this.QueryInterface(ISmsDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsDevice2 := ISmsDevice2(outPtr)
        }

        return this.__ISmsDevice2.get_SmscAddress()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SmscAddress(value) {
        if (!this.HasProp("__ISmsDevice2")) {
            if ((queryResult := this.QueryInterface(ISmsDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsDevice2 := ISmsDevice2(outPtr)
        }

        return this.__ISmsDevice2.put_SmscAddress(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__ISmsDevice2")) {
            if ((queryResult := this.QueryInterface(ISmsDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsDevice2 := ISmsDevice2(outPtr)
        }

        return this.__ISmsDevice2.get_DeviceId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ParentDeviceId() {
        if (!this.HasProp("__ISmsDevice2")) {
            if ((queryResult := this.QueryInterface(ISmsDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsDevice2 := ISmsDevice2(outPtr)
        }

        return this.__ISmsDevice2.get_ParentDeviceId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AccountPhoneNumber() {
        if (!this.HasProp("__ISmsDevice2")) {
            if ((queryResult := this.QueryInterface(ISmsDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsDevice2 := ISmsDevice2(outPtr)
        }

        return this.__ISmsDevice2.get_AccountPhoneNumber()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CellularClass() {
        if (!this.HasProp("__ISmsDevice2")) {
            if ((queryResult := this.QueryInterface(ISmsDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsDevice2 := ISmsDevice2(outPtr)
        }

        return this.__ISmsDevice2.get_CellularClass()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DeviceStatus() {
        if (!this.HasProp("__ISmsDevice2")) {
            if ((queryResult := this.QueryInterface(ISmsDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsDevice2 := ISmsDevice2(outPtr)
        }

        return this.__ISmsDevice2.get_DeviceStatus()
    }

    /**
     * Estimates the transmitted message length of the specified text message. The estimate can be useful to clients that want to give an indication of how many messages will be sent on the network to carry the text of the full message.
     * @param {ISmsMessageBase} message A reference to the SMS text message to measure.
     * @returns {SmsEncodedLength} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevice2.calculatelength
     */
    CalculateLength(message) {
        if (!this.HasProp("__ISmsDevice2")) {
            if ((queryResult := this.QueryInterface(ISmsDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsDevice2 := ISmsDevice2(outPtr)
        }

        return this.__ISmsDevice2.CalculateLength(message)
    }

    /**
     * Asynchronously sends a message using the SMS device. The method is asynchronous because the send operation might not occur instantaneously. The message operation object is returned immediately.
     * @param {ISmsMessageBase} message A reference to an object that implements the [ISmsMessageBase](ismsmessagebase.md) interface. The message can be in text or binary format.
     * @returns {IAsyncOperation<SmsSendMessageResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevice2.sendmessageandgetresultasync
     */
    SendMessageAndGetResultAsync(message) {
        if (!this.HasProp("__ISmsDevice2")) {
            if ((queryResult := this.QueryInterface(ISmsDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsDevice2 := ISmsDevice2(outPtr)
        }

        return this.__ISmsDevice2.SendMessageAndGetResultAsync(message)
    }

    /**
     * 
     * @param {TypedEventHandler<SmsDevice2, IInspectable>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_DeviceStatusChanged(eventHandler) {
        if (!this.HasProp("__ISmsDevice2")) {
            if ((queryResult := this.QueryInterface(ISmsDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsDevice2 := ISmsDevice2(outPtr)
        }

        return this.__ISmsDevice2.add_DeviceStatusChanged(eventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_DeviceStatusChanged(eventCookie) {
        if (!this.HasProp("__ISmsDevice2")) {
            if ((queryResult := this.QueryInterface(ISmsDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsDevice2 := ISmsDevice2(outPtr)
        }

        return this.__ISmsDevice2.remove_DeviceStatusChanged(eventCookie)
    }

;@endregion Instance Methods
}
