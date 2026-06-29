#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DWRITE_FONT_STYLE.ahk" { DWRITE_FONT_STYLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DWRITE_FONT_METRICS.ahk" { DWRITE_FONT_METRICS }
#Import ".\IDWriteFontFace.ahk" { IDWriteFontFace }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DWRITE_FONT_STRETCH.ahk" { DWRITE_FONT_STRETCH }
#Import ".\IDWriteLocalizedStrings.ahk" { IDWriteLocalizedStrings }
#Import ".\IDWriteFontFamily.ahk" { IDWriteFontFamily }
#Import ".\DWRITE_INFORMATIONAL_STRING_ID.ahk" { DWRITE_INFORMATIONAL_STRING_ID }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DWRITE_FONT_SIMULATIONS.ahk" { DWRITE_FONT_SIMULATIONS }
#Import ".\DWRITE_FONT_WEIGHT.ahk" { DWRITE_FONT_WEIGHT }

/**
 * Represents a physical font in a font collection. This interface is used to create font faces from physical fonts, or to retrieve information such as font face metrics or face names from existing font faces.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefont
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFont extends IUnknown {
    /**
     * The interface identifier for IDWriteFont
     * @type {Guid}
     */
    static IID := Guid("{acd16696-8c14-4f5d-877e-fe3fc1d32737}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFont interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFontFamily           : IntPtr
        GetWeight               : IntPtr
        GetStretch              : IntPtr
        GetStyle                : IntPtr
        IsSymbolFont            : IntPtr
        GetFaceNames            : IntPtr
        GetInformationalStrings : IntPtr
        GetSimulations          : IntPtr
        GetMetrics              : IntPtr
        HasCharacter            : IntPtr
        CreateFontFace          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFont.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the font family to which the specified font belongs.
     * @returns {IDWriteFontFamily} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontfamily">IDWriteFontFamily</a>**</b>
     * 
     * When this method returns, contains an address of a pointer to the font family object to which the specified font belongs.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefont-getfontfamily
     */
    GetFontFamily() {
        result := ComCall(3, this, "ptr*", &_fontFamily := 0, "HRESULT")
        return IDWriteFontFamily(_fontFamily)
    }

    /**
     * Gets the weight, or stroke thickness, of the specified font.
     * @returns {DWRITE_FONT_WEIGHT} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_weight">DWRITE_FONT_WEIGHT</a></b>
     * 
     * A value that indicates the weight for the specified font.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefont-getweight
     */
    GetWeight() {
        result := ComCall(4, this, DWRITE_FONT_WEIGHT)
        return result
    }

    /**
     * Gets the stretch, or width, of the specified font.
     * @returns {DWRITE_FONT_STRETCH} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_stretch">DWRITE_FONT_STRETCH</a></b>
     * 
     * A value that indicates the type of stretch, or width, applied to the specified font.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefont-getstretch
     */
    GetStretch() {
        result := ComCall(5, this, DWRITE_FONT_STRETCH)
        return result
    }

    /**
     * Gets the style, or slope, of the specified font.
     * @returns {DWRITE_FONT_STYLE} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_style">DWRITE_FONT_STYLE</a></b>
     * 
     * A value that indicates the type of style, or slope, of the specified font.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefont-getstyle
     */
    GetStyle() {
        result := ComCall(6, this, DWRITE_FONT_STYLE)
        return result
    }

    /**
     * Determines whether the font is a symbol font. (IDWriteFont.IsSymbolFont)
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if the font is a symbol font; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefont-issymbolfont
     */
    IsSymbolFont() {
        result := ComCall(7, this, BOOL)
        return result
    }

    /**
     * Gets a localized strings collection containing the face names for the font (such as Regular or Bold), indexed by locale name.
     * @returns {IDWriteLocalizedStrings} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritelocalizedstrings">IDWriteLocalizedStrings</a>**</b>
     * 
     * When this method returns, contains an address to a  pointer to the newly created localized strings object.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefont-getfacenames
     */
    GetFaceNames() {
        result := ComCall(8, this, "ptr*", &names := 0, "HRESULT")
        return IDWriteLocalizedStrings(names)
    }

    /**
     * Gets a localized strings collection containing the specified informational strings, indexed by locale name.
     * @remarks
     * If the font does not contain the string specified by <i>informationalStringID</i>, the return value is <b>S_OK</b> but 
     *      <i>informationalStrings</i> receives a <b>NULL</b> pointer and <i>exists</i> receives the value <b>FALSE</b>.
     * @param {DWRITE_INFORMATIONAL_STRING_ID} informationalStringID Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_informational_string_id">DWRITE_INFORMATIONAL_STRING_ID</a></b>
     * 
     * A value that identifies the  informational string to get. For example, <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_informational_string_id">DWRITE_INFORMATIONAL_STRING_DESCRIPTION</a> specifies a string that contains a description of the font.
     * @param {Pointer<IDWriteLocalizedStrings>} informationalStrings Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritelocalizedstrings">IDWriteLocalizedStrings</a>**</b>
     * 
     * When this method returns, contains an address of a pointer to the newly created localized strings object.
     * @param {Pointer<BOOL>} exists Type: <b>BOOL*</b>
     * 
     * When this method returns, <b>TRUE</b> if the font contains the specified string ID; otherwise, <b>FALSE</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefont-getinformationalstrings
     */
    GetInformationalStrings(informationalStringID, informationalStrings, exists) {
        existsMarshal := exists is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, DWRITE_INFORMATIONAL_STRING_ID, informationalStringID, IDWriteLocalizedStrings.Ptr, informationalStrings, existsMarshal, exists, "HRESULT")
        return result
    }

    /**
     * Gets a value that indicates what simulations are applied to the specified font.
     * @returns {DWRITE_FONT_SIMULATIONS} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_simulations">DWRITE_FONT_SIMULATIONS</a></b>
     * 
     *  A value that indicates one or more of the  types of simulations (none, bold, or oblique)  applied to the specified font.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefont-getsimulations
     */
    GetSimulations() {
        result := ComCall(10, this, DWRITE_FONT_SIMULATIONS)
        return result
    }

    /**
     * Obtains design units and common metrics for the font face. These metrics are applicable to all the glyphs within a font face and are used by applications for layout calculations. (IDWriteFont.GetMetrics)
     * @param {Pointer<DWRITE_FONT_METRICS>} fontMetrics Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_font_metrics">DWRITE_FONT_METRICS</a>*</b>
     * 
     * When this method returns, contains a structure that has font metrics for the current font face. The metrics returned by this function are in font design units.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefont-getmetrics
     */
    GetMetrics(fontMetrics) {
        ComCall(11, this, DWRITE_FONT_METRICS.Ptr, fontMetrics)
    }

    /**
     * Determines whether the font supports a specified character.
     * @param {Integer} unicodeValue Type: <b>UINT32</b>
     * 
     * A Unicode (UCS-4) character value for the method to inspect.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * When this method returns, <b>TRUE</b> if the font supports the specified character; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefont-hascharacter
     */
    HasCharacter(unicodeValue) {
        result := ComCall(12, this, "uint", unicodeValue, BOOL.Ptr, &exists := 0, "HRESULT")
        return exists
    }

    /**
     * Creates a font face object for the font. (IDWriteFont.CreateFontFace)
     * @returns {IDWriteFontFace} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontface">IDWriteFontFace</a>**</b>
     * 
     * When this method returns, contains an address of a pointer to the newly created font face object.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefont-createfontface
     */
    CreateFontFace() {
        result := ComCall(13, this, "ptr*", &fontFace := 0, "HRESULT")
        return IDWriteFontFace(fontFace)
    }

    Query(iid) {
        if (IDWriteFont.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFontFamily := CallbackCreate(GetMethod(implObj, "GetFontFamily"), flags, 2)
        this.vtbl.GetWeight := CallbackCreate(GetMethod(implObj, "GetWeight"), flags, 1)
        this.vtbl.GetStretch := CallbackCreate(GetMethod(implObj, "GetStretch"), flags, 1)
        this.vtbl.GetStyle := CallbackCreate(GetMethod(implObj, "GetStyle"), flags, 1)
        this.vtbl.IsSymbolFont := CallbackCreate(GetMethod(implObj, "IsSymbolFont"), flags, 1)
        this.vtbl.GetFaceNames := CallbackCreate(GetMethod(implObj, "GetFaceNames"), flags, 2)
        this.vtbl.GetInformationalStrings := CallbackCreate(GetMethod(implObj, "GetInformationalStrings"), flags, 4)
        this.vtbl.GetSimulations := CallbackCreate(GetMethod(implObj, "GetSimulations"), flags, 1)
        this.vtbl.GetMetrics := CallbackCreate(GetMethod(implObj, "GetMetrics"), flags, 2)
        this.vtbl.HasCharacter := CallbackCreate(GetMethod(implObj, "HasCharacter"), flags, 3)
        this.vtbl.CreateFontFace := CallbackCreate(GetMethod(implObj, "CreateFontFace"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFontFamily)
        CallbackFree(this.vtbl.GetWeight)
        CallbackFree(this.vtbl.GetStretch)
        CallbackFree(this.vtbl.GetStyle)
        CallbackFree(this.vtbl.IsSymbolFont)
        CallbackFree(this.vtbl.GetFaceNames)
        CallbackFree(this.vtbl.GetInformationalStrings)
        CallbackFree(this.vtbl.GetSimulations)
        CallbackFree(this.vtbl.GetMetrics)
        CallbackFree(this.vtbl.HasCharacter)
        CallbackFree(this.vtbl.CreateFontFace)
    }
}
