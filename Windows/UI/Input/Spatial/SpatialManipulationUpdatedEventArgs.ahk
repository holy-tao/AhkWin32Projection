#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialManipulationUpdatedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the SpatialGestureRecognizer.ManipulationUpdated event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialmanipulationupdatedeventargs
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialManipulationUpdatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialManipulationUpdatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialManipulationUpdatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the kind of interaction source associated with this gesture.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialmanipulationupdatedeventargs.interactionsourcekind
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
        if (!this.HasProp("__ISpatialManipulationUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISpatialManipulationUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialManipulationUpdatedEventArgs := ISpatialManipulationUpdatedEventArgs(outPtr)
        }

        return this.__ISpatialManipulationUpdatedEventArgs.get_InteractionSourceKind()
    }

    /**
     * Get the relative motion of the hand since the start of the Manipulation gesture.
     * @remarks
     * This motion is expressed in the specified coordinate system. If you want the path followed by the manipulation to represent translation through the world as the user walks around, specify an anchored or stationary coordinate system. If you want the path to stay relative to the user and ignore the user's translation, specify a locator-attached coordinate system.
     * 
     * This method will return null if the specified coordinate system cannot be located at the moment.
     * @param {SpatialCoordinateSystem} coordinateSystem The coordinate system in which to express the delta.
     * @returns {SpatialManipulationDelta} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialmanipulationupdatedeventargs.trygetcumulativedelta
     */
    TryGetCumulativeDelta(coordinateSystem) {
        if (!this.HasProp("__ISpatialManipulationUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISpatialManipulationUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialManipulationUpdatedEventArgs := ISpatialManipulationUpdatedEventArgs(outPtr)
        }

        return this.__ISpatialManipulationUpdatedEventArgs.TryGetCumulativeDelta(coordinateSystem)
    }

;@endregion Instance Methods
}
