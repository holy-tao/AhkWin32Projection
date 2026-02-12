#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialManipulationCompletedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the SpatialGestureRecognizer.ManipulationCompleted event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialmanipulationcompletedeventargs
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialManipulationCompletedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialManipulationCompletedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialManipulationCompletedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the kind of interaction source associated with this gesture.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialmanipulationcompletedeventargs.interactionsourcekind
     * @type {Integer} 
     */
    InteractionSourceKind {
        get => this.get_InteractionSourceKind()
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
    get_InteractionSourceKind() {
        if (!this.HasProp("__ISpatialManipulationCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISpatialManipulationCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialManipulationCompletedEventArgs := ISpatialManipulationCompletedEventArgs(outPtr)
        }

        return this.__ISpatialManipulationCompletedEventArgs.get_InteractionSourceKind()
    }

    /**
     * Get the relative motion of the hand since the start of the Manipulation gesture.
     * @remarks
     * This method will return null if the specified coordinate system cannot be located at the moment.
     * @param {SpatialCoordinateSystem} coordinateSystem The coordinate system in which to express the delta.
     * @returns {SpatialManipulationDelta} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialmanipulationcompletedeventargs.trygetcumulativedelta
     */
    TryGetCumulativeDelta(coordinateSystem) {
        if (!this.HasProp("__ISpatialManipulationCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISpatialManipulationCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialManipulationCompletedEventArgs := ISpatialManipulationCompletedEventArgs(outPtr)
        }

        return this.__ISpatialManipulationCompletedEventArgs.TryGetCumulativeDelta(coordinateSystem)
    }

;@endregion Instance Methods
}
