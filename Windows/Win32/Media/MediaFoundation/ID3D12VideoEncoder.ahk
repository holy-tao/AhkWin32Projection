#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Direct3D12\ID3D12Pageable.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nn-d3d12video-id3d12videoencoder
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoEncoder extends ID3D12Pageable{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNodeMask", "GetEncoderFlags", "GetCodec", "GetCodecProfile", "GetCodecConfiguration", "GetInputFormat", "GetMaxMotionEstimationPrecision"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoencoder-getnodemask
     */
    GetNodeMask() {
        result := ComCall(8, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoencoder-getencoderflags
     */
    GetEncoderFlags() {
        result := ComCall(9, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoencoder-getcodec
     */
    GetCodec() {
        result := ComCall(10, this, "int")
        return result
    }

    /**
     * 
     * @param {D3D12_VIDEO_ENCODER_PROFILE_DESC} dstProfile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoencoder-getcodecprofile
     */
    GetCodecProfile(dstProfile) {
        result := ComCall(11, this, "ptr", dstProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION} dstCodecConfig 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoencoder-getcodecconfiguration
     */
    GetCodecConfiguration(dstCodecConfig) {
        result := ComCall(12, this, "ptr", dstCodecConfig, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoencoder-getinputformat
     */
    GetInputFormat() {
        result := ComCall(13, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoencoder-getmaxmotionestimationprecision
     */
    GetMaxMotionEstimationPrecision() {
        result := ComCall(14, this, "int")
        return result
    }
}
