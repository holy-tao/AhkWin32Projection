#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IChatRecipientDeliveryInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represent the delivery info about a chat recipient.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatrecipientdeliveryinfo
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatRecipientDeliveryInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IChatRecipientDeliveryInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IChatRecipientDeliveryInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the transport address of the recipient.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatrecipientdeliveryinfo.transportaddress
     * @type {HSTRING} 
     */
    TransportAddress {
        get => this.get_TransportAddress()
        set => this.put_TransportAddress(value)
    }

    /**
     * Gets or sets the time the message was sent to the recipient.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatrecipientdeliveryinfo.deliverytime
     * @type {IReference<DateTime>} 
     */
    DeliveryTime {
        get => this.get_DeliveryTime()
        set => this.put_DeliveryTime(value)
    }

    /**
     * Gets or sets the time the recipient read the message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatrecipientdeliveryinfo.readtime
     * @type {IReference<DateTime>} 
     */
    ReadTime {
        get => this.get_ReadTime()
        set => this.put_ReadTime(value)
    }

    /**
     * Gets the category for the [TransportErrorCode](chatrecipientdeliveryinfo_transporterrorcode.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatrecipientdeliveryinfo.transporterrorcodecategory
     * @type {Integer} 
     */
    TransportErrorCodeCategory {
        get => this.get_TransportErrorCodeCategory()
    }

    /**
     * Gets the interpreted error code for the transport.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatrecipientdeliveryinfo.transportinterpretederrorcode
     * @type {Integer} 
     */
    TransportInterpretedErrorCode {
        get => this.get_TransportInterpretedErrorCode()
    }

    /**
     * Get the transport error code.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatrecipientdeliveryinfo.transporterrorcode
     * @type {Integer} 
     */
    TransportErrorCode {
        get => this.get_TransportErrorCode()
    }

    /**
     * Gets a Boolean value indicating whether the error for the message that was sent to the recipient is permanent.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatrecipientdeliveryinfo.iserrorpermanent
     * @type {Boolean} 
     */
    IsErrorPermanent {
        get => this.get_IsErrorPermanent()
    }

    /**
     * Gets the status of the message.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatrecipientdeliveryinfo.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ChatRecipientDeliveryInfo](chatrecipientdeliveryinfo.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Chat.ChatRecipientDeliveryInfo")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TransportAddress() {
        if (!this.HasProp("__IChatRecipientDeliveryInfo")) {
            if ((queryResult := this.QueryInterface(IChatRecipientDeliveryInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatRecipientDeliveryInfo := IChatRecipientDeliveryInfo(outPtr)
        }

        return this.__IChatRecipientDeliveryInfo.get_TransportAddress()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TransportAddress(value) {
        if (!this.HasProp("__IChatRecipientDeliveryInfo")) {
            if ((queryResult := this.QueryInterface(IChatRecipientDeliveryInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatRecipientDeliveryInfo := IChatRecipientDeliveryInfo(outPtr)
        }

        return this.__IChatRecipientDeliveryInfo.put_TransportAddress(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_DeliveryTime() {
        if (!this.HasProp("__IChatRecipientDeliveryInfo")) {
            if ((queryResult := this.QueryInterface(IChatRecipientDeliveryInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatRecipientDeliveryInfo := IChatRecipientDeliveryInfo(outPtr)
        }

        return this.__IChatRecipientDeliveryInfo.get_DeliveryTime()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_DeliveryTime(value) {
        if (!this.HasProp("__IChatRecipientDeliveryInfo")) {
            if ((queryResult := this.QueryInterface(IChatRecipientDeliveryInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatRecipientDeliveryInfo := IChatRecipientDeliveryInfo(outPtr)
        }

        return this.__IChatRecipientDeliveryInfo.put_DeliveryTime(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_ReadTime() {
        if (!this.HasProp("__IChatRecipientDeliveryInfo")) {
            if ((queryResult := this.QueryInterface(IChatRecipientDeliveryInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatRecipientDeliveryInfo := IChatRecipientDeliveryInfo(outPtr)
        }

        return this.__IChatRecipientDeliveryInfo.get_ReadTime()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_ReadTime(value) {
        if (!this.HasProp("__IChatRecipientDeliveryInfo")) {
            if ((queryResult := this.QueryInterface(IChatRecipientDeliveryInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatRecipientDeliveryInfo := IChatRecipientDeliveryInfo(outPtr)
        }

        return this.__IChatRecipientDeliveryInfo.put_ReadTime(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TransportErrorCodeCategory() {
        if (!this.HasProp("__IChatRecipientDeliveryInfo")) {
            if ((queryResult := this.QueryInterface(IChatRecipientDeliveryInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatRecipientDeliveryInfo := IChatRecipientDeliveryInfo(outPtr)
        }

        return this.__IChatRecipientDeliveryInfo.get_TransportErrorCodeCategory()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TransportInterpretedErrorCode() {
        if (!this.HasProp("__IChatRecipientDeliveryInfo")) {
            if ((queryResult := this.QueryInterface(IChatRecipientDeliveryInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatRecipientDeliveryInfo := IChatRecipientDeliveryInfo(outPtr)
        }

        return this.__IChatRecipientDeliveryInfo.get_TransportInterpretedErrorCode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TransportErrorCode() {
        if (!this.HasProp("__IChatRecipientDeliveryInfo")) {
            if ((queryResult := this.QueryInterface(IChatRecipientDeliveryInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatRecipientDeliveryInfo := IChatRecipientDeliveryInfo(outPtr)
        }

        return this.__IChatRecipientDeliveryInfo.get_TransportErrorCode()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsErrorPermanent() {
        if (!this.HasProp("__IChatRecipientDeliveryInfo")) {
            if ((queryResult := this.QueryInterface(IChatRecipientDeliveryInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatRecipientDeliveryInfo := IChatRecipientDeliveryInfo(outPtr)
        }

        return this.__IChatRecipientDeliveryInfo.get_IsErrorPermanent()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IChatRecipientDeliveryInfo")) {
            if ((queryResult := this.QueryInterface(IChatRecipientDeliveryInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatRecipientDeliveryInfo := IChatRecipientDeliveryInfo(outPtr)
        }

        return this.__IChatRecipientDeliveryInfo.get_Status()
    }

;@endregion Instance Methods
}
