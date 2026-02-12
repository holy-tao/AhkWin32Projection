#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInteractionTrackerRequestIgnoredArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Arguments for the [IInteractionTrackerOwner.RequestIgnored](iinteractiontrackerowner_requestignored_1806693457.md) callback.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackerrequestignoredargs
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class InteractionTrackerRequestIgnoredArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInteractionTrackerRequestIgnoredArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInteractionTrackerRequestIgnoredArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The ID of the request that triggered the callback.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackerrequestignoredargs.requestid
     * @type {Integer} 
     */
    RequestId {
        get => this.get_RequestId()
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
        if (!this.HasProp("__IInteractionTrackerRequestIgnoredArgs")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerRequestIgnoredArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerRequestIgnoredArgs := IInteractionTrackerRequestIgnoredArgs(outPtr)
        }

        return this.__IInteractionTrackerRequestIgnoredArgs.get_RequestId()
    }

;@endregion Instance Methods
}
