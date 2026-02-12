#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGameChatMessageReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains the event arguments for the [MessageReceived](gamechatoverlaymessagesource_messagereceived.md) event. This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, your app cannot use this API.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.ui.gamechatmessagereceivedeventargs
 * @namespace Windows.Gaming.UI
 * @version WindowsRuntime 1.4
 */
class GameChatMessageReceivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGameChatMessageReceivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGameChatMessageReceivedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The **Package Family Name (PFN)** of the app that triggered the event. This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, your app cannot use this API.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.ui.gamechatmessagereceivedeventargs.appid
     * @type {HSTRING} 
     */
    AppId {
        get => this.get_AppId()
    }

    /**
     * The display name for the app that triggered the event. This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, your app cannot use this API.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.ui.gamechatmessagereceivedeventargs.appdisplayname
     * @type {HSTRING} 
     */
    AppDisplayName {
        get => this.get_AppDisplayName()
    }

    /**
     * The sender of the message (the *sender* parameter passed to the [GameChatOverlay.AddMessage](gamechatoverlay_addmessage_872691225.md) method). This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, your app cannot use this API.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.ui.gamechatmessagereceivedeventargs.sendername
     * @type {HSTRING} 
     */
    SenderName {
        get => this.get_SenderName()
    }

    /**
     * The contents of the message. This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, your app cannot use this API.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.ui.gamechatmessagereceivedeventargs.message
     * @type {HSTRING} 
     */
    Message {
        get => this.get_Message()
    }

    /**
     * The origin of the message (voice or text). This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, your app cannot use this API.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.ui.gamechatmessagereceivedeventargs.origin
     * @type {Integer} 
     */
    Origin {
        get => this.get_Origin()
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
    get_AppId() {
        if (!this.HasProp("__IGameChatMessageReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGameChatMessageReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameChatMessageReceivedEventArgs := IGameChatMessageReceivedEventArgs(outPtr)
        }

        return this.__IGameChatMessageReceivedEventArgs.get_AppId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppDisplayName() {
        if (!this.HasProp("__IGameChatMessageReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGameChatMessageReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameChatMessageReceivedEventArgs := IGameChatMessageReceivedEventArgs(outPtr)
        }

        return this.__IGameChatMessageReceivedEventArgs.get_AppDisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SenderName() {
        if (!this.HasProp("__IGameChatMessageReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGameChatMessageReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameChatMessageReceivedEventArgs := IGameChatMessageReceivedEventArgs(outPtr)
        }

        return this.__IGameChatMessageReceivedEventArgs.get_SenderName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Message() {
        if (!this.HasProp("__IGameChatMessageReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGameChatMessageReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameChatMessageReceivedEventArgs := IGameChatMessageReceivedEventArgs(outPtr)
        }

        return this.__IGameChatMessageReceivedEventArgs.get_Message()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Origin() {
        if (!this.HasProp("__IGameChatMessageReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGameChatMessageReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameChatMessageReceivedEventArgs := IGameChatMessageReceivedEventArgs(outPtr)
        }

        return this.__IGameChatMessageReceivedEventArgs.get_Origin()
    }

;@endregion Instance Methods
}
