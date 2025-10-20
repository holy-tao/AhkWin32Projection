#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides DirectX Video Acceleration (DXVA) services from a Direct3D device.
 * @remarks
 * 
  * This is the base interface for DXVA services. The Direct3D device can support any of the following DXVA services, which derive from <b>IDirectXVideoAccelerationService</b>:
  * 
  * <ul>
  * <li>Video decoding: <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nn-dxva2api-idirectxvideodecoderservice">IDirectXVideoDecoderService</a>
  * </li>
  * <li>Video processing: <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nn-dxva2api-idirectxvideoprocessorservice">IDirectXVideoProcessorService</a>
  * </li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxva2api/nn-dxva2api-idirectxvideoaccelerationservice
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IDirectXVideoAccelerationService extends IUnknown{
    /**
     * The interface identifier for IDirectXVideoAccelerationService
     * @type {Guid}
     */
    static IID => Guid("{fc51a550-d5e7-11d9-af55-00054e43ff02}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} Width 
     * @param {Integer} Height 
     * @param {Integer} BackBuffers 
     * @param {Integer} Format 
     * @param {Integer} Pool 
     * @param {Integer} Usage 
     * @param {Integer} DxvaType 
     * @param {Pointer<IDirect3DSurface9>} ppSurface 
     * @param {Pointer<HANDLE>} pSharedHandle 
     * @returns {HRESULT} 
     */
    CreateSurface(Width, Height, BackBuffers, Format, Pool, Usage, DxvaType, ppSurface, pSharedHandle) {
        result := ComCall(3, this, "uint", Width, "uint", Height, "uint", BackBuffers, "uint", Format, "int", Pool, "uint", Usage, "uint", DxvaType, "ptr", ppSurface, "ptr", pSharedHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
