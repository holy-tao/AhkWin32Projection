#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The ITextRow interface provides methods to insert one or more identical table rows, and to retrieve and change table row properties. To insert nonidentical rows, call ITextRow::Insert for each different row configuration.
 * @remarks
 * 
 * To select a table, a row, or a cell, use <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-expand">ITextRange::Expand</a>, with the <i>Unit</i> parameter set to <b>tomTable</b>, <b>tomRow</b>, or <b>tomCell</b>, respectively. These units can also be used with the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-move">ITextRange::Move</a> methods to navigate and select multiple rows or cells.
 * 
 * Some of the <b>ITextRow</b> properties apply to the whole row, such as the row alignment. In addition, there are a number of properties, such as cell alignment, that apply to a cell with the index set via the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrow-setcellindex">ITextRow::SetCellIndex</a> method. This cell is referred to as the active cell.
 * 
 * 
 * <b>ITextRow</b> works similarly to <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextpara2">ITextPara2</a>, but doesn't modify the document until either the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrow-apply">ITextRow::Apply</a> or <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrow-insert">ITextRow::Insert</a> methods are called. In addition, the row and cell parameters are always active, that is, they cannot have the value <b>tomDefault</b>.
 * 
 * On initialization, the <b>ITextRow</b> object acquires the table row properties, if any, at the active end of the associated <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange2">ITextRange2</a>. The <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrow-reset">ITextRow::Reset</a> method can be used to update these properties to the current values for <b>ITextRange2</b> object.
 * 
 * 
 * A rich edit control table consists of a sequence of table rows, which, in turn, consist of sequences of paragraphs. A table row starts with the special two-character delimiter paragraph U+FFF9 U+000D and ends with the two-character delimiter paragraph U+FFFB U+000D. Each cell is terminated by the cell mark U+0007, which is treated as a hard end-of-paragraph mark just as U+000D (CR) is. The table row and cell parameters are treated as special paragraph formatting of the table-row delimiters. The cell parameters are stored in an expanded version of the tabs array. This format allows tables to be nested within other tables and is allowed to go fifteen levels deep.
 * 
 * The architecture is quite flexible in that each table row can have any valid table-row parameters, regardless of the parameters for other rows (except for vertical merge flags). For example, the number of cells and the start indents of table rows can differ, unlike in HTML which has n×m rectangular format with all rows starting at the same indent. 
 * 
 * On the other hand, no formal table description is stored anywhere. Information such as the number of rows must be figured out by navigating through the table.
 * For example, the count of rows in a table can be obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-startof">ITextRange::StartOf</a> (<b>tomTable</b>, <b>tomFalse</b>, <b>NULL</b>) to move to the start of the current table and then calling <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-move">ITextRange::Move</a> (<b>tomRow</b>, <b>tomForward</b>, <i>&amp;dcRow</i>). The quantity <i>&amp;dcRow</i> + 1 then contains the count of rows in the table, because moving by <b>tomRow</b> increments doesn't move beyond the last table row.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tom/nn-tom-itextrow
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextRow extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextRow
     * @type {Guid}
     */
    static IID => Guid("{c241f5ef-7206-11d8-a2c7-00a0d1d6c6b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAlignment", "SetAlignment", "GetCellCount", "SetCellCount", "GetCellCountCache", "SetCellCountCache", "GetCellIndex", "SetCellIndex", "GetCellMargin", "SetCellMargin", "GetHeight", "SetHeight", "GetIndent", "SetIndent", "GetKeepTogether", "SetKeepTogether", "GetKeepWithNext", "SetKeepWithNext", "GetNestLevel", "GetRTL", "SetRTL", "GetCellAlignment", "SetCellAlignment", "GetCellColorBack", "SetCellColorBack", "GetCellColorFore", "SetCellColorFore", "GetCellMergeFlags", "SetCellMergeFlags", "GetCellShading", "SetCellShading", "GetCellVerticalText", "SetCellVerticalText", "GetCellWidth", "SetCellWidth", "GetCellBorderColors", "GetCellBorderWidths", "SetCellBorderColors", "SetCellBorderWidths", "Apply", "CanChange", "GetProperty", "Insert", "IsEqual", "Reset", "SetProperty"]

    /**
     * Gets the horizontal alignment of a row.
     * @returns {Integer} Type: <b>long*</b>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-getalignment
     */
    GetAlignment() {
        result := ComCall(7, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the horizontal alignment of a row.
     * @param {Integer} Value Type: <b>long</b>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-setalignment
     */
    SetAlignment(Value) {
        result := ComCall(8, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the count of cells in this row.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The cell count for this row.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-getcellcount
     */
    GetCellCount() {
        result := ComCall(9, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the count of cells in a row.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The row cell count.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-setcellcount
     */
    SetCellCount(Value) {
        result := ComCall(10, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the count of cells cached for this row.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The cached cell count.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-getcellcountcache
     */
    GetCellCountCache() {
        result := ComCall(11, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the count of cells cached for a row.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The cell count.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-setcellcountcache
     */
    SetCellCountCache(Value) {
        result := ComCall(12, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the index of the active cell to get or set parameters for.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The cell index.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-getcellindex
     */
    GetCellIndex() {
        result := ComCall(13, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the index of the active cell.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The cell index.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-setcellindex
     */
    SetCellIndex(Value) {
        result := ComCall(14, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the cell margin of this row.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The cell margin.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-getcellmargin
     */
    GetCellMargin() {
        result := ComCall(15, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the cell margin of a row.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The cell margin. The cell margin is used for all cells in the row and is typically about 108 twips or 0.075 inches.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-setcellmargin
     */
    SetCellMargin(Value) {
        result := ComCall(16, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the height of the row.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The row height. A value of 0 indicates autoheight.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-getheight
     */
    GetHeight() {
        result := ComCall(17, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the height of a row.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The row height. A value of 0 indicates autoheight.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-setheight
     */
    SetHeight(Value) {
        result := ComCall(18, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the indent of this row.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The indent of the row.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-getindent
     */
    GetIndent() {
        result := ComCall(19, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the indent of a row.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The row indent.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-setindent
     */
    SetIndent(Value) {
        result := ComCall(20, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets whether this row is allowed to be broken across pages.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">tomBool</a> value that indicates whether this row can be broken across pages.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-getkeeptogether
     */
    GetKeepTogether() {
        result := ComCall(21, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets whether this row is allowed to be broken across pages.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">tomBool</a> value that indicates whether this row can be broken across pages.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-setkeeptogether
     */
    SetKeepTogether(Value) {
        result := ComCall(22, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets whether this row should appear on the same page as the row that follows it.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">tomBool</a> value that indicates whether this row should be kept on the same page as the following row.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-getkeepwithnext
     */
    GetKeepWithNext() {
        result := ComCall(23, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets whether a row should appear on the same page as the row that follows it.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">tomBool</a> value that indicates whether a row should appear on the same page as the row that follows it.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-setkeepwithnext
     */
    SetKeepWithNext(Value) {
        result := ComCall(24, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the nest level of a table.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The nest level.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-getnestlevel
     */
    GetNestLevel() {
        result := ComCall(25, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Gets whether this row has right-to-left orientation.
     * @returns {Integer} Type: <b>long*</b>
     * 
     *  A <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">tomBool</a> value that indicates whether this row has right-to-left orientation.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-getrtl
     */
    GetRTL() {
        result := ComCall(26, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets whether this row has right-to-left orientation.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">tomBool</a> value that can be one of the following.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomTrue"></a><a id="tomtrue"></a><a id="TOMTRUE"></a><dl>
     * <dt><b>tomTrue</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Right-to-left orientation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomFalse"></a><a id="tomfalse"></a><a id="TOMFALSE"></a><dl>
     * <dt><b>tomFalse</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Left-to-right orientation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomToggle"></a><a id="tomtoggle"></a><a id="TOMTOGGLE"></a><dl>
     * <dt><b>tomToggle</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Toggles the orientation.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-setrtl
     */
    SetRTL(Value) {
        result := ComCall(27, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the vertical alignment of the active cell.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The vertical alignment.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-getcellalignment
     */
    GetCellAlignment() {
        result := ComCall(28, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the vertical alignment of the active cell.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The vertical alignment.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-setcellalignment
     */
    SetCellAlignment(Value) {
        result := ComCall(29, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the background color of the active cell.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The background color.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-getcellcolorback
     */
    GetCellColorBack() {
        result := ComCall(30, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the background color of the active cell.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The background color.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-setcellcolorback
     */
    SetCellColorBack(Value) {
        result := ComCall(31, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the foreground color of the active cell.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The foreground color.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-getcellcolorfore
     */
    GetCellColorFore() {
        result := ComCall(32, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the foreground color of the active cell.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The foreground color.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-setcellcolorfore
     */
    SetCellColorFore(Value) {
        result := ComCall(33, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the merge flags of the active cell.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The merge flag of the active cell. The flag can be one of the following:
     * 
     * <a id="tomHContCell"></a>
     * <a id="tomhcontcell"></a>
     * <a id="TOMHCONTCELL"></a>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-getcellmergeflags
     */
    GetCellMergeFlags() {
        result := ComCall(34, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the merge flags of the active cell.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The merge flag. It can be one of these values.
     * 
     * 
     * <a id="tomHContCell"></a>
     * <a id="tomhcontcell"></a>
     * <a id="TOMHCONTCELL"></a>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-setcellmergeflags
     */
    SetCellMergeFlags(Value) {
        result := ComCall(35, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the shading of the active cell.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The shading of the active cell. See Remarks.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-getcellshading
     */
    GetCellShading() {
        result := ComCall(36, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the shading of the active cell.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The shading of the active cell.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-setcellshading
     */
    SetCellShading(Value) {
        result := ComCall(37, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the vertical-text setting of the active cell.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The vertical-text setting
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-getcellverticaltext
     */
    GetCellVerticalText() {
        result := ComCall(38, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the vertical-text setting of the active cell.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The vertical setting.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-setcellverticaltext
     */
    SetCellVerticalText(Value) {
        result := ComCall(39, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the width of the active cell.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The width of the active cell, in twips.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-getcellwidth
     */
    GetCellWidth() {
        result := ComCall(40, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the active cell width in twips.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The width of the active cell.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-setcellwidth
     */
    SetCellWidth(Value) {
        result := ComCall(41, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Gets the border colors of the active cell.
     * @param {Pointer<Integer>} pcrLeft Type: <b>long*</b>
     * 
     * The active-cell left border color.
     * @param {Pointer<Integer>} pcrTop Type: <b>long*</b>
     * 
     * The active-cell top border color.
     * @param {Pointer<Integer>} pcrRight Type: <b>long*</b>
     * 
     * The active-cell right border color.
     * @param {Pointer<Integer>} pcrBottom Type: <b>long*</b>
     * 
     * The active-cell bottom border color.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-getcellbordercolors
     */
    GetCellBorderColors(pcrLeft, pcrTop, pcrRight, pcrBottom) {
        pcrLeftMarshal := pcrLeft is VarRef ? "int*" : "ptr"
        pcrTopMarshal := pcrTop is VarRef ? "int*" : "ptr"
        pcrRightMarshal := pcrRight is VarRef ? "int*" : "ptr"
        pcrBottomMarshal := pcrBottom is VarRef ? "int*" : "ptr"

        result := ComCall(42, this, pcrLeftMarshal, pcrLeft, pcrTopMarshal, pcrTop, pcrRightMarshal, pcrRight, pcrBottomMarshal, pcrBottom, "HRESULT")
        return result
    }

    /**
     * Gets the border widths of the active cell.
     * @param {Pointer<Integer>} pduLeft Type: <b>long*</b>
     * 
     * The active-cell left border width.
     * @param {Pointer<Integer>} pduTop Type: <b>long*</b>
     * 
     * The active-cell top border width.
     * @param {Pointer<Integer>} pduRight Type: <b>long*</b>
     * 
     * The active-cell right border width.
     * @param {Pointer<Integer>} pduBottom Type: <b>long*</b>
     * 
     * The active-cell bottom border width.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-getcellborderwidths
     */
    GetCellBorderWidths(pduLeft, pduTop, pduRight, pduBottom) {
        pduLeftMarshal := pduLeft is VarRef ? "int*" : "ptr"
        pduTopMarshal := pduTop is VarRef ? "int*" : "ptr"
        pduRightMarshal := pduRight is VarRef ? "int*" : "ptr"
        pduBottomMarshal := pduBottom is VarRef ? "int*" : "ptr"

        result := ComCall(43, this, pduLeftMarshal, pduLeft, pduTopMarshal, pduTop, pduRightMarshal, pduRight, pduBottomMarshal, pduBottom, "HRESULT")
        return result
    }

    /**
     * Sets the border colors of the active cell.
     * @param {Integer} crLeft Type: <b>long</b>
     * 
     * The left border color.
     * @param {Integer} crTop Type: <b>long</b>
     * 
     * The top border color.
     * @param {Integer} crRight Type: <b>long</b>
     * 
     * The right border color.
     * @param {Integer} crBottom Type: <b>long</b>
     * 
     * The bottom border color.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-setcellbordercolors
     */
    SetCellBorderColors(crLeft, crTop, crRight, crBottom) {
        result := ComCall(44, this, "int", crLeft, "int", crTop, "int", crRight, "int", crBottom, "HRESULT")
        return result
    }

    /**
     * Sets the border widths of the active cell.
     * @param {Integer} duLeft Type: <b>long</b>
     * 
     * The left border width.
     * @param {Integer} duTop Type: <b>long</b>
     * 
     * The top border width.
     * @param {Integer} duRight Type: <b>long</b>
     * 
     * The right border width.
     * @param {Integer} duBottom Type: <b>long</b>
     * 
     * The bottom border width.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-setcellborderwidths
     */
    SetCellBorderWidths(duLeft, duTop, duRight, duBottom) {
        result := ComCall(45, this, "int", duLeft, "int", duTop, "int", duRight, "int", duBottom, "HRESULT")
        return result
    }

    /**
     * Applies the formatting attributes of this text row object to the specified rows in the associated ITextRange2.
     * @param {Integer} cRow Type: <b>long</b>
     * 
     * The number of rows to apply this text row object to.
     * @param {Integer} Flags Type: <b>long</b>
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-apply
     */
    Apply(cRow, Flags) {
        result := ComCall(46, this, "int", cRow, "int", Flags, "HRESULT")
        return result
    }

    /**
     * Determines whether changes can be made to this row.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">tomBool</a> indicating whether the row can be edited. It is <b>tomTrue</b> only if the row can be edited. The <i>pB</i> paraemeter can be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-canchange
     */
    CanChange() {
        result := ComCall(47, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Gets the value of the specified property.
     * @param {Integer} Type Type: <b>long</b>
     * 
     * The ID of the property to retrieve.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The value for the property.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-getproperty
     */
    GetProperty(Type) {
        result := ComCall(48, this, "int", Type, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Inserts a row, or rows, at the location identified by the associated ITextRange2 object.
     * @param {Integer} cRow Type: <b>long</b>
     * 
     * The number of rows to insert.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-insert
     */
    Insert(cRow) {
        result := ComCall(49, this, "int", cRow, "HRESULT")
        return result
    }

    /**
     * Compares two table rows to determine if they have the same properties.
     * @param {ITextRow} pRow Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrow">ITextRow</a>*</b>
     * 
     * The row to compare to.
     * @returns {Integer} Type: <b>long*</b>
     * 
     *  The comparison result. The value is set to  <b>tomTrue</b> if equal, and <b>tomFalse</b> if not. The value can be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-isequal
     */
    IsEqual(pRow) {
        result := ComCall(50, this, "ptr", pRow, "int*", &pB := 0, "HRESULT")
        return pB
    }

    /**
     * Resets a row.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomRowUpdate</a> reset value.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Write access is denied.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-reset
     */
    Reset(Value) {
        result := ComCall(51, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Sets the value of the specified property.
     * @param {Integer} Type Type: <b>long</b>
     * 
     * The ID of the  property to set.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * The value.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the method succeeds, it returns <b>NOERROR</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrow-setproperty
     */
    SetProperty(Type, Value) {
        result := ComCall(52, this, "int", Type, "int", Value, "HRESULT")
        return result
    }
}
