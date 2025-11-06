#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Direct3D9\IDirect3DSurface9.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSurface"]

    /**
     * 
     * @param {Integer} Width 
     * @param {Integer} Height 
     * @param {Integer} BackBuffers 
     * @param {Integer} Format 
     * @param {Integer} Pool 
     * @param {Integer} Usage 
     * @param {Integer} DxvaType 
     * @param {Pointer<HANDLE>} pSharedHandle 
     * @returns {IDirect3DSurface9} 
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideoaccelerationservice-createsurface
     */
    CreateSurface(Width, Height, BackBuffers, Format, Pool, Usage, DxvaType, pSharedHandle) {
        result := ComCall(3, this, "uint", Width, "uint", Height, "uint", BackBuffers, "uint", Format, "int", Pool, "uint", Usage, "uint", DxvaType, "ptr*", &ppSurface := 0, "ptr", pSharedHandle, "HRESULT")
        return IDirect3DSurface9(ppSurface)
    }
}
