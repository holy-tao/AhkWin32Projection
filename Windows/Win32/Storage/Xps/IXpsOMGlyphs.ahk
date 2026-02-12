#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\XPS_POINT.ahk
#Include .\IXpsOMFontResource.ahk
#Include .\IXpsOMBrush.ahk
#Include .\IXpsOMGlyphsEditor.ahk
#Include .\IXpsOMGlyphs.ahk
#Include .\IXpsOMVisual.ahk

/**
 * Describes the text that appears on a page.
 * @remarks
 * The code example that follows illustrates how to create an instance of  this interface.
 * 
 * 
 * ```cpp
 * 
 * IXpsOMGlyphs       *newInterface;
 * // this interface is defined outside of this example
 * //  IXpsOMFontResource *font; 
 * 
 * // Note the implicit requirement that CoInitializeEx 
 * //  has previously been called from this thread.
 * 
 * hr = CoCreateInstance(
 *     __uuidof(XpsOMObjectFactory),
 *     NULL,
 *     CLSCTX_INPROC_SERVER,
 *     _uuidof(IXpsOMObjectFactory),
 *     reinterpret_cast<LPVOID*>(&xpsFactory)
 *     );
 * 
 * if (SUCCEEDED(hr))
 * {
 *     hr = xpsFactory->CreateGlyphs (font, &newInterface);
 *     if (SUCCEEDED(hr))
 *     {
 *         // use newInterface
 * 
 *         newInterface->Release();
 *     }
 *     xpsFactory->Release();
 * }
 * else
 * {
 *     // evaluate HRESULT error returned in hr
 * }
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nn-xpsobjectmodel-ixpsomglyphs
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMGlyphs extends IXpsOMVisual{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMGlyphs
     * @type {Guid}
     */
    static IID => Guid("{819b3199-0a5a-4b64-bec7-a9e17e780de2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 30

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetUnicodeString", "GetGlyphIndexCount", "GetGlyphIndices", "GetGlyphMappingCount", "GetGlyphMappings", "GetProhibitedCaretStopCount", "GetProhibitedCaretStops", "GetBidiLevel", "GetIsSideways", "GetDeviceFontName", "GetStyleSimulations", "SetStyleSimulations", "GetOrigin", "SetOrigin", "GetFontRenderingEmSize", "SetFontRenderingEmSize", "GetFontResource", "SetFontResource", "GetFontFaceIndex", "SetFontFaceIndex", "GetFillBrush", "GetFillBrushLocal", "SetFillBrushLocal", "GetFillBrushLookup", "SetFillBrushLookup", "GetGlyphsEditor", "Clone"]

    /**
     * Gets the text in unescaped UTF-16 scalar values. (IXpsOMGlyphs.GetUnicodeString)
     * @remarks
     * This method allocates the memory that is used by the string returned in <i>unicodeString</i>.  If <i>unicodeString</i> is not <b>NULL</b>, use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function  to free the memory.
     * @returns {PWSTR} The UTF-16 Unicode string of the text to be displayed. If the string is empty, a <b>NULL</b> pointer is returned.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getunicodestring
     */
    GetUnicodeString() {
        result := ComCall(30, this, "ptr*", &unicodeString := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return unicodeString
    }

    /**
     * Gets the number of Glyph indices.
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getglyphindices">GetGlyphIndices</a> gets the glyph indices.
     * @returns {Integer} The number of glyph  indices.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getglyphindexcount
     */
    GetGlyphIndexCount() {
        result := ComCall(31, this, "uint*", &indexCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return indexCount
    }

    /**
     * Gets an array of XPS_GLYPH_INDEX structures that describe the specific glyph indices in the font. (IXpsOMGlyphs.GetGlyphIndices)
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getglyphindexcount">GetGlyphIndexCount</a> gets the number of elements in the glyph index array.
     * 
     * The glyph indices override the default <b>cmap</b> mapping from the <b>UnicodeString</b> to the glyph index. The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_glyph_index">XPS_GLYPH_INDEX</a> structure also contains advance width as well as vertical and horizontal offset information.
     * @param {Pointer<Integer>} indexCount The number of <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_glyph_index">XPS_GLYPH_INDEX</a> structures that will fit in  the array that is referenced by <i>glyphIndices</i>. When the method returns, <i>indexCount</i>  will contain the number of <b>XPS_GLYPH_INDEX</b> structures that are returned in the array referenced by <i>glyphIndices</i>.
     * @param {Pointer<XPS_GLYPH_INDEX>} glyphIndices The address of an array of <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_glyph_index">XPS_GLYPH_INDEX</a> structures that receive the glyph indices.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>indexCount</i> or <i>glyphIndices</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>glyphIndices</i> is not large enough to receive the glyph index data. <i>indexCount</i> contains the required number of elements.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getglyphindices
     */
    GetGlyphIndices(indexCount, glyphIndices) {
        indexCountMarshal := indexCount is VarRef ? "uint*" : "ptr"

        result := ComCall(32, this, indexCountMarshal, indexCount, "ptr", glyphIndices, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the number of glyph mappings. (IXpsOMGlyphs.GetGlyphMappingCount)
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getglyphmappings">GetGlyphMappings</a> gets the glyph mappings.
     * @returns {Integer} The number of glyph mappings.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getglyphmappingcount
     */
    GetGlyphMappingCount() {
        result := ComCall(33, this, "uint*", &glyphMappingCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return glyphMappingCount
    }

    /**
     * Gets an array of XPS_GLYPH_MAPPING structures that describe how to map UTF-16 scalar values to entries in the array of XPS_GLYPH_INDEX structures, which is returned by GetGlyphIndices. (IXpsOMGlyphs.GetGlyphMappings)
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getglyphmappingcount">GetGlyphMappingCount</a> gets the number of glyph mappings.
     * @param {Pointer<Integer>} glyphMappingCount The number of <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_glyph_mapping">XPS_GLYPH_MAPPING</a> structures that will fit in the array referenced by <i>glyphMappings</i>. When the method returns, <i>glyphMappingCount</i> contains the number of values returned in the array referenced by <i>glyphMappings</i>.
     * @param {Pointer<XPS_GLYPH_MAPPING>} glyphMappings An array of <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_glyph_mapping">XPS_GLYPH_MAPPING</a> structures that contain the glyph mapping values.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>glyphMappingCount</i>, <i>glyphMappings</i>, or both are <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>glyphMappings</i> is not large enough to receive the glyph index data. <i>glyphMappingCount</i> contains the required number of elements.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getglyphmappings
     */
    GetGlyphMappings(glyphMappingCount, glyphMappings) {
        glyphMappingCountMarshal := glyphMappingCount is VarRef ? "uint*" : "ptr"

        result := ComCall(34, this, glyphMappingCountMarshal, glyphMappingCount, "ptr", glyphMappings, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the number of prohibited caret stops. (IXpsOMGlyphs.GetProhibitedCaretStopCount)
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getprohibitedcaretstops">GetProhibitedCaretStops</a> gets the prohibited caret stops.
     * 
     * Each caret stop index corresponds to the scalar values of a UTF-16  <b>UnicodeString</b> property.  Index 0 represents the location just before the first UTF-16 scalar value of <b>UnicodeString</b>; index 1 represents the location between the first and second UTF-16 scalar values, and so on. There is an additional index at the end of <b>UnicodeString</b>. Any unspecified index is a valid caret stop location.
     * @returns {Integer} The number of prohibited caret stops.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getprohibitedcaretstopcount
     */
    GetProhibitedCaretStopCount() {
        result := ComCall(35, this, "uint*", &prohibitedCaretStopCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return prohibitedCaretStopCount
    }

    /**
     * Gets an array of prohibited caret stop locations. (IXpsOMGlyphs.GetProhibitedCaretStops)
     * @remarks
     * Each caret stop index corresponds to the scalar values of a UTF-16  <b>UnicodeString</b> property.  Index 0 represents the location just before the first UTF-16 scalar value of <b>UnicodeString</b>; index 1 represents the location between the first and second UTF-16 scalar values, and so on. There is an additional index at the end of <b>UnicodeString</b>. Any unspecified index is a valid caret stop location.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getprohibitedcaretstopcount">GetProhibitedCaretStopCount</a> gets the number of prohibited caret stops.
     * 
     * A caret stop is the index of the UTF-16 code point in the <b>UnicodeString</b> property of the glyph.
     * @param {Pointer<Integer>} prohibitedCaretStopCount The number of prohibited caret stop locations that will fit in the array referenced by <i>prohibitedCaretStops</i>. When the method returns, <i>prohibitedCaretStopCount</i> will contain the number of values returned in the array referenced by <i>prohibitedCaretStops</i>.
     * @returns {Integer} An array of prohibited caret stop locations; if such are not defined, a <b>NULL</b> pointer is returned.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getprohibitedcaretstops
     */
    GetProhibitedCaretStops(prohibitedCaretStopCount) {
        prohibitedCaretStopCountMarshal := prohibitedCaretStopCount is VarRef ? "uint*" : "ptr"

        result := ComCall(36, this, prohibitedCaretStopCountMarshal, prohibitedCaretStopCount, "uint*", &prohibitedCaretStops := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return prohibitedCaretStops
    }

    /**
     * Gets the level of bidirectional text.
     * @remarks
     * The bidirectional text level, or <b>BidiLevel</b>,  specifies the nesting level of the Unicode bidirectional algorithm. Even values imply the left-to-right layout and odd values the right-to-left layout, which places the run origin on the right side of the first glyph. Advance widths that are positive     will move to the left, allowing subsequent glyphs to be placed to the left of the previous glyph.
     * 
     * The range of allowed values for this property is between 0 and 61, inclusive, and the default value is 0.
     * @returns {Integer} The level of bidirectional text.
     * 
     * Range: 0–61
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getbidilevel
     */
    GetBidiLevel() {
        result := ComCall(37, this, "uint*", &bidiLevel := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return bidiLevel
    }

    /**
     * Gets a Boolean value that indicates whether the text is to be rendered with the glyphs rotated sideways. (IXpsOMGlyphs.GetIsSideways)
     * @remarks
     * The default value for this property is <b>FALSE</b>.
     * @returns {BOOL} The Boolean value that indicates whether the text is to be rendered with the glyphs rotated sideways. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b><b>TRUE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Render the glyphs sideways to produce sideways text.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not render the glyphs sideways to produce normal text.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getissideways
     */
    GetIsSideways() {
        result := ComCall(38, this, "int*", &isSideways := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isSideways
    }

    /**
     * Gets the name of the device font. (IXpsOMGlyphs.GetDeviceFontName)
     * @remarks
     * The device font name uniquely identifies a specific device font and is typically defined by a hardware vendor or font vendor.
     * 
     * The escaped version of the device font name is created when the object is serialized.
     * 
     * This method allocates the memory used by the string that is returned in <i>deviceFontName</i>.  If <i>deviceFontName</i> is not <b>NULL</b>, use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function  to free the memory.
     * @returns {PWSTR} The string that contains the unescaped name of the  device font. If the name has not been set, a <b>NULL</b> pointer will be returned.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getdevicefontname
     */
    GetDeviceFontName() {
        result := ComCall(39, this, "ptr*", &deviceFontName := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return deviceFontName
    }

    /**
     * Gets the style simulations that will be applied when rendering the glyphs.
     * @returns {Integer} The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_style_simulation">XPS_STYLE_SIMULATION</a> value that describes the style simulations to be applied.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getstylesimulations
     */
    GetStyleSimulations() {
        result := ComCall(40, this, "int*", &styleSimulations := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return styleSimulations
    }

    /**
     * Sets the style simulations that will be applied when the glyphs are rendered.
     * @param {Integer} styleSimulations The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_style_simulation">XPS_STYLE_SIMULATION</a> value that specifies the style simulation to be applied.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>styleSimulations</i> is not a valid <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_style_simulation">XPS_STYLE_SIMULATION</a> value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setstylesimulations
     */
    SetStyleSimulations(styleSimulations) {
        result := ComCall(41, this, "int", styleSimulations, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the starting position of the text.
     * @remarks
     * In the units of the effective coordinate space, the origin specifies the x and y coordinates of the first glyph in the run. The glyph is placed such that its baseline and the leading edge of its advance vector intersect with the point defined by <i>origin.x</i> and <i>origin.y</i>.
     * @returns {XPS_POINT} The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_point">XPS_POINT</a> structure that receives the starting position of the text.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getorigin
     */
    GetOrigin() {
        origin := XPS_POINT()
        result := ComCall(42, this, "ptr", origin, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return origin
    }

    /**
     * Sets the starting position of the text.
     * @remarks
     * In the units of the effective coordinate space, the origin specifies the x and y coordinates of the first glyph in the run. The glyph is placed such that its baseline and the leading edge of its advance vector intersect with the point defined by <i>origin.x</i> and <i>origin.y</i>.
     * @param {Pointer<XPS_POINT>} origin The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_point">XPS_POINT</a> structure that contains the coordinates to be set as the text's starting position.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>origin</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>origin.x</i> or <i>origin.y</i> refers to a floating-point value that is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setorigin
     */
    SetOrigin(origin) {
        result := ComCall(43, this, "ptr", origin, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the font size. (IXpsOMGlyphs.GetFontRenderingEmSize)
     * @remarks
     * The em size that is returned in <i>fontRenderingEmSize</i> specifies the font size in the drawing surface units. The drawing surface units are expressed as floating-point values in the effective coordinate space.
     * 
     * In new glyph objects, the default value of <i>fontRenderingEmSize</i> is 10.0.
     * 
     * If the value of <i>fontRenderingEmSize</i> is 0.0, no text is displayed.
     * @returns {Float} The  font size.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getfontrenderingemsize
     */
    GetFontRenderingEmSize() {
        result := ComCall(44, this, "float*", &fontRenderingEmSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return fontRenderingEmSize
    }

    /**
     * Sets the font size of the text.
     * @remarks
     * The em size returned in <i>fontRenderingEmSize</i> specifies the font size in  drawing surface units. Drawing surface units are expressed as floating-point values in the units of the effective coordinate space.
     * 
     * In new glyph objects, the default value of <i>fontRenderingEmSize</i> is 10.0.
     * 
     * If the value of <i>fontRenderingEmSize</i> is 0.0, no text is displayed.
     * 
     * A value of 0.0 results in no visible text being displayed.
     * @param {Float} fontRenderingEmSize The  font size.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of <i>fontRenderingEmSize</i> is not valid; it must be a non-negative number.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfontrenderingemsize
     */
    SetFontRenderingEmSize(fontRenderingEmSize) {
        result := ComCall(45, this, "float", fontRenderingEmSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets a pointer to the IXpsOMFontResource interface of the font resource object required for this text.
     * @remarks
     * After loading and parsing the resource into the XPS OM, this method might return an error that applies to another resource. This occurs because all of the relationships are parsed when a resource is loaded.
     * @returns {IXpsOMFontResource} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomfontresource">IXpsOMFontResource</a> interface of the font resource.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getfontresource
     */
    GetFontResource() {
        result := ComCall(46, this, "ptr*", &fontResource := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXpsOMFontResource(fontResource)
    }

    /**
     * Sets the pointer to the IXpsOMFontResource interface of the font resource object that is required for this text.
     * @remarks
     * <i>fontResource</i> must not be a <b>NULL</b> pointer; a glyph object must have a font resource.
     * @param {IXpsOMFontResource} fontResource The pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomfontresource">IXpsOMFontResource</a> interface to be used.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>fontResource</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_NO_CUSTOM_OBJECTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>fontResource</i> does not point to a recognized interface implementation. Custom implementation of XPS Document API interfaces is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfontresource
     */
    SetFontResource(fontResource) {
        result := ComCall(47, this, "ptr", fontResource, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the index of the font face to be used.
     * @remarks
     * The font resource is obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getfontresource">GetFontResource</a> method.
     * 
     * If a font face has not been set or is not supported by the font, a value of –1 is returned in <i>fontFaceIndex</i>. When the glyph is loaded from an existing XPS document file, a <i>fontFaceIndex</i> value of –1 indicates that the <b>FontUri</b> attribute did not include a <b>#index</b> fragment.
     * 
     * In the following markup of a FixedPage, the <b>FontUri</b> attribute of the <b>Glyphs</b> element has a value of <c>../Resources/Fonts/Font.TTF#1</c>. In this case, <b>GetFontFaceIndex</b>  would return a value of 1 in <i>fontFaceIndex</i>.
     * 
     * 
     * ``` syntax
     *     &lt;FixedPage Height="1056" Width="816" xml:lang="en-US"
     *     xmlns="http://schemas.microsoft.com/xps/2005/06"&gt;
     *       &lt;Glyphs
     *       OriginX="96"
     *       OriginY="96"
     *       UnicodeString="This is Page 1!"
     *       FontUri="../Resources/Fonts/Font.TTF#1"
     *       FontRenderingEmSize="16" /&gt;
     *     &lt;/FixedPage&gt;
     * ```
     * @returns {Integer} The index value of the font face. If the font face has not been set, –1 is returned.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getfontfaceindex
     */
    GetFontFaceIndex() {
        result := ComCall(48, this, "short*", &fontFaceIndex := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return fontFaceIndex
    }

    /**
     * Sets the index of the font face to be used.
     * @remarks
     * The default value of the font face index property is –1, which means that a font index has not been set or the font resource is not a  <b>TrueType</b> font collection.
     * 
     * If this value is specified and is not –1, "#&lt;Index&gt;" is appended to the Font URI during serialization. Here, &lt;Index&gt; is the value that is set by <b>SetFontFaceIndex</b>.
     * 
     * The following markup of a FixedPage shows the result of setting the <i>fontFaceIndex</i> to 1. Notice that the <b>FontUri</b> attribute of the <b>Glyphs</b> element has a value of <c>../Resources/Fonts/Font.TTF#1</c>, which includes the index of the font face.
     * 
     * 
     * ``` syntax
     *     &lt;FixedPage Height="1056" Width="816" xml:lang="en-US"
     *     xmlns="http://schemas.microsoft.com/xps/2005/06"&gt;
     *       &lt;Glyphs
     *       OriginX="96"
     *       OriginY="96"
     *       UnicodeString="This is Page 1!"
     *       FontUri="../Resources/Fonts/Font.TTF#1"
     *       FontRenderingEmSize="16" /&gt;
     *     &lt;/FixedPage&gt;
     * ```
     * @param {Integer} fontFaceIndex The index value of the font face to be used.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of <i>fontFaceIndex</i> is not valid; it must be an integer that is greater than or equal to –1.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfontfaceindex
     */
    SetFontFaceIndex(fontFaceIndex) {
        result := ComCall(49, this, "short", fontFaceIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets a pointer to the resolved IXpsOMBrush interface of the fill brush to be used for the text.
     * @remarks
     * The fill brush is  used to fill the shape of the rendered glyphs.
     * @returns {IXpsOMBrush} A pointer to the resolved <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsombrush">IXpsOMBrush</a> interface of the fill brush to be used for the text. If a fill brush has not been set, a <b>NULL</b> pointer will be returned.
     * 
     * The value that is returned in this parameter depends on which method has most recently been called to set the brush.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Object that is returned in <i>fillBrush</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfillbrushlocal">SetFillBrushLocal</a>
     * 
     * 
     * </td>
     * <td>
     * The local brush that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfillbrushlocal">SetFillBrushLocal</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfillbrushlookup">SetFillBrushLookup</a>
     * 
     * 
     * </td>
     * <td>
     * The shared brush retrieved, with a lookup key that matches the key that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfillbrushlookup">SetFillBrushLookup</a>, from the local or resource directory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfillbrushlocal">SetFillBrushLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfillbrushlookup">SetFillBrushLookup</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getfillbrush
     */
    GetFillBrush() {
        result := ComCall(50, this, "ptr*", &fillBrush := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXpsOMBrush(fillBrush)
    }

    /**
     * Gets a pointer to the local, unshared IXpsOMBrush interface of the fill brush to be used for the text.
     * @returns {IXpsOMBrush} A pointer to the local, unshared <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsombrush">IXpsOMBrush</a> interface of the  fill brush to be used for the text. If a fill brush lookup key has been set or if a local fill brush has not been set, a <b>NULL</b> pointer will be returned.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Object that is returned in <i>fillBrush</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfillbrushlocal">SetFillBrushLocal</a>
     * 
     * 
     * </td>
     * <td>
     * The local brush that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfillbrushlocal">SetFillBrushLocal</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfillbrushlookup">SetFillBrushLookup</a>
     * 
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfillbrushlocal">SetFillBrushLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfillbrushlookup">SetFillBrushLookup</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getfillbrushlocal
     */
    GetFillBrushLocal() {
        result := ComCall(51, this, "ptr*", &fillBrush := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXpsOMBrush(fillBrush)
    }

    /**
     * Sets the IXpsOMBrush interface pointer to a local, unshared fill brush.
     * @remarks
     * After you call <b>SetFillBrushLocal</b>, the fill brush lookup key is released and <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getfillbrushlookup">GetFillBrushLookup</a> returns a <b>NULL</b> pointer in the <i>key</i> parameter. The table that follows explains the relationship between the local and lookup values of this property.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Object that is returned in <i>fillBrush</i> by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getfillbrush">GetFillBrush</a>
     * </th>
     * <th>Object that is returned in <i>fillBrush</i>   by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getfillbrushlocal">GetFillBrushLocal</a>
     * </th>
     * <th>String that is returned  in <i>key</i> by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getfillbrushlookup">GetFillBrushLookup</a>
     * </th>
     * </tr>
     * <tr>
     * <td>
     * <b>SetFillBrushLocal</b> (this method)
     * 
     * </td>
     * <td>
     * The local brush that is set by <b>SetFillBrushLocal</b>.
     * 
     * </td>
     * <td>
     * The local brush that is set by <b>SetFillBrushLocal</b>.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfillbrushlookup">SetFillBrushLookup</a>
     * 
     * 
     * </td>
     * <td>
     * The shared brush that gets retrieved, with a lookup key matching the key that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfillbrushlookup">SetFillBrushLookup</a>, from the resource directory.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * <td>
     * The lookup key that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfillbrushlookup">SetFillBrushLookup</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Neither <b>SetFillBrushLocal</b> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfillbrushlookup">SetFillBrushLookup</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {IXpsOMBrush} fillBrush The <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsombrush">IXpsOMBrush</a> interface pointer  to be set as the local, unshared fill brush. A <b>NULL</b> pointer releases any previously assigned brushes.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_NO_CUSTOM_OBJECTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>fillBrush</i> does not point to a recognized interface implementation. Custom implementation of XPS Document API interfaces is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfillbrushlocal
     */
    SetFillBrushLocal(fillBrush) {
        result := ComCall(52, this, "ptr", fillBrush, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the lookup key of the IXpsOMBrush interface that is stored in a resource dictionary and will be used as the fill brush.
     * @remarks
     * This method allocates the memory that is used by the string returned in <i>key</i>.  If <i>key</i> is not <b>NULL</b>, use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function  to free the memory.
     * @returns {PWSTR} The lookup key for the brush that is stored in a resource dictionary and will be used as the fill brush. If a fill brush lookup key has not been set or if a local fill brush has been set, a <b>NULL</b> pointer will be returned.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>String that is returned in <i>key</i></th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfillbrushlocal">SetFillBrushLocal</a>
     * 
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfillbrushlookup">SetFillBrushLookup</a>
     * 
     * 
     * </td>
     * <td>
     * The lookup key that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfillbrushlookup">SetFillBrushLookup</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfillbrushlocal">SetFillBrushLocal</a> nor <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfillbrushlookup">SetFillBrushLookup</a> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getfillbrushlookup
     */
    GetFillBrushLookup() {
        result := ComCall(53, this, "ptr*", &key := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return key
    }

    /**
     * Sets the lookup key name of a shared fill brush.
     * @remarks
     * After you call <b>SetFillBrushLookup</b>, the local fill brush is released and <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getfillbrushlocal">GetFillBrushLocal</a> returns a <b>NULL</b> pointer in the <i>fillBrush</i> parameter. The table that follows explains the relationship between the local and lookup values of this property.
     * 
     * <table>
     * <tr>
     * <th>Most recent method called</th>
     * <th>Object that is returned in <i>fillBrush</i> by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getfillbrush">GetFillBrush</a>
     * </th>
     * <th>Object that is returned in <i>fillBrush</i>   by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getfillbrushlocal">GetFillBrushLocal</a>
     * </th>
     * <th>String that is returned in <i>key</i> by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getfillbrushlookup">GetFillBrushLookup</a>
     * </th>
     * </tr>
     * <tr>
     * <td>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfillbrushlocal">SetFillBrushLocal</a>
     * 
     * 
     * </td>
     * <td>
     * The local brush that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfillbrushlocal">SetFillBrushLocal</a>.
     * 
     * </td>
     * <td>
     * The local brush that is set by <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfillbrushlocal">SetFillBrushLocal</a>.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>SetFillBrushLookup</b> (this method)
     * 
     * </td>
     * <td>
     * The shared brush that gets retrieved, with a lookup key matching the key that is set by <b>SetFillBrushLookup</b>, from the resource directory.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * <td>
     * The lookup key that is set by <b>SetFillBrushLookup</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Neither <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfillbrushlocal">SetFillBrushLocal</a> nor <b>SetFillBrushLookup</b> has been called yet.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * <td>
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} key A string variable that contains the key name of the fill brush that is stored in the resource dictionary and will be used as the shared fill brush. A <b>NULL</b> pointer clears any previously assigned key string.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_INVALID_RESOURCE_KEY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * According to the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>, the value of <i>lookup</i> is not a valid lookup key string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_INVALID_LOOKUP_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The lookup key name in <i>key</i> references an object that is not a geometry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_LOOKUP_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No object could be found with a key name that matched the value passed in <i>key</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-setfillbrushlookup
     */
    SetFillBrushLookup(key) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(54, this, "ptr", key, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets a pointer to the IXpsOMGlyphsEditor interface that will be used to edit the glyphs in the object.
     * @remarks
     * An <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomglyphseditor">IXpsOMGlyphsEditor</a>  interface is required to edit the read-only properties of the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomglyphs">IXpsOMGlyphs</a> interface.
     * @returns {IXpsOMGlyphsEditor} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomglyphseditor">IXpsOMGlyphsEditor</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-getglyphseditor
     */
    GetGlyphsEditor() {
        result := ComCall(55, this, "ptr*", &editor := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXpsOMGlyphsEditor(editor)
    }

    /**
     * Makes a deep copy of the interface. (IXpsOMGlyphs.Clone)
     * @remarks
     * This method does not update any of the resource pointers in the copy of the interface.
     * @returns {IXpsOMGlyphs} A pointer to the copy of the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphs-clone
     */
    Clone() {
        result := ComCall(56, this, "ptr*", &glyphs := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXpsOMGlyphs(glyphs)
    }
}
