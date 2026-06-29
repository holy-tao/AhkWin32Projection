#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDWriteFontFallback.ahk" { IDWriteFontFallback }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DWRITE_UNICODE_RANGE.ahk" { DWRITE_UNICODE_RANGE }
#Import ".\IDWriteFontCollection.ahk" { IDWriteFontCollection }

/**
 * Allows you to create Unicode font fallback mappings and create a font fall back object from those mappings.
 * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritefontfallbackbuilder
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFontFallbackBuilder extends IUnknown {
    /**
     * The interface identifier for IDWriteFontFallbackBuilder
     * @type {Guid}
     */
    static IID := Guid("{fd882d06-8aba-4fb8-b849-8be8b73e14de}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFontFallbackBuilder interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddMapping         : IntPtr
        AddMappings        : IntPtr
        CreateFontFallback : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFontFallbackBuilder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Appends a single mapping to the list. Call this once for each additional mapping.
     * @param {Pointer<DWRITE_UNICODE_RANGE>} ranges Type: **[**DWRITE\_UNICODE\_RANGE**](/windows/win32/api/Dwrite_1/ns-dwrite_1-dwrite_unicode_range)\***
     * 
     * Unicode ranges that apply to this mapping.
     * @param {Integer} rangesCount Type: **UINT32**
     * 
     * Number of Unicode ranges.
     * @param {Pointer<Pointer<Integer>>} targetFamilyNames Type: **const WCHAR\*\***
     * 
     * List of target family name strings.
     * @param {Integer} targetFamilyNamesCount Type: **UINT32**
     * 
     * Number of target family names.
     * @param {IDWriteFontCollection} _fontCollection Type: **[**IDWriteFontCollection**](/windows/win32/api/dwrite/nn-dwrite-idwritefontcollection)**
     * 
     * Optional explicit font collection for this mapping.
     * @param {PWSTR} localeName Type: **const WCHAR\***
     * 
     * Locale of the context.
     * @param {PWSTR} baseFamilyName Type: **const WCHAR\***
     * 
     * Base family name to match against, if applicable.
     * @param {Float} scale Type: **FLOAT**
     * 
     * Scale factor to multiply the result target font by.
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * If this method succeeds, it returns **S\_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritefontfallbackbuilder-addmapping
     */
    AddMapping(ranges, rangesCount, targetFamilyNames, targetFamilyNamesCount, _fontCollection, localeName, baseFamilyName, scale) {
        localeName := localeName is String ? StrPtr(localeName) : localeName
        baseFamilyName := baseFamilyName is String ? StrPtr(baseFamilyName) : baseFamilyName

        targetFamilyNamesMarshal := targetFamilyNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, DWRITE_UNICODE_RANGE.Ptr, ranges, "uint", rangesCount, targetFamilyNamesMarshal, targetFamilyNames, "uint", targetFamilyNamesCount, "ptr", _fontCollection, "ptr", localeName, "ptr", baseFamilyName, "float", scale, "HRESULT")
        return result
    }

    /**
     * Add all the mappings from an existing font fallback object.
     * @param {IDWriteFontFallback} fontFallback Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/nn-dwrite_2-idwritefontfallback">IDWriteFontFallback</a>*</b>
     * 
     * An existing font fallback object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritefontfallbackbuilder-addmappings
     */
    AddMappings(fontFallback) {
        result := ComCall(4, this, "ptr", fontFallback, "HRESULT")
        return result
    }

    /**
     * Creates the finalized fallback object from the mappings added.
     * @returns {IDWriteFontFallback} Contains an address of a pointer to the created fallback list.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/nf-dwrite_2-idwritefontfallbackbuilder-createfontfallback
     */
    CreateFontFallback() {
        result := ComCall(5, this, "ptr*", &fontFallback := 0, "HRESULT")
        return IDWriteFontFallback(fontFallback)
    }

    Query(iid) {
        if (IDWriteFontFallbackBuilder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddMapping := CallbackCreate(GetMethod(implObj, "AddMapping"), flags, 9)
        this.vtbl.AddMappings := CallbackCreate(GetMethod(implObj, "AddMappings"), flags, 2)
        this.vtbl.CreateFontFallback := CallbackCreate(GetMethod(implObj, "CreateFontFallback"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddMapping)
        CallbackFree(this.vtbl.AddMappings)
        CallbackFree(this.vtbl.CreateFontFallback)
    }
}
