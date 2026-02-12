#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInteractionTrackerValuesChangedArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Arguments for the [IInteractionTrackerOwner.ValuesChanged](iinteractiontrackerowner_valueschanged_7014738.md) callback.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackervalueschangedargs
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class InteractionTrackerValuesChangedArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInteractionTrackerValuesChangedArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInteractionTrackerValuesChangedArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The current position of the [InteractionTracker](interactiontracker.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackervalueschangedargs.position
     * @type {Vector3} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * The ID of the request that triggered the callback.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackervalueschangedargs.requestid
     * @type {Integer} 
     */
    RequestId {
        get => this.get_RequestId()
    }

    /**
     * The current scale of the [InteractionTracker](interactiontracker.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactiontrackervalueschangedargs.scale
     * @type {Float} 
     */
    Scale {
        get => this.get_Scale()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Position() {
        if (!this.HasProp("__IInteractionTrackerValuesChangedArgs")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerValuesChangedArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerValuesChangedArgs := IInteractionTrackerValuesChangedArgs(outPtr)
        }

        return this.__IInteractionTrackerValuesChangedArgs.get_Position()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RequestId() {
        if (!this.HasProp("__IInteractionTrackerValuesChangedArgs")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerValuesChangedArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerValuesChangedArgs := IInteractionTrackerValuesChangedArgs(outPtr)
        }

        return this.__IInteractionTrackerValuesChangedArgs.get_RequestId()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Scale() {
        if (!this.HasProp("__IInteractionTrackerValuesChangedArgs")) {
            if ((queryResult := this.QueryInterface(IInteractionTrackerValuesChangedArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInteractionTrackerValuesChangedArgs := IInteractionTrackerValuesChangedArgs(outPtr)
        }

        return this.__IInteractionTrackerValuesChangedArgs.get_Scale()
    }

;@endregion Instance Methods
}
