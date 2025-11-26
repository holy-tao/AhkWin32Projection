#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFamily.ahk
#Include .\IDWriteLocalizedStrings.ahk
#Include .\IDWriteFontFace.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a physical font in a font collection. This interface is used to create font faces from physical fonts, or to retrieve information such as font face metrics or face names from existing font faces.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritefont
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFont extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFont
     * @type {Guid}
     */
    static IID => Guid("{acd16696-8c14-4f5d-877e-fe3fc1d32737}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFontFamily", "GetWeight", "GetStretch", "GetStyle", "IsSymbolFont", "GetFaceNames", "GetInformationalStrings", "GetSimulations", "GetMetrics", "HasCharacter", "CreateFontFace"]

    /**
     * Gets the font family to which the specified font belongs.
     * @returns {IDWriteFontFamily} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontfamily">IDWriteFontFamily</a>**</b>
     * 
     * When this method returns, contains an address of a pointer to the font family object to which the specified font belongs.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefont-getfontfamily
     */
    GetFontFamily() {
        result := ComCall(3, this, "ptr*", &fontFamily := 0, "HRESULT")
        return IDWriteFontFamily(fontFamily)
    }

    /**
     * Gets the weight, or stroke thickness, of the specified font.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/dwrite/ne-dwrite-dwrite_font_weight">DWRITE_FONT_WEIGHT</a></b>
     * 
     * A value that indicates the weight for the specified font.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefont-getweight
     */
    GetWeight() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * Gets the stretch, or width, of the specified font.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/dwrite/ne-dwrite-dwrite_font_stretch">DWRITE_FONT_STRETCH</a></b>
     * 
     * A value that indicates the type of stretch, or width, applied to the specified font.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefont-getstretch
     */
    GetStretch() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * Gets the style, or slope, of the specified font.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/dwrite/ne-dwrite-dwrite_font_style">DWRITE_FONT_STYLE</a></b>
     * 
     * A value that indicates the type of style, or slope, of the specified font.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefont-getstyle
     */
    GetStyle() {
        result := ComCall(6, this, "int")
        return result
    }

    /**
     * Determines whether the font is a symbol font.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if the font is a symbol font; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefont-issymbolfont
     */
    IsSymbolFont() {
        result := ComCall(7, this, "int")
        return result
    }

    /**
     * Gets a localized strings collection containing the face names for the font (such as Regular or Bold), indexed by locale name.
     * @returns {IDWriteLocalizedStrings} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritelocalizedstrings">IDWriteLocalizedStrings</a>**</b>
     * 
     * When this method returns, contains an address to a  pointer to the newly created localized strings object.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefont-getfacenames
     */
    GetFaceNames() {
        result := ComCall(8, this, "ptr*", &names := 0, "HRESULT")
        return IDWriteLocalizedStrings(names)
    }

    /**
     * Gets a localized strings collection containing the specified informational strings, indexed by locale name.
     * @param {Integer} informationalStringID Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_informational_string_id">DWRITE_INFORMATIONAL_STRING_ID</a></b>
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefont-getinformationalstrings
     */
    GetInformationalStrings(informationalStringID, informationalStrings, exists) {
        existsMarshal := exists is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "int", informationalStringID, "ptr*", informationalStrings, existsMarshal, exists, "HRESULT")
        return result
    }

    /**
     * Gets a value that indicates what simulations are applied to the specified font.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/dwrite/ne-dwrite-dwrite_font_simulations">DWRITE_FONT_SIMULATIONS</a></b>
     * 
     *  A value that indicates one or more of the  types of simulations (none, bold, or oblique)  applied to the specified font.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefont-getsimulations
     */
    GetSimulations() {
        result := ComCall(10, this, "int")
        return result
    }

    /**
     * Obtains design units and common metrics for the font face. These metrics are applicable to all the glyphs within a font face and are used by applications for layout calculations.
     * @param {Pointer<DWRITE_FONT_METRICS>} fontMetrics Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_font_metrics">DWRITE_FONT_METRICS</a>*</b>
     * 
     * When this method returns, contains a structure that has font metrics for the current font face. The metrics returned by this function are in font design units.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefont-getmetrics
     */
    GetMetrics(fontMetrics) {
        ComCall(11, this, "ptr", fontMetrics)
    }

    /**
     * Determines whether the font supports a specified character.
     * @param {Integer} unicodeValue Type: <b>UINT32</b>
     * 
     * A Unicode (UCS-4) character value for the method to inspect.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * When this method returns, <b>TRUE</b> if the font supports the specified character; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefont-hascharacter
     */
    HasCharacter(unicodeValue) {
        result := ComCall(12, this, "uint", unicodeValue, "int*", &exists := 0, "HRESULT")
        return exists
    }

    /**
     * Creates a font face object for the font.
     * @returns {IDWriteFontFace} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontface">IDWriteFontFace</a>**</b>
     * 
     * When this method returns, contains an address of a pointer to the newly created font face object.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefont-createfontface
     */
    CreateFontFace() {
        result := ComCall(13, this, "ptr*", &fontFace := 0, "HRESULT")
        return IDWriteFontFace(fontFace)
    }
}
