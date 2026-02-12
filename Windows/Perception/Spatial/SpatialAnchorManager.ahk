#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialAnchorManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Static methods for getting the spatial anchor store for the current app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialanchormanager
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialAnchorManager extends IInspectable {
;@region Static Methods
    /**
     * Retrieves the anchor store for the current app.
     * @returns {IAsyncOperation<SpatialAnchorStore>} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialanchormanager.requeststoreasync
     */
    static RequestStoreAsync() {
        if (!SpatialAnchorManager.HasProp("__ISpatialAnchorManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.SpatialAnchorManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialAnchorManagerStatics.IID)
            SpatialAnchorManager.__ISpatialAnchorManagerStatics := ISpatialAnchorManagerStatics(factoryPtr)
        }

        return SpatialAnchorManager.__ISpatialAnchorManagerStatics.RequestStoreAsync()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
