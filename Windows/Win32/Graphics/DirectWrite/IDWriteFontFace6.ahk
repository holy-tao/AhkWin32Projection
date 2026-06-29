#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDWriteLocalizedStrings.ahk" { IDWriteLocalizedStrings }
#Import ".\IDWriteFontFace5.ahk" { IDWriteFontFace5 }
#Import ".\DWRITE_FONT_FAMILY_MODEL.ahk" { DWRITE_FONT_FAMILY_MODEL }

/**
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFontFace6 extends IDWriteFontFace5 {
    /**
     * The interface identifier for IDWriteFontFace6
     * @type {Guid}
     */
    static IID := Guid("{c4b1fe1b-6e84-47d5-b54c-a597981b06ad}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFontFace6 interfaces
    */
    struct Vtbl extends IDWriteFontFace5.Vtbl {
        GetFamilyNames : IntPtr
        GetFaceNames   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFontFace6.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {DWRITE_FONT_FAMILY_MODEL} fontFamilyModel 
     * @returns {IDWriteLocalizedStrings} 
     */
    GetFamilyNames(fontFamilyModel) {
        result := ComCall(58, this, DWRITE_FONT_FAMILY_MODEL, fontFamilyModel, "ptr*", &names := 0, "HRESULT")
        return IDWriteLocalizedStrings(names)
    }

    /**
     * 
     * @param {DWRITE_FONT_FAMILY_MODEL} fontFamilyModel 
     * @returns {IDWriteLocalizedStrings} 
     */
    GetFaceNames(fontFamilyModel) {
        result := ComCall(59, this, DWRITE_FONT_FAMILY_MODEL, fontFamilyModel, "ptr*", &names := 0, "HRESULT")
        return IDWriteLocalizedStrings(names)
    }

    Query(iid) {
        if (IDWriteFontFace6.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFamilyNames := CallbackCreate(GetMethod(implObj, "GetFamilyNames"), flags, 3)
        this.vtbl.GetFaceNames := CallbackCreate(GetMethod(implObj, "GetFaceNames"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFamilyNames)
        CallbackFree(this.vtbl.GetFaceNames)
    }
}
