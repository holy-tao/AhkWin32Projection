#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGameChatOverlay.ahk
#Include .\IGameChatOverlayStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the game chat overlay.
 * @remarks
 * This class provides methods to get the default game chat overlay instance, set the desired position of the overlay, and add messages to it.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.ui.gamechatoverlay
 * @namespace Windows.Gaming.UI
 * @version WindowsRuntime 1.4
 */
class GameChatOverlay extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGameChatOverlay

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGameChatOverlay.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the default game chat overlay instance.
     * @remarks
     * If game chat isn't supported on the device, this method will return **null**.
     * @returns {GameChatOverlay} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.ui.gamechatoverlay.getdefault
     */
    static GetDefault() {
        if (!GameChatOverlay.HasProp("__IGameChatOverlayStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.UI.GameChatOverlay")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGameChatOverlayStatics.IID)
            GameChatOverlay.__IGameChatOverlayStatics := IGameChatOverlayStatics(factoryPtr)
        }

        return GameChatOverlay.__IGameChatOverlayStatics.GetDefault()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The desired position of the game chat overlay.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.ui.gamechatoverlay.desiredposition
     * @type {Integer} 
     */
    DesiredPosition {
        get => this.get_DesiredPosition()
        set => this.put_DesiredPosition(value)
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
    get_DesiredPosition() {
        if (!this.HasProp("__IGameChatOverlay")) {
            if ((queryResult := this.QueryInterface(IGameChatOverlay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameChatOverlay := IGameChatOverlay(outPtr)
        }

        return this.__IGameChatOverlay.get_DesiredPosition()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DesiredPosition(value) {
        if (!this.HasProp("__IGameChatOverlay")) {
            if ((queryResult := this.QueryInterface(IGameChatOverlay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameChatOverlay := IGameChatOverlay(outPtr)
        }

        return this.__IGameChatOverlay.put_DesiredPosition(value)
    }

    /**
     * Render a message in the game chat overlay.
     * @param {HSTRING} sender The name of the account that sent the message. In most cases, this should be the gamertag.
     * @param {HSTRING} message The contents of the message.
     * @param {Integer} origin The origin of the message (voice or text).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.ui.gamechatoverlay.addmessage
     */
    AddMessage(sender, message, origin) {
        if (!this.HasProp("__IGameChatOverlay")) {
            if ((queryResult := this.QueryInterface(IGameChatOverlay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameChatOverlay := IGameChatOverlay(outPtr)
        }

        return this.__IGameChatOverlay.AddMessage(sender, message, origin)
    }

;@endregion Instance Methods
}
