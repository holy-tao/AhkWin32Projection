#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUssdReply.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the network response after sending a USSD message.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.ussdreply
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class UssdReply extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUssdReply

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUssdReply.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the result code for the USSD response.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * If the ResultCode property returns **ActionRequired**, the session is still open and you can respond by sending a message or closing the session.
     * 
     * > [!NOTE]
     * > The USSD protocol supports only a single USSD session at a time. An application must ensure that a session is closed when it is no longer needed. If an unused USSD session is not explicitly closed, other applications cannot use USSD until the unused USSD session times out.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.ussdreply.resultcode
     * @type {Integer} 
     */
    ResultCode {
        get => this.get_ResultCode()
    }

    /**
     * Gets the message for the USSD response.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * A message is present only if the [ResultCode](ussdreply_resultcode.md) property returns **ActionRequired** or **NoActionRequired**; otherwise the Message property returns **null**.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.ussdreply.message
     * @type {UssdMessage} 
     */
    Message {
        get => this.get_Message()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ResultCode() {
        if (!this.HasProp("__IUssdReply")) {
            if ((queryResult := this.QueryInterface(IUssdReply.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUssdReply := IUssdReply(outPtr)
        }

        return this.__IUssdReply.get_ResultCode()
    }

    /**
     * 
     * @returns {UssdMessage} 
     */
    get_Message() {
        if (!this.HasProp("__IUssdReply")) {
            if ((queryResult := this.QueryInterface(IUssdReply.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUssdReply := IUssdReply(outPtr)
        }

        return this.__IUssdReply.get_Message()
    }

;@endregion Instance Methods
}
