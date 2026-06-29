#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D2D1_COLOR_SPACE.ahk" { D2D1_COLOR_SPACE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID2D1Resource.ahk" { ID2D1Resource }

/**
 * Represents a color context that can be used with an ID2D1Bitmap1 object.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nn-d2d1_1-id2d1colorcontext
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1ColorContext extends ID2D1Resource {
    /**
     * The interface identifier for ID2D1ColorContext
     * @type {Guid}
     */
    static IID := Guid("{1c4820bb-5771-4518-a581-2fe4dd0ec657}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1ColorContext interfaces
    */
    struct Vtbl extends ID2D1Resource.Vtbl {
        GetColorSpace  : IntPtr
        GetProfileSize : IntPtr
        GetProfile     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1ColorContext.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the color space of the color context.
     * @returns {D2D1_COLOR_SPACE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_color_space">D2D1_COLOR_SPACE</a></b>
     * 
     * This method returns the color space of the contained ICC profile.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1colorcontext-getcolorspace
     */
    GetColorSpace() {
        result := ComCall(4, this, D2D1_COLOR_SPACE)
        return result
    }

    /**
     * Gets the size of the color profile associated with the bitmap.
     * @remarks
     * This can be used to allocate a buffer to receive the color profile bytes associated with the context.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * This method returns the  size of the profile in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1colorcontext-getprofilesize
     */
    GetProfileSize() {
        result := ComCall(5, this, UInt32)
        return result
    }

    /**
     * Gets the color profile bytes for an ID2D1ColorContext.
     * @remarks
     * If <i>profileSize</i> is insufficient to store the entire profile, <i>profile</i> is zero-initialized before this method fails.
     * @param {Integer} profileSize Type: <b>UINT32</b>
     * 
     * The size of the <i>profile</i> buffer.
     * @returns {Integer} Type: <b>BYTE*</b>
     * 
     * When this method returns, contains the color profile.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1colorcontext-getprofile
     */
    GetProfile(profileSize) {
        result := ComCall(6, this, "char*", &_profile := 0, "uint", profileSize, "HRESULT")
        return _profile
    }

    Query(iid) {
        if (ID2D1ColorContext.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetColorSpace := CallbackCreate(GetMethod(implObj, "GetColorSpace"), flags, 1)
        this.vtbl.GetProfileSize := CallbackCreate(GetMethod(implObj, "GetProfileSize"), flags, 1)
        this.vtbl.GetProfile := CallbackCreate(GetMethod(implObj, "GetProfile"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetColorSpace)
        CallbackFree(this.vtbl.GetProfileSize)
        CallbackFree(this.vtbl.GetProfile)
    }
}
