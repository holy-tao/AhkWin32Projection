#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SmsTextMessage2.ahk
#Include .\SmsWapMessage.ahk
#Include .\SmsAppMessage.ahk
#Include .\SmsBroadcastMessage.ahk
#Include .\SmsVoicemailMessage.ahk
#Include .\SmsStatusMessage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class ISmsMessageReceivedTriggerDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmsMessageReceivedTriggerDetails
     * @type {Guid}
     */
    static IID => Guid("{2bcfcbd4-2657-4128-ad5f-e3877132bdb1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MessageType", "get_TextMessage", "get_WapMessage", "get_AppMessage", "get_BroadcastMessage", "get_VoicemailMessage", "get_StatusMessage", "Drop", "Accept"]

    /**
     * @type {Integer} 
     */
    MessageType {
        get => this.get_MessageType()
    }

    /**
     * @type {SmsTextMessage2} 
     */
    TextMessage {
        get => this.get_TextMessage()
    }

    /**
     * @type {SmsWapMessage} 
     */
    WapMessage {
        get => this.get_WapMessage()
    }

    /**
     * @type {SmsAppMessage} 
     */
    AppMessage {
        get => this.get_AppMessage()
    }

    /**
     * @type {SmsBroadcastMessage} 
     */
    BroadcastMessage {
        get => this.get_BroadcastMessage()
    }

    /**
     * @type {SmsVoicemailMessage} 
     */
    VoicemailMessage {
        get => this.get_VoicemailMessage()
    }

    /**
     * @type {SmsStatusMessage} 
     */
    StatusMessage {
        get => this.get_StatusMessage()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MessageType() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SmsTextMessage2} 
     */
    get_TextMessage() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SmsTextMessage2(value)
    }

    /**
     * 
     * @returns {SmsWapMessage} 
     */
    get_WapMessage() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SmsWapMessage(value)
    }

    /**
     * 
     * @returns {SmsAppMessage} 
     */
    get_AppMessage() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SmsAppMessage(value)
    }

    /**
     * 
     * @returns {SmsBroadcastMessage} 
     */
    get_BroadcastMessage() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SmsBroadcastMessage(value)
    }

    /**
     * 
     * @returns {SmsVoicemailMessage} 
     */
    get_VoicemailMessage() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SmsVoicemailMessage(value)
    }

    /**
     * 
     * @returns {SmsStatusMessage} 
     */
    get_StatusMessage() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SmsStatusMessage(value)
    }

    /**
     * Represents a standard Drop-Down Button control.
     * @remarks
     * Optional or required, depending on the parent element.
     * 
     * May occur one or more times for each [**ControlGroup**](windowsribbon-element-controlgroup.md), **DropDownButton**, [**DropDownGallery**](windowsribbon-element-dropdowngallery.md), [**Group**](windowsribbon-element-group.md), [**MenuGroup**](windowsribbon-element-menugroup.md), [**SplitButton**](windowsribbon-element-splitbutton.md), or [**SplitButtonGallery**](windowsribbon-element-splitbuttongallery.md) element.
     * 
     * **DropDownButton** supports [application modes](ribbon-applicationmodes.md) when it is hosted in the left column of the Application Menu.
     * 
     * [**DropDownGallery**](windowsribbon-element-dropdowngallery.md) and [**SplitButtonGallery**](windowsribbon-element-splitbuttongallery.md) are not valid child elements of **DropDownButton** when **DropDownButton** is a descendant of [**ApplicationMenu**](windowsribbon-element-applicationmenu.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/windowsribbon/windowsribbon-element-dropdownbutton
     */
    Drop() {
        result := ComCall(13, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a default instance of [AcceptedVoipPhoneCallOptions](./acceptedvoipphonecalloptions.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.acceptedvoipphonecalloptions.#ctor
     */
    Accept() {
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
