#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\MediaFoundation\AM_MEDIA_TYPE.ahk" { AM_MEDIA_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\DirectDraw\IDirectDrawSurface7.ahk" { IDirectDrawSurface7 }
#Import ".\VMRVIDEOSTREAMINFO.ahk" { VMRVIDEOSTREAMINFO }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IVMRImageCompositor interface is implemented by the default compositor for the Video Mixing Renderer Filter 7 (VMR-7).
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ivmrimagecompositor
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IVMRImageCompositor extends IUnknown {
    /**
     * The interface identifier for IVMRImageCompositor
     * @type {Guid}
     */
    static IID := Guid("{7a4fb5af-479f-4074-bb40-ce6722e43c82}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVMRImageCompositor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InitCompositionTarget : IntPtr
        TermCompositionTarget : IntPtr
        SetStreamMediaType    : IntPtr
        CompositeImage        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVMRImageCompositor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The InitCompositionTarget method informs the compositor that a new composition target has been created.
     * @param {IUnknown} pD3DDevice Pointer to the <b>IUnknown</b> interface of the Direct3D device object.
     * @param {IDirectDrawSurface7} pddsRenderTarget Specifies the DirectDraw surface.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrimagecompositor-initcompositiontarget
     */
    InitCompositionTarget(pD3DDevice, pddsRenderTarget) {
        result := ComCall(3, this, "ptr", pD3DDevice, "ptr", pddsRenderTarget, "HRESULT")
        return result
    }

    /**
     * The TermCompositionTarget method informs the compositor that the current composition target is being replaced. Compositors should perform any necessary cleanup of the composition target in this method.
     * @param {IUnknown} pD3DDevice Pointer to the <b>IUnknown</b> interface of the Direct3D device object.
     * @param {IDirectDrawSurface7} pddsRenderTarget Specifies the DirectDraw surface
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrimagecompositor-termcompositiontarget
     */
    TermCompositionTarget(pD3DDevice, pddsRenderTarget) {
        result := ComCall(4, this, "ptr", pD3DDevice, "ptr", pddsRenderTarget, "HRESULT")
        return result
    }

    /**
     * The SetStreamMediaType method sets the media type for the input stream.
     * @param {Integer} dwStrmID Specifies the input stream. The value must be from 1 through 16.
     * @param {Pointer<AM_MEDIA_TYPE>} pmt Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure that specifies the media type.
     * @param {BOOL} fTexture If <b>TRUE</b>, specifies that the target surface is a Direct3D texture surface.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrimagecompositor-setstreammediatype
     */
    SetStreamMediaType(dwStrmID, pmt, fTexture) {
        result := ComCall(5, this, "uint", dwStrmID, AM_MEDIA_TYPE.Ptr, pmt, BOOL, fTexture, "HRESULT")
        return result
    }

    /**
     * The CompositeImage method composites the current frames available in each input stream.
     * @param {IUnknown} pD3DDevice Pointer to the <b>IUnknown</b> interface of the Direct3D device. The compositor must cast this to a <b>LPDIRECT3DDEVICE7</b> type.
     * @param {IDirectDrawSurface7} pddsRenderTarget Specifies the DirectDraw surface that all drawing should be performed on.
     * @param {Pointer<AM_MEDIA_TYPE>} pmtRenderTarget Specifies the media type of the DirectDraw surface.
     * @param {Integer} rtStart Specifies the start time.
     * @param {Integer} rtEnd Specifies the end time.
     * @param {Integer} dwClrBkGnd Specifies the background color.
     * @param {Pointer<VMRVIDEOSTREAMINFO>} pVideoStreamInfo Pointer to an array of video stream info objects.
     * @param {Integer} cStreams Specifies the number of streams to be mixed, which is equal to the size of the pVideoStreamInfo array.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrimagecompositor-compositeimage
     */
    CompositeImage(pD3DDevice, pddsRenderTarget, pmtRenderTarget, rtStart, rtEnd, dwClrBkGnd, pVideoStreamInfo, cStreams) {
        result := ComCall(6, this, "ptr", pD3DDevice, "ptr", pddsRenderTarget, AM_MEDIA_TYPE.Ptr, pmtRenderTarget, "int64", rtStart, "int64", rtEnd, "uint", dwClrBkGnd, VMRVIDEOSTREAMINFO.Ptr, pVideoStreamInfo, "uint", cStreams, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVMRImageCompositor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitCompositionTarget := CallbackCreate(GetMethod(implObj, "InitCompositionTarget"), flags, 3)
        this.vtbl.TermCompositionTarget := CallbackCreate(GetMethod(implObj, "TermCompositionTarget"), flags, 3)
        this.vtbl.SetStreamMediaType := CallbackCreate(GetMethod(implObj, "SetStreamMediaType"), flags, 4)
        this.vtbl.CompositeImage := CallbackCreate(GetMethod(implObj, "CompositeImage"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitCompositionTarget)
        CallbackFree(this.vtbl.TermCompositionTarget)
        CallbackFree(this.vtbl.SetStreamMediaType)
        CallbackFree(this.vtbl.CompositeImage)
    }
}
