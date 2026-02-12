#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialNavigationCompletedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the SpatialGestureRecognizer.NavigationCompleted event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialnavigationcompletedeventargs
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialNavigationCompletedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialNavigationCompletedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialNavigationCompletedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the kind of interaction source associated with this gesture.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialnavigationcompletedeventargs.interactionsourcekind
     * @type {Integer} 
     */
    InteractionSourceKind {
        get => this.get_InteractionSourceKind()
    }

    /**
     * Gets the normalized offset of the hand or motion controller within the unit cube for all axes for this Navigation gesture.
     * @remarks
     * For hand interactions, the unit cube is oriented relative to the user's head at the time of the finger press.
     * 
     * The NormalizedOffset is returned as a vector along three axes within the cube: Horizontal, Vertical, and Depth, respectively. For each axis, the value ranges from -1.0 to 1.0 as motion in that axis reaches its extent. A value of 0.0 means no motion in that axis. These are normalized values and do not represent any physical unit, such as meters. It's up to an app to assign meaning, such as scroll velocity, to motion of the hand or controller within the unit cube.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialnavigationcompletedeventargs.normalizedoffset
     * @type {Vector3} 
     */
    NormalizedOffset {
        get => this.get_NormalizedOffset()
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
        if (!this.HasProp("__ISpatialNavigationCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISpatialNavigationCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialNavigationCompletedEventArgs := ISpatialNavigationCompletedEventArgs(outPtr)
        }

        return this.__ISpatialNavigationCompletedEventArgs.get_InteractionSourceKind()
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_NormalizedOffset() {
        if (!this.HasProp("__ISpatialNavigationCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISpatialNavigationCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialNavigationCompletedEventArgs := ISpatialNavigationCompletedEventArgs(outPtr)
        }

        return this.__ISpatialNavigationCompletedEventArgs.get_NormalizedOffset()
    }

;@endregion Instance Methods
}
