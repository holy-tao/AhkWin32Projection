#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInteractionTrackerCustomAnimationStateEnteredArgs.ahk
#Include .\IInteractionTrackerCustomAnimationStateEnteredArgs2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Arguments for the [IInteractionTrackerOwner.CustomAnimationStateEntered](iinteractiontrackerowner_customanimationstateentered_1536907716.md) callback.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackercustomanimationstateenteredargs
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class InteractionTrackerCustomAnimationStateEnteredArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInteractionTrackerCustomAnimationStateEnteredArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInteractionTrackerCustomAnimationStateEnteredArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The ID of the request that triggered the callback.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackercustomanimationstateenteredargs.requestid
     * @type {Integer} 
     */
    RequestId {
        get => this.get_RequestId()
    }

    /**
     * Gets a value that indicates whether this state was entered through interaction with a tracker that this one is bound to.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackercustomanimationstateenteredargs.isfrombinding
     * @type {Boolean} 
     */
    IsFromBinding {
        get => this.get_IsFromBinding()
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
    get_RequestId() {
        if (!this.HasProp("__IInteractionTrackerCustomAnimationStateEnteredArgs")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerCustomAnimationStateEnteredArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerCustomAnimationStateEnteredArgs := IInteractionTrackerCustomAnimationStateEnteredArgs(outPtr)
        }

        return this.__IInteractionTrackerCustomAnimationStateEnteredArgs.get_RequestId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFromBinding() {
        if (!this.HasProp("__IInteractionTrackerCustomAnimationStateEnteredArgs2")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerCustomAnimationStateEnteredArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerCustomAnimationStateEnteredArgs2 := IInteractionTrackerCustomAnimationStateEnteredArgs2(outPtr)
        }

        return this.__IInteractionTrackerCustomAnimationStateEnteredArgs2.get_IsFromBinding()
    }

;@endregion Instance Methods
}
