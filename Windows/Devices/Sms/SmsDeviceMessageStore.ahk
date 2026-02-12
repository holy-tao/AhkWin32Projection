#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmsDeviceMessageStore.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to the messages stored on an SMS Device and information about the message store.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
  * 
  * > [!NOTE]
  * > This class and its methods are supported for the maintenance of legacy desktop apps that used it in earlier versions of Windows. If you do use this class, then you must specify the **Windows.Devices.Sms.LegacySmsApiContract** in your app's manifest. Don't use this class if you're developing a new app for Windows. Instead, use the APIs in this namespace that don't require the **Windows.Devices.Sms.LegacySmsApiContract**.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevicemessagestore
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class SmsDeviceMessageStore extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmsDeviceMessageStore

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmsDeviceMessageStore.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Indicates the maximum number of messages that can be stored in the device store. The client can use this value to determine how to maintain enough space in the device store to receive new messages from the network.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevicemessagestore.maxmessages
     * @type {Integer} 
     */
    MaxMessages {
        get => this.get_MaxMessages()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Deletes the message with the specified ID. Because the device might be busy, the operation executes asynchronously. The asynchronous operation object returns immediately.
     * @param {Integer} messageId Integer ID of the message to delete, which was previously read from an SmsTextMessage object obtained from the device message store.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevicemessagestore.deletemessageasync
     */
    DeleteMessageAsync(messageId) {
        if (!this.HasProp("__ISmsDeviceMessageStore")) {
            if ((queryResult := this.QueryInterface(ISmsDeviceMessageStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsDeviceMessageStore := ISmsDeviceMessageStore(outPtr)
        }

        return this.__ISmsDeviceMessageStore.DeleteMessageAsync(messageId)
    }

    /**
     * Deletes the messages to which the filter applies. The filter can be used to delete all messages, or only messages that are read, unread, sent, or in a draft state. Because the operation might not be instantaneous, it executes asynchronously. The asynchronous operation object returns immediately.
     * @param {Integer} messageFilter A search filter that specifies which messages to delete.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevicemessagestore.deletemessagesasync
     */
    DeleteMessagesAsync(messageFilter) {
        if (!this.HasProp("__ISmsDeviceMessageStore")) {
            if ((queryResult := this.QueryInterface(ISmsDeviceMessageStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsDeviceMessageStore := ISmsDeviceMessageStore(outPtr)
        }

        return this.__ISmsDeviceMessageStore.DeleteMessagesAsync(messageFilter)
    }

    /**
     * Retrieves the message with the specified ID. The device might be busy, so the method executes asynchronously. The asynchronous operation object returns immediately.
     * @param {Integer} messageId ID of the message to retrieve.
     * @returns {IAsyncOperation<ISmsMessage>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevicemessagestore.getmessageasync
     */
    GetMessageAsync(messageId) {
        if (!this.HasProp("__ISmsDeviceMessageStore")) {
            if ((queryResult := this.QueryInterface(ISmsDeviceMessageStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsDeviceMessageStore := ISmsDeviceMessageStore(outPtr)
        }

        return this.__ISmsDeviceMessageStore.GetMessageAsync(messageId)
    }

    /**
     * Retrieves a list of messages that match the conditions specified in a filter. The messages can be filtered as read, unread, sent, or in the draft state.
     * @param {Integer} messageFilter ID of the message to retrieve.
     * @returns {IAsyncOperationWithProgress<IVectorView<ISmsMessage>, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdevicemessagestore.getmessagesasync
     */
    GetMessagesAsync(messageFilter) {
        if (!this.HasProp("__ISmsDeviceMessageStore")) {
            if ((queryResult := this.QueryInterface(ISmsDeviceMessageStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsDeviceMessageStore := ISmsDeviceMessageStore(outPtr)
        }

        return this.__ISmsDeviceMessageStore.GetMessagesAsync(messageFilter)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxMessages() {
        if (!this.HasProp("__ISmsDeviceMessageStore")) {
            if ((queryResult := this.QueryInterface(ISmsDeviceMessageStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsDeviceMessageStore := ISmsDeviceMessageStore(outPtr)
        }

        return this.__ISmsDeviceMessageStore.get_MaxMessages()
    }

;@endregion Instance Methods
}
