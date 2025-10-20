#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Direct3D12\ID3D12Pageable.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoEncoder extends ID3D12Pageable{
    /**
     * The interface identifier for ID3D12VideoEncoder
     * @type {Guid}
     */
    static IID => Guid("{2e0d212d-8df9-44a6-a770-bb289b182737}")

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
    GetEncoderFlags() {
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
     * @param {D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION} dstCodecConfig 
     * @returns {HRESULT} 
     */
    GetCodecConfiguration(dstCodecConfig) {
        result := ComCall(12, this, "ptr", dstCodecConfig, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetInputFormat() {
        result := ComCall(13, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMaxMotionEstimationPrecision() {
        result := ComCall(14, this, "int")
        return result
    }
}
