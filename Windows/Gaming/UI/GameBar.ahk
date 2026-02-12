#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGameBarStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides notifications and information about the visibility and input redirection state of Game bar.
 * @remarks
 * The events and properties of  are class static. Objects are not instantiated for this class.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.ui.gamebar
 * @namespace Windows.Gaming.UI
 * @version WindowsRuntime 1.4
 */
class GameBar extends IInspectable {
;@region Static Properties
    /**
     * Indicates whether Game bar is currently visible.
     * 
     * Use the  property to determine the visibility state of Game bar. Games can choose to pause gameplay or present an idle state when Game bar is visible and being drawn over the game. While paused or idle, a best practice is to continue rendering the current frame or scene, so that the recording is smooth and seamless if the player begins recording or is already recording. Multiplayer games might choose to continue gameplay rather than to pause.
     * 
     * To be notified of changes to , handle the [VisibilityChanged](gamebar_visibilitychanged.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.ui.gamebar.visible
     * @type {Boolean} 
     */
    static Visible {
        get => GameBar.get_Visible()
    }

    /**
     * Indicates whether input is currently redirected to Game bar.
     * 
     * After the user invokes Game bar, input may be redirected to Game bar while the player interacts with it. Games that are no longer receiving input will typically want to pause gameplay or present an idle state. While paused or idle, a best practice is to continue rendering the current frame or scene, so that the recording is smooth and seamless if the player begins recording or is already recording. Multiplayer games might choose to continue gameplay rather than to pause.
     * 
     * To be notified of changes to , handle the [IsInputRedirectedChanged](gamebar_isinputredirectedchanged.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.ui.gamebar.isinputredirected
     * @type {Boolean} 
     */
    static IsInputRedirected {
        get => GameBar.get_IsInputRedirected()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_VisibilityChanged(handler) {
        if (!GameBar.HasProp("__IGameBarStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.UI.GameBar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGameBarStatics.IID)
            GameBar.__IGameBarStatics := IGameBarStatics(factoryPtr)
        }

        return GameBar.__IGameBarStatics.add_VisibilityChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_VisibilityChanged(token) {
        if (!GameBar.HasProp("__IGameBarStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.UI.GameBar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGameBarStatics.IID)
            GameBar.__IGameBarStatics := IGameBarStatics(factoryPtr)
        }

        return GameBar.__IGameBarStatics.remove_VisibilityChanged(token)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_IsInputRedirectedChanged(handler) {
        if (!GameBar.HasProp("__IGameBarStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.UI.GameBar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGameBarStatics.IID)
            GameBar.__IGameBarStatics := IGameBarStatics(factoryPtr)
        }

        return GameBar.__IGameBarStatics.add_IsInputRedirectedChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_IsInputRedirectedChanged(token) {
        if (!GameBar.HasProp("__IGameBarStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.UI.GameBar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGameBarStatics.IID)
            GameBar.__IGameBarStatics := IGameBarStatics(factoryPtr)
        }

        return GameBar.__IGameBarStatics.remove_IsInputRedirectedChanged(token)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_Visible() {
        if (!GameBar.HasProp("__IGameBarStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.UI.GameBar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGameBarStatics.IID)
            GameBar.__IGameBarStatics := IGameBarStatics(factoryPtr)
        }

        return GameBar.__IGameBarStatics.get_Visible()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsInputRedirected() {
        if (!GameBar.HasProp("__IGameBarStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.UI.GameBar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGameBarStatics.IID)
            GameBar.__IGameBarStatics := IGameBarStatics(factoryPtr)
        }

        return GameBar.__IGameBarStatics.get_IsInputRedirected()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
