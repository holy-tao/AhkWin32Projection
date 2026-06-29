#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D2D1_COLOR_CONTEXT_TYPE.ahk" { D2D1_COLOR_CONTEXT_TYPE }
#Import ".\ID2D1ColorContext.ahk" { ID2D1ColorContext }
#Import "..\Dxgi\Common\DXGI_COLOR_SPACE_TYPE.ahk" { DXGI_COLOR_SPACE_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D2D1_SIMPLE_COLOR_PROFILE.ahk" { D2D1_SIMPLE_COLOR_PROFILE }

/**
 * Represents a color context to be used with the Color Management Effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nn-d2d1_3-id2d1colorcontext1
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1ColorContext1 extends ID2D1ColorContext {
    /**
     * The interface identifier for ID2D1ColorContext1
     * @type {Guid}
     */
    static IID := Guid("{1ab42875-c57f-4be9-bd85-9cd78d6f55ee}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1ColorContext1 interfaces
    */
    struct Vtbl extends ID2D1ColorContext.Vtbl {
        GetColorContextType   : IntPtr
        GetDXGIColorSpace     : IntPtr
        GetSimpleColorProfile : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1ColorContext1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the color context type. (ID2D1ColorContext1.GetColorContextType)
     * @returns {D2D1_COLOR_CONTEXT_TYPE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ne-d2d1_3-d2d1_color_context_type">D2D1_COLOR_CONTEXT_TYPE</a></b>
     * 
     * This method returns color context type.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1colorcontext1-getcolorcontexttype
     */
    GetColorContextType() {
        result := ComCall(7, this, D2D1_COLOR_CONTEXT_TYPE)
        return result
    }

    /**
     * Retrieves the DXGI color space of this context. Returns DXGI_COLOR_SPACE_CUSTOM when color context type is ICC.
     * @returns {DXGI_COLOR_SPACE_TYPE} Type: <b>DXGI_COLOR_SPACE_TYPE</b>
     * 
     * This method returns the DXGI color space of this context.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1colorcontext1-getdxgicolorspace
     */
    GetDXGIColorSpace() {
        result := ComCall(8, this, DXGI_COLOR_SPACE_TYPE)
        return result
    }

    /**
     * Retrieves a set simple color profile.
     * @returns {D2D1_SIMPLE_COLOR_PROFILE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ns-d2d1_3-d2d1_simple_color_profile">D2D1_SIMPLE_COLOR_PROFILE</a>*</b>
     * 
     * Pointer to a D2D1_SIMPLE_COLOR_PROFILE that will contain the simple color profile when the method returns.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/nf-d2d1_3-id2d1colorcontext1-getsimplecolorprofile
     */
    GetSimpleColorProfile() {
        simpleProfile := D2D1_SIMPLE_COLOR_PROFILE()
        result := ComCall(9, this, D2D1_SIMPLE_COLOR_PROFILE.Ptr, simpleProfile, "HRESULT")
        return simpleProfile
    }

    Query(iid) {
        if (ID2D1ColorContext1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetColorContextType := CallbackCreate(GetMethod(implObj, "GetColorContextType"), flags, 1)
        this.vtbl.GetDXGIColorSpace := CallbackCreate(GetMethod(implObj, "GetDXGIColorSpace"), flags, 1)
        this.vtbl.GetSimpleColorProfile := CallbackCreate(GetMethod(implObj, "GetSimpleColorProfile"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetColorContextType)
        CallbackFree(this.vtbl.GetDXGIColorSpace)
        CallbackFree(this.vtbl.GetSimpleColorProfile)
    }
}
