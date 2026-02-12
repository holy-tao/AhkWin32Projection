#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialInteractionSourceEventArgs.ahk
#Include .\ISpatialInteractionSourceEventArgs2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the SpatialInteractionSource Source events.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsourceeventargs
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialInteractionSourceEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialInteractionSourceEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialInteractionSourceEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the interaction source state associated with the event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsourceeventargs.state
     * @type {SpatialInteractionSourceState} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Gets the kind of press or release associated with the event.
     * @remarks
     * This property is only useful for the SourcePressed and SourceReleased events, as it represents the nature of that particular press or release.  For all other Source events, the PressKind will be None.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsourceeventargs.presskind
     * @type {Integer} 
     */
    PressKind {
        get => this.get_PressKind()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SpatialInteractionSourceState} 
     */
    get_State() {
        if (!this.HasProp("__ISpatialInteractionSourceEventArgs")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSourceEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSourceEventArgs := ISpatialInteractionSourceEventArgs(outPtr)
        }

        return this.__ISpatialInteractionSourceEventArgs.get_State()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PressKind() {
        if (!this.HasProp("__ISpatialInteractionSourceEventArgs2")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSourceEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSourceEventArgs2 := ISpatialInteractionSourceEventArgs2(outPtr)
        }

        return this.__ISpatialInteractionSourceEventArgs2.get_PressKind()
    }

;@endregion Instance Methods
}
