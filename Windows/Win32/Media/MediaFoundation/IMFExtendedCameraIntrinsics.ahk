#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFExtendedCameraIntrinsics extends IUnknown{
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
     * 
     * @param {Pointer} pbBuffer 
     * @param {Integer} dwBufferSize 
     * @returns {HRESULT} 
     */
    InitializeFromBuffer(pbBuffer, dwBufferSize) {
        result := ComCall(3, this, "ptr", pbBuffer, "uint", dwBufferSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwBufferSize 
     * @returns {HRESULT} 
     */
    GetBufferSize(pdwBufferSize) {
        result := ComCall(4, this, "uint*", pdwBufferSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} pbBuffer 
     * @param {Pointer<UInt32>} pdwBufferSize 
     * @returns {HRESULT} 
     */
    SerializeToBuffer(pbBuffer, pdwBufferSize) {
        result := ComCall(5, this, "ptr", pbBuffer, "uint*", pdwBufferSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwCount 
     * @returns {HRESULT} 
     */
    GetIntrinsicModelCount(pdwCount) {
        result := ComCall(6, this, "uint*", pdwCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<IMFExtendedCameraIntrinsicModel>} ppIntrinsicModel 
     * @returns {HRESULT} 
     */
    GetIntrinsicModelByIndex(dwIndex, ppIntrinsicModel) {
        result := ComCall(7, this, "uint", dwIndex, "ptr", ppIntrinsicModel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFExtendedCameraIntrinsicModel>} pIntrinsicModel 
     * @returns {HRESULT} 
     */
    AddIntrinsicModel(pIntrinsicModel) {
        result := ComCall(8, this, "ptr", pIntrinsicModel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
