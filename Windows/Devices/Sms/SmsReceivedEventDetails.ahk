#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmsReceivedEventDetails.ahk
#Include .\ISmsReceivedEventDetails2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Presents the details of SMS message events to the background work item that handles messages while your app is suspended.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
  * 
  * > [!NOTE]
  * > This class and its methods are supported for the maintenance of legacy desktop apps that used it in earlier versions of Windows. If you do use this class, then you must specify the **Windows.Devices.Sms.LegacySmsApiContract** in your app's manifest. Don't use this class if you're developing a new app for Windows. Instead, use the APIs in this namespace that don't require the **Windows.Devices.Sms.LegacySmsApiContract**.
 * @remarks
 * Windows extends battery life by suspending applications that are not in the foreground. If your application needs to handle new SMS messages even while it is suspended, it needs to create a background work item to handle this. When a new SMS message arrives, the background work item is activated.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsreceivedeventdetails
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class SmsReceivedEventDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmsReceivedEventDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmsReceivedEventDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Returns the [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) ID of the network interface that received the SMS message. This ID can be passed to [SmsDevice.FromIdAsync](smsdevice_fromidasync_1322863552.md) to activate the device and retrieve additional message details.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsreceivedeventdetails.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Returns the index of the new message that raised the event. You can pass this to [SmsDevice.GetMessageAsync](smsdevicemessagestore_getmessageasync_746997042.md) to retrieve the new message itself.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsreceivedeventdetails.messageindex
     * @type {Integer} 
     */
    MessageIndex {
        get => this.get_MessageIndex()
    }

    /**
     * Gets the message class for the SMS message received by the background task.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsreceivedeventdetails.messageclass
     * @type {Integer} 
     */
    MessageClass {
        get => this.get_MessageClass()
    }

    /**
     * Gets the binary message object for the SMS message received by the background task.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsreceivedeventdetails.binarymessage
     * @type {SmsBinaryMessage} 
     */
    BinaryMessage {
        get => this.get_BinaryMessage()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__ISmsReceivedEventDetails")) {
            if ((queryResult := this.QueryInterface(ISmsReceivedEventDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsReceivedEventDetails := ISmsReceivedEventDetails(outPtr)
        }

        return this.__ISmsReceivedEventDetails.get_DeviceId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MessageIndex() {
        if (!this.HasProp("__ISmsReceivedEventDetails")) {
            if ((queryResult := this.QueryInterface(ISmsReceivedEventDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsReceivedEventDetails := ISmsReceivedEventDetails(outPtr)
        }

        return this.__ISmsReceivedEventDetails.get_MessageIndex()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MessageClass() {
        if (!this.HasProp("__ISmsReceivedEventDetails2")) {
            if ((queryResult := this.QueryInterface(ISmsReceivedEventDetails2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsReceivedEventDetails2 := ISmsReceivedEventDetails2(outPtr)
        }

        return this.__ISmsReceivedEventDetails2.get_MessageClass()
    }

    /**
     * 
     * @returns {SmsBinaryMessage} 
     */
    get_BinaryMessage() {
        if (!this.HasProp("__ISmsReceivedEventDetails2")) {
            if ((queryResult := this.QueryInterface(ISmsReceivedEventDetails2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsReceivedEventDetails2 := ISmsReceivedEventDetails2(outPtr)
        }

        return this.__ISmsReceivedEventDetails2.get_BinaryMessage()
    }

;@endregion Instance Methods
}
