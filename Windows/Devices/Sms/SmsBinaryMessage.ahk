#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmsBinaryMessage.ahk
#Include .\ISmsMessage.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an SMS message in raw PDU format. The data format differs depending on whether the message format (indicated by the value of the [Format](smsbinarymessage_format.md) property) is GSM or CDMA.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
  * 
  * > [!NOTE]
  * > This class and its methods are supported for the maintenance of legacy desktop apps that used it in earlier versions of Windows. If you do use this class, then you must specify the **Windows.Devices.Sms.LegacySmsApiContract** in your app's manifest. Don't use this class if you're developing a new app for Windows. Instead, use the APIs in this namespace that don't require the **Windows.Devices.Sms.LegacySmsApiContract**.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsbinarymessage
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class SmsBinaryMessage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmsBinaryMessage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmsBinaryMessage.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Retrieves the detected protocol description unit (PDU) format of this message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsbinarymessage.format
     * @type {Integer} 
     */
    Format {
        get => this.get_Format()
        set => this.put_Format(value)
    }

    /**
     * Indicates the ID of the asynchronous message operation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsbinarymessage.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Returns the message class, as determined by the operator's message network. The two most common classes are None (normal message) or Class0 (special operator message, such as a roaming warning that must be shown immediately to the user). A typical client for end-user messages ignores Class0 messages.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsbinarymessage.messageclass
     * @type {Integer} 
     */
    MessageClass {
        get => this.get_MessageClass()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of the [SmsBinaryMessage](smsbinarymessage.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sms.SmsBinaryMessage")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Format() {
        if (!this.HasProp("__ISmsBinaryMessage")) {
            if ((queryResult := this.QueryInterface(ISmsBinaryMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsBinaryMessage := ISmsBinaryMessage(outPtr)
        }

        return this.__ISmsBinaryMessage.get_Format()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Format(value) {
        if (!this.HasProp("__ISmsBinaryMessage")) {
            if ((queryResult := this.QueryInterface(ISmsBinaryMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsBinaryMessage := ISmsBinaryMessage(outPtr)
        }

        return this.__ISmsBinaryMessage.put_Format(value)
    }

    /**
     * Returns the raw buffer of the message in binary protocol description unit (PDU) format as a byte array.
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} A byte array representing message data. If there is no message data, the returned array is empty.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsbinarymessage.getdata
     */
    GetData(value) {
        if (!this.HasProp("__ISmsBinaryMessage")) {
            if ((queryResult := this.QueryInterface(ISmsBinaryMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsBinaryMessage := ISmsBinaryMessage(outPtr)
        }

        return this.__ISmsBinaryMessage.GetData(value)
    }

    /**
     * Specifies the raw binary payload of the SMS message. It should be formatted according to the protocol description unit (PDU) standard.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value A byte array representing message data. If there is no message data, the returned array is empty.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsbinarymessage.setdata
     */
    SetData(value_length, value) {
        if (!this.HasProp("__ISmsBinaryMessage")) {
            if ((queryResult := this.QueryInterface(ISmsBinaryMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsBinaryMessage := ISmsBinaryMessage(outPtr)
        }

        return this.__ISmsBinaryMessage.SetData(value_length, value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        if (!this.HasProp("__ISmsMessage")) {
            if ((queryResult := this.QueryInterface(ISmsMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsMessage := ISmsMessage(outPtr)
        }

        return this.__ISmsMessage.get_Id()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MessageClass() {
        if (!this.HasProp("__ISmsMessage")) {
            if ((queryResult := this.QueryInterface(ISmsMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsMessage := ISmsMessage(outPtr)
        }

        return this.__ISmsMessage.get_MessageClass()
    }

;@endregion Instance Methods
}
