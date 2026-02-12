#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialAnchorExportSufficiency.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents information about whether a spatial anchor's data is sufficient for sharing or relocalization.
 * @remarks
 * An anchor has gathered the minimal amount of data needed to export if it has a [SufficiencyLevel](spatialanchorexportsufficiency_sufficiencylevel.md) >= 1.0, also indicated by [IsMinimallySufficient](spatialanchorexportsufficiency_isminimallysufficient.md).
 * 
 * An anchor has gathered the ideal amount of data needed to export if it has a **SufficiencyLevel** >= [RecommendedSufficiencyLevel](spatialanchorexportsufficiency_recommendedsufficiencylevel.md).
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialanchorexportsufficiency
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialAnchorExportSufficiency extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialAnchorExportSufficiency

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialAnchorExportSufficiency.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets whether the spatial anchor has gathered enough data to successfully export for the specified purpose.
     * @remarks
     * Minimal sufficiency is also indicated by a [SufficiencyLevel](spatialanchorexportsufficiency_sufficiencylevel.md) >= 1.0.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialanchorexportsufficiency.isminimallysufficient
     * @type {Boolean} 
     */
    IsMinimallySufficient {
        get => this.get_IsMinimallySufficient()
    }

    /**
     * Gets the amount of data the spatial anchor has gathered relative to the minimal amount needed to successfully export for the specified purpose.
     * @remarks
     * An anchor has gathered the minimal amount of data needed to export if it has a SufficiencyLevel >= 1.0, also indicated by [IsMinimallySufficient](spatialanchorexportsufficiency_isminimallysufficient.md).
     * 
     * An anchor has gathered the ideal amount of data needed to export if it has a SufficiencyLevel >= [RecommendedSufficiencyLevel](spatialanchorexportsufficiency_recommendedsufficiencylevel.md).
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialanchorexportsufficiency.sufficiencylevel
     * @type {Float} 
     */
    SufficiencyLevel {
        get => this.get_SufficiencyLevel()
    }

    /**
     * Gets the [SufficiencyLevel](spatialanchorexportsufficiency_sufficiencylevel.md) value that is ideal for an export for the specified purpose.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialanchorexportsufficiency.recommendedsufficiencylevel
     * @type {Float} 
     */
    RecommendedSufficiencyLevel {
        get => this.get_RecommendedSufficiencyLevel()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMinimallySufficient() {
        if (!this.HasProp("__ISpatialAnchorExportSufficiency")) {
            if ((queryResult := this.QueryInterface(ISpatialAnchorExportSufficiency.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialAnchorExportSufficiency := ISpatialAnchorExportSufficiency(outPtr)
        }

        return this.__ISpatialAnchorExportSufficiency.get_IsMinimallySufficient()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SufficiencyLevel() {
        if (!this.HasProp("__ISpatialAnchorExportSufficiency")) {
            if ((queryResult := this.QueryInterface(ISpatialAnchorExportSufficiency.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialAnchorExportSufficiency := ISpatialAnchorExportSufficiency(outPtr)
        }

        return this.__ISpatialAnchorExportSufficiency.get_SufficiencyLevel()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RecommendedSufficiencyLevel() {
        if (!this.HasProp("__ISpatialAnchorExportSufficiency")) {
            if ((queryResult := this.QueryInterface(ISpatialAnchorExportSufficiency.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialAnchorExportSufficiency := ISpatialAnchorExportSufficiency(outPtr)
        }

        return this.__ISpatialAnchorExportSufficiency.get_RecommendedSufficiencyLevel()
    }

;@endregion Instance Methods
}
