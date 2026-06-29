#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDWriteRenderingParams.ahk" { IDWriteRenderingParams }

/**
 * Represents text rendering settings for glyph rasterization and filtering. (IDWriteRenderingParams1)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nn-dwrite_1-idwriterenderingparams1
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteRenderingParams1 extends IDWriteRenderingParams {
    /**
     * The interface identifier for IDWriteRenderingParams1
     * @type {Guid}
     */
    static IID := Guid("{94413cf4-a6fc-4248-8b50-6674348fcad3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteRenderingParams1 interfaces
    */
    struct Vtbl extends IDWriteRenderingParams.Vtbl {
        GetGrayscaleEnhancedContrast : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteRenderingParams1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the amount of contrast enhancement to use for grayscale antialiasing.
     * @returns {Float} Type: <b>FLOAT</b>
     * 
     * The contrast enhancement value. Valid values are greater than or equal to zero.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/nf-dwrite_1-idwriterenderingparams1-getgrayscaleenhancedcontrast
     */
    GetGrayscaleEnhancedContrast() {
        result := ComCall(8, this, Float32)
        return result
    }

    Query(iid) {
        if (IDWriteRenderingParams1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetGrayscaleEnhancedContrast := CallbackCreate(GetMethod(implObj, "GetGrayscaleEnhancedContrast"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetGrayscaleEnhancedContrast)
    }
}
