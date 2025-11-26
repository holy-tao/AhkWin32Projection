#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFaceReference.ahk
#Include .\IDWriteLocalizedStrings.ahk
#Include .\IDWriteFontFace2.ahk

/**
 * Contains font face type, appropriate file references, and face identification data.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefontface3
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontFace3 extends IDWriteFontFace2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontFace3
     * @type {Guid}
     */
    static IID => Guid("{d37d7598-09be-4222-a236-2081341cc1f2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 35

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFontFaceReference", "GetPanose", "GetWeight", "GetStretch", "GetStyle", "GetFamilyNames", "GetFaceNames", "GetInformationalStrings", "HasCharacter", "GetRecommendedRenderingMode", "IsCharacterLocal", "IsGlyphLocal", "AreCharactersLocal", "AreGlyphsLocal"]

    /**
     * Gets a font face reference that identifies this font.
     * @returns {IDWriteFontFaceReference} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontfacereference">IDWriteFontFaceReference</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontfacereference">IDWriteFontFaceReference</a> interface for the newly created font face reference object.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontface3-getfontfacereference
     */
    GetFontFaceReference() {
        result := ComCall(35, this, "ptr*", &fontFaceReference := 0, "HRESULT")
        return IDWriteFontFaceReference(fontFaceReference)
    }

    /**
     * Gets the PANOSE values from the font, used for font selection and matching.
     * @remarks
     * 
     * This method doesn't simulate these values, such as substituting a weight or proportion inferred on other values. If the font doesn't specify them, they are all set to 'any' (0).
     * 
     * 
     * @param {Pointer<DWRITE_PANOSE>} panose Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_panose">DWRITE_PANOSE</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_panose">DWRITE_PANOSE</a> structure that receives the PANOSE values from the font.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontface3-getpanose
     */
    GetPanose(panose) {
        ComCall(36, this, "ptr", panose)
    }

    /**
     * Gets the weight of this font.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/dwrite/ne-dwrite-dwrite_font_weight">DWRITE_FONT_WEIGHT</a></b>
     * 
     * Returns a <a href="/windows/win32/api/dwrite/ne-dwrite-dwrite_font_weight">DWRITE_FONT_WEIGHT</a>-typed value that specifies the density of a typeface, in terms of the lightness or heaviness of the strokes.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontface3-getweight
     */
    GetWeight() {
        result := ComCall(37, this, "int")
        return result
    }

    /**
     * Gets the stretch (also known as width) of this font.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/dwrite/ne-dwrite-dwrite_font_stretch">DWRITE_FONT_STRETCH</a></b>
     * 
     * Returns a <a href="/windows/win32/api/dwrite/ne-dwrite-dwrite_font_stretch">DWRITE_FONT_STRETCH</a>-typed value that specifies the degree to which a font has been stretched compared to a font's normal aspect ratio.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontface3-getstretch
     */
    GetStretch() {
        result := ComCall(38, this, "int")
        return result
    }

    /**
     * Gets the style (also known as slope) of this font.
     * @returns {Integer} Type: <b><a href="/windows/win32/api/dwrite/ne-dwrite-dwrite_font_style">DWRITE_FONT_STYLE</a></b>
     * 
     * Returns a <a href="/windows/win32/api/dwrite/ne-dwrite-dwrite_font_style">DWRITE_FONT_STYLE</a>-typed value that specifies the style of the font.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontface3-getstyle
     */
    GetStyle() {
        result := ComCall(39, this, "int")
        return result
    }

    /**
     * Creates a localized strings object that contains the family names for the font family, indexed by locale name.
     * @returns {IDWriteLocalizedStrings} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritelocalizedstrings">IDWriteLocalizedStrings</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritelocalizedstrings">IDWriteLocalizedStrings</a> interface for the newly created localized strings object.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontface3-getfamilynames
     */
    GetFamilyNames() {
        result := ComCall(40, this, "ptr*", &names := 0, "HRESULT")
        return IDWriteLocalizedStrings(names)
    }

    /**
     * Creates a localized strings object that contains the face names for the font (for example, Regular or Bold), indexed by locale name.
     * @returns {IDWriteLocalizedStrings} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritelocalizedstrings">IDWriteLocalizedStrings</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritelocalizedstrings">IDWriteLocalizedStrings</a> interface for the newly created localized strings object.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontface3-getfacenames
     */
    GetFaceNames() {
        result := ComCall(41, this, "ptr*", &names := 0, "HRESULT")
        return IDWriteLocalizedStrings(names)
    }

    /**
     * Gets a localized strings collection that contains the specified informational strings, indexed by locale name.
     * @param {Integer} informationalStringID Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_informational_string_id">DWRITE_INFORMATIONAL_STRING_ID</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_informational_string_id">DWRITE_INFORMATIONAL_STRING_ID</a>-typed value that identifies the strings to get.
     * @param {Pointer<IDWriteLocalizedStrings>} informationalStrings Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritelocalizedstrings">IDWriteLocalizedStrings</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritelocalizedstrings">IDWriteLocalizedStrings</a> interface for the newly created localized strings object.
     * @param {Pointer<BOOL>} exists Type: <b>BOOL*</b>
     * 
     * A pointer to a variable that receives whether the font contains the specified string ID. <b>TRUE</b> if the font contains the specified string ID; otherwise, <b>FALSE</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the font doesn't contain the specified string, the return value is S_OK, but <i>informationalStrings</i> receives a <b>NULL</b> pointer and <i>exists</i> receives the value <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontface3-getinformationalstrings
     */
    GetInformationalStrings(informationalStringID, informationalStrings, exists) {
        existsMarshal := exists is VarRef ? "int*" : "ptr"

        result := ComCall(42, this, "int", informationalStringID, "ptr*", informationalStrings, existsMarshal, exists, "HRESULT")
        return result
    }

    /**
     * Determines whether the font supports the specified character.
     * @param {Integer} unicodeValue Type: <b>UINT32</b>
     * 
     * A Unicode (UCS-4) character value.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns whether the font supports the specified character. Returns <b>TRUE</b> if the font has the specified character; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontface3-hascharacter
     */
    HasCharacter(unicodeValue) {
        result := ComCall(43, this, "uint", unicodeValue, "int")
        return result
    }

    /**
     * Determines the recommended text rendering and grid-fit mode to be used based on the font, size, world transform, and measuring mode.
     * @param {Float} fontEmSize Type: <b>FLOAT</b>
     * 
     * Logical font size in DIPs.
     * @param {Float} dpiX Type: <b>FLOAT</b>
     * 
     * Number of pixels per logical inch in the horizontal direction.
     * @param {Float} dpiY Type: <b>FLOAT</b>
     * 
     * Number of pixels per logical inch in the vertical direction.
     * @param {Pointer<DWRITE_MATRIX>} transform Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix">DWRITE_MATRIX</a>*</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_matrix">DWRITE_MATRIX</a> structure that describes the world transform.
     * @param {BOOL} isSideways Type: <b>BOOL</b>
     * 
     * Specifies whether the font is sideways. <b>TRUE</b> if the font is sideways; otherwise, <b>FALSE</b>.
     * @param {Integer} outlineThreshold Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_outline_threshold">DWRITE_OUTLINE_THRESHOLD</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dwrite_1/ne-dwrite_1-dwrite_outline_threshold">DWRITE_OUTLINE_THRESHOLD</a>-typed value that specifies the quality of the graphics system's outline rendering, affects the size threshold above which outline rendering is used.
     * @param {Integer} measuringMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE</a>-typed value that specifies  the method used to measure during text layout. For proper glyph spacing, this method returns a rendering mode that is compatible with the specified measuring mode.
     * @param {IDWriteRenderingParams} renderingParams Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwriterenderingparams">IDWriteRenderingParams</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwriterenderingparams">IDWriteRenderingParams</a> interface for the rendering parameters object. This parameter is necessary in case the rendering parameters object overrides the rendering mode.
     * @param {Pointer<Integer>} renderingMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_rendering_mode1">DWRITE_RENDERING_MODE1</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_rendering_mode1">DWRITE_RENDERING_MODE1</a>-typed value for the recommended rendering mode.
     * @param {Pointer<Integer>} gridFitMode Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/ne-dwrite_2-dwrite_grid_fit_mode">DWRITE_GRID_FIT_MODE</a>*</b>
     * 
     * A pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/win32/api/dwrite_2/ne-dwrite_2-dwrite_grid_fit_mode">DWRITE_GRID_FIT_MODE</a>-typed value for the recommended grid-fit mode.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontface3-getrecommendedrenderingmode
     */
    GetRecommendedRenderingMode(fontEmSize, dpiX, dpiY, transform, isSideways, outlineThreshold, measuringMode, renderingParams, renderingMode, gridFitMode) {
        renderingModeMarshal := renderingMode is VarRef ? "int*" : "ptr"
        gridFitModeMarshal := gridFitMode is VarRef ? "int*" : "ptr"

        result := ComCall(44, this, "float", fontEmSize, "float", dpiX, "float", dpiY, "ptr", transform, "int", isSideways, "int", outlineThreshold, "int", measuringMode, "ptr", renderingParams, renderingModeMarshal, renderingMode, gridFitModeMarshal, gridFitMode, "HRESULT")
        return result
    }

    /**
     * Determines whether the character is locally downloaded from the font.
     * @param {Integer} unicodeValue Type: <b>UINT32</b>
     * 
     * A Unicode (UCS-4) character value.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns <b>TRUE</b> if the font has the specified character locally available,    
     *   <b>FALSE</b> if not or if the font does not support that character.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontface3-ischaracterlocal
     */
    IsCharacterLocal(unicodeValue) {
        result := ComCall(45, this, "uint", unicodeValue, "int")
        return result
    }

    /**
     * Determines whether the glyph is locally downloaded from the font.
     * @param {Integer} glyphId Type: <b>UINT16</b>
     * 
     * Glyph identifier.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns TRUE if the font has the specified glyph locally available.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontface3-isglyphlocal
     */
    IsGlyphLocal(glyphId) {
        result := ComCall(46, this, "ushort", glyphId, "int")
        return result
    }

    /**
     * Determines whether the specified characters are local.
     * @param {PWSTR} characters Type: <b>WCHAR</b>
     * 
     * Array of characters.
     * @param {Integer} characterCount Type: <b>UINT32</b>
     * 
     * The number of elements in the character array.
     * @param {BOOL} enqueueIfNotLocal Type: <b>BOOL</b>
     * 
     * Specifies whether to enqueue a download request    
     *        if any of the specified characters are not local.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Receives TRUE if all of the specified characters are local,    
     *        FALSE if any of the specified characters are remote.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontface3-arecharacterslocal
     */
    AreCharactersLocal(characters, characterCount, enqueueIfNotLocal) {
        characters := characters is String ? StrPtr(characters) : characters

        result := ComCall(47, this, "ptr", characters, "uint", characterCount, "int", enqueueIfNotLocal, "int*", &isLocal := 0, "HRESULT")
        return isLocal
    }

    /**
     * Determines whether the specified glyphs are local.
     * @param {Pointer<Integer>} glyphIndices Type: <b>UINT16</b>
     * 
     * Array of glyph indices.
     * @param {Integer} glyphCount Type: <b>UINT32</b>
     * 
     * The number of elements in the glyph index array.
     * @param {BOOL} enqueueIfNotLocal Type: <b>BOOL</b>
     * 
     * Specifies whether to enqueue a download request    
     *        if any of the specified glyphs are not local.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Receives TRUE if all of the specified glyphs are local,    
     *        FALSE if any of the specified glyphs are remote.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nf-dwrite_3-idwritefontface3-areglyphslocal
     */
    AreGlyphsLocal(glyphIndices, glyphCount, enqueueIfNotLocal) {
        glyphIndicesMarshal := glyphIndices is VarRef ? "ushort*" : "ptr"

        result := ComCall(48, this, glyphIndicesMarshal, glyphIndices, "uint", glyphCount, "int", enqueueIfNotLocal, "int*", &isLocal := 0, "HRESULT")
        return isLocal
    }
}
