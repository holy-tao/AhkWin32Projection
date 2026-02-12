#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\SpatialAnchorExportSufficiency.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialAnchorExporter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialAnchorExporter
     * @type {Guid}
     */
    static IID => Guid("{9a2a4338-24fb-4269-89c5-88304aeef20f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAnchorExportSufficiencyAsync", "TryExportAnchorAsync"]

    /**
     * 
     * @param {SpatialAnchor} anchor 
     * @param {Integer} purpose 
     * @returns {IAsyncOperation<SpatialAnchorExportSufficiency>} 
     */
    GetAnchorExportSufficiencyAsync(anchor, purpose) {
        result := ComCall(6, this, "ptr", anchor, "int", purpose, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SpatialAnchorExportSufficiency, operation)
    }

    /**
     * 
     * @param {SpatialAnchor} anchor 
     * @param {Integer} purpose 
     * @param {IOutputStream} stream 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryExportAnchorAsync(anchor, purpose, stream) {
        result := ComCall(7, this, "ptr", anchor, "int", purpose, "ptr", stream, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
