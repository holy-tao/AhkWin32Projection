#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialInteractionSourceProperties.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents advanced state of a hand or motion controller.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsourceproperties
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialInteractionSourceProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialInteractionSourceProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialInteractionSourceProperties.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the risk that detection of a hand or motion controller will be lost as a value from 0.0 to 1.0.
     * @remarks
     * As the value nears 1.0, you should suggest that the user moves this source in the direction indicated by [TryGetSourceLossMitigationDirection](spatialinteractionsourceproperties_trygetsourcelossmitigationdirection_282458382.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsourceproperties.sourcelossrisk
     * @type {Float} 
     */
    SourceLossRisk {
        get => this.get_SourceLossRisk()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets the direction you should suggest that the user move their hand or motion controller if it is nearing the edge of the detection area.
     * @remarks
     * This method will return null if the specified coordinate system cannot be located at the moment.
     * @param {SpatialCoordinateSystem} coordinateSystem The coordinate system in which to express the mitigation direction.
     * @returns {IReference<Vector3>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsourceproperties.trygetsourcelossmitigationdirection
     */
    TryGetSourceLossMitigationDirection(coordinateSystem) {
        if (!this.HasProp("__ISpatialInteractionSourceProperties")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSourceProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSourceProperties := ISpatialInteractionSourceProperties(outPtr)
        }

        return this.__ISpatialInteractionSourceProperties.TryGetSourceLossMitigationDirection(coordinateSystem)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SourceLossRisk() {
        if (!this.HasProp("__ISpatialInteractionSourceProperties")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSourceProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSourceProperties := ISpatialInteractionSourceProperties(outPtr)
        }

        return this.__ISpatialInteractionSourceProperties.get_SourceLossRisk()
    }

    /**
     * Get the position, orientation and velocity of the hand or motion controller, expressed in the specified coordinate system.
     * @remarks
     * This method will return null if the specified coordinate system cannot be located at the moment.
     * @param {SpatialCoordinateSystem} coordinateSystem The coordinate system in which to express the hand's location.
     * @returns {SpatialInteractionSourceLocation} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsourceproperties.trygetlocation
     */
    TryGetLocation(coordinateSystem) {
        if (!this.HasProp("__ISpatialInteractionSourceProperties")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSourceProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSourceProperties := ISpatialInteractionSourceProperties(outPtr)
        }

        return this.__ISpatialInteractionSourceProperties.TryGetLocation(coordinateSystem)
    }

;@endregion Instance Methods
}
