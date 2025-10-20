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
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetAlignment(pValue) {
        result := ComCall(7, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetAlignment(Value) {
        result := ComCall(8, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetCellCount(pValue) {
        result := ComCall(9, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetCellCount(Value) {
        result := ComCall(10, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetCellCountCache(pValue) {
        result := ComCall(11, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetCellCountCache(Value) {
        result := ComCall(12, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetCellIndex(pValue) {
        result := ComCall(13, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetCellIndex(Value) {
        result := ComCall(14, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetCellMargin(pValue) {
        result := ComCall(15, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetCellMargin(Value) {
        result := ComCall(16, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetHeight(pValue) {
        result := ComCall(17, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetHeight(Value) {
        result := ComCall(18, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetIndent(pValue) {
        result := ComCall(19, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetIndent(Value) {
        result := ComCall(20, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetKeepTogether(pValue) {
        result := ComCall(21, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetKeepTogether(Value) {
        result := ComCall(22, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetKeepWithNext(pValue) {
        result := ComCall(23, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetKeepWithNext(Value) {
        result := ComCall(24, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetNestLevel(pValue) {
        result := ComCall(25, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetRTL(pValue) {
        result := ComCall(26, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetRTL(Value) {
        result := ComCall(27, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetCellAlignment(pValue) {
        result := ComCall(28, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetCellAlignment(Value) {
        result := ComCall(29, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetCellColorBack(pValue) {
        result := ComCall(30, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetCellColorBack(Value) {
        result := ComCall(31, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetCellColorFore(pValue) {
        result := ComCall(32, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetCellColorFore(Value) {
        result := ComCall(33, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetCellMergeFlags(pValue) {
        result := ComCall(34, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetCellMergeFlags(Value) {
        result := ComCall(35, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetCellShading(pValue) {
        result := ComCall(36, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetCellShading(Value) {
        result := ComCall(37, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetCellVerticalText(pValue) {
        result := ComCall(38, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetCellVerticalText(Value) {
        result := ComCall(39, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetCellWidth(pValue) {
        result := ComCall(40, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetCellWidth(Value) {
        result := ComCall(41, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pcrLeft 
     * @param {Pointer<Int32>} pcrTop 
     * @param {Pointer<Int32>} pcrRight 
     * @param {Pointer<Int32>} pcrBottom 
     * @returns {HRESULT} 
     */
    GetCellBorderColors(pcrLeft, pcrTop, pcrRight, pcrBottom) {
        result := ComCall(42, this, "int*", pcrLeft, "int*", pcrTop, "int*", pcrRight, "int*", pcrBottom, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pduLeft 
     * @param {Pointer<Int32>} pduTop 
     * @param {Pointer<Int32>} pduRight 
     * @param {Pointer<Int32>} pduBottom 
     * @returns {HRESULT} 
     */
    GetCellBorderWidths(pduLeft, pduTop, pduRight, pduBottom) {
        result := ComCall(43, this, "int*", pduLeft, "int*", pduTop, "int*", pduRight, "int*", pduBottom, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} crLeft 
     * @param {Integer} crTop 
     * @param {Integer} crRight 
     * @param {Integer} crBottom 
     * @returns {HRESULT} 
     */
    SetCellBorderColors(crLeft, crTop, crRight, crBottom) {
        result := ComCall(44, this, "int", crLeft, "int", crTop, "int", crRight, "int", crBottom, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} duLeft 
     * @param {Integer} duTop 
     * @param {Integer} duRight 
     * @param {Integer} duBottom 
     * @returns {HRESULT} 
     */
    SetCellBorderWidths(duLeft, duTop, duRight, duBottom) {
        result := ComCall(45, this, "int", duLeft, "int", duTop, "int", duRight, "int", duBottom, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cRow 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    Apply(cRow, Flags) {
        result := ComCall(46, this, "int", cRow, "int", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    CanChange(pValue) {
        result := ComCall(47, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetProperty(Type, pValue) {
        result := ComCall(48, this, "int", Type, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cRow 
     * @returns {HRESULT} 
     */
    Insert(cRow) {
        result := ComCall(49, this, "int", cRow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextRow>} pRow 
     * @param {Pointer<Int32>} pB 
     * @returns {HRESULT} 
     */
    IsEqual(pRow, pB) {
        result := ComCall(50, this, "ptr", pRow, "int*", pB, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    Reset(Value) {
        result := ComCall(51, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetProperty(Type, Value) {
        result := ComCall(52, this, "int", Type, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
