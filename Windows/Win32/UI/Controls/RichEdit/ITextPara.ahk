#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITextPara.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Text Object Model (TOM) rich text-range attributes are accessed through a pair of dual interfaces, ITextFont and ITextPara. (ITextPara)
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api//content/tom/nn-tom-itextpara
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
     * Creates a duplicate of the specified paragraph format object. The duplicate property is the default property of an ITextPara object.
     * @returns {ITextPara} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextpara">ITextPara</a>**</b>
     * 
     * The duplicate <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextpara">ITextPara</a> object.
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-getduplicate
     */
    GetDuplicate() {
        result := ComCall(7, this, "ptr*", &ppPara := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITextPara(ppPara)
    }

    /**
     * Sets the formatting for an existing paragraph by copying a given format.
     * @remarks
     * The tomUndefined values have no effect, that is, they will not change the target values.
     * @param {ITextPara} pPara Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextpara">ITextPara</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextpara">ITextPara</a> range that contains the new paragraph formatting.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If <b>ITextPara::SetDuplicate</b> succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Value</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Meaning
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
     * Invalid argument.
     * 
     * </td>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The paragraph formatting object is attached to a range that has been deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-setduplicate
     */
    SetDuplicate(pPara) {
        result := ComCall(8, this, "ptr", pPara, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines whether the paragraph formatting can be changed.
     * @remarks
     * The *<i>pbCanChange</i>  parameter returns <b>tomTrue</b> only if the paragraph formatting can be changed (that is, if no part of an associated range is protected and an associated document is not read-only). If this <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextpara">ITextPara</a> object is a duplicate, no protection rules apply.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * A variable that is <b>tomTrue</b> if the paragraph formatting can be changed or <b>tomFalse</b> if it cannot be changed. This parameter can be null.
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-canchange
     */
    CanChange() {
        result := ComCall(9, this, "int*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Determines if the current range has the same properties as a specified range.
     * @param {ITextPara} pPara Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextpara">ITextPara</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextpara">ITextPara</a> range that is compared to the current range.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The comparison result. The value can be null.
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-isequal
     */
    IsEqual(pPara) {
        result := ComCall(10, this, "ptr", pPara, "int*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Resets the paragraph formatting to a choice of default values.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * Type of reset. It can be one of the following possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomDefault</a></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Used for paragraph formatting that is defined by the RTF \pard, that is, the paragraph default control word.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomUndefined</a></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Used for all undefined values. The tomUndefined value is only valid for duplicate (clone) <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextpara">ITextPara</a> objects.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If <b>ITextPara::Reset</b> succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Value</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Meaning
     * 
     * </td>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The paragraph formatting object is attached to a range that has been deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-reset
     */
    Reset(Value) {
        result := ComCall(11, this, "int", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the style handle to the paragraphs in the specified range.
     * @remarks
     * The Text Object Model (TOM) version 1.0 has no way to specify the meanings of user-defined style handles. They depend on other facilities of the text system implementing TOM. Negative style handles are reserved for built-in character and paragraph styles. Currently defined values are listed in the following table. For a description of the following styles, see the Microsoft Word documentation.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Style </th>
     * <th>Value</th>
     * <th>Style</th>
     * <th>Value</th>
     * </tr>
     * <tr>
     * <td>StyleNormal</td>
     * <td>–1</td>
     * <td>StyleTableofAuthorities</td>
     * <td>–45</td>
     * </tr>
     * <tr>
     * <td>StyleHeading1</td>
     * <td>–2</td>
     * <td>StyleMacroText</td>
     * <td>–46</td>
     * </tr>
     * <tr>
     * <td>StyleHeading2</td>
     * <td>–3</td>
     * <td>StyleTOAHeading</td>
     * <td>–47</td>
     * </tr>
     * <tr>
     * <td>StyleHeading3</td>
     * <td>–4</td>
     * <td>StyleList</td>
     * <td>–48</td>
     * </tr>
     * <tr>
     * <td>StyleHeading4</td>
     * <td>–5</td>
     * <td>StyleListBullet</td>
     * <td>–49</td>
     * </tr>
     * <tr>
     * <td>StyleHeading5</td>
     * <td>–6</td>
     * <td>StyleListNumber</td>
     * <td>–50</td>
     * </tr>
     * <tr>
     * <td>StyleHeading6</td>
     * <td>–7</td>
     * <td>StyleList2</td>
     * <td>–51</td>
     * </tr>
     * <tr>
     * <td>StyleHeading7</td>
     * <td>–8</td>
     * <td>StyleList3</td>
     * <td>–52</td>
     * </tr>
     * <tr>
     * <td>StyleHeading8</td>
     * <td>–9</td>
     * <td>StyleList4</td>
     * <td>–53</td>
     * </tr>
     * <tr>
     * <td>StyleHeading9</td>
     * <td>–10</td>
     * <td>StyleList5</td>
     * <td>–54</td>
     * </tr>
     * <tr>
     * <td>StyleIndex1</td>
     * <td>–11</td>
     * <td>StyleListBullet2</td>
     * <td>–55</td>
     * </tr>
     * <tr>
     * <td>StyleIndex2</td>
     * <td>–12</td>
     * <td>StyleListBullet3</td>
     * <td>–56</td>
     * </tr>
     * <tr>
     * <td>StyleIndex3</td>
     * <td>–13</td>
     * <td>StyleListBullet4</td>
     * <td>–57</td>
     * </tr>
     * <tr>
     * <td>StyleIndex4</td>
     * <td>–14</td>
     * <td>StyleListBullet5</td>
     * <td>–58</td>
     * </tr>
     * <tr>
     * <td>StyleIndex5</td>
     * <td>–15</td>
     * <td>StyleListNumber2</td>
     * <td>–59</td>
     * </tr>
     * <tr>
     * <td>StyleIndex6</td>
     * <td>–16</td>
     * <td>StyleListNumber3</td>
     * <td>–60</td>
     * </tr>
     * <tr>
     * <td>StyleIndex7</td>
     * <td>–17</td>
     * <td>StyleListNumber4</td>
     * <td>–61</td>
     * </tr>
     * <tr>
     * <td>StyleIndex8</td>
     * <td>–18</td>
     * <td>StyleListNumber5</td>
     * <td>–62</td>
     * </tr>
     * <tr>
     * <td>StyleIndex9</td>
     * <td>–19</td>
     * <td>StyleTitle</td>
     * <td>–63</td>
     * </tr>
     * <tr>
     * <td>StyleTOC1</td>
     * <td>–20</td>
     * <td>StyleClosing</td>
     * <td>–64</td>
     * </tr>
     * <tr>
     * <td>StyleTOC2</td>
     * <td>–21</td>
     * <td>StyleSignature</td>
     * <td>–65</td>
     * </tr>
     * <tr>
     * <td>StyleTOC3</td>
     * <td>–22</td>
     * <td>StyleDefaultParagraphFont</td>
     * <td>–66</td>
     * </tr>
     * <tr>
     * <td>StyleTOC4</td>
     * <td>–23</td>
     * <td>StyleBodyText</td>
     * <td>–67</td>
     * </tr>
     * <tr>
     * <td>StyleTOC5</td>
     * <td>–24</td>
     * <td>StyleBodyTextIndent</td>
     * <td>–68</td>
     * </tr>
     * <tr>
     * <td>StyleTOC6</td>
     * <td>–25</td>
     * <td>StyleListContinue</td>
     * <td>–69</td>
     * </tr>
     * <tr>
     * <td>StyleTOC7</td>
     * <td>–26</td>
     * <td>StyleListContinue2</td>
     * <td>–70</td>
     * </tr>
     * <tr>
     * <td>StyleTOC8</td>
     * <td>–27</td>
     * <td>StyleListContinue3</td>
     * <td>–71</td>
     * </tr>
     * <tr>
     * <td>StyleTOC9</td>
     * <td>–28</td>
     * <td>StyleListContinue4</td>
     * <td>–72</td>
     * </tr>
     * <tr>
     * <td>StyleNormalIndent</td>
     * <td>–29</td>
     * <td>StyleListContinue5</td>
     * <td>–73</td>
     * </tr>
     * <tr>
     * <td>StyleFootnoteText</td>
     * <td>–30</td>
     * <td>StyleMessageHeader</td>
     * <td>–74</td>
     * </tr>
     * <tr>
     * <td>StyleAnnotationText</td>
     * <td>–31</td>
     * <td>StyleSubtitle</td>
     * <td>–75</td>
     * </tr>
     * <tr>
     * <td>StyleHeader</td>
     * <td>–32</td>
     * <td>StyleSalutation</td>
     * <td>–76</td>
     * </tr>
     * <tr>
     * <td>StyleFooter</td>
     * <td>–33</td>
     * <td>StyleDate</td>
     * <td>–77</td>
     * </tr>
     * <tr>
     * <td>StyleIndexHeading</td>
     * <td>–34</td>
     * <td>StyleBodyTextFirstIndent</td>
     * <td>–78</td>
     * </tr>
     * <tr>
     * <td>StyleCaption</td>
     * <td>–35</td>
     * <td>StyleBodyTextFirstIndent2</td>
     * <td>–79</td>
     * </tr>
     * <tr>
     * <td>StyleTableofFigures</td>
     * <td>–36</td>
     * <td>StyleNoteHeading</td>
     * <td>–80</td>
     * </tr>
     * <tr>
     * <td>StyleEnvelopeAddress</td>
     * <td>–37</td>
     * <td>StyleBodyText2</td>
     * <td>–81</td>
     * </tr>
     * <tr>
     * <td>StyleEnvelopeReturn</td>
     * <td>–38</td>
     * <td>StyleBodyText3</td>
     * <td>–82</td>
     * </tr>
     * <tr>
     * <td>StyleFootnoteReference</td>
     * <td>–39</td>
     * <td>StyleBodyTextIndent2</td>
     * <td>–83</td>
     * </tr>
     * <tr>
     * <td>StyleAnnotationReference</td>
     * <td>–40</td>
     * <td>StyleBodyTextIndent3</td>
     * <td>–84</td>
     * </tr>
     * <tr>
     * <td>StyleLineNumber</td>
     * <td>–41</td>
     * <td>StyleBlockQuotation</td>
     * <td>–85</td>
     * </tr>
     * <tr>
     * <td>StylePageNumber</td>
     * <td>–42</td>
     * <td>StyleHyperlink</td>
     * <td>–86</td>
     * </tr>
     * <tr>
     * <td>StyleEndnoteReference</td>
     * <td>–43</td>
     * <td>StyleHyperlinkFollowed</td>
     * <td>–87</td>
     * </tr>
     * <tr>
     * <td>StyleEndnoteText</td>
     * <td>–44</td>
     * <td> 
     * 						</td>
     * <td> 
     * 						</td>
     * </tr>
     * </table>
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The paragraph style handle. For more information, see the Remarks.
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-getstyle
     */
    GetStyle() {
        result := ComCall(12, this, "int*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Sets the paragraph style for the paragraphs in a range.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * New paragraph style handle. For a list of styles, see the Remarks section of <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextpara-getstyle">ITextPara::GetStyle</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If <b>ITextPara::SetStyle</b> succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Value</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Meaning
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
     * Invalid argument.
     * 
     * </td>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The paragraph formatting object is attached to a range that has been deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-setstyle
     */
    SetStyle(Value) {
        result := ComCall(13, this, "int", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the current paragraph alignment value.
     * @returns {Integer} Type: <b>long*</b>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-getalignment
     */
    GetAlignment() {
        result := ComCall(14, this, "int*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Sets the paragraph alignment.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * New paragraph alignment. For a list of possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextpara-getalignment">ITextPara::GetAlignment</a> method.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If <b>ITextPara::SetAlignment</b> succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Value</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Meaning
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
     * Invalid argument.
     * 
     * </td>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The paragraph formatting object is attached to a range that has been deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-setalignment
     */
    SetAlignment(Value) {
        result := ComCall(15, this, "int", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines whether automatic hyphenation is enabled for the range.
     * @remarks
     * This property corresponds to the PFE_DONOTHYPHEN effect described in the <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-paraformat2">PARAFORMAT2</a> structure.
     * @returns {Integer} Type: <b>long*</b>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-gethyphenation
     */
    GetHyphenation() {
        result := ComCall(16, this, "int*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Controls hyphenation for the paragraphs in the range.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * Indicates how hyphenation is controlled. It can be one of the following possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>tomTrue</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Automatic hyphenation is enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>tomFalse</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Automatic hyphenation is disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>tomUndefined</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The hyphenation property is undefined.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If <b>ITextPara::SetHyphenation</b> succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Value</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Meaning
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
     * Invalid argument.
     * 
     * </td>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The paragraph formatting object is attached to a range that has been deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-sethyphenation
     */
    SetHyphenation(Value) {
        result := ComCall(17, this, "int", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the amount used to indent the first line of a paragraph relative to the left indent. The left indent is the indent for all lines of the paragraph except the first line.
     * @remarks
     * To set the first line indentation amount, call the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextpara-setindents">ITextPara::SetIndents</a> method.
     * 
     * To get and set the indent for all other lines of the paragraph (that is, the left
     * 				indent), use <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextpara-getleftindent">ITextPara::GetLeftIndent</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextpara-setindents">ITextPara::SetIndents</a>.
     * @returns {Float} Type: <b>float*</b>
     * 
     * The first-line indentation amount in floating-point points.
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-getfirstlineindent
     */
    GetFirstLineIndent() {
        result := ComCall(18, this, "float*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Determines whether page breaks are allowed within paragraphs.
     * @remarks
     * This property corresponds to the PFE_KEEP effect described in the <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-paraformat2">PARAFORMAT2</a> structure.
     * @returns {Integer} Type: <b>long*</b>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-getkeeptogether
     */
    GetKeepTogether() {
        result := ComCall(19, this, "int*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Controls whether page breaks are allowed within a paragraph in a range.
     * @remarks
     * This property corresponds to the PFE_KEEP effect described in the <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-paraformat2">PARAFORMAT2</a> structure.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * Indicates whether page breaks are allowed within a paragraph in a range. It can be one of the following possible values. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>tomTrue</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Page breaks are not allowed within a paragraph.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>tomFalse</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Page breaks are allowed within a paragraph.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>tomUndefined</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property is undefined.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If <b>ITextPara::SetKeepTogether</b> succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Value</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Meaning
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
     * Invalid argument.
     * 
     * </td>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The paragraph formatting object is attached to a range that has been deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-setkeeptogether
     */
    SetKeepTogether(Value) {
        result := ComCall(20, this, "int", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines whether page breaks are allowed between paragraphs in the range.
     * @remarks
     * This property corresponds to the PFE_KEEPNEXT effect described in the <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-paraformat2">PARAFORMAT2</a> structure.
     * @returns {Integer} Type: <b>long*</b>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-getkeepwithnext
     */
    GetKeepWithNext() {
        result := ComCall(21, this, "int*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Controls whether page breaks are allowed between the paragraphs in a range.
     * @remarks
     * This property corresponds to the PFE_KEEPNEXT effect described in the <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-paraformat2">PARAFORMAT2</a> structure.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * Indicates if page breaks can be used between the paragraphs of a range. It can be one of the following possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>tomTrue</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Page breaks are not allowed between paragraphs.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>tomFalse</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Page breaks are allowed between paragraphs.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>tomUndefined</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property is undefined.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If <b>ITextPara::SetKeepWithNext</b> succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Value</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Meaning
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
     * Invalid argument.
     * 
     * </td>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The paragraph formatting object is attached to a range that has been deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-setkeepwithnext
     */
    SetKeepWithNext(Value) {
        result := ComCall(22, this, "int", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the distance used to indent all lines except the first line of a paragraph. The distance is relative to the left margin.
     * @remarks
     * To set the left indentation amount, call the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextpara-setindents">ITextPara::SetIndents</a> method.
     * 
     * To get the first-line indent, call <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextpara-getfirstlineindent">ITextPara::GetFirstLineIndent</a>.
     * @returns {Float} Type: <b>float*</b>
     * 
     * The left indentation, in floating-point points.
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-getleftindent
     */
    GetLeftIndent() {
        result := ComCall(23, this, "float*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Retrieves the line-spacing value for the text range.
     * @remarks
     * To retrieve the line-spacing rule, call the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextpara-getlinespacingrule">ITextPara::GetLineSpacingRule</a> method.
     * @returns {Float} Type: <b>float*</b>
     * 
     * The line-spacing value. The following table shows how this value is interpreted for the different line-spacing rules. 
     * 					
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Line spacing rule</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>tomLineSpaceSingle</td>
     * <td>The line-spacing value is ignored. </td>
     * </tr>
     * <tr>
     * <td>tomLineSpace1pt5</td>
     * <td>The line-spacing value is ignored. </td>
     * </tr>
     * <tr>
     * <td>tomLineSpaceDouble</td>
     * <td>The line-spacing value is ignored. </td>
     * </tr>
     * <tr>
     * <td>tomLineSpaceAtLeast</td>
     * <td>The line-spacing value specifies the spacing, in floating-point points, from one line to the next. However, if the value is less than single spacing, the control displays single-spaced text.</td>
     * </tr>
     * <tr>
     * <td>tomLineSpaceExactly</td>
     * <td>The line-spacing value specifies the exact spacing, in floating-point points, from one line to the next (even if the value is less than single spacing).</td>
     * </tr>
     * <tr>
     * <td>tomLineSpaceMultiple</td>
     * <td>The line-spacing value specifies the line spacing, in lines.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-getlinespacing
     */
    GetLineSpacing() {
        result := ComCall(24, this, "float*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Retrieves the line-spacing rule for the text range.
     * @returns {Integer} Type: <b>long*</b>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-getlinespacingrule
     */
    GetLineSpacingRule() {
        result := ComCall(25, this, "int*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Retrieves the kind of alignment to use for bulleted and numbered lists.
     * @remarks
     * For a description of the different types of lists, see the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextpara-getlisttype">ITextPara::GetListType</a> method.
     * @returns {Integer} Type: <b>long*</b>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-getlistalignment
     */
    GetListAlignment() {
        result := ComCall(26, this, "int*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Sets the alignment of bulleted or numbered text used for paragraphs.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * New list alignment value. For possible values, see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextpara-getlistalignment">ITextPara::GetListAlignment</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If <b>ITextPara::SetListAlignment</b> succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Value</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Meaning
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
     * Invalid argument.
     * 
     * </td>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The paragraph formatting object is attached to a range that has been deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-setlistalignment
     */
    SetListAlignment(Value) {
        result := ComCall(27, this, "int", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the list level index used with paragraphs.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * A variable that is the list level index. The value of <i>pValue</i> can be one of the following. 
     * 					
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>No list.</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>First-level (outermost) list.</td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>Second-level (nested) list. This is nested under a level 1 list item.</td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>Third-level (nested) list. This is nested under a level 2 list item.</td>
     * </tr>
     * <tr>
     * <td>and so forth</td>
     * <td>Nesting continues similarly.</td>
     * </tr>
     * </table>
     *  
     * 
     * Up to three levels are common in HTML documents.
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-getlistlevelindex
     */
    GetListLevelIndex() {
        result := ComCall(28, this, "int*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Sets the list level index used for paragraphs.
     * @remarks
     * Setting the list level index does not automatically change a list's indentation and other paragraph properties.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * New list level index value. For possible values, see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextpara-getlistlevelindex">ITextPara::GetListLevelIndex</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If <b>ITextPara::SetListLevelIndex</b> succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Value</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Meaning
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
     * Invalid argument.
     * 
     * </td>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The paragraph formatting object is attached to a range that has been deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-setlistlevelindex
     */
    SetListLevelIndex(Value) {
        result := ComCall(29, this, "int", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the starting value or code of a list numbering sequence.
     * @remarks
     * For a discussion on which sequence to use, see the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextpara-getlisttype">ITextPara::GetListType</a> method.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The starting value or code of a list numbering sequence. For the possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextpara-getlisttype">ITextPara::GetListType</a> method.
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-getliststart
     */
    GetListStart() {
        result := ComCall(30, this, "int*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Sets the starting number or Unicode value for a numbered list.
     * @remarks
     * Other characteristics of a list are specified by <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextpara-setlisttype">ITextPara::SetListType</a>.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * New starting number or Unicode value for a numbered list.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If <b>ITextPara::SetListStart</b> succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Value</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Meaning
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
     * Invalid argument.
     * 
     * </td>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The paragraph formatting object is attached to a range that has been deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-setliststart
     */
    SetListStart(Value) {
        result := ComCall(31, this, "int", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the list tab setting, which is the distance between the first-line indent and the text on the first line. The numbered or bulleted text is left-justified, centered, or right-justified at the first-line indent value.
     * @remarks
     * To determine whether the numbered or bulleted text is left-justified, centered, or right-justified, call <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextpara-getlistalignment">ITextPara::GetListAlignment</a>.
     * @returns {Float} Type: <b>float*</b>
     * 
     * The list tab setting. The list tab value is in floating-point points.
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-getlisttab
     */
    GetListTab() {
        result := ComCall(32, this, "float*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Sets the list tab setting, which is the distance between the first indent and the start of the text on the first line.
     * @param {Float} Value Type: <b>float</b>
     * 
     * New list tab value, in floating-point points.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If <b>ITextPara::SetListTab</b> succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Value</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Meaning
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
     * Invalid argument.
     * 
     * </td>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The paragraph formatting object is attached to a range that has been deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-setlisttab
     */
    SetListTab(Value) {
        result := ComCall(33, this, "float", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the kind of numbering to use with paragraphs.
     * @remarks
     * Values above 32 correspond to Unicode values for bullets. 
     * 
     * The mobile Microsoft Office version of the rich edit control uses <a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomIgnoreNumberStyle</a> to suppress setting the style.
     * 
     * The following Microsoft Visual Basic for Applications (VBA) example numbers the paragraphs in a range, starting with the number 2 and following the numbers with a period.
     *             
     * 
     * 
     * ```
     *     range.Para.ListStart = 2
     *     range.Para.ListType = tomListNumberAsArabic + tomListPeriod
     * ```
     * 
     * 
     * For an example of <a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomListNumberAsSequence</a>, set <c>ListStart</c> to 0x2780, which gives you circled numbers. The <a href="https://www.unicode.org/standard/standard.html">Unicode Standard</a> has examples of many more numbering sequences.
     * @returns {Integer} Type: <b>long*</b>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-getlisttype
     */
    GetListType() {
        result := ComCall(34, this, "int*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Sets the type of list to be used for paragraphs.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * New list type. For possible list types, see the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextpara-getlisttype">ITextPara::GetListType</a> method.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If <b>ITextPara::SetListType</b> succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Value</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Meaning
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
     * Invalid argument.
     * 
     * </td>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The paragraph formatting object is attached to a range that has been deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-setlisttype
     */
    SetListType(Value) {
        result := ComCall(35, this, "int", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines whether paragraph numbering is enabled.
     * @remarks
     * Paragraph numbering is when the paragraphs of a range are numbered. The number appears on the first line of a paragraph.
     * @returns {Integer} Type: <b>long*</b>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-getnolinenumber
     */
    GetNoLineNumber() {
        result := ComCall(36, this, "int*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Determines whether to suppress line numbering of paragraphs in a range.
     * @remarks
     * This property concerns the numbering of paragraphs in a range. If 
     * 				<i>Value</i> is <b>tomFalse</b>, the number of the paragraph appears on the first line of the paragraph.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * Indicates if line numbering is suppressed. It can be one of the following possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>tomTrue</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Line numbering is disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>tomFalse</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Line numbering is enabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>tomUndefined</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The property is undefined.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If <b>ITextPara::SetNoLineNumber</b> succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Value</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Meaning
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
     * Invalid argument.
     * 
     * </td>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The paragraph formatting object is attached to a range that has been deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-setnolinenumber
     */
    SetNoLineNumber(Value) {
        result := ComCall(37, this, "int", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines whether each paragraph in the range must begin on a new page.
     * @returns {Integer} Type: <b>long*</b>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-getpagebreakbefore
     */
    GetPageBreakBefore() {
        result := ComCall(38, this, "int*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Controls whether there is a page break before each paragraph in a range.
     * @remarks
     * This method is included for compatibility with Microsoft Word; it does not affect how the rich edit control displays text.
     * @param {Integer} Value Type: <b>long</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If <b>ITextPara::SetPageBreakBefore</b> succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Value</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Meaning
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
     * Invalid argument.
     * 
     * </td>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The paragraph formatting object is attached to a range that has been deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-setpagebreakbefore
     */
    SetPageBreakBefore(Value) {
        result := ComCall(39, this, "int", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the size of the right margin indent of a paragraph.
     * @returns {Float} Type: <b>float*</b>
     * 
     * The right indentation, in floating-point points.
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-getrightindent
     */
    GetRightIndent() {
        result := ComCall(40, this, "float*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Sets the right margin of paragraph.
     * @param {Float} Value Type: <b>float</b>
     * 
     * Right indent, in floating-point points.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If <b>ITextPara::SetRightIndent</b> succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Value</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Meaning
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
     * Invalid argument.
     * 
     * </td>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The paragraph formatting object is attached to a range that has been deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-setrightindent
     */
    SetRightIndent(Value) {
        result := ComCall(41, this, "float", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the first-line indent, the left indent, and the right indent for a paragraph.
     * @remarks
     * Line indents are not allowed to position text in the margins. If the first-line indent is set to a negative value (for an outdented paragraph) while the left indent is zero, the first-line indent is reset to zero. To avoid this problem while retaining property sets, set the first-line indent value equal to zero either explicitly or by calling the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextpara-reset">ITextPara::Reset</a> method. Then, call <b>ITextPara::SetIndents</b> to set a nonnegative, left-indent value and set the desired first-line indent.
     * @param {Float} First Type: <b>float</b>
     * 
     * Indent of the first line in a paragraph, relative to the left indent. The value is in floating-point points and can be positive or negative.
     * @param {Float} Left Type: <b>float</b>
     * 
     * Left indent of all lines except the first line in a paragraph, relative to left margin. The value is in floating-point points and can be positive or negative.
     * @param {Float} Right Type: <b>float</b>
     * 
     * Right indent of all lines in paragraph, relative to the right margin. The value is in floating-point points and can be positive or negative. This value is optional.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If <b>ITextPara::SetIndents</b> succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Value</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Meaning
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
     * Invalid argument.
     * 
     * </td>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The paragraph formatting object is attached to a range that has been deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-setindents
     */
    SetIndents(First, Left, Right) {
        result := ComCall(42, this, "float", First, "float", Left, "float", Right, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the paragraph line-spacing rule and the line spacing for a paragraph.
     * @remarks
     * The line-spacing rule and line spacing work together, and as a result, they must be set together, much as the first and left indents need to be set together.
     * @param {Integer} Rule Type: <b>long</b>
     * 
     * Value of new line-spacing rule. For a list of possible rule values and further discussion, see the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextpara-getlinespacingrule">ITextPara::GetLineSpacingRule</a> method.
     * @param {Float} Spacing Type: <b>float</b>
     * 
     * Value of new line spacing. If the line-spacing rule treats the <i>Spacing</i> value as a linear dimension, then <i>Spacing</i> is given in floating-point points.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If <b>ITextPara::SetLineSpacing</b> succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Value</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Meaning
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
     * Invalid argument.
     * 
     * </td>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The paragraph formatting object is attached to a range that has been deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-setlinespacing
     */
    SetLineSpacing(Rule, Spacing) {
        result := ComCall(43, this, "int", Rule, "float", Spacing, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the amount of vertical space below a paragraph.
     * @returns {Float} Type: <b>float*</b>
     * 
     * The space-after value, in floating-point points.
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-getspaceafter
     */
    GetSpaceAfter() {
        result := ComCall(44, this, "float*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Sets the amount of space that follows a paragraph.
     * @param {Float} Value Type: <b>float</b>
     * 
     * New space-after value, in floating-point points.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If <b>ITextPara::SetSpaceAfter</b> succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Value</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Meaning
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
     * Invalid argument.
     * 
     * </td>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The paragraph formatting object is attached to a range that has been deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-setspaceafter
     */
    SetSpaceAfter(Value) {
        result := ComCall(45, this, "float", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the amount of vertical space above a paragraph.
     * @returns {Float} Type: <b>float*</b>
     * 
     * The space-before value, in floating-point points.
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-getspacebefore
     */
    GetSpaceBefore() {
        result := ComCall(46, this, "float*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Sets the amount of space preceding a paragraph.
     * @param {Float} Value Type: <b>float</b>
     * 
     * New space-before value, in floating-point points.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If <b>ITextPara::SetSpaceBefore</b> succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Value</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Meaning
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
     * Invalid argument.
     * 
     * </td>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The paragraph formatting object is attached to a range that has been deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-setspacebefore
     */
    SetSpaceBefore(Value) {
        result := ComCall(47, this, "float", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the widow and orphan control state for the paragraphs in a range.
     * @remarks
     * A widow is created when the last line of a paragraph is printed by itself at the top of a page. An orphan is when the first line of a paragraph is printed by itself at the bottom of a page.
     * @returns {Integer} Type: <b>long*</b>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-getwidowcontrol
     */
    GetWidowControl() {
        result := ComCall(48, this, "int*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Controls the suppression of widows and orphans.
     * @remarks
     * This method is included for compatibility with Microsoft Word; it does not affect how the rich edit control displays text.
     * 
     * A widow is created when the last line of a paragraph is printed by itself at the top of a page. An orphan is when the first line of a paragraph is printed by itself at the bottom of a page.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * A tomBool value that controls the suppression of widows and orphans. It can be one of the following possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>tomTrue</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Prevents printing of widows and orphans.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>tomFalse</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allows printing of widows and orphans.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>tomToggle</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value is toggled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>tomUndefined</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No change.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If <b>ITextPara::SetWidowControl</b> succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Value</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Meaning
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
     * Invalid argument.
     * 
     * </td>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The paragraph formatting object is attached to a range that has been deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-setwidowcontrol
     */
    SetWidowControl(Value) {
        result := ComCall(49, this, "int", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the tab count.
     * @remarks
     * The tab count of a new instance can be nonzero, depending on the underlying text engine. For example, Microsoft Word stories begin with no explicit tabs defined, while rich edit instances start with a single explicit tab. To be sure there are no explicit tabs (that is, to set the tab count to zero), call <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextpara-clearalltabs">ITextPara::ClearAllTabs</a>.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The tab count.
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-gettabcount
     */
    GetTabCount() {
        result := ComCall(50, this, "int*", &pCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pCount
    }

    /**
     * Adds a tab at the displacement tbPos, with type tbAlign, and leader style, tbLeader.
     * @remarks
     * It is assumed that there is never a tab at position zero. If multiple paragraphs are described, the common subset of tabs will be returned with 0x8000 in the upper word of the tab type.
     * @param {Float} tbPos Type: <b>float</b>
     * 
     * New tab displacement, in floating-point points.
     * @param {Integer} tbAlign Type: <b>long</b>
     * 
     * Alignment options for the tab position. It can be one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomAlignLeft"></a><a id="tomalignleft"></a><a id="TOMALIGNLEFT"></a><dl>
     * <dt><b>tomAlignLeft</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Text is left justified from the tab position. This is the default.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomAlignCenter"></a><a id="tomaligncenter"></a><a id="TOMALIGNCENTER"></a><dl>
     * <dt><b>tomAlignCenter</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Text is centered on the tab position.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomAlignRight"></a><a id="tomalignright"></a><a id="TOMALIGNRIGHT"></a><dl>
     * <dt><b>tomAlignRight</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Text is right justified from the tab position.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomAlignDecimal"></a><a id="tomaligndecimal"></a><a id="TOMALIGNDECIMAL"></a><dl>
     * <dt><b>tomAlignDecimal</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The decimal point is set at the tab position. This is useful for aligning a column of decimal numbers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomAlignBar"></a><a id="tomalignbar"></a><a id="TOMALIGNBAR"></a><dl>
     * <dt><b>tomAlignBar</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A vertical bar is positioned at the tab position. Text is not affected. Alignment bars on nearby lines at the same position form a continuous vertical line.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} tbLeader Type: <b>long</b>
     * 
     * Leader character style. A leader character is the character that is used to fill the space taken by a tab character. It can be one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomSpaces"></a><a id="tomspaces"></a><a id="TOMSPACES"></a><dl>
     * <dt><b>tomSpaces</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Spaces are used. This is the default.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomDots"></a><a id="tomdots"></a><a id="TOMDOTS"></a><dl>
     * <dt><b>tomDots</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dots are used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomDashes"></a><a id="tomdashes"></a><a id="TOMDASHES"></a><dl>
     * <dt><b>tomDashes</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A dashed line is used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomLines"></a><a id="tomlines"></a><a id="TOMLINES"></a><dl>
     * <dt><b>tomLines</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A solid line is used.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If <b>ITextPara::AddTab</b> succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes.  For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Value</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Meaning
     * 
     * </td>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The paragraph format object is attached to a range that has been deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-addtab
     */
    AddTab(tbPos, tbAlign, tbLeader) {
        result := ComCall(51, this, "float", tbPos, "int", tbAlign, "int", tbLeader, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Clears all tabs, reverting to equally spaced tabs with the default tab spacing.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If <b>ITextPara::ClearAllTabs</b> succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes.  For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Value</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Meaning
     * 
     * </td>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The paragraph format object is attached to a range that has been deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-clearalltabs
     */
    ClearAllTabs() {
        result := ComCall(52, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Deletes a tab at a specified displacement.
     * @param {Float} tbPos Type: <b>float</b>
     * 
     * Displacement, in floating-point points, at which a tab should be deleted.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If <b>ITextPara::DeleteTab</b> succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes.  For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Value</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Meaning
     * 
     * </td>
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>tbPos</i> value is less than or equal to zero.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The paragraph format object is attached to a range that has been deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-deletetab
     */
    DeleteTab(tbPos) {
        result := ComCall(53, this, "float", tbPos, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves tab parameters (displacement, alignment, and leader style) for a specified tab.
     * @param {Integer} iTab Type: <b>long</b>
     * 
     * Index of tab for which to retrieve info. It can be either a numerical index or a special value (see the following table). Since tab indexes are zero-based, <i>iTab</i> = zero gets the first tab defined, <i>iTab</i> = 1 gets the second tab defined, and so forth. The following table summarizes all of the possible values of <i>iTab</i>. 
     * 					
     * 
     * <table class="clsStd">
     * <tr>
     * <th><i>iTab</i></th>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>tomTabBack</td>
     * <td>–3</td>
     * <td>Get tab previous to * <i>ptbPos</i></td>
     * </tr>
     * <tr>
     * <td>tomTabNext</td>
     * <td>–2</td>
     * <td>Get tab following * <i>ptbPos</i></td>
     * </tr>
     * <tr>
     * <td>tomTabHere </td>
     * <td>–1</td>
     * <td>Get tab at * <i>ptbPos</i></td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>&gt;= 0</td>
     * <td>Get tab with index of <i>iTab</i> (and ignore <i>ptbPos</i>).</td>
     * </tr>
     * </table>
     * @param {Pointer<Float>} ptbPos Type: <b>float*</b>
     * 
     * The tab displacement, in floating-point points. The value of * <i>ptbPos</i> is zero if the tab does not exist and the value of * <i>ptbPos</i> is tomUndefined if there are multiple values in the associated range.
     * @param {Pointer<Integer>} ptbAlign Type: <b>long*</b>
     * 
     * The tab alignment. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextpara-addtab">ITextPara::AddTab</a>.
     * @param {Pointer<Integer>} ptbLeader Type: <b>long*</b>
     * 
     * The tab leader-character style. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextpara-addtab">ITextPara::AddTab</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If <b>ITextPara::GetTab</b> succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following COM error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Value</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Meaning
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
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_RELEASED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The paragraph formatting object is attached to a range that has been deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no tab corresponding to iTab.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextpara-gettab
     */
    GetTab(iTab, ptbPos, ptbAlign, ptbLeader) {
        ptbPosMarshal := ptbPos is VarRef ? "float*" : "ptr"
        ptbAlignMarshal := ptbAlign is VarRef ? "int*" : "ptr"
        ptbLeaderMarshal := ptbLeader is VarRef ? "int*" : "ptr"

        result := ComCall(54, this, "int", iTab, ptbPosMarshal, ptbPos, ptbAlignMarshal, ptbAlign, ptbLeaderMarshal, ptbLeader, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
