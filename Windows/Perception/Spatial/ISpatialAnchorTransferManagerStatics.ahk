#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\SpatialAnchor.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialAnchorTransferManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialAnchorTransferManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{03bbf9b9-12d8-4bce-8835-c5df3ac0adab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryImportAnchorsAsync", "TryExportAnchorsAsync", "RequestAccessAsync"]

    /**
     * 
     * @param {IInputStream} stream 
     * @returns {IAsyncOperation<IMapView<HSTRING, SpatialAnchor>>} 
     */
    TryImportAnchorsAsync(stream) {
        result := ComCall(6, this, "ptr", stream, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IMapView.Call.Bind(IMapView, (ptr) => HSTRING({ Value: ptr }), SpatialAnchor), operation)
    }

    /**
     * 
     * @param {IIterable<IKeyValuePair<HSTRING, SpatialAnchor>>} anchors 
     * @param {IOutputStream} stream 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryExportAnchorsAsync(anchors, stream) {
        result := ComCall(7, this, "ptr", anchors, "ptr", stream, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAccessAsync() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }
}
