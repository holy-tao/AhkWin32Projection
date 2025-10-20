#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Direct3D12\ID3D12Pageable.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoEncoderHeap extends ID3D12Pageable{
    /**
     * The interface identifier for ID3D12VideoEncoderHeap
     * @type {Guid}
     */
    static IID => Guid("{22b35d96-876a-44c0-b25e-fb8c9c7f1c4a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @returns {Integer} 
     */
    GetNodeMask() {
        result := ComCall(8, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetEncoderHeapFlags() {
        result := ComCall(9, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCodec() {
        result := ComCall(10, this, "int")
        return result
    }

    /**
     * 
     * @param {D3D12_VIDEO_ENCODER_PROFILE_DESC} dstProfile 
     * @returns {HRESULT} 
     */
    GetCodecProfile(dstProfile) {
        result := ComCall(11, this, "ptr", dstProfile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {D3D12_VIDEO_ENCODER_LEVEL_SETTING} dstLevel 
     * @returns {HRESULT} 
     */
    GetCodecLevel(dstLevel) {
        result := ComCall(12, this, "ptr", dstLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetResolutionListCount() {
        result := ComCall(13, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} ResolutionsListCount 
     * @param {Pointer<D3D12_VIDEO_ENCODER_PICTURE_RESOLUTION_DESC>} pResolutionList 
     * @returns {HRESULT} 
     */
    GetResolutionList(ResolutionsListCount, pResolutionList) {
        result := ComCall(14, this, "uint", ResolutionsListCount, "ptr", pResolutionList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
