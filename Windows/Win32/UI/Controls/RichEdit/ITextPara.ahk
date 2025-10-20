#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Text Object Model (TOM) rich text-range attributes are accessed through a pair of dual interfaces, ITextFont and ITextPara.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextfont">ITextFont</a> and <b>ITextPara</b> interfaces encapsulate the functionality of the Microsoft Word Format <b>Font</b> and <b>Paragraph</b> dialog boxes, respectively. Both interfaces include a duplicate (<b>Value</b>) property that can return a duplicate of the attributes in a range object or transfer a set of attributes to a range. As such, they act like programmable format painters. For example, you could transfer all attributes from range r1 to range r2 except for making r2 bold and the font size 12 points by using the following subroutine.
  * 
  * 
  * ```
  * Sub AttributeCopy(r1 As ITextRange, r2 As ITextRange)
  *     Dim tf As ITextFont
  *     tf = r1.Font                ' Value is the default property    
  *     tf.Bold = tomTrue           ' You can make some modifications
  *     tf.Size = 12
  *     tf.Animation = tomSparkleText
  *     r2.Font = tf                ' Apply font attributes all at once
  * End Sub
  * ```
  * 
  * 
  * See <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-setfont">SetFont</a> for a similar example written in C++.
  * 
  * The <b>ITextPara</b> interface encapsulates the Word Paragraph dialog box. All measurements are given in floating-point points. The rich edit control is able to accept and return all <b>ITextPara</b> properties intact (that is, without modification), both through TOM and through its Rich Text Format (RTF) converters. However, the following properties have no effect on what the control displays:
  * 
  * <ul>
  * <li>DoNotHyphen</li>
  * <li>KeepTogether</li>
  * <li>KeepWithNext</li>
  * <li>LineSpacing</li>
  * <li>LineSpacingRule</li>
  * <li>NoLineNumber</li>
  * <li>PageBreakBefore</li>
  * <li>Tab alignments</li>
  * <li>Tab styles (other than tomAlignLeft and tomSpaces)</li>
  * <li>Style WidowControl</li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tom/nn-tom-itextpara
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextPara extends IDispatch{
    /**
     * The interface identifier for ITextPara
     * @type {Guid}
     */
    static IID => Guid("{8cc497c4-a1df-11ce-8098-00aa0047be5d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<ITextPara>} ppPara 
     * @returns {HRESULT} 
     */
    GetDuplicate(ppPara) {
        result := ComCall(7, this, "ptr", ppPara, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextPara>} pPara 
     * @returns {HRESULT} 
     */
    SetDuplicate(pPara) {
        result := ComCall(8, this, "ptr", pPara, "int")
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
        result := ComCall(9, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITextPara>} pPara 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    IsEqual(pPara, pValue) {
        result := ComCall(10, this, "ptr", pPara, "int*", pValue, "int")
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
        result := ComCall(11, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetStyle(pValue) {
        result := ComCall(12, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetStyle(Value) {
        result := ComCall(13, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetAlignment(pValue) {
        result := ComCall(14, this, "int*", pValue, "int")
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
        result := ComCall(15, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetHyphenation(pValue) {
        result := ComCall(16, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetHyphenation(Value) {
        result := ComCall(17, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} pValue 
     * @returns {HRESULT} 
     */
    GetFirstLineIndent(pValue) {
        result := ComCall(18, this, "float*", pValue, "int")
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
    SetKeepTogether(Value) {
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
    GetKeepWithNext(pValue) {
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
    SetKeepWithNext(Value) {
        result := ComCall(22, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} pValue 
     * @returns {HRESULT} 
     */
    GetLeftIndent(pValue) {
        result := ComCall(23, this, "float*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} pValue 
     * @returns {HRESULT} 
     */
    GetLineSpacing(pValue) {
        result := ComCall(24, this, "float*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetLineSpacingRule(pValue) {
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
    GetListAlignment(pValue) {
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
    SetListAlignment(Value) {
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
    GetListLevelIndex(pValue) {
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
    SetListLevelIndex(Value) {
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
    GetListStart(pValue) {
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
    SetListStart(Value) {
        result := ComCall(31, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} pValue 
     * @returns {HRESULT} 
     */
    GetListTab(pValue) {
        result := ComCall(32, this, "float*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     */
    SetListTab(Value) {
        result := ComCall(33, this, "float", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetListType(pValue) {
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
    SetListType(Value) {
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
    GetNoLineNumber(pValue) {
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
    SetNoLineNumber(Value) {
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
    GetPageBreakBefore(pValue) {
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
    SetPageBreakBefore(Value) {
        result := ComCall(39, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} pValue 
     * @returns {HRESULT} 
     */
    GetRightIndent(pValue) {
        result := ComCall(40, this, "float*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     */
    SetRightIndent(Value) {
        result := ComCall(41, this, "float", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} First 
     * @param {Float} Left 
     * @param {Float} Right 
     * @returns {HRESULT} 
     */
    SetIndents(First, Left, Right) {
        result := ComCall(42, this, "float", First, "float", Left, "float", Right, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Rule 
     * @param {Float} Spacing 
     * @returns {HRESULT} 
     */
    SetLineSpacing(Rule, Spacing) {
        result := ComCall(43, this, "int", Rule, "float", Spacing, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} pValue 
     * @returns {HRESULT} 
     */
    GetSpaceAfter(pValue) {
        result := ComCall(44, this, "float*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     */
    SetSpaceAfter(Value) {
        result := ComCall(45, this, "float", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} pValue 
     * @returns {HRESULT} 
     */
    GetSpaceBefore(pValue) {
        result := ComCall(46, this, "float*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     */
    SetSpaceBefore(Value) {
        result := ComCall(47, this, "float", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetWidowControl(pValue) {
        result := ComCall(48, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetWidowControl(Value) {
        result := ComCall(49, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pCount 
     * @returns {HRESULT} 
     */
    GetTabCount(pCount) {
        result := ComCall(50, this, "int*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} tbPos 
     * @param {Integer} tbAlign 
     * @param {Integer} tbLeader 
     * @returns {HRESULT} 
     */
    AddTab(tbPos, tbAlign, tbLeader) {
        result := ComCall(51, this, "float", tbPos, "int", tbAlign, "int", tbLeader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearAllTabs() {
        result := ComCall(52, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} tbPos 
     * @returns {HRESULT} 
     */
    DeleteTab(tbPos) {
        result := ComCall(53, this, "float", tbPos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iTab 
     * @param {Pointer<Single>} ptbPos 
     * @param {Pointer<Int32>} ptbAlign 
     * @param {Pointer<Int32>} ptbLeader 
     * @returns {HRESULT} 
     */
    GetTab(iTab, ptbPos, ptbAlign, ptbLeader) {
        result := ComCall(54, this, "int", iTab, "float*", ptbPos, "int*", ptbAlign, "int*", ptbLeader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
