#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWTSBitmapRendererCallback.ahk" { IWTSBitmapRendererCallback }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWTSBitmapRenderer.ahk" { IWTSBitmapRenderer }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * This service is used to create a visual mapping on the client corresponding to a mapped window on the server.
 * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nn-tsvirtualchannels-iwtsbitmaprenderservice
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWTSBitmapRenderService extends IUnknown {
    /**
     * The interface identifier for IWTSBitmapRenderService
     * @type {Guid}
     */
    static IID := Guid("{ea326091-05fe-40c1-b49c-3d2ef4626a0e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWTSBitmapRenderService interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetMappedRenderer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWTSBitmapRenderService.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Obtains the bitmap rendering object used to render media on the server.
     * @param {Integer} mappingId A 64-bit number that uniquely identifies the render mapping.
     * @param {IWTSBitmapRendererCallback} pMappedRendererCallback The address of the caller's <a href="https://docs.microsoft.com/windows/desktop/api/tsvirtualchannels/nn-tsvirtualchannels-iwtsbitmaprenderercallback">IWTSBitmapRendererCallback</a> interface.
     * @returns {IWTSBitmapRenderer} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/tsvirtualchannels/nn-tsvirtualchannels-iwtsbitmaprenderer">IWTSBitmapRenderer</a> interface pointer that receives the bitmap renderer. When you have finished using pointer, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release()</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nf-tsvirtualchannels-iwtsbitmaprenderservice-getmappedrenderer
     */
    GetMappedRenderer(mappingId, pMappedRendererCallback) {
        result := ComCall(3, this, "uint", mappingId, "ptr", pMappedRendererCallback, "ptr*", &ppMappedRenderer := 0, "HRESULT")
        return IWTSBitmapRenderer(ppMappedRenderer)
    }

    Query(iid) {
        if (IWTSBitmapRenderService.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMappedRenderer := CallbackCreate(GetMethod(implObj, "GetMappedRenderer"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMappedRenderer)
    }
}
