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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDuplicate", "SetDuplicate", "CanChange", "IsEqual", "Reset", "GetStyle", "SetStyle", "GetAlignment", "SetAlignment", "GetHyphenation", "SetHyphenation", "GetFirstLineIndent", "GetKeepTogether", "SetKeepTogether", "GetKeepWithNext", "SetKeepWithNext", "GetLeftIndent", "GetLineSpacing", "GetLineSpacingRule", "GetListAlignment", "SetListAlignment", "GetListLevelIndex", "SetListLevelIndex", "GetListStart", "SetListStart", "GetListTab", "SetListTab", "GetListType", "SetListType", "GetNoLineNumber", "SetNoLineNumber", "GetPageBreakBefore", "SetPageBreakBefore", "GetRightIndent", "SetRightIndent", "SetIndents", "SetLineSpacing", "GetSpaceAfter", "SetSpaceAfter", "GetSpaceBefore", "SetSpaceBefore", "GetWidowControl", "SetWidowControl", "GetTabCount", "AddTab", "ClearAllTabs", "DeleteTab", "GetTab"]

    /**
     * 
     * @param {Pointer<ITextPara>} ppPara 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-getduplicate
     */
    GetDuplicate(ppPara) {
        result := ComCall(7, this, "ptr*", ppPara, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITextPara} pPara 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-setduplicate
     */
    SetDuplicate(pPara) {
        result := ComCall(8, this, "ptr", pPara, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-canchange
     */
    CanChange(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITextPara} pPara 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-isequal
     */
    IsEqual(pPara, pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, "ptr", pPara, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-reset
     */
    Reset(Value) {
        result := ComCall(11, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-getstyle
     */
    GetStyle(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-setstyle
     */
    SetStyle(Value) {
        result := ComCall(13, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-getalignment
     */
    GetAlignment(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-setalignment
     */
    SetAlignment(Value) {
        result := ComCall(15, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-gethyphenation
     */
    GetHyphenation(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-sethyphenation
     */
    SetHyphenation(Value) {
        result := ComCall(17, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-getfirstlineindent
     */
    GetFirstLineIndent(pValue) {
        pValueMarshal := pValue is VarRef ? "float*" : "ptr"

        result := ComCall(18, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-getkeeptogether
     */
    GetKeepTogether(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-setkeeptogether
     */
    SetKeepTogether(Value) {
        result := ComCall(20, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-getkeepwithnext
     */
    GetKeepWithNext(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(21, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-setkeepwithnext
     */
    SetKeepWithNext(Value) {
        result := ComCall(22, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-getleftindent
     */
    GetLeftIndent(pValue) {
        pValueMarshal := pValue is VarRef ? "float*" : "ptr"

        result := ComCall(23, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-getlinespacing
     */
    GetLineSpacing(pValue) {
        pValueMarshal := pValue is VarRef ? "float*" : "ptr"

        result := ComCall(24, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-getlinespacingrule
     */
    GetLineSpacingRule(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(25, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-getlistalignment
     */
    GetListAlignment(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(26, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-setlistalignment
     */
    SetListAlignment(Value) {
        result := ComCall(27, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-getlistlevelindex
     */
    GetListLevelIndex(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(28, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-setlistlevelindex
     */
    SetListLevelIndex(Value) {
        result := ComCall(29, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-getliststart
     */
    GetListStart(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(30, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-setliststart
     */
    SetListStart(Value) {
        result := ComCall(31, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-getlisttab
     */
    GetListTab(pValue) {
        pValueMarshal := pValue is VarRef ? "float*" : "ptr"

        result := ComCall(32, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-setlisttab
     */
    SetListTab(Value) {
        result := ComCall(33, this, "float", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-getlisttype
     */
    GetListType(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(34, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-setlisttype
     */
    SetListType(Value) {
        result := ComCall(35, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-getnolinenumber
     */
    GetNoLineNumber(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(36, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-setnolinenumber
     */
    SetNoLineNumber(Value) {
        result := ComCall(37, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-getpagebreakbefore
     */
    GetPageBreakBefore(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(38, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-setpagebreakbefore
     */
    SetPageBreakBefore(Value) {
        result := ComCall(39, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-getrightindent
     */
    GetRightIndent(pValue) {
        pValueMarshal := pValue is VarRef ? "float*" : "ptr"

        result := ComCall(40, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-setrightindent
     */
    SetRightIndent(Value) {
        result := ComCall(41, this, "float", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} First 
     * @param {Float} Left 
     * @param {Float} Right 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-setindents
     */
    SetIndents(First, Left, Right) {
        result := ComCall(42, this, "float", First, "float", Left, "float", Right, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Rule 
     * @param {Float} Spacing 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-setlinespacing
     */
    SetLineSpacing(Rule, Spacing) {
        result := ComCall(43, this, "int", Rule, "float", Spacing, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-getspaceafter
     */
    GetSpaceAfter(pValue) {
        pValueMarshal := pValue is VarRef ? "float*" : "ptr"

        result := ComCall(44, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-setspaceafter
     */
    SetSpaceAfter(Value) {
        result := ComCall(45, this, "float", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-getspacebefore
     */
    GetSpaceBefore(pValue) {
        pValueMarshal := pValue is VarRef ? "float*" : "ptr"

        result := ComCall(46, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-setspacebefore
     */
    SetSpaceBefore(Value) {
        result := ComCall(47, this, "float", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-getwidowcontrol
     */
    GetWidowControl(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(48, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-setwidowcontrol
     */
    SetWidowControl(Value) {
        result := ComCall(49, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-gettabcount
     */
    GetTabCount(pCount) {
        pCountMarshal := pCount is VarRef ? "int*" : "ptr"

        result := ComCall(50, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} tbPos 
     * @param {Integer} tbAlign 
     * @param {Integer} tbLeader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-addtab
     */
    AddTab(tbPos, tbAlign, tbLeader) {
        result := ComCall(51, this, "float", tbPos, "int", tbAlign, "int", tbLeader, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-clearalltabs
     */
    ClearAllTabs() {
        result := ComCall(52, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} tbPos 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-deletetab
     */
    DeleteTab(tbPos) {
        result := ComCall(53, this, "float", tbPos, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iTab 
     * @param {Pointer<Float>} ptbPos 
     * @param {Pointer<Integer>} ptbAlign 
     * @param {Pointer<Integer>} ptbLeader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextpara-gettab
     */
    GetTab(iTab, ptbPos, ptbAlign, ptbLeader) {
        ptbPosMarshal := ptbPos is VarRef ? "float*" : "ptr"
        ptbAlignMarshal := ptbAlign is VarRef ? "int*" : "ptr"
        ptbLeaderMarshal := ptbLeader is VarRef ? "int*" : "ptr"

        result := ComCall(54, this, "int", iTab, ptbPosMarshal, ptbPos, ptbAlignMarshal, ptbAlign, ptbLeaderMarshal, ptbLeader, "HRESULT")
        return result
    }
}
