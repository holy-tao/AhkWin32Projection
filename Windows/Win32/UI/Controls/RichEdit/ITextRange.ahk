#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ITextRange.ahk
#Include .\ITextFont.ahk
#Include .\ITextPara.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The ITextRange objects are powerful editing and data-binding tools that allow a program to select text in a story and then examine or change that text.
 * @remarks
 * 
 * Multiple text ranges can be active and work cooperatively on the same story and evolve with the story. For example, if one text range deletes specified text before another text range, the latter tracks the change. In this sense, text ranges are similar to Microsoft Word bookmarks, which also track editing changes. However, bookmarks cannot edit text, while text ranges can. In addition, ranges let you manipulate text without changing the selection or Clipboard, both of which are valuable to end users. The <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextselection">ITextSelection</a> interface inherits from <b>ITextRange</b> and adds some UI-oriented methods and properties as described in the section on <b>ITextSelection</b>.
 * 
 * You can look at a text range using methods based on character positions. Specifically, a text range is characterized by:
 * 
 * <ul>
 * <li>The <i>first</i> character position, <i>cpFirst</i>, which points at an insertion point immediately preceding the first character (relative to the beginning of the story) in the range.</li>
 * <li>The <i>limit</i> position, <i>cpLim</i>, which points at an insertion point immediately following the last character in the range.</li>
 * </ul>
 * The first character in a story has <i>cpFirst</i> = zero. If a <i>cp</i> argument has a value greater than the number of characters in the story, the number of characters in the story is used instead. If a <i>cp</i> argument is negative, zero is used instead. For those familiar with Microsoft Visual Basic for Applications, call the <i>cpFirst</i> property <b>Start</b> and the <i>cpLim</i> property <b>End</b> (even though the starting position of a range is also an end).
 * 
 * In the following figure, character positions are represented by the lines separating the letters. The corresponding character position values are given beneath the lines. The range starting at <i>cpFirst</i> = 5 and ending at <i>cpLim</i> = 7 contains the two-letter word is. If this figure depicts the complete text in a story, the story length is 30.
 * 
 * <img alt="Diagram of a 30-character text string, with two of the five words shaded" src="./images/textpos1.png"/>
 * The <i>length</i> of a range is given by <i>cpLim</i> - <i>cpFirst</i> or equivalently by End - Start. A range with zero length is called a <i>degenerate</i> or <i>empty</i> range and has equal <i>cp</i>* values, that is, <i>cpFirst</i> = <i>cpLim</i>. An example of a degenerate range is the current insertion point. A non-null selection is an example of a nondegenerate range.
 * 
 * Suppose that the range from 5 to 7 indicated by shaded cells in the preceding figure is told to delete its text (see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-delete">Delete</a>), thereby turning itself into an insertion point. The range from 25 to 29 would automatically track its contents, namely the word text. The following figure shows the result.
 * 
 * <img alt="Diagram of a 28-character text string, with one of the four words shaded" src="./images/textpos2.png"/>
 * In this figure, the range for text now has been <i>automatically</i> adjusted to have <i>cpFirst</i> = 23 and <i>cpLim</i> = 27. The owner of the range does not have to worry about updating the range character position values in the face of editing.
 * 
 * The names of the move methods indicate which end to move, but note that if any method attempts to move one range end past the other, both ends get moved to the target position. As a result, the insertion point is at the target position. The concept is that <i>cpFirst</i> and <i>cpLim</i> always have to obey the fundamental condition
 * 
 * 0 &lt;= <i>cpFirst</i> &lt;= <i>cpLim</i> &lt;= # characters in story
 * 
 * or equivalently for a range <i>r</i>, 0 &lt;= <i>r</i>.Start &lt;= <i>r</i>.End &lt;= <i>r</i>.StoryLength, which is what you would expect from the names of these quantities.
 * 
 * Another important feature is that all stories contain an undeletable final CR (0xD) character at the end. So even an empty story has a single character, namely the final CR. A range can select this character, but cannot become an insertion point beyond it. To see how this works, try selecting the final CR in a Word document and then press the RIGHT ARROW key to collapse it. The directory tree will collapse before the final CR, but the CR cannot be deleted. The Text Object Model (TOM) functions the same way. So, if <i>r</i>.Start &lt;= <i>r</i>.End, then <i>r</i>.End &lt;= (<i>r</i>.StoryLength – 1). For a discussion about deleting a CR, see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-delete">Delete</a>.
 * 
 * Some methods depend on a <i>Unit</i> argument, which can take on the predefined values listed in the following table.
 * 
 * <table class="clsStd">
 * <tr>
 * <th>Unit</th>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td>tomCharacter</td>
 * <td>1</td>
 * <td>Character.</td>
 * </tr>
 * <tr>
 * <td>tomWord</td>
 * <td>2</td>
 * <td>Word.</td>
 * </tr>
 * <tr>
 * <td>tomSentence</td>
 * <td>3</td>
 * <td>Sentence.</td>
 * </tr>
 * <tr>
 * <td>tomParagraph</td>
 * <td>4</td>
 * <td>Paragraph.</td>
 * </tr>
 * <tr>
 * <td>tomLine</td>
 * <td>5</td>
 * <td>Line (on display).</td>
 * </tr>
 * <tr>
 * <td>tomStory</td>
 * <td>6</td>
 * <td>Story.</td>
 * </tr>
 * <tr>
 * <td>tomScreen</td>
 * <td>7</td>
 * <td>Screen (as for PAGE UP/PAGE DOWN).</td>
 * </tr>
 * <tr>
 * <td>tomSection</td>
 * <td>8</td>
 * <td>Section.</td>
 * </tr>
 * <tr>
 * <td>tomColumn</td>
 * <td>9</td>
 * <td>Table column.</td>
 * </tr>
 * <tr>
 * <td>tomRow</td>
 * <td>10</td>
 * <td>Table row.</td>
 * </tr>
 * <tr>
 * <td>tomWindow</td>
 * <td>11</td>
 * <td>Upper-left or lower-right of the window.</td>
 * </tr>
 * <tr>
 * <td>tomCell</td>
 * <td>12</td>
 * <td>Table cell.</td>
 * </tr>
 * <tr>
 * <td>tomCharFormat</td>
 * <td>13</td>
 * <td>Run of constant character formatting.</td>
 * </tr>
 * <tr>
 * <td>tomParaFormat</td>
 * <td>14</td>
 * <td>Run of constant paragraph formatting.</td>
 * </tr>
 * <tr>
 * <td>tomTable</td>
 * <td>15</td>
 * <td>Table.</td>
 * </tr>
 * <tr>
 * <td>tomObject</td>
 * <td>16</td>
 * <td>Embedded object.</td>
 * </tr>
 * </table>
 *  
 * 
 * Most of the <i>Unit</i> values are self-explanatory. However the following descriptions are provided for additional clarity.
 * 
 * <h3><a id="tomWord"></a><a id="tomword"></a><a id="TOMWORD"></a>tomWord</h3>
 * The tomWord constant is an end of paragraph or a span of alphanumerics or punctuation including any blanks that follow. To get an on-screen feel for tomWord, watch how the caret moves when you press CTRL+RIGHT ARROW (—&gt;) or CTRL+LEFT ARROW (&lt;—) in a Word document.
 * 
 * <h3><a id="tomSentence"></a><a id="tomsentence"></a><a id="TOMSENTENCE"></a>tomSentence</h3>
 * The tomSentence constant describes a string of text that ends with a period, question mark, or exclamation mark and is followed either by one or more ASCII white space characters (9 through 0xd and 0x20), or the Unicode paragraph separator (0x2029). The trailing white space is part of the sentence. The last sentence in a story does not need to have a period, question mark, or exclamation mark. The start of a story qualifies as the start of a tomSentence, even if the string there does not qualify as a sentence grammatically. Other sentences must follow a sentence end and cannot begin with a period, question mark, or exclamation mark.
 * 
 * <h3><a id="tomParagraph"></a><a id="tomparagraph"></a><a id="TOMPARAGRAPH"></a>tomParagraph</h3>
 * The tomParagraph constant is a string of text terminated by an end-of-paragraph mark (CRLF, CR, VT (for SHIFT+ENTER), LF, FF, or 0x2029). TOM engines always have an undeletable end-of-paragraph mark at the end of a story. Thus, all TOM stories automatically have at least one tomWord, one tomSentence, and one tomParagraph.
 * 
 * <h3><a id="tomLine"></a><a id="tomline"></a><a id="TOMLINE"></a>tomLine</h3>
 * The tomLine constant corresponds to one line of text on a display, provided that a display is associated with the range. If no display is associated with a range, tomLine is treated as tomParagraph. A selection automatically has a display and a range that is a duplicate (see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-getduplicate">GetDuplicate</a>). Other ranges may not have a display, depending on the TOM engine and context.
 * 
 * Methods that move one or both ends in terms of <i>Unit</i>, such as <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-move">Move</a>, <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-moveend">MoveEnd</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-movestart">MoveStart</a>, depend on the signed <i>Count</i> argument. Except for the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextselection">ITextSelection</a> geometrical movement commands, if <i>Count</i> is greater than zero, the ends to be moved are moved forward (toward the end of the story), and if <i>Count</i> is less than zero, the ends are moved backward (toward the beginning). The default value of <i>Count</i> for these <b>Move</b> methods is 1. These methods attempt to move <i>Count Units</i>, but movement is never beyond the ends of the story.
 * 
 * Methods that move one or both ends by matching character strings or string patterns, such as <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-movewhile">MoveWhile</a>, <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-moveendwhile">MoveEndWhile</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-movestartwhile">MoveStartWhile</a>, can move up to a maximum number of characters given by the signed <i>Count</i> argument. If <i>Count</i> is greater than zero, the ends to be moved are moved forward, and if <i>Count</i> is less than zero, the ends are moved backward. Two special <i>Count</i> values, tomForward and tomBackward, are defined. These values are guaranteed to reach the end and the start of the story, respectively. The default value of <i>Count</i> is tomForward.
 * 
 * In <b>Move</b>* methods that turn a nondegenerate range into a degenerate one, such as <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-move">Move</a>, <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-movewhile">MoveWhile</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-moveuntil">MoveUntil</a>, <i>cpFirst</i> is changed if <i>Count</i> is negative and <i>cpLim</i> is changed if <i>Count</i> is positive. After this movement, the other end of the range is also moved to the new location. See the individual methods for more specific <i>Count</i> information. For nondegenerate ranges, the methods <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-movestart">MoveStart</a>, <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-moveend">MoveEnd</a>, <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-movestartwhile">MoveStartWhile</a>, <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-moveendwhile">MoveEndWhile</a>, <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-movestartuntil">MoveStartUntil</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-moveenduntil">MoveEndUntil</a> move either the starting position (Start) or the ending position (End).
 * 
 * To select a unit that corresponds to a contiguous range, such as a tomWord, tomSentence, and tomParagraph, use the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-moveend">MoveEnd</a> method. To select a unit that corresponds to a noncontiguous range, such as tomObject, use the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-endof">EndOf</a> method, since the next object may occur after substantial intermediate text, if at all. To select a tomCell unit, the range must be inside a table.
 * 
 * Examples and further explanation of the <i>Count</i> and <i>Unit</i> arguments follow. Note that TOM engines may not support all of the units in the table above. For example, rich edit controls do not offer the concepts of sections, but rather return E_NOTIMPL when given tomSection. However if a TOM engine does support a unit, it has the index value given in the table.
 * 
 * Applications typically do not implement the <b>ITextRange</b> interface. Microsoft text solutions, such as rich edit controls, implement <b>ITextRange</b> as part of their TOM implementation.
 * 
 * Applications can retrieve an <b>ITextRange</b> pointer by calling the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextdocument-range">Range</a> method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tom/nn-tom-itextrange
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextRange extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextRange
     * @type {Guid}
     */
    static IID => Guid("{8cc497c2-a1df-11ce-8098-00aa0047be5d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetText", "SetText", "GetChar", "SetChar", "GetDuplicate", "GetFormattedText", "SetFormattedText", "GetStart", "SetStart", "GetEnd", "SetEnd", "GetFont", "SetFont", "GetPara", "SetPara", "GetStoryLength", "GetStoryType", "Collapse", "Expand", "GetIndex", "SetIndex", "SetRange", "InRange", "InStory", "IsEqual", "Select", "StartOf", "EndOf", "Move", "MoveStart", "MoveEnd", "MoveWhile", "MoveStartWhile", "MoveEndWhile", "MoveUntil", "MoveStartUntil", "MoveEndUntil", "FindText", "FindTextStart", "FindTextEnd", "Delete", "Cut", "Copy", "Paste", "CanPaste", "CanEdit", "ChangeCase", "GetPoint", "SetPoint", "ScrollIntoView", "GetEmbeddedObject"]

    /**
     * Gets the plain text in this range. The Text property is the default property of the ITextRange interface.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * The text.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-gettext
     */
    GetText() {
        pbstr := BSTR()
        result := ComCall(7, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * Sets the text in this range.
     * @param {BSTR} bstr Type: <b>BSTR</b>
     * 
     * Text that replaces the current text in this range. If null, the current text is deleted.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b> value. If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following error codes. For more information about COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * Text is write-protected.
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
     * bstr is null.
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
     * Out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-settext
     */
    SetText(bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(8, this, "ptr", bstr, "HRESULT")
        return result
    }

    /**
     * Gets the character at the start position of the range.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The start character position of the range.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-getchar
     */
    GetChar() {
        result := ComCall(9, this, "int*", &pChar := 0, "HRESULT")
        return pChar
    }

    /**
     * Sets the character at the starting position of the range.
     * @param {Integer} Char Type: <b>long</b>
     * 
     * New value for character at the starting position.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b> value. If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following error codes. For more information about COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * Text is write-protected.
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
     * Out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-setchar
     */
    SetChar(Char) {
        result := ComCall(10, this, "int", Char, "HRESULT")
        return result
    }

    /**
     * Gets a duplicate of this range object.
     * @returns {ITextRange} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a>**</b>
     * 
     * The duplicate of the range.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-getduplicate
     */
    GetDuplicate() {
        result := ComCall(11, this, "ptr*", &ppRange := 0, "HRESULT")
        return ITextRange(ppRange)
    }

    /**
     * Gets an ITextRange object with the specified range's formatted text.
     * @returns {ITextRange} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a>**</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a> object with the formatted text.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-getformattedtext
     */
    GetFormattedText() {
        result := ComCall(12, this, "ptr*", &ppRange := 0, "HRESULT")
        return ITextRange(ppRange)
    }

    /**
     * Sets the formatted text of this range text to the formatted text of the specified range.
     * @param {ITextRange} pRange Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a>*</b>
     * 
     * The formatted text to replace this range's text.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following error codes. For more information about COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * Text is protected.
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
     * <i>pRange</i> is null.
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
     * Out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-setformattedtext
     */
    SetFormattedText(pRange) {
        result := ComCall(13, this, "ptr", pRange, "HRESULT")
        return result
    }

    /**
     * Gets the start character position of the range.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The start character position.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-getstart
     */
    GetStart() {
        result := ComCall(14, this, "int*", &pcpFirst := 0, "HRESULT")
        return pcpFirst
    }

    /**
     * Sets the character position for the start of this range.
     * @param {Integer} cpFirst Type: <b>long</b>
     * 
     * The new character position for the start of the range.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b> value. If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns S_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-setstart
     */
    SetStart(cpFirst) {
        result := ComCall(15, this, "int", cpFirst, "HRESULT")
        return result
    }

    /**
     * Gets the end character position of the range.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The end character position.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-getend
     */
    GetEnd() {
        result := ComCall(16, this, "int*", &pcpLim := 0, "HRESULT")
        return pcpLim
    }

    /**
     * Sets the end position of the range.
     * @param {Integer} cpLim Type: <b>long</b>
     * 
     * The new end position.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b> value. If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns S_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-setend
     */
    SetEnd(cpLim) {
        result := ComCall(17, this, "int", cpLim, "HRESULT")
        return result
    }

    /**
     * Gets an ITextFont object with the character attributes of the specified range.
     * @returns {ITextFont} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextfont">ITextFont</a>**</b>
     * 
     * The pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextfont">ITextFont</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-getfont
     */
    GetFont() {
        result := ComCall(18, this, "ptr*", &ppFont := 0, "HRESULT")
        return ITextFont(ppFont)
    }

    /**
     * Sets this range's character attributes to those of the specified ITextFont object.
     * @param {ITextFont} pFont Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextfont">ITextFont</a>*</b>
     * 
     * A font object with the desired character format.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b> value. If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following error codes. For more information about COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * Text is protected.
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
     * <i>pFont</i> is null.
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
     * Out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-setfont
     */
    SetFont(pFont) {
        result := ComCall(19, this, "ptr", pFont, "HRESULT")
        return result
    }

    /**
     * Gets an ITextPara object with the paragraph attributes of the specified range.
     * @returns {ITextPara} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextpara">ITextPara</a>**</b>
     * 
     * The pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextpara">ITextPara</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-getpara
     */
    GetPara() {
        result := ComCall(20, this, "ptr*", &ppPara := 0, "HRESULT")
        return ITextPara(ppPara)
    }

    /**
     * Sets the paragraph attributes of this range to those of the specified ITextPara object.
     * @param {ITextPara} pPara Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextpara">ITextPara</a>*</b>
     * 
     * The paragraph object with the desired paragraph format.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b> value. If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following error codes. For more information about COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * Text is write-protected.
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
     * <i>pPara</i> is null.
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
     * Out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-setpara
     */
    SetPara(pPara) {
        result := ComCall(21, this, "ptr", pPara, "HRESULT")
        return result
    }

    /**
     * Gets the count of characters in the range's story.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The count of characters in the range's story.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-getstorylength
     */
    GetStoryLength() {
        result := ComCall(22, this, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Get the type of the range's story.
     * @returns {Integer} Type: <b>long*</b>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-getstorytype
     */
    GetStoryType() {
        result := ComCall(23, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Collapses the specified text range into a degenerate point at either the beginning or end of the range.
     * @param {Integer} bStart Type: <b>long</b>
     * 
     * Flag specifying the end to collapse at. It can be one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomStart_or_tomTrue"></a><a id="tomstart_or_tomtrue"></a><a id="TOMSTART_OR_TOMTRUE"></a><dl>
     * <dt><b>tomStart or tomTrue</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Range is collapsed to the start of the range. This is the default.
     * 					
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomEnd_or_tomFalse"></a><a id="tomend_or_tomfalse"></a><a id="TOMEND_OR_TOMFALSE"></a><dl>
     * <dt><b>tomEnd or tomFalse</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Range is collapsed to the end of the range.
     * 					
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method returns an 
     * 						<b>HRESULT</b> value. If successful, it returns <b>S_OK</b>. Otherwise, it returns S_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-collapse
     */
    Collapse(bStart) {
        result := ComCall(24, this, "int", bStart, "HRESULT")
        return result
    }

    /**
     * Expands this range so that any partial units it contains are completely contained.
     * @param {Integer} Unit Type: <b>long</b>
     * 
     * Unit to include, if it is partially within the range. The default value is <c>tomWord</c>. For a list of the other <i>Unit</i> values, see the discussion under <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a>.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The count of characters added to the range. The value can be null.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-expand
     */
    Expand(Unit) {
        result := ComCall(25, this, "int", Unit, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Retrieves the story index of the Unit parameter at the specified range Start character position.
     * @param {Integer} Unit Type: <b>long</b>
     * 
     * Unit that is indexed. For a list of possible <i>Unit</i> values, see the discussion under <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a>.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The index value. The value is zero if <i>Unit</i> does not exist.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-getindex
     */
    GetIndex(Unit) {
        result := ComCall(26, this, "int", Unit, "int*", &pIndex := 0, "HRESULT")
        return pIndex
    }

    /**
     * Changes this range to the specified unit of the story.
     * @param {Integer} Unit Type: <b>long</b>
     * 
     * Unit used to index the range. For a list of unit values, see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a>.
     * @param {Integer} Index Type: <b>long</b>
     * 
     * Index for the <i>Unit</i>. This range is relocated to the <i>Unit</i> that has this index number. If positive, the numbering of <i>Unit</i>s begins at the start of the story and proceeds forward. If negative, the numbering begins at the end of the story and proceeds backward. The start of the story corresponds to an <i>Index</i> of 1 for all units that exist, and the last unit in the story corresponds to an <i>Index</i> of -1.
     * @param {Integer} Extend Type: <b>long</b>
     * 
     * Flag that indicates the extent of the range. If zero (the default), the range is collapsed to an insertion point at the start position of the specified <i>Unit</i>. If nonzero, the range is set to the entire <i>Unit</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b> value. If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following error codes. For more information about COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Index is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unit is not supported.
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
     * Failure for some other reason.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-setindex
     */
    SetIndex(Unit, Index, Extend) {
        result := ComCall(27, this, "int", Unit, "int", Index, "int", Extend, "HRESULT")
        return result
    }

    /**
     * Adjusts the range endpoints to the specified values.
     * @param {Integer} cpAnchor Type: <b>long</b>
     * 
     * The character position for the anchor end of the range.
     * @param {Integer} cpActive Type: <b>long</b>
     * 
     * The character position for the active end of the range.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-setrange
     */
    SetRange(cpAnchor, cpActive) {
        result := ComCall(28, this, "int", cpAnchor, "int", cpActive, "HRESULT")
        return result
    }

    /**
     * Determines whether this range is within or at the same text as a specified range.
     * @param {ITextRange} pRange Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a>*</b>
     * 
     * Text that is compared to the current range.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The comparison result. The pointer can be null. The method returns <i>pB</i> is <b>tomTrue</b> only if the range is in or at the same text as <i>pRange</i>.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-inrange
     */
    InRange(pRange) {
        result := ComCall(29, this, "ptr", pRange, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Determines whether this range's story is the same as a specified range's story.
     * @param {ITextRange} pRange Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a> object whose story is compared to this range's story.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The comparison result. The pointer can be null. The <i>pB</i> parameter receives <b>tomTrue</b> if this range's story is the same as that of the <i>pRange</i>; otherwise it receives <b>tomFalse</b>.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-instory
     */
    InStory(pRange) {
        result := ComCall(30, this, "ptr", pRange, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Determines whether this range has the same character positions and story as those of a specified range.
     * @param {ITextRange} pRange Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a> object that is compared to this range.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The comparison result. The pointer can be null. The <i>pB</i> parameter receives <b>tomTrue</b> if this range points at the same text (has the same start and end character positions and story) as <i>pRange</i>; otherwise it returns <b>tomFalse</b>.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-isequal
     */
    IsEqual(pRange) {
        result := ComCall(31, this, "ptr", pRange, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the start and end positions, and story values of the active selection, to those of this range.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b> value. If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns S_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-select
     */
    Select() {
        result := ComCall(32, this, "HRESULT")
        return result
    }

    /**
     * Moves the range ends to the start of the first overlapping Unit in the range.
     * @param {Integer} Unit Type: <b>long</b>
     * 
     * Unit to use in the move operation. For a list of <i>Unit</i> values, see the discussion under <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a>.
     * @param {Integer} Extend Type: <b>long</b>
     * @returns {Integer} Type: <b>long*</b>
     * 
     * Pointer to a variable that receives the number of characters that the start position is moved. It can be null. On return, <i>pDelta</i> is the signed number of characters that the insertion point or start position is moved. This value is always less than or equal to zero, because the motion is always toward the beginning of the story.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-startof
     */
    StartOf(Unit, Extend) {
        result := ComCall(33, this, "int", Unit, "int", Extend, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Moves this range's ends to the end of the last overlapping Unit in the range.
     * @param {Integer} Unit Type: <b>long</b>
     * 
     * Unit to use. Default value: <i>tomWord</i>. For a list of the other <i>Unit</i> values, see the discussion under <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a>.
     * @param {Integer} Extend Type: <b>long</b>
     * 
     * Indicator of how the shifting of the range ends is to proceed. It can be one of the following. 
     * 					
     * 
     * <table class="clsStd">
     * <tr>
     * <td>0 or <i>tomMove</i></td>
     * <td>Collapses a nondegenerate range to the End of the original range by moving the insertion point. This is the default.</td>
     * </tr>
     * <tr>
     * <td>1 (or <i>tomExtend</i>)</td>
     * <td>Moves End to the end of the overlapping <i>Unit</i>. Does not move Start.</td>
     * </tr>
     * </table>
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The count of characters that End is moved past. The value of the pointer can be null. On return, the value of
     * 					<i>pDelta</i> is the number of characters the insertion point or End is moved 
     * 					<i>plus</i> 1 if a collapse occurs to the entry End. If the range includes the final CR (carriage return) (at the end of the story) and 
     * 					<i>Extend</i> = tomMove, then
     * 					<i>pDelta</i> is set to 
     * 					–1, to indicate that the collapse occurred 
     * 					<i>before</i> the end of the range (because an insertion point cannot exist beyond the final CR).
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-endof
     */
    EndOf(Unit, Extend) {
        result := ComCall(34, this, "int", Unit, "int", Extend, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Moves the insertion point forward or backward a specified number of units. If the range is nondegenerate, the range is collapsed to an insertion point at either end, depending on Count, and then is moved.
     * @param {Integer} Unit Type: <b>long</b>
     * 
     * Unit to use. The default value is <b>tomCharacter</b>. For information on other values, see the discussion in <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a>.
     * @param {Integer} Count Type: <b>long</b>
     * 
     * Number of <i>Unit</i>s to move past. The default value is 1. If <i>Count</i> is greater than zero, motion is forward—toward the end of the story—and if <i>Count</i> is less than zero, motion is backward—toward the beginning. If <i>Count</i> is zero, the range is unchanged.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The actual number of <i>Unit</i>s the insertion point moves past. The pointer can be <b>NULL</b>. For more information, see the Remarks section.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-move
     */
    Move(Unit, Count) {
        result := ComCall(35, this, "int", Unit, "int", Count, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Moves the start postion of the range the specified number of units in the specified direction.
     * @param {Integer} Unit Type: <b>long</b>
     * 
     * Unit used in the move. The default value is <b>tomCharacter</b>. For a list of the other <i>Unit</i> values, see the discussion under <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a>.
     * @param {Integer} Count Type: <b>long</b>
     * 
     * Number of units to move. The default value is 1. If <i>Count</i> is greater than zero, motion is forward—toward the end of the story—and if <i>Count</i> is less than zero, motion is backward—toward the beginning. If  <i>Count</i> is zero, the start position is unchanged.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The actual number of units that the end is moved. The value can be null.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-movestart
     */
    MoveStart(Unit, Count) {
        result := ComCall(36, this, "int", Unit, "int", Count, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Moves the end position of the range.
     * @param {Integer} Unit Type: <b>long</b>
     * 
     * The units by which to move the end of the range. The default value is <b>tomCharacter</b>. For a list of the other unit values, see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a>.
     * @param {Integer} Count Type: <b>long</b>
     * 
     * The number of units to move past. The default value is 1. If <i>Count</i> is greater than zero, motion is forward—toward the end of the story—and if <i>Count</i> is less than zero, motion is backward—toward the beginning. If  <i>Count</i> is zero, the end position is unchanged.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The actual number of units that the end position of the range is moved past. The value can be null.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-moveend
     */
    MoveEnd(Unit, Count) {
        result := ComCall(37, this, "int", Unit, "int", Count, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Starts at a specified end of a range and searches while the characters belong to the set specified by Cset and while the number of characters is less than or equal to Count.
     * @param {Pointer<VARIANT>} Cset Type: <b>VARIANT*</b>
     * 
     * The character set to use in the match. This could be an explicit string of characters or a character-set index. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">Character Match Sets</a>.
     * @param {Integer} Count Type: <b>long</b>
     * 
     * Maximum number of characters to move past. The default value is <b>tomForward</b>, which searches to the end of the story. If <i>Count</i> is less than zero, the search starts at the start position and goes backward — toward the beginning of the story. If <i>Count</i> is greater than zero, the search starts at the end position and goes forward — toward the end of the story.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The actual count of characters end is moved. This parameter can be null.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-movewhile
     */
    MoveWhile(Cset, Count) {
        result := ComCall(38, this, "ptr", Cset, "int", Count, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Moves the start position of the range either Count characters, or just past all contiguous characters that are found in the set of characters specified by Cset, whichever is less.
     * @param {Pointer<VARIANT>} Cset Type: <b>VARIANT*</b>
     * 
     * The character set to use in the match. This could be an explicit string of characters or a character-set index. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">Character Match Sets</a>.
     * @param {Integer} Count Type: <b>long</b>
     * 
     * Maximum number of characters to move past. The default value is <b>tomForward</b>, which searches to the end of the story. If <i>Count</i> is greater than zero, the search is forward—toward the end of the story—and if <i>Count</i> is less than zero, search is backward—toward the beginning. If  <i>Count</i> is zero, the start position is unchanged.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The actual count of characters that the start position is moved. This parameter can be null.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-movestartwhile
     */
    MoveStartWhile(Cset, Count) {
        result := ComCall(39, this, "ptr", Cset, "int", Count, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Moves the end of the range either Count characters or just past all contiguous characters that are found in the set of characters specified by Cset, whichever is less.
     * @param {Pointer<VARIANT>} Cset Type: <b>VARIANT*</b>
     * 
     * The character set to use in the match. This could be an explicit string of characters or a character-set index. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">Character Match Sets</a>.
     * @param {Integer} Count Type: <b>long</b>
     * 
     * Maximum number of characters to move past. The default value is <b>tomForward</b>, which searches to the end of the story. If <i>Count</i> is greater than zero, the search moves forward (toward the end of the story). If <i>Count</i> is less than zero, the search moves backward (toward the beginning of the story). If  <i>Count</i> is zero, the end position is unchanged.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The actual number of characters that the end is moved. The value can be null.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-moveendwhile
     */
    MoveEndWhile(Cset, Count) {
        result := ComCall(40, this, "ptr", Cset, "int", Count, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Searches up to Count characters for the first character in the set of characters specified by Cset. If a character is found, the range is collapsed to that point. The start of the search and the direction are also specified by Count.
     * @param {Pointer<VARIANT>} Cset Type: <b>VARIANT*</b>
     * 
     * The character set used in the match. This could be an explicit string of characters or a character-set index. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">Character Match Sets</a>.
     * @param {Integer} Count Type: <b>long</b>
     * 
     * Maximum number of characters to move past. The default value is <b>tomForward</b>, which searches to the end of the story. If <i>Count</i> is less than zero, the search is backward starting at the start position. If <i>Count</i> is greater than zero, the search is forward starting at the end.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The number of characters the insertion point is moved, plus 1 for a match if <i>Count</i> is greater than zero, and –1 for a match if <i>Count</i> less than zero. The pointer can be null.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-moveuntil
     */
    MoveUntil(Cset, Count) {
        result := ComCall(41, this, "ptr", Cset, "int", Count, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Moves the start position of the range the position of the first character found that is in the set of characters specified by Cset, provided that the character is found within Count characters of the start position.
     * @param {Pointer<VARIANT>} Cset Type: <b>VARIANT*</b>
     * 
     * The character set to use in the match. This could be an explicit string of characters or a character-set index. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">Character Match Sets</a>.
     * @param {Integer} Count Type: <b>long</b>
     * 
     * Maximum number of characters to move past. The default value is <b>tomForward</b>, which searches to the end of the story. If <i>Count</i> is greater than zero, the search is forward—toward the end of the story—and if <i>Count</i> is less than zero, search is backward—toward the beginning. If  <i>Count</i> is zero, the start position is unchanged.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The actual number of characters the start of the range is moved, plus 1 for a match if <i>Count</i> is greater than zero, and –1 for a match if <i>Count</i> is less than zero. The value can be null.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-movestartuntil
     */
    MoveStartUntil(Cset, Count) {
        result := ComCall(42, this, "ptr", Cset, "int", Count, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Moves the range's end to the character position of the first character found that is in the set of characters specified by Cset, provided that the character is found within Count characters of the range's end.
     * @param {Pointer<VARIANT>} Cset Type: <b>VARIANT*</b>
     * 
     * The character set to use in the match. This could be an explicit string of characters or a character-set index. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">Character Match Sets</a>.
     * @param {Integer} Count Type: <b>long</b>
     * 
     * Maximum number of characters to move past. The default value is <b>tomForward</b>, which searches to the end of the story. If <i>Count</i> is greater than zero, the search moves forward (toward the end of the story). If <i>Count</i> is less than zero, the search moves backward (toward the beginning of the story). If  <i>Count</i> is zero, the end position is unchanged.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The actual number of characters that the range end is moved, plus 1 for a match if <i>Count</i> is greater than zero, and –1 for a match if <i>Count</i> is less than zero. The value can be null.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-moveenduntil
     */
    MoveEndUntil(Cset, Count) {
        result := ComCall(43, this, "ptr", Cset, "int", Count, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Searches up to Count characters for the text given by bstr. The starting position and direction are also specified by Count, and the matching criteria are given by Flags.
     * @param {BSTR} bstr Type: <b>BSTR</b>
     * 
     * String to find.
     * @param {Integer} Count Type: <b>long</b>
     * 
     * Maximum number of characters to search. It can be one of the following. 
     * 					
     * 
     * <table class="clsStd">
     * <tr>
     * <td><i>tomForward</i></td>
     * <td>Searches to the end of the story. This is the default value.</td>
     * </tr>
     * <tr>
     * <td><i>n</i> (greater than 0)</td>
     * <td>Searches forward for <i>n</i> chars, starting from <i>cpFirst.</i> If the range itself matches <i>bstr</i>, another search is attempted from <i>cpFirst</i> + 1.</td>
     * </tr>
     * <tr>
     * <td><i>n</i>(less than 0)</td>
     * <td>Searches backward for <i>n</i> chars, starting from <i>cpLim. </i>If the range itself matches <i>bstr</i>, another search is attempted from <i>cpLim</i>– 1.</td>
     * </tr>
     * <tr>
     * <td>0 (degenerate range)</td>
     * <td>Search begins after the range.</td>
     * </tr>
     * <tr>
     * <td>0 (nondegenerate range)</td>
     * <td>Search is limited to the range.</td>
     * </tr>
     * </table>
     *  
     * 
     * In all cases, if a string is found, the range limits are changed to be those of the matched string and 					<i>pLength</i> is set equal to the length of the string. If the string is not found, the range remains unchanged and <i>pLength</i> is set equal to zero.
     * @param {Integer} Flags Type: <b>long</b>
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The length of string matched.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-findtext
     */
    FindText(bstr, Count, Flags) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(44, this, "ptr", bstr, "int", Count, "int", Flags, "int*", &pLength := 0, "HRESULT")
        return pLength
    }

    /**
     * Searches up to Count characters for the string, bstr, starting at the range's Start cp (cpFirst).
     * @param {BSTR} bstr Type: <b>BSTR</b>
     * 
     * The string to search for.
     * @param {Integer} Count Type: <b>long</b>
     * 
     * Maximum number of characters to search. It can be one of the following. 
     * 					
     * 
     * <table class="clsStd">
     * <tr>
     * <td><i>tomForward</i></td>
     * <td>Search to the end of the story. This is the default value.</td>
     * </tr>
     * <tr>
     * <td><i>n </i>(greater than 0)</td>
     * <td>Search forward for <i>n</i> chars, starting from <i>cpLim.</i></td>
     * </tr>
     * <tr>
     * <td><i>n </i>(less than 0)</td>
     * <td>Search backward for <i>n</i> chars, starting from <i>cpLim.</i></td>
     * </tr>
     * </table>
     * @param {Integer} Flags Type: <b>long</b>
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The length of the matched string.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-findtextstart
     */
    FindTextStart(bstr, Count, Flags) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(45, this, "ptr", bstr, "int", Count, "int", Flags, "int*", &pLength := 0, "HRESULT")
        return pLength
    }

    /**
     * Searches up to Count characters for the string, bstr, starting from the range's End cp.
     * @param {BSTR} bstr Type: <b>BSTR</b>
     * 
     * String to search for.
     * @param {Integer} Count Type: <b>long</b>
     * 
     * Maximum number of characters to search. It can be one of the following. 
     * 					
     * 
     * <table class="clsStd">
     * <tr>
     * <td><i>tomForward</i></td>
     * <td>Search to the end of the story. This is the default value.</td>
     * </tr>
     * <tr>
     * <td><i>n</i> (greater than 0)</td>
     * <td>Search forward for <i>n</i> chars, starting from <i>cpLim.</i></td>
     * </tr>
     * <tr>
     * <td><i>n</i> (less than 0)</td>
     * <td>Search backward for 
     * 								<i>n</i> chars, starting from 
     * 								<i>cpLim.</i></td>
     * </tr>
     * </table>
     * @param {Integer} Flags Type: <b>long</b>
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The length of string matched.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-findtextend
     */
    FindTextEnd(bstr, Count, Flags) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(46, this, "ptr", bstr, "int", Count, "int", Flags, "int*", &pLength := 0, "HRESULT")
        return pLength
    }

    /**
     * Mimics the DELETE and BACKSPACE keys, with and without the CTRL key depressed.
     * @param {Integer} Unit Type: <b>long</b>
     * 
     * Unit to use. 
     * 					<i>Unit</i> can be <i>tomCharacter</i> (the default value) or <i>tomWord</i>.
     * @param {Integer} Count Type: <b>long</b>
     * 
     * Number of 
     * 					<i>Unit</i>s to delete. If 
     * 					<i>Count</i>= zero, it deletes the text in the range only. If 
     * 					<i>Count</i> is greater than zero, <b>ITextRange::Delete</b> acts as if the DELETE key was pressed 
     * 					<i>Count</i> times. If 
     * 					<i>Count</i> is less than zero, it acts as if the BACKSPACE key was pressed 
     * 					<i>Count</i> times. The default value is 1. For more information, see the Remarks.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The count of units deleted. It can be null. The
     * 					<i>pDelta</i> parameter is set equal to the number of 
     * 					<i>Unit</i>s deleted. Deleting the text in a nondegenerate range counts as one 
     * 					<i>Unit</i>.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-delete
     */
    Delete(Unit, Count) {
        result := ComCall(47, this, "int", Unit, "int", Count, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Cuts the plain or rich text to a data object or to the Clipboard, depending on the pVar parameter.
     * @returns {VARIANT} Type: <b>VARIANT*</b>
     * 
     * The cut text. 
     * 					<i>pVar</i>-&gt;ppunkVal is the out parameter for an 
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> object, provided that the following conditions exist: 
     * 				
     * 
     * <ul>
     * <li>pVar-&gt;vt = (VT_UNKNOWN | VT_BYREF) </li>
     * <li>pVar is not null </li>
     * <li>pVar-&gt;ppunkVal is not null </li>
     * </ul>
     * Otherwise, the clipboard is used.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-cut
     */
    Cut() {
        pVar := VARIANT()
        result := ComCall(48, this, "ptr", pVar, "HRESULT")
        return pVar
    }

    /**
     * Copies the text to a data object.
     * @returns {VARIANT} Type: <b>VARIANT*</b>
     * 
     * The copied text. 
     * 					<i>pVar</i>-&gt;ppunkVal is the out parameter for an 
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> provided that the following conditions exist: 
     * 					
     * 
     * <ul>
     * <li>pVar-&gt;vt = (VT_UNKNOWN | VT_BYREF) </li>
     * <li>pVar is not null </li>
     * <li>pVar-&gt;ppunkVal is not null </li>
     * </ul>
     * Otherwise, the clipboard is used.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-copy
     */
    Copy() {
        pVar := VARIANT()
        result := ComCall(49, this, "ptr", pVar, "HRESULT")
        return pVar
    }

    /**
     * Pastes text from a specified data object.
     * @param {Pointer<VARIANT>} pVar Type: <b>VARIANT*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> to paste. However, the contents of the clipboard are used if any of the following are true.
     *                 
     * 
     * <i>pVar</i> is null 
     * 
     * <i>pVar</i> punkVal is null 
     * 
     * <i>pVar</i> is not <b>VT_UNKNOWN</b>
     * 
     * <i>pVar</i> punkVal does not return an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> when queried for one
     * @param {Integer} Format Type: <b>long</b>
     * 
     * The clipboard format to use in the paste operation. Zero is best format, which usually is RTF, but <b>CF_UNICODETEXT</b> and other formats are also possible. The default value is zero. For more information, see <a href="https://docs.microsoft.com/windows/desktop/dataxchg/clipboard-formats">Clipboard Formats</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following error codes. For more information about COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * Destination is write-protected.
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
     * Destination cannot contain the text to be pasted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-paste
     */
    Paste(pVar, Format) {
        result := ComCall(50, this, "ptr", pVar, "int", Format, "HRESULT")
        return result
    }

    /**
     * Determines if a data object can be pasted, using a specified format, into the current range.
     * @param {Pointer<VARIANT>} pVar Type: <b>VARIANT*</b>
     * 
     * The 
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> to be pasted. However, the Clipboard contents are checked for pasting if any of the following are true: 
     * 					
     * 
     * <ul>
     * <li><i>pVar</i> is null </li>
     * <li><i>pVar</i>-&gt;punkVal is null </li>
     * <li><i>pVar</i>-&gt;vt is not <b>VT_UNKNOWN</b></li>
     * <li><i>pVar</i>-&gt;punkVal does not return an 
     * 							<a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> object when queried for one </li>
     * </ul>
     * @param {Integer} Format Type: <b>long</b>
     * 
     * Clipboard format that is used. Zero represents the best format, which usually is RTF, but <b>CF_UNICODETEXT</b> and other formats are also possible. The default value is zero.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">tomBool</a> value that is <b>tomTrue</b> only if the data object identified by 
     * 					<i>pVar</i> can be pasted, using the specified format, into the range. This parameter can null.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-canpaste
     */
    CanPaste(pVar, Format) {
        result := ComCall(51, this, "ptr", pVar, "int", Format, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Determines whether the specified range can be edited.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">tomBool</a> value indicating whether the range can be edited. It is <b>tomTrue</b> only if the specified range can be edited. The pointer can be null.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-canedit
     */
    CanEdit() {
        result := ComCall(52, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Changes the case of letters in this range according to the Type parameter.
     * @param {Integer} Type Type: <b>long</b>
     * 
     * Type of case change. The default value is <i>tomLower</i>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomLowerCase"></a><a id="tomlowercase"></a><a id="TOMLOWERCASE"></a><dl>
     * <dt><b>tomLowerCase</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sets all text to lowercase.
     * 						
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomUpperCase"></a><a id="tomuppercase"></a><a id="TOMUPPERCASE"></a><dl>
     * <dt><b>tomUpperCase</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sets all text to lowercase.
     * 						
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomTitleCase"></a><a id="tomtitlecase"></a><a id="TOMTITLECASE"></a><dl>
     * <dt><b>tomTitleCase</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Capitalizes the first letter of each word.
     * 						
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomSentenceCase"></a><a id="tomsentencecase"></a><a id="TOMSENTENCECASE"></a><dl>
     * <dt><b>tomSentenceCase</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Capitalizes the first letter of each sentence.
     * 						
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomToggleCase"></a><a id="tomtogglecase"></a><a id="TOMTOGGLECASE"></a><dl>
     * <dt><b>tomToggleCase</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Toggles the case of each letter.
     * 						
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method returns an 
     * 						<b>HRESULT</b> value. If successful, it returns <b>S_OK</b>. Otherwise, it returns S_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-changecase
     */
    ChangeCase(Type) {
        result := ComCall(53, this, "int", Type, "HRESULT")
        return result
    }

    /**
     * Retrieves screen coordinates for the start or end character position in the text range, along with the intra-line position.
     * @param {Integer} Type Type: <b>long</b>
     * 
     * Flag that indicates the position to retrieve. This parameter can include one value from each of the following tables. The default value is tomStart + TA_BASELINE + TA_LEFT.
     * 
     * <a id="tomAllowOffClient"></a>
     * <a id="tomallowoffclient"></a>
     * <a id="TOMALLOWOFFCLIENT"></a>
     * @param {Pointer<Integer>} px Type: <b>long*</b>
     * 
     * The x-coordinate.
     * @param {Pointer<Integer>} py Type: <b>long*</b>
     * 
     * The y-coordinate.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b> value. If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following error codes. For more information about COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either <i>px</i> or <i>py</i> is null.
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
     * Failure for some other reason.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-getpoint
     */
    GetPoint(Type, px, py) {
        pxMarshal := px is VarRef ? "int*" : "ptr"
        pyMarshal := py is VarRef ? "int*" : "ptr"

        result := ComCall(54, this, "int", Type, pxMarshal, px, pyMarshal, py, "HRESULT")
        return result
    }

    /**
     * Changes the range based on a specified point at or up through (depending on Extend) the point (x, y) aligned according to Type.
     * @param {Integer} x Type: <b>long</b>
     * 
     * Horizontal coordinate of the specified point, in absolute screen coordinates.
     * @param {Integer} y Type: <b>long</b>
     * 
     * Vertical coordinate of the specified point, in absolute screen coordinates.
     * @param {Integer} Type Type: <b>long</b>
     * 
     * The end to move to the specified point. It can be one of the following. 
     * 					
     * 
     * <table class="clsStd">
     * <tr>
     * <td><b>tomStart</b></td>
     * <td>Move the start of range.</td>
     * </tr>
     * <tr>
     * <td><b>tomEnd</b></td>
     * <td>Move the end of range.</td>
     * </tr>
     * </table>
     * @param {Integer} Extend Type: <b>long</b>
     * 
     * How to set the endpoints of the range. If <i>Extend</i> is zero (the default), the range is an insertion point at the specified point (or at the nearest point with selectable text). If <i>Extend</i> is 1, the end specified by <i>Type</i> is moved to the point and the other end is left alone.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-setpoint
     */
    SetPoint(x, y, Type, Extend) {
        result := ComCall(55, this, "int", x, "int", y, "int", Type, "int", Extend, "HRESULT")
        return result
    }

    /**
     * Scrolls the specified range into view.
     * @param {Integer} Value Type: <b>long</b>
     * 
     * Flag specifying the end to scroll into view. It can be one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomEnd"></a><a id="tomend"></a><a id="TOMEND"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomEnd</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Scrolls the end character position to appear on the bottom line.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomStart"></a><a id="tomstart"></a><a id="TOMSTART"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomStart</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Scrolls the start character position to appear on the top line. (Default value).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomNoUpScroll"></a><a id="tomnoupscroll"></a><a id="TOMNOUPSCROLL"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomNoUpScroll</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomNoVpScroll"></a><a id="tomnovpscroll"></a><a id="TOMNOVPSCROLL"></a><dl>
     * <dt><b><a href="https://docs.microsoft.com/windows/win32/api/tom/ne-tom-tomconstants">tomNoVpScroll</a></b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b> value. If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns S_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-scrollintoview
     */
    ScrollIntoView(Value) {
        result := ComCall(56, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Retrieves a pointer to the embedded object at the start of the specified range, that is, at cpFirst. The range must either be an insertion point or it must select only the embedded object.
     * @returns {IUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * The pointer to the object.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextrange-getembeddedobject
     */
    GetEmbeddedObject() {
        result := ComCall(57, this, "ptr*", &ppObject := 0, "HRESULT")
        return IUnknown(ppObject)
    }
}
