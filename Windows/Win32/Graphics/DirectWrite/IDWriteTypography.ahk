#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DWRITE_FONT_FEATURE.ahk" { DWRITE_FONT_FEATURE }

/**
 * Represents a font typography setting.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetypography
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteTypography extends IUnknown {
    /**
     * The interface identifier for IDWriteTypography
     * @type {Guid}
     */
    static IID := Guid("{55f1112b-1dc2-4b3c-9541-f46894ed85b6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteTypography interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddFontFeature      : IntPtr
        GetFontFeatureCount : IntPtr
        GetFontFeature      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteTypography.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds an OpenType font feature.
     * @param {DWRITE_FONT_FEATURE} fontFeature Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_font_feature">DWRITE_FONT_FEATURE</a></b>
     * 
     * A structure that contains the OpenType name identifier and the execution parameter for the font feature being added.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetypography-addfontfeature
     */
    AddFontFeature(fontFeature) {
        result := ComCall(3, this, DWRITE_FONT_FEATURE, fontFeature, "HRESULT")
        return result
    }

    /**
     * Gets the number of OpenType font features for the current font.
     * @remarks
     * A single run of text can be associated with more than one typographic feature. The <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetypography">IDWriteTypography</a> object holds a list of these font features.
     * @returns {Integer} Type: <b>UINT32</b>
     * 
     * The number of font features for the current text format.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetypography-getfontfeaturecount
     */
    GetFontFeatureCount() {
        result := ComCall(4, this, UInt32)
        return result
    }

    /**
     * Gets the font feature at the specified index.
     * @remarks
     * A single run of text can be associated with more than one typographic feature. The <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritetypography">IDWriteTypography</a> object holds a list of these font features.
     * @param {Integer} fontFeatureIndex Type: <b>UINT32</b>
     * 
     * The zero-based index of the font feature to retrieve.
     * @returns {DWRITE_FONT_FEATURE} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_font_feature">DWRITE_FONT_FEATURE</a>*</b>
     * 
     * When this method returns, contains the font feature which is at the specified index.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritetypography-getfontfeature
     */
    GetFontFeature(fontFeatureIndex) {
        fontFeature := DWRITE_FONT_FEATURE()
        result := ComCall(5, this, "uint", fontFeatureIndex, DWRITE_FONT_FEATURE.Ptr, fontFeature, "HRESULT")
        return fontFeature
    }

    Query(iid) {
        if (IDWriteTypography.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddFontFeature := CallbackCreate(GetMethod(implObj, "AddFontFeature"), flags, 2)
        this.vtbl.GetFontFeatureCount := CallbackCreate(GetMethod(implObj, "GetFontFeatureCount"), flags, 1)
        this.vtbl.GetFontFeature := CallbackCreate(GetMethod(implObj, "GetFontFeature"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddFontFeature)
        CallbackFree(this.vtbl.GetFontFeatureCount)
        CallbackFree(this.vtbl.GetFontFeature)
    }
}
