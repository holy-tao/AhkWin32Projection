#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Graphics\Direct3D9\D3DPOOL.ahk" { D3DPOOL }
#Import "..\..\Graphics\Direct3D9\IDirect3DSurface9.ahk" { IDirect3DSurface9 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Graphics\Direct3D9\D3DFORMAT.ahk" { D3DFORMAT }

/**
 * Provides DirectX Video Acceleration (DXVA) services from a Direct3D device.
 * @remarks
 * This is the base interface for DXVA services. The Direct3D device can support any of the following DXVA services, which derive from <b>IDirectXVideoAccelerationService</b>:
 * 
 * <ul>
 * <li>Video decoding: <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nn-dxva2api-idirectxvideodecoderservice">IDirectXVideoDecoderService</a>
 * </li>
 * <li>Video processing: <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nn-dxva2api-idirectxvideoprocessorservice">IDirectXVideoProcessorService</a>
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nn-dxva2api-idirectxvideoaccelerationservice
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IDirectXVideoAccelerationService extends IUnknown {
    /**
     * The interface identifier for IDirectXVideoAccelerationService
     * @type {Guid}
     */
    static IID := Guid("{fc51a550-d5e7-11d9-af55-00054e43ff02}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectXVideoAccelerationService interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateSurface : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectXVideoAccelerationService.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a DirectX Video Acceleration (DXVA) video processor or DXVA decoder render target.
     * @remarks
     * If the method returns <b>E_FAIL</b>, try calling <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nf-dxva2api-idirect3ddevicemanager9-resetdevice">IDirect3DDeviceManager9::ResetDevice</a> to reset the DirectX Video Acceleration Manager.
     * @param {Integer} Width The width of the surface, in pixels.
     * @param {Integer} Height The height of the surface, in pixels.
     * @param {Integer} BackBuffers The number of back buffers. The method creates <i>BackBuffers</i> + 1 surfaces.
     * @param {D3DFORMAT} Format The pixel format, specified as a <b>D3DFORMAT</b> value or FOURCC code. For more information, see the Direct3D documentation.
     * @param {D3DPOOL} Pool The memory pool in which to create the surface, specified as a <b>D3DPOOL</b> value. For more information, see the Direct3D documentation. Decoders should generally use the value D3DPOOL_DEFAULT.
     * @param {Integer} Usage Reserved. Set this value to zero.
     * @param {Integer} DxvaType 
     * @param {Pointer<HANDLE>} pSharedHandle A pointer to a handle that is used to share the surfaces between Direct3D devices. Set this parameter to <b>NULL</b>.
     * @returns {IDirect3DSurface9} The address of an array of <b>IDirect3DSurface9</b> pointers allocated by the caller. The size of the array must be 1 + <i>BackBuffers</i> (enough for the back buffers plus one front buffer). The method fills the array with <b>IDirect3DSurface9</b> pointers. The caller must release all of the interface pointers. In addition, the front buffer holds a reference count on each of the back buffers. Therefore, the back buffers are never deleted until the front buffer is deleted.
     * @see https://learn.microsoft.com/windows/win32/api/dxva2api/nf-dxva2api-idirectxvideoaccelerationservice-createsurface
     */
    CreateSurface(Width, Height, BackBuffers, Format, Pool, Usage, DxvaType, pSharedHandle) {
        result := ComCall(3, this, "uint", Width, "uint", Height, "uint", BackBuffers, D3DFORMAT, Format, D3DPOOL, Pool, "uint", Usage, "uint", DxvaType, "ptr*", &ppSurface := 0, HANDLE.Ptr, pSharedHandle, "HRESULT")
        return IDirect3DSurface9(ppSurface)
    }

    Query(iid) {
        if (IDirectXVideoAccelerationService.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateSurface := CallbackCreate(GetMethod(implObj, "CreateSurface"), flags, 10)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateSurface)
    }
}
