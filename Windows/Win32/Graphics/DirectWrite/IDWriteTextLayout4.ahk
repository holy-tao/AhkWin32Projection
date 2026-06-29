#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDWriteTextLayout3.ahk" { IDWriteTextLayout3 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DWRITE_FONT_AXIS_VALUE.ahk" { DWRITE_FONT_AXIS_VALUE }
#Import ".\DWRITE_TEXT_RANGE.ahk" { DWRITE_TEXT_RANGE }
#Import ".\DWRITE_AUTOMATIC_FONT_AXES.ahk" { DWRITE_AUTOMATIC_FONT_AXES }

/**
 * Represents a block of text after it has been fully analyzed and formatted.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritetextlayout4
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteTextLayout4 extends IDWriteTextLayout3 {
    /**
     * The interface identifier for IDWriteTextLayout4
     * @type {Guid}
     */
    static IID := Guid("{05a9bf42-223f-4441-b5fb-8263685f55e9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteTextLayout4 interfaces
    */
    struct Vtbl extends IDWriteTextLayout3.Vtbl {
        SetFontAxisValues     : IntPtr
        GetFontAxisValueCount : IntPtr
        GetFontAxisValues     : IntPtr
        GetAutomaticFontAxes  : IntPtr
        SetAutomaticFontAxes  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteTextLayout4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues 
     * @param {Integer} fontAxisValueCount 
     * @param {DWRITE_TEXT_RANGE} textRange 
     * @returns {HRESULT} 
     */
    SetFontAxisValues(fontAxisValues, fontAxisValueCount, textRange) {
        result := ComCall(84, this, DWRITE_FONT_AXIS_VALUE.Ptr, fontAxisValues, "uint", fontAxisValueCount, DWRITE_TEXT_RANGE, textRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @returns {Integer} 
     */
    GetFontAxisValueCount(currentPosition) {
        result := ComCall(85, this, "uint", currentPosition, UInt32)
        return result
    }

    /**
     * 
     * @param {Integer} currentPosition 
     * @param {Pointer<DWRITE_FONT_AXIS_VALUE>} fontAxisValues 
     * @param {Integer} fontAxisValueCount 
     * @param {Pointer<DWRITE_TEXT_RANGE>} textRange 
     * @returns {HRESULT} 
     */
    GetFontAxisValues(currentPosition, fontAxisValues, fontAxisValueCount, textRange) {
        result := ComCall(86, this, "uint", currentPosition, DWRITE_FONT_AXIS_VALUE.Ptr, fontAxisValues, "uint", fontAxisValueCount, DWRITE_TEXT_RANGE.Ptr, textRange, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {DWRITE_AUTOMATIC_FONT_AXES} 
     */
    GetAutomaticFontAxes() {
        result := ComCall(87, this, DWRITE_AUTOMATIC_FONT_AXES)
        return result
    }

    /**
     * 
     * @param {DWRITE_AUTOMATIC_FONT_AXES} automaticFontAxes 
     * @returns {HRESULT} 
     */
    SetAutomaticFontAxes(automaticFontAxes) {
        result := ComCall(88, this, DWRITE_AUTOMATIC_FONT_AXES, automaticFontAxes, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDWriteTextLayout4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetFontAxisValues := CallbackCreate(GetMethod(implObj, "SetFontAxisValues"), flags, 4)
        this.vtbl.GetFontAxisValueCount := CallbackCreate(GetMethod(implObj, "GetFontAxisValueCount"), flags, 2)
        this.vtbl.GetFontAxisValues := CallbackCreate(GetMethod(implObj, "GetFontAxisValues"), flags, 5)
        this.vtbl.GetAutomaticFontAxes := CallbackCreate(GetMethod(implObj, "GetAutomaticFontAxes"), flags, 1)
        this.vtbl.SetAutomaticFontAxes := CallbackCreate(GetMethod(implObj, "SetAutomaticFontAxes"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetFontAxisValues)
        CallbackFree(this.vtbl.GetFontAxisValueCount)
        CallbackFree(this.vtbl.GetFontAxisValues)
        CallbackFree(this.vtbl.GetAutomaticFontAxes)
        CallbackFree(this.vtbl.SetAutomaticFontAxes)
    }
}
