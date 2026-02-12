#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFExtendedCameraIntrinsicModel.ahk
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
        result := ComCall(3, this, "ptr", pbBuffer, "uint", dwBufferSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetBufferSizeBits
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wmformat/iwmcodecleakybucket-getbuffersizebits
     */
    GetBufferSize() {
        result := ComCall(4, this, "uint*", &pdwBufferSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwBufferSize
    }

    /**
     * 
     * @param {Pointer} pbBuffer 
     * @param {Pointer<Integer>} pdwBufferSize 
     * @returns {HRESULT} 
     */
    SerializeToBuffer(pbBuffer, pdwBufferSize) {
        pdwBufferSizeMarshal := pdwBufferSize is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pbBuffer, pdwBufferSizeMarshal, pdwBufferSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetIntrinsicModelCount() {
        result := ComCall(6, this, "uint*", &pdwCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwCount
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @returns {Pointer<IMFExtendedCameraIntrinsicModel>} 
     */
    GetIntrinsicModelByIndex(dwIndex) {
        result := ComCall(7, this, "uint", dwIndex, "ptr*", &ppIntrinsicModel := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppIntrinsicModel
    }

    /**
     * 
     * @param {IMFExtendedCameraIntrinsicModel} pIntrinsicModel 
     * @returns {HRESULT} 
     */
    AddIntrinsicModel(pIntrinsicModel) {
        result := ComCall(8, this, "ptr", pIntrinsicModel, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
