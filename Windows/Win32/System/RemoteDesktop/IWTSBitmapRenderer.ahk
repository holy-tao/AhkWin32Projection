#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\BITMAP_RENDERER_STATISTICS.ahk" { BITMAP_RENDERER_STATISTICS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Used by a dynamic virtual channel plug-in to render bitmaps.
 * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nn-tsvirtualchannels-iwtsbitmaprenderer
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWTSBitmapRenderer extends IUnknown {
    /**
     * The interface identifier for IWTSBitmapRenderer
     * @type {Guid}
     */
    static IID := Guid("{5b7acc97-f3c9-46f7-8c5b-fa685d3441b1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWTSBitmapRenderer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Render                : IntPtr
        GetRendererStatistics : IntPtr
        RemoveMapping         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWTSBitmapRenderer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called by a dynamic virtual channel plug-in to render bitmaps.
     * @param {Guid} imageFormat Specifies the format of the data in the <i>pImageBuffer</i> buffer. This parameter is ignored and only bitmaps can be rendered.
     * @param {Integer} dwWidth The width of the bitmap.
     * @param {Integer} dwHeight The height of the bitmap.
     * @param {Integer} cbStride The stride width of the bitmap.
     * @param {Integer} cbImageBuffer The size, in bytes, of the <i>pImageBuffer</i> buffer.
     * @param {Pointer<Integer>} pImageBuffer An array of bytes that contains the data to render.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nf-tsvirtualchannels-iwtsbitmaprenderer-render
     */
    Render(imageFormat, dwWidth, dwHeight, cbStride, cbImageBuffer, pImageBuffer) {
        pImageBufferMarshal := pImageBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, Guid, imageFormat, "uint", dwWidth, "uint", dwHeight, "int", cbStride, "uint", cbImageBuffer, pImageBufferMarshal, pImageBuffer, "HRESULT")
        return result
    }

    /**
     * Retrieves statistics for the RemoteFX media redirection bitmap renderer.
     * @returns {BITMAP_RENDERER_STATISTICS} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/tsvirtualchannels/ns-tsvirtualchannels-bitmap_renderer_statistics">BITMAP_RENDERER_STATISTICS</a>*</b>
     * 
     * The address of a 
     *       <a href="https://docs.microsoft.com/windows/win32/api/tsvirtualchannels/ns-tsvirtualchannels-bitmap_renderer_statistics">BITMAP_RENDERER_STATISTICS</a> structure 
     *       that receives the bitmap rendering statistics.
     * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nf-tsvirtualchannels-iwtsbitmaprenderer-getrendererstatistics
     */
    GetRendererStatistics() {
        pStatistics := BITMAP_RENDERER_STATISTICS()
        result := ComCall(4, this, BITMAP_RENDERER_STATISTICS.Ptr, pStatistics, "HRESULT")
        return pStatistics
    }

    /**
     * Called by a dynamic virtual channel plug-in to remove a render mapping.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nf-tsvirtualchannels-iwtsbitmaprenderer-removemapping
     */
    RemoveMapping() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWTSBitmapRenderer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Render := CallbackCreate(GetMethod(implObj, "Render"), flags, 7)
        this.vtbl.GetRendererStatistics := CallbackCreate(GetMethod(implObj, "GetRendererStatistics"), flags, 2)
        this.vtbl.RemoveMapping := CallbackCreate(GetMethod(implObj, "RemoveMapping"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Render)
        CallbackFree(this.vtbl.GetRendererStatistics)
        CallbackFree(this.vtbl.RemoveMapping)
    }
}
