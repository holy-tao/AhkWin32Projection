#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlayReadySoapMessage.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains a SOAP message used in manual challenge requests.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadysoapmessage
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class PlayReadySoapMessage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlayReadySoapMessage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlayReadySoapMessage.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a collection of the SOAP headers applied to the current SOAP request or SOAP response.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadysoapmessage.messageheaders
     * @type {IPropertySet} 
     */
    MessageHeaders {
        get => this.get_MessageHeaders()
    }

    /**
     * Gets the base URL of the XML Web service.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadysoapmessage.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Retrieves the contents of the SOAP message.
     * @param {Pointer<Pointer>} messageBodyBytes 
     * @returns {HRESULT} The contents of the SOAP message.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadysoapmessage.getmessagebody
     */
    GetMessageBody(messageBodyBytes) {
        if (!this.HasProp("__IPlayReadySoapMessage")) {
            if ((queryResult := this.QueryInterface(IPlayReadySoapMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadySoapMessage := IPlayReadySoapMessage(outPtr)
        }

        return this.__IPlayReadySoapMessage.GetMessageBody(messageBodyBytes)
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_MessageHeaders() {
        if (!this.HasProp("__IPlayReadySoapMessage")) {
            if ((queryResult := this.QueryInterface(IPlayReadySoapMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadySoapMessage := IPlayReadySoapMessage(outPtr)
        }

        return this.__IPlayReadySoapMessage.get_MessageHeaders()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        if (!this.HasProp("__IPlayReadySoapMessage")) {
            if ((queryResult := this.QueryInterface(IPlayReadySoapMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadySoapMessage := IPlayReadySoapMessage(outPtr)
        }

        return this.__IPlayReadySoapMessage.get_Uri()
    }

;@endregion Instance Methods
}
