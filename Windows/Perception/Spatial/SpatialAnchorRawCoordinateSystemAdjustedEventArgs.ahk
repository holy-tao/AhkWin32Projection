#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialAnchorRawCoordinateSystemAdjustedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [SpatialAnchor.RawCoordinateSystemAdjusted](spatialanchor_rawcoordinatesystemadjusted.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialanchorrawcoordinatesystemadjustedeventargs
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialAnchorRawCoordinateSystemAdjustedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialAnchorRawCoordinateSystemAdjustedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialAnchorRawCoordinateSystemAdjustedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a transform representing the adjustment of this [SpatialAnchor](spatialanchor.md) relative to its previous location.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialanchorrawcoordinatesystemadjustedeventargs.oldrawcoordinatesystemtonewrawcoordinatesystemtransform
     * @type {Matrix4x4} 
     */
    OldRawCoordinateSystemToNewRawCoordinateSystemTransform {
        get => this.get_OldRawCoordinateSystemToNewRawCoordinateSystemTransform()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Matrix4x4} 
     */
    get_OldRawCoordinateSystemToNewRawCoordinateSystemTransform() {
        if (!this.HasProp("__ISpatialAnchorRawCoordinateSystemAdjustedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISpatialAnchorRawCoordinateSystemAdjustedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialAnchorRawCoordinateSystemAdjustedEventArgs := ISpatialAnchorRawCoordinateSystemAdjustedEventArgs(outPtr)
        }

        return this.__ISpatialAnchorRawCoordinateSystemAdjustedEventArgs.get_OldRawCoordinateSystemToNewRawCoordinateSystemTransform()
    }

;@endregion Instance Methods
}
