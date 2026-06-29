#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDWriteRenderingParams1.ahk" { IDWriteRenderingParams1 }
#Import ".\DWRITE_GRID_FIT_MODE.ahk" { DWRITE_GRID_FIT_MODE }

/**
 * Represents text rendering settings for glyph rasterization and filtering. (IDWriteRenderingParams2)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nn-dwrite_2-idwriterenderingparams2
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteRenderingParams2 extends IDWriteRenderingParams1 {
    /**
     * The interface identifier for IDWriteRenderingParams2
     * @type {Guid}
     */
    static IID := Guid("{f9d711c3-9777-40ae-87e8-3e5af9bf0948}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteRenderingParams2 interfaces
    */
    struct Vtbl extends IDWriteRenderingParams1.Vtbl {
        GetGridFitMode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteRenderingParams2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the grid fitting mode.
     * @returns {DWRITE_GRID_FIT_MODE} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/ne-dwrite_2-dwrite_grid_fit_mode">DWRITE_GRID_FIT_MODE</a></b>
     * 
     * Returns a <a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/ne-dwrite_2-dwrite_grid_fit_mode">DWRITE_GRID_FIT_MODE</a>-typed value for the grid fitting mode.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwriterenderingparams2-getgridfitmode
     */
    GetGridFitMode() {
        result := ComCall(9, this, DWRITE_GRID_FIT_MODE)
        return result
    }

    Query(iid) {
        if (IDWriteRenderingParams2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetGridFitMode := CallbackCreate(GetMethod(implObj, "GetGridFitMode"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetGridFitMode)
    }
}
