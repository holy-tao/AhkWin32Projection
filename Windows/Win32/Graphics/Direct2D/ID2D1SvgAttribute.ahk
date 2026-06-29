#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID2D1SvgElement.ahk" { ID2D1SvgElement }
#Import ".\ID2D1Resource.ahk" { ID2D1Resource }

/**
 * Interface describing an SVG attribute.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nn-d2d1svg-id2d1svgattribute
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1SvgAttribute extends ID2D1Resource {
    /**
     * The interface identifier for ID2D1SvgAttribute
     * @type {Guid}
     */
    static IID := Guid("{c9cdb0dd-f8c9-4e70-b7c2-301c80292c5e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1SvgAttribute interfaces
    */
    struct Vtbl extends ID2D1Resource.Vtbl {
        GetElement : IntPtr
        Clone      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1SvgAttribute.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the element on which this attribute is set. Returns null if the attribute is not set on any element.
     * @param {Pointer<ID2D1SvgElement>} element Type: <b>ID2D1SvgElement**</b>
     * 
     * When this method completes, this will contain a pointer to the element on which this attribute is set.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgattribute-getelement
     */
    GetElement(element) {
        ComCall(4, this, ID2D1SvgElement.Ptr, element)
    }

    /**
     * Creates a clone of this attribute value. On creation, the cloned attribute is not set on any element.
     * @returns {ID2D1SvgAttribute} Type: <b>ID2D1SvgAttribute**</b>
     * 
     * Specifies the attribute value to clone.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgattribute-clone
     */
    Clone() {
        result := ComCall(5, this, "ptr*", &attribute := 0, "HRESULT")
        return ID2D1SvgAttribute(attribute)
    }

    Query(iid) {
        if (ID2D1SvgAttribute.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetElement := CallbackCreate(GetMethod(implObj, "GetElement"), flags, 2)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetElement)
        CallbackFree(this.vtbl.Clone)
    }
}
