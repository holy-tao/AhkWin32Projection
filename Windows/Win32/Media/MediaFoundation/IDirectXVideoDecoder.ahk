#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirectXVideoDecoderService.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a DirectX Video Acceleration (DXVA) video decoder device.
 * @remarks
 * 
  * The <b>IDirectXVideoDecoder</b> methods make calls to the Direct3D device. Therefore, the <b>D3DCREATE</b> flags that you specify  when creating the device can affect the behavior of this interface. For example, if you specify the <b>D3DCREATE_MULTITHREADED</b> flag, the Direct3D global critical section will be held during decode operations.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nn-dxva2api-idirectxvideodecoder
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IDirectXVideoDecoder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectXVideoDecoder
     * @type {Guid}
     */
    static IID => Guid("{f2b0810a-fd00-43c9-918c-df94e2d8ef7d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetVideoDecoderService", "GetCreationParameters", "GetBuffer", "ReleaseBuffer", "BeginFrame", "EndFrame", "Execute"]

    /**
     * 
     * @returns {IDirectXVideoDecoderService} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideodecoder-getvideodecoderservice
     */
    GetVideoDecoderService() {
        result := ComCall(3, this, "ptr*", &ppService := 0, "HRESULT")
        return IDirectXVideoDecoderService(ppService)
    }

    /**
     * 
     * @param {Pointer<Guid>} pDeviceGuid 
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc 
     * @param {Pointer<DXVA2_ConfigPictureDecode>} pConfig 
     * @param {Pointer<Pointer<IDirect3DSurface9>>} pDecoderRenderTargets 
     * @param {Pointer<Integer>} pNumSurfaces 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideodecoder-getcreationparameters
     */
    GetCreationParameters(pDeviceGuid, pVideoDesc, pConfig, pDecoderRenderTargets, pNumSurfaces) {
        pDecoderRenderTargetsMarshal := pDecoderRenderTargets is VarRef ? "ptr*" : "ptr"
        pNumSurfacesMarshal := pNumSurfaces is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pDeviceGuid, "ptr", pVideoDesc, "ptr", pConfig, pDecoderRenderTargetsMarshal, pDecoderRenderTargets, pNumSurfacesMarshal, pNumSurfaces, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} BufferType 
     * @param {Pointer<Pointer<Void>>} ppBuffer 
     * @param {Pointer<Integer>} pBufferSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideodecoder-getbuffer
     */
    GetBuffer(BufferType, ppBuffer, pBufferSize) {
        ppBufferMarshal := ppBuffer is VarRef ? "ptr*" : "ptr"
        pBufferSizeMarshal := pBufferSize is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", BufferType, ppBufferMarshal, ppBuffer, pBufferSizeMarshal, pBufferSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} BufferType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideodecoder-releasebuffer
     */
    ReleaseBuffer(BufferType) {
        result := ComCall(6, this, "uint", BufferType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirect3DSurface9} pRenderTarget 
     * @param {Pointer<Void>} pvPVPData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideodecoder-beginframe
     */
    BeginFrame(pRenderTarget, pvPVPData) {
        pvPVPDataMarshal := pvPVPData is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, "ptr", pRenderTarget, pvPVPDataMarshal, pvPVPData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} pHandleComplete 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideodecoder-endframe
     */
    EndFrame(pHandleComplete) {
        result := ComCall(8, this, "ptr", pHandleComplete, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DXVA2_DecodeExecuteParams>} pExecuteParams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideodecoder-execute
     */
    Execute(pExecuteParams) {
        result := ComCall(9, this, "ptr", pExecuteParams, "HRESULT")
        return result
    }
}
