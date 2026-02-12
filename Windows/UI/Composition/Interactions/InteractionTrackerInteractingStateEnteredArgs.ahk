#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInteractionTrackerInteractingStateEnteredArgs.ahk
#Include .\IInteractionTrackerInteractingStateEnteredArgs2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Arguments for the [IInteractionTrackerOwner.InteractingStateEntered](iinteractiontrackerowner_interactingstateentered_562654012.md) callback.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackerinteractingstateenteredargs
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class InteractionTrackerInteractingStateEnteredArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInteractionTrackerInteractingStateEnteredArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInteractionTrackerInteractingStateEnteredArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The ID of the request that triggered the callback.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackerinteractingstateenteredargs.requestid
     * @type {Integer} 
     */
    RequestId {
        get => this.get_RequestId()
    }

    /**
     * Gets a value that indicates whether this state was entered through interaction with a tracker that this one is bound to.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackerinteractingstateenteredargs.isfrombinding
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
        if (!this.HasProp("__IInteractionTrackerInteractingStateEnteredArgs")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerInteractingStateEnteredArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerInteractingStateEnteredArgs := IInteractionTrackerInteractingStateEnteredArgs(outPtr)
        }

        return this.__IInteractionTrackerInteractingStateEnteredArgs.get_RequestId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFromBinding() {
        if (!this.HasProp("__IInteractionTrackerInteractingStateEnteredArgs2")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerInteractingStateEnteredArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerInteractingStateEnteredArgs2 := IInteractionTrackerInteractingStateEnteredArgs2(outPtr)
        }

        return this.__IInteractionTrackerInteractingStateEnteredArgs2.get_IsFromBinding()
    }

;@endregion Instance Methods
}
