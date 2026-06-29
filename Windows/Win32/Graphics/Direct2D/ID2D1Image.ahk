#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1Resource.ahk" { ID2D1Resource }

/**
 * Represents a producer of pixels that can fill an arbitrary 2D plane. (ID2D1Image)
 * @remarks
 * An <b>ID2D1Image</b> is abstract.  Concrete instances can be created through <a href="https://docs.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-createeffect">ID2D1DeviceContext::CreateEffect</a> and <a href="https://docs.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-createbitmap(d2d1_size_u_constvoid_uint32_constd2d1_bitmap_properties1_id2d1bitmap1)">ID2D1DeviceContext::CreateBitmap</a>.
 * 
 * Images are evaluated lazily. If the type of image passed in is concrete, then the image can be directly sampled from. Other images can act only as a source of pixels and can produce content only as a result of calling <a href="https://docs.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-drawimage(id2d1effect_constd2d1_point_2f_constd2d1_rect_f_d2d1_interpolation_mode_d2d1_composite_mode)">ID2D1DeviceContext::DrawImage</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1image
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1Image extends ID2D1Resource {
    /**
     * The interface identifier for ID2D1Image
     * @type {Guid}
     */
    static IID := Guid("{65019f75-8da2-497c-b32c-dfa34e48ede6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1Image interfaces
    */
    struct Vtbl extends ID2D1Resource.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1Image.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (ID2D1Image.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
    }
}
