#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFExtendedCameraIntrinsics extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFExtendedCameraIntrinsics
     * @type {Guid}
     */
    static IID => Guid("{687f6dac-6987-4750-a16a-734d1e7a10fe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFromBuffer", "GetBufferSize", "SerializeToBuffer", "GetIntrinsicModelCount", "GetIntrinsicModelByIndex", "AddIntrinsicModel"]

    /**
     * 
     * @param {Pointer} pbBuffer 
     * @param {Integer} dwBufferSize 
     * @returns {HRESULT} 
     */
    InitializeFromBuffer(pbBuffer, dwBufferSize) {
        result := ComCall(3, this, "ptr", pbBuffer, "uint", dwBufferSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwBufferSize 
     * @returns {HRESULT} 
     */
    GetBufferSize(pdwBufferSize) {
        result := ComCall(4, this, "uint*", pdwBufferSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pbBuffer 
     * @param {Pointer<Integer>} pdwBufferSize 
     * @returns {HRESULT} 
     */
    SerializeToBuffer(pbBuffer, pdwBufferSize) {
        result := ComCall(5, this, "ptr", pbBuffer, "uint*", pdwBufferSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwCount 
     * @returns {HRESULT} 
     */
    GetIntrinsicModelCount(pdwCount) {
        result := ComCall(6, this, "uint*", pdwCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<IMFExtendedCameraIntrinsicModel>} ppIntrinsicModel 
     * @returns {HRESULT} 
     */
    GetIntrinsicModelByIndex(dwIndex, ppIntrinsicModel) {
        result := ComCall(7, this, "uint", dwIndex, "ptr*", ppIntrinsicModel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFExtendedCameraIntrinsicModel} pIntrinsicModel 
     * @returns {HRESULT} 
     */
    AddIntrinsicModel(pIntrinsicModel) {
        result := ComCall(8, this, "ptr", pIntrinsicModel, "HRESULT")
        return result
    }
}
