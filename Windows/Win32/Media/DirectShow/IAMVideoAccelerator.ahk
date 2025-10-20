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
     * 
     * @param {Pointer<UInt32>} pdwNumGuidsSupported 
     * @param {Pointer<Guid>} pGuidsSupported 
     * @returns {HRESULT} 
     */
    GetVideoAcceleratorGUIDs(pdwNumGuidsSupported, pGuidsSupported) {
        result := ComCall(3, this, "uint*", pdwNumGuidsSupported, "ptr", pGuidsSupported, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pGuid 
     * @param {Pointer<UInt32>} pdwNumFormatsSupported 
     * @param {Pointer<DDPIXELFORMAT>} pFormatsSupported 
     * @returns {HRESULT} 
     */
    GetUncompFormatsSupported(pGuid, pdwNumFormatsSupported, pFormatsSupported) {
        result := ComCall(4, this, "ptr", pGuid, "uint*", pdwNumFormatsSupported, "ptr", pFormatsSupported, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pGuid 
     * @param {Pointer<AMVAUncompDataInfo>} pamvaUncompDataInfo 
     * @param {Pointer<AMVAInternalMemInfo>} pamvaInternalMemInfo 
     * @returns {HRESULT} 
     */
    GetInternalMemInfo(pGuid, pamvaUncompDataInfo, pamvaInternalMemInfo) {
        result := ComCall(5, this, "ptr", pGuid, "ptr", pamvaUncompDataInfo, "ptr", pamvaInternalMemInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pGuid 
     * @param {Pointer<AMVAUncompDataInfo>} pamvaUncompDataInfo 
     * @param {Pointer<UInt32>} pdwNumTypesCompBuffers 
     * @param {Pointer<AMVACompBufferInfo>} pamvaCompBufferInfo 
     * @returns {HRESULT} 
     */
    GetCompBufferInfo(pGuid, pamvaUncompDataInfo, pdwNumTypesCompBuffers, pamvaCompBufferInfo) {
        result := ComCall(6, this, "ptr", pGuid, "ptr", pamvaUncompDataInfo, "uint*", pdwNumTypesCompBuffers, "ptr", pamvaCompBufferInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwNumTypesCompBuffers 
     * @param {Pointer<AMVACompBufferInfo>} pamvaCompBufferInfo 
     * @returns {HRESULT} 
     */
    GetInternalCompBufferInfo(pdwNumTypesCompBuffers, pamvaCompBufferInfo) {
        result := ComCall(7, this, "uint*", pdwNumTypesCompBuffers, "ptr", pamvaCompBufferInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<AMVABeginFrameInfo>} amvaBeginFrameInfo 
     * @returns {HRESULT} 
     */
    BeginFrame(amvaBeginFrameInfo) {
        result := ComCall(8, this, "ptr", amvaBeginFrameInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<AMVAEndFrameInfo>} pEndFrameInfo 
     * @returns {HRESULT} 
     */
    EndFrame(pEndFrameInfo) {
        result := ComCall(9, this, "ptr", pEndFrameInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwTypeIndex 
     * @param {Integer} dwBufferIndex 
     * @param {BOOL} bReadOnly 
     * @param {Pointer<Void>} ppBuffer 
     * @param {Pointer<Int32>} lpStride 
     * @returns {HRESULT} 
     */
    GetBuffer(dwTypeIndex, dwBufferIndex, bReadOnly, ppBuffer, lpStride) {
        result := ComCall(10, this, "uint", dwTypeIndex, "uint", dwBufferIndex, "int", bReadOnly, "ptr", ppBuffer, "int*", lpStride, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwTypeIndex 
     * @param {Integer} dwBufferIndex 
     * @returns {HRESULT} 
     */
    ReleaseBuffer(dwTypeIndex, dwBufferIndex) {
        result := ComCall(11, this, "uint", dwTypeIndex, "uint", dwBufferIndex, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    Execute(dwFunction, lpPrivateInputData, cbPrivateInputData, lpPrivateOutputDat, cbPrivateOutputData, dwNumBuffers, pamvaBufferInfo) {
        result := ComCall(12, this, "uint", dwFunction, "ptr", lpPrivateInputData, "uint", cbPrivateInputData, "ptr", lpPrivateOutputDat, "uint", cbPrivateOutputData, "uint", dwNumBuffers, "ptr", pamvaBufferInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwTypeIndex 
     * @param {Integer} dwBufferIndex 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    QueryRenderStatus(dwTypeIndex, dwBufferIndex, dwFlags) {
        result := ComCall(13, this, "uint", dwTypeIndex, "uint", dwBufferIndex, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlipToIndex 
     * @param {Pointer<IMediaSample>} pMediaSample 
     * @returns {HRESULT} 
     */
    DisplayFrame(dwFlipToIndex, pMediaSample) {
        result := ComCall(14, this, "uint", dwFlipToIndex, "ptr", pMediaSample, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
