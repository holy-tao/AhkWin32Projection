#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialAnchorTransferManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Static methods for transferring spatial anchors between devices, so that both devices can reason about the same locations in their users' surroundings.
 * @remarks
 * > [!NOTE]
 * > Local anchor transfers using **SpatialAnchorTransferManager** provide less robust anchor recall than [Azure Spatial Anchors](/azure/spatial-anchors), and iOS and Android devices are not supported by this approach.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialanchortransfermanager
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialAnchorTransferManager extends IInspectable {
;@region Static Methods
    /**
     * Imports a stream of spatial anchors that was previously exported from another device. This allows both devices to reason about the same locations in their users' surroundings.
     * @remarks
     * You must first export the anchors on the source device using the TryExportAnchorsAsync method. It is then the app's responsibility to get the data in the stream to the other device through its own network channel.
     * 
     * This imports the anchors and their supporting data into the device's spatial understanding. An app should then use [SpatialAnchorStore.TrySave](spatialanchorstore_trysave_1258774399.md) if it needs to retain access to this anchor.
     * 
     * This method can yield null if the device has reached its limit of spatial anchors, or if the spatial understanding system times out during the import.
     * @param {IInputStream} stream The stream to import anchors from.
     * @returns {IAsyncOperation<IMapView<HSTRING, SpatialAnchor>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialanchortransfermanager.tryimportanchorsasync
     */
    static TryImportAnchorsAsync(stream) {
        if (!SpatialAnchorTransferManager.HasProp("__ISpatialAnchorTransferManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.SpatialAnchorTransferManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialAnchorTransferManagerStatics.IID)
            SpatialAnchorTransferManager.__ISpatialAnchorTransferManagerStatics := ISpatialAnchorTransferManagerStatics(factoryPtr)
        }

        return SpatialAnchorTransferManager.__ISpatialAnchorTransferManagerStatics.TryImportAnchorsAsync(stream)
    }

    /**
     * Exports spatial anchors to a stream, which can later be imported on another device. This allows both devices to reason about the same locations in their users' surroundings.
     * @remarks
     * It's the app's responsibility to get the data in the stream to the other device through its own network channel.
     * 
     * This method yields a result of **true** if the export succeeded. The export can fail if the spatial understanding system times out during the export.
     * 
     * **Note:** If you're using JavaScript, you can't create the *anchors* parameter directly, because it's of type IIterable&lt;IKeyValuePair&lt;Platform::String^, Windows::Perception::Spatial::SpatialAnchor^&gt;&gt;. Instead, create a native WinRT helper component that has a **CreateMap** function:
     * 
     * ```cppwinrt
     * @param {IIterable<IKeyValuePair<HSTRING, SpatialAnchor>>} anchors The collection of anchors to export, each identified by an app-specified string key.
     * @param {IOutputStream} stream The stream to export anchors to.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialanchortransfermanager.tryexportanchorsasync
     */
    static TryExportAnchorsAsync(anchors, stream) {
        if (!SpatialAnchorTransferManager.HasProp("__ISpatialAnchorTransferManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.SpatialAnchorTransferManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialAnchorTransferManagerStatics.IID)
            SpatialAnchorTransferManager.__ISpatialAnchorTransferManagerStatics := ISpatialAnchorTransferManagerStatics(factoryPtr)
        }

        return SpatialAnchorTransferManager.__ISpatialAnchorTransferManagerStatics.TryExportAnchorsAsync(anchors, stream)
    }

    /**
     * Requests access for an app to export or import spatial anchors. This requires the spatialPerception capability.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialanchortransfermanager.requestaccessasync
     */
    static RequestAccessAsync() {
        if (!SpatialAnchorTransferManager.HasProp("__ISpatialAnchorTransferManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.SpatialAnchorTransferManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialAnchorTransferManagerStatics.IID)
            SpatialAnchorTransferManager.__ISpatialAnchorTransferManagerStatics := ISpatialAnchorTransferManagerStatics(factoryPtr)
        }

        return SpatialAnchorTransferManager.__ISpatialAnchorTransferManagerStatics.RequestAccessAsync()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
