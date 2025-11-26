#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\XPS_GLYPH_INDEX.ahk
#Include .\XPS_GLYPH_MAPPING.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Allows batch modification of properties that affect the text content in an IXpsOMGlyphs interface.
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomglyphseditor
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMGlyphsEditor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMGlyphsEditor
     * @type {Guid}
     */
    static IID => Guid("{a5ab8616-5b16-4b9f-9629-89b323ed7909}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ApplyEdits", "GetUnicodeString", "SetUnicodeString", "GetGlyphIndexCount", "GetGlyphIndices", "SetGlyphIndices", "GetGlyphMappingCount", "GetGlyphMappings", "SetGlyphMappings", "GetProhibitedCaretStopCount", "GetProhibitedCaretStops", "SetProhibitedCaretStops", "GetBidiLevel", "SetBidiLevel", "GetIsSideways", "SetIsSideways", "GetDeviceFontName", "SetDeviceFontName"]

    /**
     * Performs cross-property validation and then copies the changes to the parent IXpsOMGlyphs interface.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomglyphseditor">IXpsOMGlyphsEditor</a> interface does not belong to a valid <a href="/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomglyphs">IXpsOMGlyphs</a> interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_CARET_OUTSIDE_STRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Caret stops were specified for an empty string, or the caret jump index has exceeded the length of the Unicode string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_MAPPING_OUTSIDE_INDICES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The glyph mappings exceed the number of glyph indices.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_MAPPING_OUTSIDE_STRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Glyph mappings were defined for an empty string. If the Unicode string is empty, there must not be any glyph mappings defined.
     * 
     * or
     * 
     * The glyph mappings exceed the length of the Unicode string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_MISSING_GLYPHS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomglyphs">IXpsOMGlyphs</a> interface without a Unicode string does not have any glyph indices specified. An <b>IXpsOMGlyphs</b> interface must specify either a Unicode string or an array of glyph indices.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_ODD_BIDILEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The text string was specified as sideways and right-to-left. If the text is sideways, it cannot have a bidi level that is an odd value (right-to-left). Likewise, if the bidi level is an odd value, it cannot be sideways.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_ONE_TO_ONE_MAPPING_EXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Glyph mappings did not match the Unicode string contents.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_TOO_MANY_INDICES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *                 There were more glyph indices than Unicode code points. If there are no glyph mappings, the number of glyph indices must be less than or equal to the number of  Unicode code points.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-applyedits
     */
    ApplyEdits() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Gets the text in unescaped UTF-16 scalar values.
     * @returns {PWSTR} The UTF-16 Unicode string. If the string is empty, a <b>NULL</b> pointer is returned.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-getunicodestring
     */
    GetUnicodeString() {
        result := ComCall(4, this, "ptr*", &unicodeString := 0, "HRESULT")
        return unicodeString
    }

    /**
     * Sets the text in unescaped UTF-16 scalar values.
     * @param {PWSTR} unicodeString The address of a UTF-16 Unicode string. A <b>NULL</b> pointer clears the property.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-setunicodestring
     */
    SetUnicodeString(unicodeString) {
        unicodeString := unicodeString is String ? StrPtr(unicodeString) : unicodeString

        result := ComCall(5, this, "ptr", unicodeString, "HRESULT")
        return result
    }

    /**
     * Gets the number of glyph indices.
     * @returns {Integer} The glyph index count.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-getglyphindexcount
     */
    GetGlyphIndexCount() {
        result := ComCall(6, this, "uint*", &indexCount := 0, "HRESULT")
        return indexCount
    }

    /**
     * Gets an array of XPS_GLYPH_INDEX structures that describe the specific glyph indices in the font.
     * @param {Pointer<Integer>} indexCount The number of elements that will fit in the array referenced by the <i>glyphIndices</i> parameter. When the method returns, <i>indexCount</i> will contain the number of <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_glyph_index">XPS_GLYPH_INDEX</a> structures that are returned in the array referenced by <i>glyphIndices</i>.
     * @returns {XPS_GLYPH_INDEX} The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_glyph_index">XPS_GLYPH_INDEX</a> structure array that receives the glyph indices.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-getglyphindices
     */
    GetGlyphIndices(indexCount) {
        indexCountMarshal := indexCount is VarRef ? "uint*" : "ptr"

        glyphIndices := XPS_GLYPH_INDEX()
        result := ComCall(7, this, indexCountMarshal, indexCount, "ptr", glyphIndices, "HRESULT")
        return glyphIndices
    }

    /**
     * Sets an XPS_GLYPH_INDEX structure array that describes which glyph indices are to be used in the font.
     * @param {Integer} indexCount The number of <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_glyph_index">XPS_GLYPH_INDEX</a> structures in the array that is referenced by <i>glyphIndices</i>. The value of 0 clears the property.
     * @param {Pointer<XPS_GLYPH_INDEX>} glyphIndices An array of <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_glyph_index">XPS_GLYPH_INDEX</a> structures that contain the glyph indices. If <i>indexCount</i> is 0, this parameter is ignored.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * The <b>index</b> field of one or more <a href="/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_glyph_index">XPS_GLYPH_INDEX</a> structures has a value that  is not valid. The <b>index</b> field must have a value between and including –1 and 65535 (0xFFFF).
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
     * <i>glyphIndices</i> is <b>NULL</b> and <i>indexCount</i> is greater than 0.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_INVALID_FLOAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>advanceWidth</b>, <b>horizontalOffset</b>, or <b>verticalOffset</b>  field of one or more <a href="/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_glyph_index">XPS_GLYPH_INDEX</a> structures has a floating-point value that is not valid. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_NEGATIVE_FLOAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>advanceWidth</b> field of one or more <a href="/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_glyph_index">XPS_GLYPH_INDEX</a> structures has a value that  is not valid. The <b>advanceWidth</b> field must have a non-negative value or a value of  exactly –1.0; a negative value that is not exactly –1.0 is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-setglyphindices
     */
    SetGlyphIndices(indexCount, glyphIndices) {
        result := ComCall(8, this, "uint", indexCount, "ptr", glyphIndices, "HRESULT")
        return result
    }

    /**
     * Gets the number of glyph mappings.
     * @returns {Integer} The number of glyph mappings.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-getglyphmappingcount
     */
    GetGlyphMappingCount() {
        result := ComCall(9, this, "uint*", &glyphMappingCount := 0, "HRESULT")
        return glyphMappingCount
    }

    /**
     * Gets an array of XPS_GLYPH_MAPPING structures that describe how to map UTF-16 scalar values to entries in the array of XPS_GLYPH_INDEX structures, which is returned by GetGlyphIndices.
     * @param {Pointer<Integer>} glyphMappingCount The number of <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_glyph_mapping">XPS_GLYPH_MAPPING</a> structures that will fit in the array referenced by  <i>glyphMappings</i>. When the method returns, <i>glyphMappingCount</i> will contain the number of values in that array.
     * @returns {XPS_GLYPH_MAPPING} An array of <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_glyph_mapping">XPS_GLYPH_MAPPING</a> structures that receives the glyph mapping values.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-getglyphmappings
     */
    GetGlyphMappings(glyphMappingCount) {
        glyphMappingCountMarshal := glyphMappingCount is VarRef ? "uint*" : "ptr"

        glyphMappings := XPS_GLYPH_MAPPING()
        result := ComCall(10, this, glyphMappingCountMarshal, glyphMappingCount, "ptr", glyphMappings, "HRESULT")
        return glyphMappings
    }

    /**
     * Sets an array of XPS_GLYPH_MAPPING structures that describe how to map the UTF-16 scalar values in the UnicodeString property to entries in the array of XPS_GLYPH_INDEX structures.
     * @param {Integer} glyphMappingCount The number of <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_glyph_mapping">XPS_GLYPH_MAPPING</a> structures in the array that is referenced by <i>glyphMappings</i>. A value of 0 clears the property.
     * @param {Pointer<XPS_GLYPH_MAPPING>} glyphMappings An  <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_glyph_mapping">XPS_GLYPH_MAPPING</a> structure array that contains the glyph mapping values. If <i>glyphMappingCount</i> is 0, this parameter is ignored and can be set to <b>NULL</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * A member of one or more <a href="/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_glyph_mapping">XPS_GLYPH_MAPPING</a> structures has a value that  is not valid. This can occur in the following cases: the sum of string length and start position is less than the start position; the sum of index position and index length is less than the start position; and length of indices is 0.
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
     * <i>glyphMappings</i> is <b>NULL</b> and <i>glyphMappingCount</i> is greater than 0.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_MAPPING_OUT_OF_ORDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * In one or more <a href="/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_glyph_mapping">XPS_GLYPH_MAPPING</a> structures, an element  is out of sequence.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-setglyphmappings
     */
    SetGlyphMappings(glyphMappingCount, glyphMappings) {
        result := ComCall(11, this, "uint", glyphMappingCount, "ptr", glyphMappings, "HRESULT")
        return result
    }

    /**
     * Gets the number of prohibited caret stops.
     * @returns {Integer} The number of prohibited caret stops.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-getprohibitedcaretstopcount
     */
    GetProhibitedCaretStopCount() {
        result := ComCall(12, this, "uint*", &prohibitedCaretStopCount := 0, "HRESULT")
        return prohibitedCaretStopCount
    }

    /**
     * Gets an array of prohibited caret stop locations.
     * @param {Pointer<Integer>} count The number of prohibited caret stop values that will fit in the array that is  referenced by the <i>prohibitedCaretStops</i> parameter. When the method returns, <i>prohibitedCaretStopCount</i> will contain the number of values in that array.
     * @returns {Integer} An array of glyph mapping values. If   no prohibited caret stops have been defined, a <b>NULL</b> pointer is returned.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-getprohibitedcaretstops
     */
    GetProhibitedCaretStops(count) {
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, countMarshal, count, "uint*", &prohibitedCaretStops := 0, "HRESULT")
        return prohibitedCaretStops
    }

    /**
     * Sets an array of prohibited caret stop locations.
     * @param {Integer} count The number of prohibited caret stop locations in the array that is referenced by <i>prohibitedCaretStops</i>. A value of 0 clears the property.
     * @param {Pointer<Integer>} prohibitedCaretStops The array of prohibited caret stop locations to be set. If <i>count</i> is 0, this parameter is ignored and can be set to <b>NULL</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * <i>prohibitedCaretStops</i> is <b>NULL</b> and <i>count</i> is greater than 0.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>XPS_E_CARET_OUTOFORDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A caret location value is out of order. The location values must be sorted in ascending order.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-setprohibitedcaretstops
     */
    SetProhibitedCaretStops(count, prohibitedCaretStops) {
        prohibitedCaretStopsMarshal := prohibitedCaretStops is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "uint", count, prohibitedCaretStopsMarshal, prohibitedCaretStops, "HRESULT")
        return result
    }

    /**
     * Gets the bidirectional text level of the parent IXpsOMGlyphs interface.
     * @returns {Integer} The bidirectional text level.
     * 
     * Range: 0–61
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-getbidilevel
     */
    GetBidiLevel() {
        result := ComCall(15, this, "uint*", &bidiLevel := 0, "HRESULT")
        return bidiLevel
    }

    /**
     * Sets the level of bidirectional text.
     * @param {Integer} bidiLevel The level of bidirectional text.
     * 
     * Range: 0–61
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the table that follows. For information about  XPS document API return values that are not listed in this table, see <a href="/previous-versions/windows/desktop/dd372955(v=vs.85)">XPS Document Errors</a>.
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
     * The value of <i>bidiLevel</i> is outside of the allowed range. For more information, see the Remarks section.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-setbidilevel
     */
    SetBidiLevel(bidiLevel) {
        result := ComCall(16, this, "uint", bidiLevel, "HRESULT")
        return result
    }

    /**
     * Gets a Boolean value that indicates whether the text is to be rendered with the glyphs rotated sideways.
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
     * Rotate the glyphs sideways. Produces sideways text.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not rotate the glyphs sideways. Produces normal text.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-getissideways
     */
    GetIsSideways() {
        result := ComCall(17, this, "int*", &isSideways := 0, "HRESULT")
        return isSideways
    }

    /**
     * Sets the value that indicates whether the text is to be rendered with the glyphs rotated sideways.
     * @param {BOOL} isSideways The Boolean value that indicates whether the text is to be rendered with the glyphs rotated sideways.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Rotate the glyphs sideways. Produces sideways text.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not rotate the glyphs sideways. Produces normal text.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-setissideways
     */
    SetIsSideways(isSideways) {
        result := ComCall(18, this, "int", isSideways, "HRESULT")
        return result
    }

    /**
     * Gets the name of the device font.
     * @returns {PWSTR} The name of the device font; if not specified, a <b>NULL</b> pointer will be returned.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-getdevicefontname
     */
    GetDeviceFontName() {
        result := ComCall(19, this, "ptr*", &deviceFontName := 0, "HRESULT")
        return deviceFontName
    }

    /**
     * Sets the name of the device font.
     * @param {PWSTR} deviceFontName A pointer to the string that contains the name of the device font in its unescaped form. A <b>NULL</b> pointer clears the property.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomglyphseditor-setdevicefontname
     */
    SetDeviceFontName(deviceFontName) {
        deviceFontName := deviceFontName is String ? StrPtr(deviceFontName) : deviceFontName

        result := ComCall(20, this, "ptr", deviceFontName, "HRESULT")
        return result
    }
}
