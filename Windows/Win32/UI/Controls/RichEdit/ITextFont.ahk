#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Text Object Model (TOM) rich text-range attributes are accessed through a pair of dual interfaces, ITextFont and ITextPara.
 * @remarks
 * 
  * The <b>ITextFont</b> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextpara">ITextPara</a> interfaces encapsulate the functionality of the Microsoft Word Format <b>Font</b> and <b>Paragraph</b> dialog boxes, respectively. Both interfaces include a duplicate (<b>Value</b>) property that can return a duplicate of the attributes in a range object or transfer a set of attributes to a range. As such, they act like programmable format painters. For example, you could transfer all attributes from range r1 to range r2 except for making r2 bold and the font size 12 points by using the following subroutine.
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
  * The <b>ITextFont</b> attribute interface represents the traditional Microsoft Visual Basic for Applications (VBA) way of setting properties and it gives the desired VBA notation.
  * 
  * <b>ITextFont</b> uses the "tomBool" type for rich-text attributes that have binary states. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">The tomBool Type</a>.
  * 
  * The rich edit control is able to accept and return all <b>ITextFont</b> properties intact, that is, without modification, both through TOM and through its Rich Text Format (RTF) converters. However, it cannot display the All Caps, Animation, Embossed, Imprint, Shadow, Small Caps, Hidden, Kerning, Outline, and Style font properties.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tom/nn-tom-itextfont
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextFont extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextFont
     * @type {Guid}
     */
    static IID => Guid("{8cc497c3-a1df-11ce-8098-00aa0047be5d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDuplicate", "SetDuplicate", "CanChange", "IsEqual", "Reset", "GetStyle", "SetStyle", "GetAllCaps", "SetAllCaps", "GetAnimation", "SetAnimation", "GetBackColor", "SetBackColor", "GetBold", "SetBold", "GetEmboss", "SetEmboss", "GetForeColor", "SetForeColor", "GetHidden", "SetHidden", "GetEngrave", "SetEngrave", "GetItalic", "SetItalic", "GetKerning", "SetKerning", "GetLanguageID", "SetLanguageID", "GetName", "SetName", "GetOutline", "SetOutline", "GetPosition", "SetPosition", "GetProtected", "SetProtected", "GetShadow", "SetShadow", "GetSize", "SetSize", "GetSmallCaps", "SetSmallCaps", "GetSpacing", "SetSpacing", "GetStrikeThrough", "SetStrikeThrough", "GetSubscript", "SetSubscript", "GetSuperscript", "SetSuperscript", "GetUnderline", "SetUnderline", "GetWeight", "SetWeight"]

    /**
     * 
     * @param {Pointer<ITextFont>} ppFont 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getduplicate
     */
    GetDuplicate(ppFont) {
        result := ComCall(7, this, "ptr*", ppFont, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITextFont} pFont 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setduplicate
     */
    SetDuplicate(pFont) {
        result := ComCall(8, this, "ptr", pFont, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-canchange
     */
    CanChange(pValue) {
        result := ComCall(9, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITextFont} pFont 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-isequal
     */
    IsEqual(pFont, pValue) {
        result := ComCall(10, this, "ptr", pFont, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-reset
     */
    Reset(Value) {
        result := ComCall(11, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getstyle
     */
    GetStyle(pValue) {
        result := ComCall(12, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setstyle
     */
    SetStyle(Value) {
        result := ComCall(13, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getallcaps
     */
    GetAllCaps(pValue) {
        result := ComCall(14, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setallcaps
     */
    SetAllCaps(Value) {
        result := ComCall(15, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getanimation
     */
    GetAnimation(pValue) {
        result := ComCall(16, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setanimation
     */
    SetAnimation(Value) {
        result := ComCall(17, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getbackcolor
     */
    GetBackColor(pValue) {
        result := ComCall(18, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setbackcolor
     */
    SetBackColor(Value) {
        result := ComCall(19, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getbold
     */
    GetBold(pValue) {
        result := ComCall(20, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setbold
     */
    SetBold(Value) {
        result := ComCall(21, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getemboss
     */
    GetEmboss(pValue) {
        result := ComCall(22, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setemboss
     */
    SetEmboss(Value) {
        result := ComCall(23, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getforecolor
     */
    GetForeColor(pValue) {
        result := ComCall(24, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setforecolor
     */
    SetForeColor(Value) {
        result := ComCall(25, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-gethidden
     */
    GetHidden(pValue) {
        result := ComCall(26, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-sethidden
     */
    SetHidden(Value) {
        result := ComCall(27, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getengrave
     */
    GetEngrave(pValue) {
        result := ComCall(28, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setengrave
     */
    SetEngrave(Value) {
        result := ComCall(29, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getitalic
     */
    GetItalic(pValue) {
        result := ComCall(30, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setitalic
     */
    SetItalic(Value) {
        result := ComCall(31, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getkerning
     */
    GetKerning(pValue) {
        result := ComCall(32, this, "float*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setkerning
     */
    SetKerning(Value) {
        result := ComCall(33, this, "float", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getlanguageid
     */
    GetLanguageID(pValue) {
        result := ComCall(34, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setlanguageid
     */
    SetLanguageID(Value) {
        result := ComCall(35, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getname
     */
    GetName(pbstr) {
        result := ComCall(36, this, "ptr", pbstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setname
     */
    SetName(bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(37, this, "ptr", bstr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getoutline
     */
    GetOutline(pValue) {
        result := ComCall(38, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setoutline
     */
    SetOutline(Value) {
        result := ComCall(39, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getposition
     */
    GetPosition(pValue) {
        result := ComCall(40, this, "float*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setposition
     */
    SetPosition(Value) {
        result := ComCall(41, this, "float", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getprotected
     */
    GetProtected(pValue) {
        result := ComCall(42, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setprotected
     */
    SetProtected(Value) {
        result := ComCall(43, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getshadow
     */
    GetShadow(pValue) {
        result := ComCall(44, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setshadow
     */
    SetShadow(Value) {
        result := ComCall(45, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getsize
     */
    GetSize(pValue) {
        result := ComCall(46, this, "float*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setsize
     */
    SetSize(Value) {
        result := ComCall(47, this, "float", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getsmallcaps
     */
    GetSmallCaps(pValue) {
        result := ComCall(48, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setsmallcaps
     */
    SetSmallCaps(Value) {
        result := ComCall(49, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getspacing
     */
    GetSpacing(pValue) {
        result := ComCall(50, this, "float*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setspacing
     */
    SetSpacing(Value) {
        result := ComCall(51, this, "float", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getstrikethrough
     */
    GetStrikeThrough(pValue) {
        result := ComCall(52, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setstrikethrough
     */
    SetStrikeThrough(Value) {
        result := ComCall(53, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getsubscript
     */
    GetSubscript(pValue) {
        result := ComCall(54, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setsubscript
     */
    SetSubscript(Value) {
        result := ComCall(55, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getsuperscript
     */
    GetSuperscript(pValue) {
        result := ComCall(56, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setsuperscript
     */
    SetSuperscript(Value) {
        result := ComCall(57, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getunderline
     */
    GetUnderline(pValue) {
        result := ComCall(58, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setunderline
     */
    SetUnderline(Value) {
        result := ComCall(59, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-getweight
     */
    GetWeight(pValue) {
        result := ComCall(60, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextfont-setweight
     */
    SetWeight(Value) {
        result := ComCall(61, this, "int", Value, "HRESULT")
        return result
    }
}
