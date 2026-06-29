#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "Common\D2D_RECT_F.ahk" { D2D_RECT_F }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID2D1GdiMetafileSink.ahk" { ID2D1GdiMetafileSink }
#Import ".\ID2D1Resource.ahk" { ID2D1Resource }

/**
 * A Direct2D resource that wraps a WMF, EMF, or EMF+ metafile.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nn-d2d1_1-id2d1gdimetafile
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1GdiMetafile extends ID2D1Resource {
    /**
     * The interface identifier for ID2D1GdiMetafile
     * @type {Guid}
     */
    static IID := Guid("{2f543dc3-cfc1-4211-864f-cfd91c6f3395}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1GdiMetafile interfaces
    */
    struct Vtbl extends ID2D1Resource.Vtbl {
        Stream    : IntPtr
        GetBounds : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1GdiMetafile.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This method streams the contents of the command to the given metafile sink.
     * @param {ID2D1GdiMetafileSink} sink Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1gdimetafilesink">ID2D1GdiMetafileSink</a></b>
     * 
     * The sink into which Direct2D  will call back.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>No error occurred.</td>
     * </tr>
     * <tr>
     * <td>E_OUTOFMEMORY</td>
     * <td>Direct2D could not allocate sufficient memory to complete the call.</td>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>An invalid value was passed to the method.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1gdimetafile-stream
     */
    Stream(sink) {
        result := ComCall(4, this, "ptr", sink, "HRESULT")
        return result
    }

    /**
     * Gets the bounds of the metafile, in device-independent pixels (DIPs), as reported in the metafile’s header.
     * @returns {D2D_RECT_F} Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * The bounds, in DIPs, of the metafile.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1gdimetafile-getbounds
     */
    GetBounds() {
        bounds := D2D_RECT_F()
        result := ComCall(5, this, D2D_RECT_F.Ptr, bounds, "HRESULT")
        return bounds
    }

    Query(iid) {
        if (ID2D1GdiMetafile.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Stream := CallbackCreate(GetMethod(implObj, "Stream"), flags, 2)
        this.vtbl.GetBounds := CallbackCreate(GetMethod(implObj, "GetBounds"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Stream)
        CallbackFree(this.vtbl.GetBounds)
    }
}
