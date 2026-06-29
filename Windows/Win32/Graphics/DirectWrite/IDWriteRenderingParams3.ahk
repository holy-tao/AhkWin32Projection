#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDWriteRenderingParams2.ahk" { IDWriteRenderingParams2 }
#Import ".\DWRITE_RENDERING_MODE1.ahk" { DWRITE_RENDERING_MODE1 }

/**
 * Represents text rendering settings for glyph rasterization and filtering. (IDWriteRenderingParams3)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwriterenderingparams3
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteRenderingParams3 extends IDWriteRenderingParams2 {
    /**
     * The interface identifier for IDWriteRenderingParams3
     * @type {Guid}
     */
    static IID := Guid("{b7924baa-391b-412a-8c5c-e44cc2d867dc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteRenderingParams3 interfaces
    */
    struct Vtbl extends IDWriteRenderingParams2.Vtbl {
        GetRenderingMode1 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteRenderingParams3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the rendering mode.
     * @returns {DWRITE_RENDERING_MODE1} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_rendering_mode1">DWRITE_RENDERING_MODE1</a></b>
     * 
     * Returns a <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_rendering_mode1">DWRITE_RENDERING_MODE1</a>-typed value for the rendering mode.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwriterenderingparams3-getrenderingmode1
     */
    GetRenderingMode1() {
        result := ComCall(10, this, DWRITE_RENDERING_MODE1)
        return result
    }

    Query(iid) {
        if (IDWriteRenderingParams3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRenderingMode1 := CallbackCreate(GetMethod(implObj, "GetRenderingMode1"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRenderingMode1)
    }
}
