#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IDirectXVideoDecoderService>} ppService 
     * @returns {HRESULT} 
     */
    GetVideoDecoderService(ppService) {
        result := ComCall(3, this, "ptr", ppService, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pDeviceGuid 
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc 
     * @param {Pointer<DXVA2_ConfigPictureDecode>} pConfig 
     * @param {Pointer<IDirect3DSurface9>} pDecoderRenderTargets 
     * @param {Pointer<UInt32>} pNumSurfaces 
     * @returns {HRESULT} 
     */
    GetCreationParameters(pDeviceGuid, pVideoDesc, pConfig, pDecoderRenderTargets, pNumSurfaces) {
        result := ComCall(4, this, "ptr", pDeviceGuid, "ptr", pVideoDesc, "ptr", pConfig, "ptr", pDecoderRenderTargets, "uint*", pNumSurfaces, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} BufferType 
     * @param {Pointer<Void>} ppBuffer 
     * @param {Pointer<UInt32>} pBufferSize 
     * @returns {HRESULT} 
     */
    GetBuffer(BufferType, ppBuffer, pBufferSize) {
        result := ComCall(5, this, "uint", BufferType, "ptr", ppBuffer, "uint*", pBufferSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} BufferType 
     * @returns {HRESULT} 
     */
    ReleaseBuffer(BufferType) {
        result := ComCall(6, this, "uint", BufferType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DSurface9>} pRenderTarget 
     * @param {Pointer<Void>} pvPVPData 
     * @returns {HRESULT} 
     */
    BeginFrame(pRenderTarget, pvPVPData) {
        result := ComCall(7, this, "ptr", pRenderTarget, "ptr", pvPVPData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} pHandleComplete 
     * @returns {HRESULT} 
     */
    EndFrame(pHandleComplete) {
        result := ComCall(8, this, "ptr", pHandleComplete, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DXVA2_DecodeExecuteParams>} pExecuteParams 
     * @returns {HRESULT} 
     */
    Execute(pExecuteParams) {
        result := ComCall(9, this, "ptr", pExecuteParams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
