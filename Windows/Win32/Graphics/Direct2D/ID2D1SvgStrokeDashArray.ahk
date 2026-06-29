#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D2D1_SVG_LENGTH.ahk" { D2D1_SVG_LENGTH }
#Import ".\ID2D1SvgAttribute.ahk" { ID2D1SvgAttribute }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Interface describing an SVG stroke-dasharray value.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nn-d2d1svg-id2d1svgstrokedasharray
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1SvgStrokeDashArray extends ID2D1SvgAttribute {
    /**
     * The interface identifier for ID2D1SvgStrokeDashArray
     * @type {Guid}
     */
    static IID := Guid("{f1c0ca52-92a3-4f00-b4ce-f35691efd9d9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1SvgStrokeDashArray interfaces
    */
    struct Vtbl extends ID2D1SvgAttribute.Vtbl {
        RemoveDashesAtEnd : IntPtr
        UpdateDashes      : IntPtr
        UpdateDashes1     : IntPtr
        GetDashes         : IntPtr
        GetDashes1        : IntPtr
        GetDashesCount    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1SvgStrokeDashArray.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Removes dashes from the end of the array.
     * @param {Integer} dashesCount Type: <b>UINT32</b>
     * 
     * Specifies how many dashes to remove.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgstrokedasharray-removedashesatend
     */
    RemoveDashesAtEnd(dashesCount) {
        result := ComCall(6, this, "uint", dashesCount, "HRESULT")
        return result
    }

    /**
     * Updates the array.
     * @param {Pointer<D2D1_SVG_LENGTH>} dashes 
     * @param {Integer} dashesCount 
     * @param {Integer} startIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1svgstrokedasharray-updatedashes-overload
     */
    UpdateDashes(dashes, dashesCount, startIndex) {
        result := ComCall(7, this, D2D1_SVG_LENGTH.Ptr, dashes, "uint", dashesCount, "uint", startIndex, "HRESULT")
        return result
    }

    /**
     * Updates the array.
     * @param {Pointer<Float>} dashes 
     * @param {Integer} dashesCount 
     * @param {Integer} startIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1svgstrokedasharray-updatedashes-overload
     */
    UpdateDashes1(dashes, dashesCount, startIndex) {
        dashesMarshal := dashes is VarRef ? "float*" : "ptr"

        result := ComCall(8, this, dashesMarshal, dashes, "uint", dashesCount, "uint", startIndex, "HRESULT")
        return result
    }

    /**
     * Gets dashes from the array.
     * @param {Integer} dashesCount 
     * @param {Integer} startIndex 
     * @returns {D2D1_SVG_LENGTH} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1svgstrokedasharray-getdashes-overload
     */
    GetDashes(dashesCount, startIndex) {
        dashes := D2D1_SVG_LENGTH()
        result := ComCall(9, this, D2D1_SVG_LENGTH.Ptr, dashes, "uint", dashesCount, "uint", startIndex, "HRESULT")
        return dashes
    }

    /**
     * Gets dashes from the array.
     * @param {Integer} dashesCount 
     * @param {Integer} startIndex 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1svgstrokedasharray-getdashes-overload
     */
    GetDashes1(dashesCount, startIndex) {
        result := ComCall(10, this, "float*", &dashes := 0, "uint", dashesCount, "uint", startIndex, "HRESULT")
        return dashes
    }

    /**
     * Gets the number of the dashes in the array.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * Returns the number of the dashes in the array.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1svg/nf-d2d1svg-id2d1svgstrokedasharray-getdashescount
     */
    GetDashesCount() {
        result := ComCall(11, this, UInt32)
        return result
    }

    Query(iid) {
        if (ID2D1SvgStrokeDashArray.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RemoveDashesAtEnd := CallbackCreate(GetMethod(implObj, "RemoveDashesAtEnd"), flags, 2)
        this.vtbl.UpdateDashes := CallbackCreate(GetMethod(implObj, "UpdateDashes"), flags, 4)
        this.vtbl.UpdateDashes1 := CallbackCreate(GetMethod(implObj, "UpdateDashes1"), flags, 4)
        this.vtbl.GetDashes := CallbackCreate(GetMethod(implObj, "GetDashes"), flags, 4)
        this.vtbl.GetDashes1 := CallbackCreate(GetMethod(implObj, "GetDashes1"), flags, 4)
        this.vtbl.GetDashesCount := CallbackCreate(GetMethod(implObj, "GetDashesCount"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RemoveDashesAtEnd)
        CallbackFree(this.vtbl.UpdateDashes)
        CallbackFree(this.vtbl.UpdateDashes1)
        CallbackFree(this.vtbl.GetDashes)
        CallbackFree(this.vtbl.GetDashes1)
        CallbackFree(this.vtbl.GetDashesCount)
    }
}
