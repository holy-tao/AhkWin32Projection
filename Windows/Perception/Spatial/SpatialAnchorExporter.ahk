#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialAnchorExporter.ahk
#Include .\ISpatialAnchorExporterStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Allows apps to export spatial anchors for sharing and relocalization across devices, so that both devices can reason about the same locations in their users' surroundings.
 * @remarks
 * > [!NOTE]
 * > This type supports [Azure Spatial Anchors](/azure/spatial-anchors), which enables you to create durable cloud-backed spatial anchors that your app can then locate across multiple HoloLens, iOS and Android devices.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialanchorexporter
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialAnchorExporter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialAnchorExporter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialAnchorExporter.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the default **SpatialAnchorExporter** instance for the current device.
     * @returns {SpatialAnchorExporter} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialanchorexporter.getdefault
     */
    static GetDefault() {
        if (!SpatialAnchorExporter.HasProp("__ISpatialAnchorExporterStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.SpatialAnchorExporter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialAnchorExporterStatics.IID)
            SpatialAnchorExporter.__ISpatialAnchorExporterStatics := ISpatialAnchorExporterStatics(factoryPtr)
        }

        return SpatialAnchorExporter.__ISpatialAnchorExporterStatics.GetDefault()
    }

    /**
     * Requests access for an app to export spatial anchors. This requires the **spatialPerception** capability.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialanchorexporter.requestaccessasync
     */
    static RequestAccessAsync() {
        if (!SpatialAnchorExporter.HasProp("__ISpatialAnchorExporterStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.SpatialAnchorExporter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialAnchorExporterStatics.IID)
            SpatialAnchorExporter.__ISpatialAnchorExporterStatics := ISpatialAnchorExporterStatics(factoryPtr)
        }

        return SpatialAnchorExporter.__ISpatialAnchorExporterStatics.RequestAccessAsync()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Returns information about whether a spatial anchor's data is sufficient for sharing or relocalization.
     * @param {SpatialAnchor} anchor The spatial anchor that will be exported.
     * @param {Integer} purpose The purpose of the export, sharing or relocalization.
     * @returns {IAsyncOperation<SpatialAnchorExportSufficiency>} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialanchorexporter.getanchorexportsufficiencyasync
     */
    GetAnchorExportSufficiencyAsync(anchor, purpose) {
        if (!this.HasProp("__ISpatialAnchorExporter")) {
            if ((queryResult := this.QueryInterface(ISpatialAnchorExporter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialAnchorExporter := ISpatialAnchorExporter(outPtr)
        }

        return this.__ISpatialAnchorExporter.GetAnchorExportSufficiencyAsync(anchor, purpose)
    }

    /**
     * Exports a spatial anchor to a stream for sharing or relocalization. This allows multiple devices to reason about the same locations in their users' surroundings.
     * @param {SpatialAnchor} anchor The spatial anchor to export.
     * @param {Integer} purpose The purpose of the export, sharing or relocalization.
     * @param {IOutputStream} stream The stream to export the anchor to.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialanchorexporter.tryexportanchorasync
     */
    TryExportAnchorAsync(anchor, purpose, stream) {
        if (!this.HasProp("__ISpatialAnchorExporter")) {
            if ((queryResult := this.QueryInterface(ISpatialAnchorExporter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialAnchorExporter := ISpatialAnchorExporter(outPtr)
        }

        return this.__ISpatialAnchorExporter.TryExportAnchorAsync(anchor, purpose, stream)
    }

;@endregion Instance Methods
}
