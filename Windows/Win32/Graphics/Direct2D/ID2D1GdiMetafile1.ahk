#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "Common\D2D_RECT_F.ahk" { D2D_RECT_F }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID2D1GdiMetafile.ahk" { ID2D1GdiMetafile }

/**
 * This interface performs all the same functions as the existing ID2D1GdiMetafile interface. It also enables accessing the metafile DPI and bounds.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nn-d2d1_3-id2d1gdimetafile1
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1GdiMetafile1 extends ID2D1GdiMetafile {
    /**
     * The interface identifier for ID2D1GdiMetafile1
     * @type {Guid}
     */
    static IID := Guid("{2e69f9e8-dd3f-4bf9-95ba-c04f49d788df}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1GdiMetafile1 interfaces
    */
    struct Vtbl extends ID2D1GdiMetafile.Vtbl {
        GetDpi          : IntPtr
        GetSourceBounds : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1GdiMetafile1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the DPI reported by the metafile.
     * @param {Pointer<Float>} dpiX Type: <b>FLOAT*</b>
     * 
     * Receives the horizontal DPI reported by the metafile.
     * @param {Pointer<Float>} dpiY Type: <b>FLOAT*</b>
     * 
     * Receives the vertical DPI reported by the metafile.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1gdimetafile1-getdpi
     */
    GetDpi(dpiX, dpiY) {
        dpiXMarshal := dpiX is VarRef ? "float*" : "ptr"
        dpiYMarshal := dpiY is VarRef ? "float*" : "ptr"

        result := ComCall(6, this, dpiXMarshal, dpiX, dpiYMarshal, dpiY, "HRESULT")
        return result
    }

    /**
     * Gets the bounds of the metafile in source space in DIPs. This corresponds to the frame rect in an EMF/EMF+.
     * @returns {D2D_RECT_F} Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * The bounds, in DIPs, of the metafile.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1gdimetafile1-getsourcebounds
     */
    GetSourceBounds() {
        bounds := D2D_RECT_F()
        result := ComCall(7, this, D2D_RECT_F.Ptr, bounds, "HRESULT")
        return bounds
    }

    Query(iid) {
        if (ID2D1GdiMetafile1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDpi := CallbackCreate(GetMethod(implObj, "GetDpi"), flags, 3)
        this.vtbl.GetSourceBounds := CallbackCreate(GetMethod(implObj, "GetSourceBounds"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDpi)
        CallbackFree(this.vtbl.GetSourceBounds)
    }
}
