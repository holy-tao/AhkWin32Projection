#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\MediaFoundation\AM_MEDIA_TYPE.ahk" { AM_MEDIA_TYPE }
#Import "..\..\Graphics\Direct3D9\IDirect3DSurface9.ahk" { IDirect3DSurface9 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\VMR9VideoStreamInfo.ahk" { VMR9VideoStreamInfo }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IVMRImageCompositor9 interface is implemented by the default compositor for the Video Mixing Renderer Filter 9 (VMR-9).
 * @remarks
 * Include DShow.h and D3d9.h before Vmr9.h.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/nn-vmr9-ivmrimagecompositor9
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IVMRImageCompositor9 extends IUnknown {
    /**
     * The interface identifier for IVMRImageCompositor9
     * @type {Guid}
     */
    static IID := Guid("{4a5c89eb-df51-4654-ac2a-e48e02bbabf6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVMRImageCompositor9 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InitCompositionDevice : IntPtr
        TermCompositionDevice : IntPtr
        SetStreamMediaType    : IntPtr
        CompositeImage        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVMRImageCompositor9.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The InitCompositionDevice method informs the compositor that a new composition target has been created.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {IUnknown} pD3DDevice Pointer to the <b>IUnknown</b> interface of the Direct3D device object.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrimagecompositor9-initcompositiondevice
     */
    InitCompositionDevice(pD3DDevice) {
        result := ComCall(3, this, "ptr", pD3DDevice, "HRESULT")
        return result
    }

    /**
     * The TermCompositionDevice method informs the compositor that the current composition target is being replaced. Compositors should perform any necessary cleanup of the composition target in this method.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {IUnknown} pD3DDevice Pointer to the <b>IUnknown</b> interface of the Direct3D device object.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrimagecompositor9-termcompositiondevice
     */
    TermCompositionDevice(pD3DDevice) {
        result := ComCall(4, this, "ptr", pD3DDevice, "HRESULT")
        return result
    }

    /**
     * The SetStreamMediaType method sets the media type for the input stream.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {Integer} dwStrmID Specifies the input stream; must be from 1 through 16.
     * @param {Pointer<AM_MEDIA_TYPE>} pmt Pointer to the AM_MEDIA_TYPE struct that specifies the media type.
     * @param {BOOL} fTexture If <b>TRUE</b>, specifies that the target surface is a Direct3D texture surface.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrimagecompositor9-setstreammediatype
     */
    SetStreamMediaType(dwStrmID, pmt, fTexture) {
        result := ComCall(5, this, "uint", dwStrmID, AM_MEDIA_TYPE.Ptr, pmt, BOOL, fTexture, "HRESULT")
        return result
    }

    /**
     * The CompositeImage method composites the current frames available in each input stream.
     * @remarks
     * Include DShow.h and D3d9.h before Vmr9.h.
     * @param {IUnknown} pD3DDevice Pointer to the <b>IUnknown</b> interface of the Direct3D device object.
     * @param {IDirect3DSurface9} pddsRenderTarget Specifies the Direct3D surface that all drawing should be performed on.
     * @param {Pointer<AM_MEDIA_TYPE>} pmtRenderTarget Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure that contains the media type of the target surface.
     * @param {Integer} rtStart Specifies the start time.
     * @param {Integer} rtEnd Specifies the end time.
     * @param {Integer} dwClrBkGnd Specifies the background color, as a <b>D3DCOLOR</b> type.
     * @param {Pointer<VMR9VideoStreamInfo>} pVideoStreamInfo Pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ns-vmr9-vmr9videostreaminfo">VMR9VideoStreamInfo</a> structures, which describe each video stream.
     * @param {Integer} cStreams Specifies the number of streams to mix, which is also the size of the <i>pVideoStreamInfo</i> array.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrimagecompositor9-compositeimage
     */
    CompositeImage(pD3DDevice, pddsRenderTarget, pmtRenderTarget, rtStart, rtEnd, dwClrBkGnd, pVideoStreamInfo, cStreams) {
        result := ComCall(6, this, "ptr", pD3DDevice, "ptr", pddsRenderTarget, AM_MEDIA_TYPE.Ptr, pmtRenderTarget, "int64", rtStart, "int64", rtEnd, "uint", dwClrBkGnd, VMR9VideoStreamInfo.Ptr, pVideoStreamInfo, "uint", cStreams, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVMRImageCompositor9.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitCompositionDevice := CallbackCreate(GetMethod(implObj, "InitCompositionDevice"), flags, 2)
        this.vtbl.TermCompositionDevice := CallbackCreate(GetMethod(implObj, "TermCompositionDevice"), flags, 2)
        this.vtbl.SetStreamMediaType := CallbackCreate(GetMethod(implObj, "SetStreamMediaType"), flags, 4)
        this.vtbl.CompositeImage := CallbackCreate(GetMethod(implObj, "CompositeImage"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitCompositionDevice)
        CallbackFree(this.vtbl.TermCompositionDevice)
        CallbackFree(this.vtbl.SetStreamMediaType)
        CallbackFree(this.vtbl.CompositeImage)
    }
}
