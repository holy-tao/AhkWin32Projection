#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialManipulationDelta.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the relative motion of the hand since the start of a Manipulation gesture.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialmanipulationdelta
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialManipulationDelta extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialManipulationDelta

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialManipulationDelta.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Get the relative translation of the hand since the start of a Manipulation gesture.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialmanipulationdelta.translation
     * @type {Vector3} 
     */
    Translation {
        get => this.get_Translation()
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
    get_Translation() {
        if (!this.HasProp("__ISpatialManipulationDelta")) {
            if ((queryResult := this.QueryInterface(ISpatialManipulationDelta.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialManipulationDelta := ISpatialManipulationDelta(outPtr)
        }

        return this.__ISpatialManipulationDelta.get_Translation()
    }

;@endregion Instance Methods
}
