#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGameChatOverlayMessageSource.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\GameChatOverlayMessageSource.ahk
#Include .\GameChatMessageReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides an event that is raised every time the game chat receives a message, as well as a method to set the delay before the game chat overlay closes after receiving a message. This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, your app cannot use this API.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.ui.gamechatoverlaymessagesource
 * @namespace Windows.Gaming.UI
 * @version WindowsRuntime 1.4
 */
class GameChatOverlayMessageSource extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGameChatOverlayMessageSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGameChatOverlayMessageSource.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Constructor for the **GameChatOverlayMessageSource** class. This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, your app cannot use this API.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Gaming.UI.GameChatOverlayMessageSource")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnMessageReceivedToken")) {
            this.remove_MessageReceived(this.__OnMessageReceivedToken)
            this.__OnMessageReceived.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<GameChatOverlayMessageSource, GameChatMessageReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MessageReceived(handler) {
        if (!this.HasProp("__IGameChatOverlayMessageSource")) {
            if ((queryResult := this.QueryInterface(IGameChatOverlayMessageSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameChatOverlayMessageSource := IGameChatOverlayMessageSource(outPtr)
        }

        return this.__IGameChatOverlayMessageSource.add_MessageReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MessageReceived(token) {
        if (!this.HasProp("__IGameChatOverlayMessageSource")) {
            if ((queryResult := this.QueryInterface(IGameChatOverlayMessageSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameChatOverlayMessageSource := IGameChatOverlayMessageSource(outPtr)
        }

        return this.__IGameChatOverlayMessageSource.remove_MessageReceived(token)
    }

    /**
     * Sets the delay before the game chat overlay closes after receiving a message. This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, your app cannot use this API.
     * @param {TimeSpan} value The delay before the game chat overlay closes.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.ui.gamechatoverlaymessagesource.setdelaybeforeclosingaftermessagereceived
     */
    SetDelayBeforeClosingAfterMessageReceived(value) {
        if (!this.HasProp("__IGameChatOverlayMessageSource")) {
            if ((queryResult := this.QueryInterface(IGameChatOverlayMessageSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameChatOverlayMessageSource := IGameChatOverlayMessageSource(outPtr)
        }

        return this.__IGameChatOverlayMessageSource.SetDelayBeforeClosingAfterMessageReceived(value)
    }

;@endregion Instance Methods
}
