#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMVideoAccelerator interface enables a video decoder filter to access DirectX Video Acceleration (DXVA) 1.0 functionality.
 * @see https://docs.microsoft.com/windows/win32/api//videoacc/nn-videoacc-iamvideoaccelerator
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMVideoAccelerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMVideoAccelerator
     * @type {Guid}
     */
    static IID => Guid("{256a6a22-fbad-11d1-82bf-00a0c9696c8f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetVideoAcceleratorGUIDs", "GetUncompFormatsSupported", "GetInternalMemInfo", "GetCompBufferInfo", "GetInternalCompBufferInfo", "BeginFrame", "EndFrame", "GetBuffer", "ReleaseBuffer", "Execute", "QueryRenderStatus", "DisplayFrame"]

    /**
     * 
     * @param {Pointer<Integer>} pdwNumGuidsSupported 
     * @param {Pointer<Guid>} pGuidsSupported 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/videoacc/nf-videoacc-iamvideoaccelerator-getvideoacceleratorguids
     */
    GetVideoAcceleratorGUIDs(pdwNumGuidsSupported, pGuidsSupported) {
        pdwNumGuidsSupportedMarshal := pdwNumGuidsSupported is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwNumGuidsSupportedMarshal, pdwNumGuidsSupported, "ptr", pGuidsSupported, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pGuid 
     * @param {Pointer<Integer>} pdwNumFormatsSupported 
     * @param {Pointer<DDPIXELFORMAT>} pFormatsSupported 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/videoacc/nf-videoacc-iamvideoaccelerator-getuncompformatssupported
     */
    GetUncompFormatsSupported(pGuid, pdwNumFormatsSupported, pFormatsSupported) {
        pdwNumFormatsSupportedMarshal := pdwNumFormatsSupported is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pGuid, pdwNumFormatsSupportedMarshal, pdwNumFormatsSupported, "ptr", pFormatsSupported, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pGuid 
     * @param {Pointer<AMVAUncompDataInfo>} pamvaUncompDataInfo 
     * @param {Pointer<AMVAInternalMemInfo>} pamvaInternalMemInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/videoacc/nf-videoacc-iamvideoaccelerator-getinternalmeminfo
     */
    GetInternalMemInfo(pGuid, pamvaUncompDataInfo, pamvaInternalMemInfo) {
        result := ComCall(5, this, "ptr", pGuid, "ptr", pamvaUncompDataInfo, "ptr", pamvaInternalMemInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pGuid 
     * @param {Pointer<AMVAUncompDataInfo>} pamvaUncompDataInfo 
     * @param {Pointer<Integer>} pdwNumTypesCompBuffers 
     * @param {Pointer<AMVACompBufferInfo>} pamvaCompBufferInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/videoacc/nf-videoacc-iamvideoaccelerator-getcompbufferinfo
     */
    GetCompBufferInfo(pGuid, pamvaUncompDataInfo, pdwNumTypesCompBuffers, pamvaCompBufferInfo) {
        pdwNumTypesCompBuffersMarshal := pdwNumTypesCompBuffers is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pGuid, "ptr", pamvaUncompDataInfo, pdwNumTypesCompBuffersMarshal, pdwNumTypesCompBuffers, "ptr", pamvaCompBufferInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwNumTypesCompBuffers 
     * @param {Pointer<AMVACompBufferInfo>} pamvaCompBufferInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/videoacc/nf-videoacc-iamvideoaccelerator-getinternalcompbufferinfo
     */
    GetInternalCompBufferInfo(pdwNumTypesCompBuffers, pamvaCompBufferInfo) {
        pdwNumTypesCompBuffersMarshal := pdwNumTypesCompBuffers is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pdwNumTypesCompBuffersMarshal, pdwNumTypesCompBuffers, "ptr", pamvaCompBufferInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<AMVABeginFrameInfo>} amvaBeginFrameInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/videoacc/nf-videoacc-iamvideoaccelerator-beginframe
     */
    BeginFrame(amvaBeginFrameInfo) {
        result := ComCall(8, this, "ptr", amvaBeginFrameInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<AMVAEndFrameInfo>} pEndFrameInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/videoacc/nf-videoacc-iamvideoaccelerator-endframe
     */
    EndFrame(pEndFrameInfo) {
        result := ComCall(9, this, "ptr", pEndFrameInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwTypeIndex 
     * @param {Integer} dwBufferIndex 
     * @param {BOOL} bReadOnly 
     * @param {Pointer<Pointer<Void>>} ppBuffer 
     * @param {Pointer<Integer>} lpStride 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/videoacc/nf-videoacc-iamvideoaccelerator-getbuffer
     */
    GetBuffer(dwTypeIndex, dwBufferIndex, bReadOnly, ppBuffer, lpStride) {
        lpStrideMarshal := lpStride is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, "uint", dwTypeIndex, "uint", dwBufferIndex, "int", bReadOnly, "ptr*", ppBuffer, lpStrideMarshal, lpStride, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwTypeIndex 
     * @param {Integer} dwBufferIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/videoacc/nf-videoacc-iamvideoaccelerator-releasebuffer
     */
    ReleaseBuffer(dwTypeIndex, dwBufferIndex) {
        result := ComCall(11, this, "uint", dwTypeIndex, "uint", dwBufferIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFunction 
     * @param {Pointer<Void>} lpPrivateInputData 
     * @param {Integer} cbPrivateInputData 
     * @param {Pointer<Void>} lpPrivateOutputDat 
     * @param {Integer} cbPrivateOutputData 
     * @param {Integer} dwNumBuffers 
     * @param {Pointer<AMVABUFFERINFO>} pamvaBufferInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/videoacc/nf-videoacc-iamvideoaccelerator-execute
     */
    Execute(dwFunction, lpPrivateInputData, cbPrivateInputData, lpPrivateOutputDat, cbPrivateOutputData, dwNumBuffers, pamvaBufferInfo) {
        lpPrivateInputDataMarshal := lpPrivateInputData is VarRef ? "ptr" : "ptr"
        lpPrivateOutputDatMarshal := lpPrivateOutputDat is VarRef ? "ptr" : "ptr"

        result := ComCall(12, this, "uint", dwFunction, lpPrivateInputDataMarshal, lpPrivateInputData, "uint", cbPrivateInputData, lpPrivateOutputDatMarshal, lpPrivateOutputDat, "uint", cbPrivateOutputData, "uint", dwNumBuffers, "ptr", pamvaBufferInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwTypeIndex 
     * @param {Integer} dwBufferIndex 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/videoacc/nf-videoacc-iamvideoaccelerator-queryrenderstatus
     */
    QueryRenderStatus(dwTypeIndex, dwBufferIndex, dwFlags) {
        result := ComCall(13, this, "uint", dwTypeIndex, "uint", dwBufferIndex, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlipToIndex 
     * @param {IMediaSample} pMediaSample 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/videoacc/nf-videoacc-iamvideoaccelerator-displayframe
     */
    DisplayFrame(dwFlipToIndex, pMediaSample) {
        result := ComCall(14, this, "uint", dwFlipToIndex, "ptr", pMediaSample, "HRESULT")
        return result
    }
}
