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
 * @see https://learn.microsoft.com/windows/win32/api/tom/nn-tom-itextrange
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
     * @remarks
     * The <b>ITextRange::GetText</b> method returns the plain text in the range. The Text property is the default property for <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a>; this is, it is automatically invoked for a range, as  in the following Microsoft Visual Basic for Applications (VBA) example.
     * 
     * <c>print range</c>
     * 
     * Some of the examples below use this fact. The <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-settext">ITextRange::SetText</a> method substitutes <i>bstr</i> for the range text. For processing a single character, the Char property is more efficient than the Text property and does not require creating a single character range for storing a character. If the range is degenerate, the Text property lets you insert text easily. You can also delete the text in a range, as shown in the following VBA examples.
     *             
     * 
     * <c>range.delete</c>
     * 
     * <c>range = ""</c>
     * 
     * You can use the <b>Text</b> property to copy plain text from one place to another, simply by setting one range equal to another. (This is quite different from the <b>Duplicate</b> property; for more information, see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-getduplicate">ITextRange::GetDuplicate</a>). The following Microsoft Visual Basic example statement
     *                 sets the text in the range1 to that in range2.
     * 
     * <c>range1 = range2            ' Replace range1's text by range2's</c>
     * 
     * The ranges can be in different stories or even in different applications. However, they do imply copying the text first into a <b>BSTR</b> and then from that string to the target location. For large amounts of text, the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-copy">ITextRange::Copy</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-paste">ITextRange::Paste</a> methods can be faster, since they can perform the copy directly from source to target and with any format supported by the source and target.
     * 
     * The text returned by the Text property is given in Unicode. The end-of-paragraph mark may be given by 0x2029 (the Unicode Paragraph Separator), or by carriage return/line feed (CR/LF) (0xd, 0xa), or by a carriage return alone, depending on the original file. Microsoft Word uses a carriage return alone, unless it reads another choice in from a file, the clipboard, or an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a>. The placeholder for an embedded object is given by the special character, <b>WCH_EMBEDDING</b>, which has the Unicode value 0xFFFC.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * The text.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-gettext
     */
    GetText() {
        pbstr := BSTR()
        result := ComCall(7, this, "ptr", pbstr, "HRESULT")
        return pbstr
    }

    /**
     * Sets the text in this range.
     * @remarks
     * <b>ITextRange::SetText</b> replaces the text in the range with the new text. In contrast, <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-typetext">TypeText</a> replaces the selection with the text <i>bstr</i> and leaves the selection as an insertion point just following the inserted text, just as if you had typed the text in. For UI selection behavior, see <b>TypeText</b>.
     * 
     * If, after you call <b>ITextRange::SetText</b>, you call <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-gettext">ITextRange::GetText</a>, you get back the same text that you set with the <b>ITextRange::SetText</b> method (unless some other range has changed that text in between the calls).
     * @param {BSTR} bstr Type: <b>BSTR</b>
     * 
     * Text that replaces the current text in this range. If null, the current text is deleted.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b> value. If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-settext
     */
    SetText(bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(8, this, "ptr", bstr, "HRESULT")
        return result
    }

    /**
     * Gets the character at the start position of the range.
     * @remarks
     * The following Microsoft Visual Basic example sets <i>ch</i> equal to the character at the start of the range.
     * 
     *     			
     * 
     * <c>ch = r.Char</c>
     * 
     * Similarly, <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-setchar">ITextRange::SetChar</a> overwrites the character at the start of the range with the specified character. The characters retrieved and set by these methods are <b>LONG</b> variables, which hide the way that they are stored in the backing store (as bytes, words, variable-length, and so forth), and they do not require using a <b>BSTR</b>.
     * 
     * The Char property, which can do most things that a characters collection can, has two big advantages: 
     * 
     * <ul>
     * <li>It can reference any character in the parent story instead of being limited to the parent range. </li>
     * <li>It is significantly faster, since <b>LONG</b>s are involved instead of range objects. </li>
     * </ul>
     * Accordingly, the Text Object Model (TOM) does not support a characters collection.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The start character position of the range.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-getchar
     */
    GetChar() {
        result := ComCall(9, this, "int*", &pChar := 0, "HRESULT")
        return pChar
    }

    /**
     * Sets the character at the starting position of the range.
     * @remarks
     * <b>ITextRange::SetChar</b> lets you specify the precise character code to use. However, string literals with similar looking glyphs can be misleading. 
     * 
     * The characters set by this method are <b>LONG</b> instead of a <b>BSTR</b>. This hides the way that they are stored in the backing store, (as bytes, words, variable-length, and so forth). 
     * 
     * Frequently on systems that do not have automatic word-wrapping, documents have hard carriage returns inserted just for line breaks. The following code shows a simple, but not perfect, way to convert such hard carriage returns back to blanks for the story that is associated with the range r. 
     * 
     * 
     * 
     * 
     * ```
     *     Sub EnableWrap(r As ITextRange)   // Convert false hard CRs to soft
     *         r.SetRange 0, 0               // r is set at start of story
     *         While r.Move(tomParagraph)    // Go to start of next paragraph
     *             If r.MoveWhile(C1_WHITE, 1) = 0 Then    // Next char isn't white space
     *                 r.Move tomCharacter, -1
     *                 r.SetChar = Asc(" ")    // Replace CR by blank
     *             End If
     *         Wend        // Loop till no more CRs in story
     *     End Sub
     * ```
     * 
     * 
     * Alternatively, you could use the following inside the IF loop.
     * 
     * 
     * ```
     * r.MoveStart tomCharacter, -1        // Select previous char (the CR)
     * r = " "        // Replace it with a blank
     * ```
     * 
     * 
     * This approach enables you to wrap the text to other widths. However, the algorithm isn't perfect: it assumes that a hard carriage return that is followed by anything other than white space (blank, tab, line feed, carriage return, and so forth) should be replaced by a blank. The algorithm also assumes that the carriage return character is a single character like carriage return  or the Unicode end-of-paragraph (EOP) 0x2029 character. And, the combination carriage return and line feed isn't matched and would require writing and executing more code (or use <c>FindText(^p)</c>). Another caution is that there are other cases, such as mixed code and documentation, where the algorithm does not work correctly. 
     * 
     * However, <b>ITextRange::SetChar</b> is more efficient than a replace operation that is accomplished by a delete followed by an insertion. Thus, rewriting the code without using <b>ITextRange::SetChar</b> would probably be much slower. 
     * 
     * The <i>Char</i> property, which can do most things that a characters collection can, has two big advantages: it can reference any character in the parent story instead of being limited to the parent range, and it's significantly faster, since <b>LONG</b>s rather than range objects are involved. Because of these advantages, the Text Object Model (TOM) does not support a characters collection.
     * @param {Integer} Char Type: <b>long</b>
     * 
     * New value for character at the starting position.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b> value. If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-setchar
     */
    SetChar(Char) {
        result := ComCall(10, this, "int", Char, "HRESULT")
        return result
    }

    /**
     * Gets a duplicate of this range object.
     * @remarks
     * To create an insertion point in order to traverse a range, first duplicate the range and then collapse the duplicate at its start character position. Note, a range is characterized by start and end character positions, and the story it belongs to.
     * 
     * Even if the range is actually an <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextselection">ITextSelection</a>, the duplicate returned is an <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a>. For an example, see the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-findtext">ITextRange::FindText</a> method.
     * @returns {ITextRange} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a>**</b>
     * 
     * The duplicate of the range.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-getduplicate
     */
    GetDuplicate() {
        result := ComCall(11, this, "ptr*", &ppRange := 0, "HRESULT")
        return ITextRange(ppRange)
    }

    /**
     * Gets an ITextRange object with the specified range's formatted text.
     * @remarks
     * This method, which amounts to an alias for the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-getduplicate">ITextRange::GetDuplicate</a> method, is included to be Microsoft Visual Basic for Applications (VBA)-friendly. The method returns the formatted text in a range. If the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a> does not belong to the same Text Object Model (TOM) engine, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a> for an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface. 
     * 
     * Among the formats typically supported by <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> are <b>CF_TEXT</b> and <b>CF_RTF</b>. In addition, private formats can be used to reference a text solution's own internal rich-text formats. The following Microsoft Visual Basic example uses the <b>FormattedText</b> property to replace the text in a range2, by the formatted text in range1. 
     *             
     * 
     * <c>range2.FormattedText = range1.FormattedText</c>
     * @returns {ITextRange} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a>**</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a> object with the formatted text.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-getformattedtext
     */
    GetFormattedText() {
        result := ComCall(12, this, "ptr*", &ppRange := 0, "HRESULT")
        return ITextRange(ppRange)
    }

    /**
     * Sets the formatted text of this range text to the formatted text of the specified range.
     * @remarks
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a> does not belong to the same Text Object Model (TOM) engine, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a> for an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface.
     * 
     * Among the formats typically supported by the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> are CF_TEXT and CF_RTF. In addition, private formats can be used to reference a text solution's own internal rich-text formats. The following Microsoft Visual Basic example uses the <b>FormattedText</b> property to replace the text in range2 with the formatted text in range1.
     * 
     * <c>range2.FormattedText = range1.FormattedText</c>
     * @param {ITextRange} pRange Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a>*</b>
     * 
     * The formatted text to replace this range's text.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-setformattedtext
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-getstart
     */
    GetStart() {
        result := ComCall(14, this, "int*", &pcpFirst := 0, "HRESULT")
        return pcpFirst
    }

    /**
     * Sets the character position for the start of this range.
     * @remarks
     * Note that if <i>cpFirst</i> is greater than the range's end position, this method sets the end position equal to <i>cpFirst</i>, making the range an insertion point. If this range is the selection, the start position becomes the active end and is scrolled into view if the display isn't frozen.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-setend">ITextRange::SetEnd</a> sets the range's end position, and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-setrange">ITextRange::SetRange</a> sets both range ends simultaneously. The following example shows how to convert a nondegenerate range into a degenerate one (insertion point).
     * 
     * <c>range.End = range.Start</c>
     * 
     * Similarly, <c>range.Start = range.End</c> converts the range into an insertion point at the end position.
     * 
     * The following example adds 1 to the end position, if it is not at the end of the story.
     * 
     * <c>range.End = range.End + 1</c>
     * 
     * This also makes the end position the active end of the range, and it can turn a degenerate range into a nondegenerate one.
     * @param {Integer} cpFirst Type: <b>long</b>
     * 
     * The new character position for the start of the range.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b> value. If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns S_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-setstart
     */
    SetStart(cpFirst) {
        result := ComCall(15, this, "int", cpFirst, "HRESULT")
        return result
    }

    /**
     * Gets the end character position of the range.
     * @remarks
     * Although a pointer to a range remains valid when the text is edited, this is not the case for the 
     * 				character position. A 
     * 				character position is volatile; that is, it becomes invalid as soon as text is inserted or deleted before the 
     * 				character position. Be careful about using methods that return 
     * 				character position values, especially if the values are to be stored for any duration. 
     * 
     * This method is similar to the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-getstart">ITextRange::GetStart</a> method which gets the start character position of the range.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The end character position.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-getend
     */
    GetEnd() {
        result := ComCall(16, this, "int*", &pcpLim := 0, "HRESULT")
        return pcpLim
    }

    /**
     * Sets the end position of the range.
     * @remarks
     * If the new end position is less than the start position, this method also sets the start position to  <i>cp</i>; that is, the range becomes an insertion point.
     * 
     * If this range is actually the selection, the end position becomes the active end and, if the display is not frozen, it is scrolled into view.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-setstart">ITextRange::SetStart</a> sets the range's start position and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-setrange">ITextRange::SetRange</a> sets both range ends simultaneously. To convert a nondegenerate range, r, into a degenerate one (insertion point) at  the start position, use
     * 
     * <c>r.End = r.Start</c>
     * 
     * Similarly, r.Start = r.End converts r into an insertion point at the end position.
     * 
     * To add 1 to the end position, unless it is at the end of the story, use:
     * 
     * <c>r.End = r.End + 1</c>
     * 
     * This also makes end position the active end, and it can turn a degenerate range into a nondegenerate one.
     * @param {Integer} cpLim Type: <b>long</b>
     * 
     * The new end position.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b> value. If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns S_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-setend
     */
    SetEnd(cpLim) {
        result := ComCall(17, this, "int", cpLim, "HRESULT")
        return result
    }

    /**
     * Gets an ITextFont object with the character attributes of the specified range.
     * @remarks
     * For plain-text controls, these objects do not vary from range to range, but in rich-text solutions, they do. See the section on <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextfont">ITextFont</a> for further details.
     * @returns {ITextFont} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextfont">ITextFont</a>**</b>
     * 
     * The pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextfont">ITextFont</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-getfont
     */
    GetFont() {
        result := ComCall(18, this, "ptr*", &ppFont := 0, "HRESULT")
        return ITextFont(ppFont)
    }

    /**
     * Sets this range's character attributes to those of the specified ITextFont object.
     * @remarks
     * For occasional format changes, use the <b>ITextRange::SetFont</b> method. However, to make a number of character formatting changes, it is more efficient to use a font duplicate. This is because every time you execute a statement like <c>range.font.bold = tomTrue</c>, a font object is allocated and freed. However, a font duplicate can be allocated once and used many times. Furthermore, you can save the font duplicate, reset it to the default or undefined states with the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextfont-reset">Reset</a> method, and give it values as needed for your rich-text processing. For sample code that shows how to use font duplicates, see <a href="https://docs.microsoft.com/windows/desktop/Controls/using-the-text-object-model">Using a Font Duplicate</a>.
     * @param {ITextFont} pFont Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextfont">ITextFont</a>*</b>
     * 
     * A font object with the desired character format.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b> value. If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-setfont
     */
    SetFont(pFont) {
        result := ComCall(19, this, "ptr", pFont, "HRESULT")
        return result
    }

    /**
     * Gets an ITextPara object with the paragraph attributes of the specified range.
     * @remarks
     * For plain-text controls, these objects do not vary from range to range, but in rich-text solutions, they do. See the section on <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextpara">ITextPara</a> for further details.
     * @returns {ITextPara} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextpara">ITextPara</a>**</b>
     * 
     * The pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextpara">ITextPara</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-getpara
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
     * The method returns an <b>HRESULT</b> value. If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-setpara
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-getstorylength
     */
    GetStoryLength() {
        result := ComCall(22, this, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Get the type of the range's story.
     * @returns {Integer} Type: <b>long*</b>
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-getstorytype
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-collapse
     */
    Collapse(bStart) {
        result := ComCall(24, this, "int", bStart, "HRESULT")
        return result
    }

    /**
     * Expands this range so that any partial units it contains are completely contained.
     * @remarks
     * For example, if an insertion point is at the beginning, the end, or within a word, <b>ITextRange::Expand</b> expands the range to include that word. If the range already includes one word and part of another, <b>ITextRange::Expand</b> expands the range to include both words. <b>ITextRange::Expand</b> expands the range to include the visible portion of the range's story.
     * @param {Integer} Unit Type: <b>long</b>
     * 
     * Unit to include, if it is partially within the range. The default value is <c>tomWord</c>. For a list of the other <i>Unit</i> values, see the discussion under <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a>.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The count of characters added to the range. The value can be null.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-expand
     */
    Expand(Unit) {
        result := ComCall(25, this, "int", Unit, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Retrieves the story index of the Unit parameter at the specified range Start character position.
     * @remarks
     * The <b>ITextRange::GetIndex</b> method retrieves the story index of a word, line, sentence, paragraph, and so forth, at the range Start. <i>Unit</i> specifies which kind of entity to index, such as words (<b>tomWord</b>), lines (<b>tomLine</b>), sentences (<b>tomSentence</b>), or paragraphs (<b>tomParagraph</b>). For example, <b>ITextRange::GetIndex</b> sets <i>pIndex</i> equal to the line number of the first line in the range. For a range at the end of the story, <b>ITextRange::GetIndex</b>, returns the number of <i>Unit</i>s in the story. Thus, you can get the number of words, lines, objects, and so forth, in a story.
     * 
     * The index value returned by the <b>ITextRange::GetIndex</b> method is not valid if the text is subsequently edited. Thus, users should be careful about using methods that return index values, especially if the values are to be stored for any duration. This is in contrast to a pointer to a range, which does remain valid when the text is edited.
     * @param {Integer} Unit Type: <b>long</b>
     * 
     * Unit that is indexed. For a list of possible <i>Unit</i> values, see the discussion under <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a>.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The index value. The value is zero if <i>Unit</i> does not exist.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-getindex
     */
    GetIndex(Unit) {
        result := ComCall(26, this, "int", Unit, "int*", &pIndex := 0, "HRESULT")
        return pIndex
    }

    /**
     * Changes this range to the specified unit of the story.
     * @remarks
     * This method allows an application to work with line-oriented text, such as programs, in a convenient way. For example, <c>SetIndex(tomLine, 10, 0)</c> converts a range to an insertion point at the start of the tenth line.
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
     * The method returns an <b>HRESULT</b> value. If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-setindex
     */
    SetIndex(Unit, Index, Extend) {
        result := ComCall(27, this, "int", Unit, "int", Index, "int", Extend, "HRESULT")
        return result
    }

    /**
     * Adjusts the range endpoints to the specified values.
     * @remarks
     * This method sets the range's start position to <c>min(cpActive, cpAnchor)</code>, and the end position to <code>max(cpActive, cpAnchor)</c>. If the range is a nondegenerate selection, <i>cpAnchor</i> is the active end, and <i>cpAnchor</i> is the anchor end.  If the range is a degenerate selection, the selection is displayed at the start of the line, rather than at the end of the previous line.
     * 
     * This method removes any other subranges this range may have. To preserve the current subranges, use <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange2-setactivesubrange">ITextRange2::SetActiveSubrange</a>. 
     * 
     * 
     * If the text range is a selection, you can set the attributes of the selection by using the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-setflags">ITextSelection::SetFlags</a> method.
     * @param {Integer} cpAnchor Type: <b>long</b>
     * 
     * The character position for the anchor end of the range.
     * @param {Integer} cpActive Type: <b>long</b>
     * 
     * The character position for the active end of the range.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-setrange
     */
    SetRange(cpAnchor, cpActive) {
        result := ComCall(28, this, "int", cpAnchor, "int", cpActive, "HRESULT")
        return result
    }

    /**
     * Determines whether this range is within or at the same text as a specified range.
     * @remarks
     * For range2 to be contained in range1, both ranges must be in the same story, and the limits of 
     * 				range2 must satisfy 
     * 				either of the following statements. 
     * 
     * <ul>
     * <li>The start and end character positions of range1 are the same as range2. That is, both ranges are degenerate and have identical insertion points. </li>
     * <li>Range2 is a nondegenerate range with start and end character positions at or within those of range1. </li>
     * </ul>
     * The following example shows how to walk one range with another. 
     * 
     * 
     * ```
     *     range2 = range1.Duplicate
     *     range2.End = range2.Start       ' Collapse range2 to its start position 
     *     While range2.InRange(range1)    ' Iterate so long as range2 remains within range1
     *          ...   ' This code would change the range2 character positions 
     *     Wend
     * ```
     * 
     * 
     * When the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-findtext">ITextRange::FindText</a>, <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-movewhile">ITextRange::MoveWhile</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-moveuntil">ITextRange::MoveUntil</a> method families are used, you can use one range to walk another by specifying the appropriate limit count of characters (for an example, see the Remarks in 
     * 				<b>ITextRange::Find</b>).
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-isequal">ITextRange::IsEqual</a> is a special case of <b>ITextRange::InRange</b> that returns <i>pB</i> <b>tomTrue</b> if the <i>pRange</i> has the same start and end character positions and belongs to the same story.
     * @param {ITextRange} pRange Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a>*</b>
     * 
     * Text that is compared to the current range.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The comparison result. The pointer can be null. The method returns <i>pB</i> is <b>tomTrue</b> only if the range is in or at the same text as <i>pRange</i>.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-inrange
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-instory
     */
    InStory(pRange) {
        result := ComCall(30, this, "ptr", pRange, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Determines whether this range has the same character positions and story as those of a specified range.
     * @remarks
     * The 
     * 				<b>ITextRange::IsEqual</b> method returns <b>tomTrue</b> only if the range points at the same text as <i>pRange</i>. See <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">Finding Rich Text</a> for code that compares two different pieces of text to see if they contain the same plain text and the same character formatting.
     * @param {ITextRange} pRange Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a> object that is compared to this range.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The comparison result. The pointer can be null. The <i>pB</i> parameter receives <b>tomTrue</b> if this range points at the same text (has the same start and end character positions and story) as <i>pRange</i>; otherwise it returns <b>tomFalse</b>.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-isequal
     */
    IsEqual(pRange) {
        result := ComCall(31, this, "ptr", pRange, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Sets the start and end positions, and story values of the active selection, to those of this range.
     * @remarks
     * The active end of the new selection is at the end position. 
     * 
     * The caret for an ambiguous character position is displayed at the beginning of the line.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b> value. If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns S_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-select
     */
    Select() {
        result := ComCall(32, this, "HRESULT")
        return result
    }

    /**
     * Moves the range ends to the start of the first overlapping Unit in the range.
     * @remarks
     * If the range is an insertion point on a boundary between <i>Unit</i>s, <b>ITextRange::StartOf</b> does not change the start position. 
     * 
     * The <b>ITextRange::StartOf</b> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-endof">ITextRange::EndOf</a> methods differ from the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-homekey">HomeKey</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-endkey">EndKey</a> methods in that the latter extend from the active end, whereas <b>ITextRange::StartOf</b> extends from the start position and <b>ITextRange::EndOf</b> extends from the end position.
     * @param {Integer} Unit Type: <b>long</b>
     * 
     * Unit to use in the move operation. For a list of <i>Unit</i> values, see the discussion under <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a>.
     * @param {Integer} Extend Type: <b>long</b>
     * @returns {Integer} Type: <b>long*</b>
     * 
     * Pointer to a variable that receives the number of characters that the start position is moved. It can be null. On return, <i>pDelta</i> is the signed number of characters that the insertion point or start position is moved. This value is always less than or equal to zero, because the motion is always toward the beginning of the story.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-startof
     */
    StartOf(Unit, Extend) {
        result := ComCall(33, this, "int", Unit, "int", Extend, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Moves this range's ends to the end of the last overlapping Unit in the range.
     * @remarks
     * For comparison, the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-startof">ITextRange::StartOf</a> method moves the range ends to the beginning of the first overlapping <i>Unit</i> in the range. Note, the <b>ITextRange::StartOf</b> and <b>ITextRange::EndOf</b> methods differ from the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-homekey">HomeKey</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-endkey">EndKey</a> methods in that the latter extend from the active end, whereas <b>ITextRange::StartOf</b> extends from Start and <b>ITextRange::EndOf</b> extends from End. If the range is an insertion point on a boundary between <i>Unit</i>s, <b>ITextRange::EndOf</b> does not change End. In particular, calling <b>ITextRange::EndOf</b> (<i>tomCharacter</i>, *, *) does not change End except for an insertion point at the beginning of a story.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-endof
     */
    EndOf(Unit, Extend) {
        result := ComCall(34, this, "int", Unit, "int", Extend, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Moves the insertion point forward or backward a specified number of units. If the range is nondegenerate, the range is collapsed to an insertion point at either end, depending on Count, and then is moved.
     * @remarks
     * If the range is degenerate (an insertion point), this method tries to move the insertion point <i>Count</i> <i>Unit</i>s. 
     * 
     * If the range is nondegenerate and <i>Count</i> is greater than zero, this method collapses the range at the end character position, moves the resulting insertion point forward to a <i>Unit</i> boundary (if it is not already at one), and then tries to move <i>Count</i> - 1 <i>Unit</i>s forward. If the range is nondegenerate and <i>Count</i> is less than zero, this method collapses the range at the start character position, moves the resulting insertion point backward to a <i>Unit</i> boundary (if it isn't already at one), and then tries to move |<i>Count</i>| - 1 <i>Unit</i>s backward. Thus, in both cases, collapsing a nondegenerate range to an insertion point, whether moving to the start or end of the <i>Unit</i> following the collapse, counts as a <i>Unit</i>.
     * 
     * The <b>ITextRange::Move</b> method returns <i>pDelta</i> = number of <i>Unit</i>s actually moved. This method never moves the insertion point beyond the story of this range. If <i>Count</i><i>Unit</i>s would move the insertion point before the beginning of the story, it is moved to the story beginning and <i>pDelta</i> is set accordingly. Similarly, if <i>Count</i> 
     * 				<i>Unit</i>s would move it beyond the end of the story, it is moved to the story end.
     * 
     * The <b>ITextRange::Move</b> method works similarly to the UI-oriented <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-moveleft">MoveLeft</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-moveright">MoveRight</a> methods, except that the direction of motion is logical rather than geometrical. That is, with <b>ITextRange::Move</b> the direction is either toward the end or toward the start of the story. Depending on the language, moving toward the end of the story could be moving to the left or to the right. To get a feel for <i>Count</i>, press Ctrl+Right Arrow in a Microsoft Word document for a variety of selections. In left-to-right text, this keystroke behaves the same as <c>Move(tomWord, 1)</code>, and <code>MoveRight(tomWord, 1)</c>. <i>Count</i> corresponds to the number of times you press Ctrl+Right Arrow.
     * 
     * For example, if you press Ctrl+Right Arrow for the selections shown in both of the following figures, you end up with an insertion point at character position 8, since this command collapses the selections at their end character positions (7 and 8, respectively) and moves to the next <b>tomWord</b> boundary.
     * 
     * <img alt="Character positions for text string" src="./images/textpos3.png"/>
     * <img alt="Character positions for text string" src="./images/textpos3.png"/>
     * The first selection does not include the blank space at character position 7, so Ctrl+Right Arrow moves past the space to the <b>tomWord</b> boundary at character position 8. The end character position is already at a <b>tomWord</b> boundary for the second selection, so Ctrl+Right Arrow just collapses the selection at that boundary. Similarly, Ctrl+Left Arrow, which for this text acts like <c>Move(tomWord, -1)</code>, and <code>MoveLeft(tomWord, 1)</c> collapses the first selection at character position 5, which is already at a <b>tomWord</b> boundary, so no more motion occurs. But Ctrl+Left Arrow collapses the second selection at character position 4 and then moves to zero, since that's the next <b>tomWord</b> boundary in the direction of motion.
     * 
     * The return argument, <i>pDelta</i>, is set equal to the number of <i>Unit</i>s that the insertion point is moved including one <i>Unit</i> for collapsing a nondegenerate range and moving it to a <i>Unit</i> boundary. So, if no motion and no collapse occur, as when the range is an insertion point at the end of the story, <i>pDelta</i> is set equal to zero. This approach is useful for controlling program loops that process a whole story.
     * 
     * In both of the cases mentioned above, calling <c>Move(tomWord, 1)</code> sets <i>pDelta</i> equal to 1 because the ranges were collapsed. Similarly, calling <code>Move(tomWord, -1)</c> sets <i>pDelta</i> equal to -1 for both cases. Collapsing, with or without moving part of a <i>Unit</i> to a <i>Unit</i> boundary, counts as a <i>Unit</i> moved.
     * 
     * The direction of motion refers to the logical character ordering in the plain-text backing store. This approach avoids the problems of geometrical ordering, such as left versus right and up versus down, in international software. Such geometrical methods are still needed in the edit engine, of course, since keyboards have arrow keys to invoke them. If the range is really an <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextselection">ITextSelection</a> object, then methods like <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-moveleft">MoveLeft</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-moveright">MoveRight</a> can be used.
     * 
     * If <i>Unit</i> specifies characters (<b>tomCharacter</b>), the Text Object Model (TOM) uses the Unicode character set. To convert between Unicode and multibyte character sets the <a href="https://docs.microsoft.com/windows/desktop/api/stringapiset/nf-stringapiset-multibytetowidechar">MultiByteToWideChar</a> and <a href="https://docs.microsoft.com/windows/desktop/api/stringapiset/nf-stringapiset-widechartomultibyte">WideCharToMultiByte</a> functions provide easy ways to convert between Unicode and multibyte character sets on import and export, respectively. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextdocument-open">Open</a>. In this connection, the use of a carriage return/line feed (CR/LF) to separate paragraphs is as problematic as double-byte character set (DBCS). The <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextselection">ITextSelection</a> UI methods back up over a CR/LF as if it were a single character, but the <b>ITextRange::Move</b> methods count CR/LFs as two characters. It's clearly better to use a single character as a paragraph separator, which in TOM is represented by a character return, although the Unicode paragraph separator character, 0x2029, is accepted. In general, TOM engines should support CR/LF, carriage return (CR), line feed (LF), vertical tab, form feed, and 0x2029. Microsoft Rich Edit 2.0 also supports CR/CR/LF for backward compatibility.
     * 
     * See also the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-movestart">ITextRange::MoveStart</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-moveend">ITextRange::MoveEnd</a> methods, which move the range Start or End position <i>Count</i> 
     * 				<i>Unit</i>s, respectively.
     * @param {Integer} Unit Type: <b>long</b>
     * 
     * Unit to use. The default value is <b>tomCharacter</b>. For information on other values, see the discussion in <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a>.
     * @param {Integer} Count Type: <b>long</b>
     * 
     * Number of <i>Unit</i>s to move past. The default value is 1. If <i>Count</i> is greater than zero, motion is forward—toward the end of the story—and if <i>Count</i> is less than zero, motion is backward—toward the beginning. If <i>Count</i> is zero, the range is unchanged.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The actual number of <i>Unit</i>s the insertion point moves past. The pointer can be <b>NULL</b>. For more information, see the Remarks section.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-move
     */
    Move(Unit, Count) {
        result := ComCall(35, this, "int", Unit, "int", Count, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Moves the start position of the range the specified number of units in the specified direction.
     * @remarks
     * If the new start follows the old end, the new end is set equal to the new start.
     * 
     * The motion described by <b>ITextRange::MoveStart</b> is logical rather than geometric. That is, motion is toward the end or toward the start of a story. Depending on the language, moving to the end of the story could be moving left or moving right. 
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-move">ITextRange::Move</a>.
     * @param {Integer} Unit Type: <b>long</b>
     * 
     * Unit used in the move. The default value is <b>tomCharacter</b>. For a list of the other <i>Unit</i> values, see the discussion under <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a>.
     * @param {Integer} Count Type: <b>long</b>
     * 
     * Number of units to move. The default value is 1. If <i>Count</i> is greater than zero, motion is forward—toward the end of the story—and if <i>Count</i> is less than zero, motion is backward—toward the beginning. If  <i>Count</i> is zero, the start position is unchanged.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The actual number of units that the end is moved. The value can be null.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-movestart
     */
    MoveStart(Unit, Count) {
        result := ComCall(36, this, "int", Unit, "int", Count, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Moves the end position of the range.
     * @remarks
     * If the new end position precedes the old start position, the new start position is set equal to the new end position; that is, it becomes a degenerate range or an insertion point.
     * 
     * The motion described by <b>ITextRange::MoveEnd</b> is logical rather than geometric. That is, motion is toward the end or toward the start of a story. Depending on the language, moving to the end of the story could be moving left or moving right. 
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-move">ITextRange::Move</a>.
     * @param {Integer} Unit Type: <b>long</b>
     * 
     * The units by which to move the end of the range. The default value is <b>tomCharacter</b>. For a list of the other unit values, see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a>.
     * @param {Integer} Count Type: <b>long</b>
     * 
     * The number of units to move past. The default value is 1. If <i>Count</i> is greater than zero, motion is forward—toward the end of the story—and if <i>Count</i> is less than zero, motion is backward—toward the beginning. If  <i>Count</i> is zero, the end position is unchanged.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The actual number of units that the end position of the range is moved past. The value can be null.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-moveend
     */
    MoveEnd(Unit, Count) {
        result := ComCall(37, this, "int", Unit, "int", Count, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Starts at a specified end of a range and searches while the characters belong to the set specified by Cset and while the number of characters is less than or equal to Count.
     * @remarks
     * The motion described by <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-moveuntil">ITextRange::MoveUntil</a> is logical rather than geometric. That is, motion is toward the end or toward the start of a story. Depending on the language, moving to the end of the story could be moving left or moving right. 
     * 
     * For more information, see the discussion in <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a> and the Remarks section of <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-move">ITextRange::Move</a>.
     * 
     * The <b>ITextRange::MoveWhile</b> method is similar to <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-moveuntil">ITextRange::MoveUntil</a>, but <b>MoveWhile</b> searches as long as it finds members of the set specified by <i>Cset</i>, and there is no additional increment to the value <i>pDelta</i>.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-movestartwhile">ITextRange::MoveStartWhile</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-moveendwhile">ITextRange::MoveEndWhile</a> methods move the start and end, respectively, just past all contiguous characters that are found in set of characters specified by the <i>Cset</i> parameter.
     * 
     * The <b>VARIANT</b> type is primarily intended to be used with <b>IDispatch</b> scenarios like Microsoft Visual Basic for Applications (VBA), but it can be readily used from C or C++ as well. The following C++ code illustrates how to initialize and use the <b>VARIANT</b> argument  for matching a span of digits in the range r.
     * 
     * 
     * ```
     * VariantInit(&varg);
     * varg.vt = VT_I4;
     * varg.lVal = C1_DIGIT;
     * hr = r.MoveWhile(&varg, tomForward, pDelta); // Move IP past span of digits
     * 
     * ```
     * 
     * 
     * Alternatively, an explicit string could be used, as in the following sample.
     * 
     * 
     * ```
     * VariantInit(&varg);
     * bstr = SysAllocString("0123456789");
     * varg.vt = VT_BSTR;
     * varg.bstr = bstr;
     * hr =r.MoveWhile(&varg, tomForward, pDelta);    // Move IP past span of digits
     * 
     * ```
     * 
     * 
     * The following VBA example code matches the body of the next Standard Generalized Markup Language (SGML) entry in a range, r. SGML entries start with &lt;
     * 				<c>keyword ...</c>&gt; and end with &lt;/
     * 				<c>keyword</c>&gt;. 
     * 
     * 
     * ```
     * r.Find <                  // Get to start of next tag
     * r.MoveWhile C1_SPACE      // Bypass any space characters
     * r.MoveEndWhile C1_ALPHA   // Match keyword
     * s$ = </ + r               // Create VBA string to search for
     * r.Find >                  // Bypass remainder of start tag
     * r.FindEnd s$              // Match up to end of closing keyword
     * r.FindEnd <, tomStart     // Back up to start of end tag
     *                           // r has body of SGML entry
     *                            
     * ```
     * @param {Pointer<VARIANT>} Cset Type: <b>VARIANT*</b>
     * 
     * The character set to use in the match. This could be an explicit string of characters or a character-set index. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">Character Match Sets</a>.
     * @param {Integer} Count Type: <b>long</b>
     * 
     * Maximum number of characters to move past. The default value is <b>tomForward</b>, which searches to the end of the story. If <i>Count</i> is less than zero, the search starts at the start position and goes backward — toward the beginning of the story. If <i>Count</i> is greater than zero, the search starts at the end position and goes forward — toward the end of the story.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The actual count of characters end is moved. This parameter can be null.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-movewhile
     */
    MoveWhile(Cset, Count) {
        result := ComCall(38, this, "ptr", Cset, "int", Count, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Moves the start position of the range either Count characters, or just past all contiguous characters that are found in the set of characters specified by Cset, whichever is less.
     * @remarks
     * If the new start follows the old end, the new end is set equal to the new start.
     * 
     * The motion described by <b>ITextRange::MoveStartWhile</b> is logical rather than geometric. That is, motion is toward the end or toward the start of a story. Depending on the language, moving to the end of the story could be moving left or moving right. 
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-move">ITextRange::Move</a>.
     * @param {Pointer<VARIANT>} Cset Type: <b>VARIANT*</b>
     * 
     * The character set to use in the match. This could be an explicit string of characters or a character-set index. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">Character Match Sets</a>.
     * @param {Integer} Count Type: <b>long</b>
     * 
     * Maximum number of characters to move past. The default value is <b>tomForward</b>, which searches to the end of the story. If <i>Count</i> is greater than zero, the search is forward—toward the end of the story—and if <i>Count</i> is less than zero, search is backward—toward the beginning. If  <i>Count</i> is zero, the start position is unchanged.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The actual count of characters that the start position is moved. This parameter can be null.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-movestartwhile
     */
    MoveStartWhile(Cset, Count) {
        result := ComCall(39, this, "ptr", Cset, "int", Count, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Moves the end of the range either Count characters or just past all contiguous characters that are found in the set of characters specified by Cset, whichever is less.
     * @remarks
     * If the new end precedes the old start, the new start is set equal to the new end.
     * 
     * The motion described by <b>ITextRange::MoveEndWhile</b> is logical rather than geometric. That is, motion is toward the end or toward the start of a story. Depending on the language, moving to the end of the story could be moving left or moving right. 
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-move">ITextRange::Move</a>.
     * @param {Pointer<VARIANT>} Cset Type: <b>VARIANT*</b>
     * 
     * The character set to use in the match. This could be an explicit string of characters or a character-set index. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">Character Match Sets</a>.
     * @param {Integer} Count Type: <b>long</b>
     * 
     * Maximum number of characters to move past. The default value is <b>tomForward</b>, which searches to the end of the story. If <i>Count</i> is greater than zero, the search moves forward (toward the end of the story). If <i>Count</i> is less than zero, the search moves backward (toward the beginning of the story). If  <i>Count</i> is zero, the end position is unchanged.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The actual number of characters that the end is moved. The value can be null.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-moveendwhile
     */
    MoveEndWhile(Cset, Count) {
        result := ComCall(40, this, "ptr", Cset, "int", Count, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Searches up to Count characters for the first character in the set of characters specified by Cset. If a character is found, the range is collapsed to that point. The start of the search and the direction are also specified by Count.
     * @remarks
     * If no character is matched, the range is unchanged.
     * 
     * The motion described by <b>ITextRange::MoveUntil</b> is logical rather than geometric. That is, motion is toward the end or toward the start of a story. Depending on the language, moving to the end of the story could be moving left or moving right. 
     * 
     * For more information, see the discussion in <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a> and the Remarks section of <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-move">ITextRange::Move</a>.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-movestartuntil">ITextRange::MoveStartUntil</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-moveenduntil">ITextRange::MoveEndUntil</a> methods move the start and end, respectively, until it finds the first character that is also in the set specified by the <i>Cset</i> parameter.
     * 
     * The <b>ITextRange::MoveUntil</b> method is similar to <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-movewhile">ITextRange::MoveWhile</a>, but there are two differences. First, <b>MoveUntil</b> moves an insertion point <i>until</i> it finds the first character that belongs to the character set specified by <i>Cset</i>. Second, in <b>MoveUntil</b> the character matched counts as an additional character in the value returned in <i>pDelta</i>. This lets you know that the character at one end of the range or the other belongs to the <i>Cset</i> even though the insertion point stays at one of the range ends. 
     * 
     * For example, suppose the range, r, is an insertion point. To see if the character at r (that is, given by r.<a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-getchar">GetChar</a>()) is in <i>Cset</i>, call 
     * 				
     * 
     * 
     * ```
     * r.MoveUntil(Cset, 1)
     * ```
     * 
     * 
     * If the character is in <i>Cset</i>, the return value is 1 and the insertion point does not move. Similarly, to see if the character preceding r is in <i>Cset</i>, call 
     * 
     * 				
     * 
     * 
     * ```
     * r.MoveUntil(Cset, -1)
     * ```
     * 
     * 
     * If the character is in <i>Cset</i>, the return value is –1.
     * 
     * The following Microsoft Visual Basic for Applications (VBA) subroutine prints all numbers in the story identified by the range, r.
     * 				
     * 
     * 
     * ```
     * Sub PrintNumbers (r As ITextRange)
     *    r.SetRange 0, 0    // r = insertion point at start of story
     *    While r.MoveUntil(C1_DIGIT)  // Move r to 1st digit in next number
     *       r.MoveEndWhile C1_DIGIT  // Select number (span of digits)
     *       Print r    // Print it
     *    Wend
     * End Sub
     * ```
     * @param {Pointer<VARIANT>} Cset Type: <b>VARIANT*</b>
     * 
     * The character set used in the match. This could be an explicit string of characters or a character-set index. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">Character Match Sets</a>.
     * @param {Integer} Count Type: <b>long</b>
     * 
     * Maximum number of characters to move past. The default value is <b>tomForward</b>, which searches to the end of the story. If <i>Count</i> is less than zero, the search is backward starting at the start position. If <i>Count</i> is greater than zero, the search is forward starting at the end.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The number of characters the insertion point is moved, plus 1 for a match if <i>Count</i> is greater than zero, and –1 for a match if <i>Count</i> less than zero. The pointer can be null.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-moveuntil
     */
    MoveUntil(Cset, Count) {
        result := ComCall(41, this, "ptr", Cset, "int", Count, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Moves the start position of the range the position of the first character found that is in the set of characters specified by Cset, provided that the character is found within Count characters of the start position.
     * @remarks
     * If no character from 
     * 				<i>Cset</i> is found within 
     * 				<i>Count</i> positions of the start position, the range is left unchanged. 
     * 
     * If the new start follows the old end, the new end is set equal to the new start.
     * 
     * The motion described by <b>ITextRange::MoveStartUntil</b> is logical rather than geometric. That is, motion is toward the end or toward the start of a story. Depending on the language, moving to the end of the story could be moving left or moving right. 
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-move">ITextRange::Move</a>.
     * @param {Pointer<VARIANT>} Cset Type: <b>VARIANT*</b>
     * 
     * The character set to use in the match. This could be an explicit string of characters or a character-set index. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">Character Match Sets</a>.
     * @param {Integer} Count Type: <b>long</b>
     * 
     * Maximum number of characters to move past. The default value is <b>tomForward</b>, which searches to the end of the story. If <i>Count</i> is greater than zero, the search is forward—toward the end of the story—and if <i>Count</i> is less than zero, search is backward—toward the beginning. If  <i>Count</i> is zero, the start position is unchanged.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The actual number of characters the start of the range is moved, plus 1 for a match if <i>Count</i> is greater than zero, and –1 for a match if <i>Count</i> is less than zero. The value can be null.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-movestartuntil
     */
    MoveStartUntil(Cset, Count) {
        result := ComCall(42, this, "ptr", Cset, "int", Count, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Moves the range's end to the character position of the first character found that is in the set of characters specified by Cset, provided that the character is found within Count characters of the range's end.
     * @remarks
     * If no character from the set specified by <i>Cset</i> is found within <i>Count</i> positions of the range's end, the range is left unchanged. If the new end precedes the old start, the new start is set equal to the new end.
     * 
     * The motion described by <b>ITextRange::MoveEndUntil</b> is logical rather than geometric. That is, motion is toward the end or toward the start of a story. Depending on the language, moving to the end of the story could be moving left or moving right. 
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-move">ITextRange::Move</a>.
     * @param {Pointer<VARIANT>} Cset Type: <b>VARIANT*</b>
     * 
     * The character set to use in the match. This could be an explicit string of characters or a character-set index. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">Character Match Sets</a>.
     * @param {Integer} Count Type: <b>long</b>
     * 
     * Maximum number of characters to move past. The default value is <b>tomForward</b>, which searches to the end of the story. If <i>Count</i> is greater than zero, the search moves forward (toward the end of the story). If <i>Count</i> is less than zero, the search moves backward (toward the beginning of the story). If  <i>Count</i> is zero, the end position is unchanged.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The actual number of characters that the range end is moved, plus 1 for a match if <i>Count</i> is greater than zero, and –1 for a match if <i>Count</i> is less than zero. The value can be null.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-moveenduntil
     */
    MoveEndUntil(Cset, Count) {
        result := ComCall(43, this, "ptr", Cset, "int", Count, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Searches up to Count characters for the text given by bstr. The starting position and direction are also specified by Count, and the matching criteria are given by Flags.
     * @remarks
     * The <b>ITextRange::FindText</b> method can also match special characters by using a caret (^) followed by a special letter. For a list of special characters, see the Special list available in the Microsoft Word 
     * 				<b>Find and Replace</b> dialog box. For example, <c>^p</code> matches the next paragraph mark. Note, <code>^c</code> can be used to represent the Clipboard contents in the string to be replaced. Thus, using <code>^c</c> in the find string enables you to search for rich text. For more details, see the Word Help files. 
     * 
     * As a comparison with the <b>ITextRange::FindText</b> method, the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-findtextstart">ITextRange::FindTextStart</a> method searches forward or backward from the range's Start 
     * 				<i>cp</i>, and the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-findtextend">ITextRange::FindTextEnd</a> method searches forward or backward from the range's End 
     * 				<i>cp</i>. For more details, see the descriptions of these methods.
     * 
     * The following are several code snippets that show the <b>ITextRange::FindText</b> methods.
     * 
     * Example #1. The following Microsoft Visual Basic for Applications (VBA) program prints all the // ...  comments in a story identified by the range r.
     * 
     * 
     * 
     * 
     * ```
     * Sub PrintComments (r As ITextRange)
     *     r.SetRange 0, 0                                      'r = insertion pt at start of story
     *     Do While r.FindText("//") And r.FindTextEnd("")    'Select comment
     *         r.MoveStart tomCharacter, 2                      'But do not include the opening or 
     *                                                          'closing comment brackets
     *         r.MoveEnd tomCharacter, -2                       
     *         Print r                                          'Show the folks
     *     Loop
     * End Sub
     * ```
     * 
     * 
     * Instead of these comments being printed, they could be inserted into another edit instance and saved to a file, or they could be inserted into separate cells in a table or spreadsheet.
     * 
     * To print all lines containing one or more occurrences of the word "laser", replace the loop by the following code:
     * 
     * 
     * ```
     *     While r.FindText("laser")            // Select next occurrence of "laser"
     *         r.Expand tomLine                // Select enclosing line    
     *         Print r                    // Print the line
     *     Wend
     * ```
     * 
     * 
     * Example #2. The following program prints a telephone list, given a story that contains an address list. The address list entries are separated by two or more paragraph marks, and each entry has the following form.
     * 
     * 
     * ```
     * Person/Business Name
     * Address (one or more lines)
     * (area code) telephone number 
     * ```
     * 
     * 
     * Note the use of the character <c>^p</c> in the <b>FindText</b> string argument to locate a pair of consecutive paragraph marks.
     * 
     * 
     * ```
     * Sub PrintTelephoneList (r As ITextRange)
     *     r.SetRange 0, 0                 // r = insertion point at start of story
     *     r.MoveWhile C1_WHITE            // Bypass any initial white space
     *     Do
     *         r.EndOf tomParagraph, 1     // Select next para (line): has name
     *         Print r                    // Print it
     *         Do
     *             r.MoveWhile C1_SPACE        // Bypass possible space chars
     *             If r.Char = Asc("(") Then Exit Do    // Look for start of telephone #
     *         Loop While r.Move(tomParagraph)    // Go to next paragraph
     *         r.EndOf tomParagraph, 1        // Select line with telephone number
     *         Print r                    // Print it
     *     Loop While r.FindText("^p^p")        // Find two consecutive para marks
     * End Sub
     * ```
     * 
     * 
     * Example #3. The following subroutine replaces all occurrences of the string, str1, in a range by str2:
     * 
     * 
     * ```
     * Sub Replace ( tr As ITextRange, str1 As String, str2 As String )
     *     Dim r As ITextRange
     *     r = tr.Duplicate                // Copy tr parameters to r
     *     r.End = r.Start                    // Convert to insertion point at Start
     *     While r.FindText(str1, tr.End - r.End)        // Match next occurrence of str
     *         r = str2                // Replace it with rep
     *     Wend                        // Iterate till no more matches
     * End Sub
     * ```
     * 
     * 
     * Example #4. The following line of code inserts a blank before the first occurrence of a right parenthesis, "(", that follows an occurrence of HRESULT. 
     * 
     * 
     * ```
     *     If r.FindText("HRESULT") And r.FindText("(") Then r = " ("
     * ```
     * 
     * 
     * To do this for all such occurrences, change the If into a While/Wend loop in the above line of code. This an example of a <b>FIND/REPLACE</b> macro that cannot be run with <b>Find and Replace</b> dialog boxes.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-findtext
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-findtextstart
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-findtextend
     */
    FindTextEnd(bstr, Count, Flags) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(46, this, "ptr", bstr, "int", Count, "int", Flags, "int*", &pLength := 0, "HRESULT")
        return pLength
    }

    /**
     * Mimics the DELETE and BACKSPACE keys, with and without the CTRL key depressed.
     * @remarks
     * If 
     * 				<i>Count</i> = zero, this method deletes the text in the range, that is, it deletes nothing if the range is only an insertion point. 
     * 
     * If 
     * 				<i>Count</i> is not zero, and the range is an insertion point (that is, degenerate), |
     * 				<i>Count</i>| (absolute value of 
     * 				<i>Count</i>)
     * 				<i>Unit</i>s are deleted in the logical direction given by the sign of 
     * 				<i>Count</i>, where a positive value is the direction toward the end of the story, and a negative value is toward the start of the story. 
     * 
     * If 
     * 				<i>Count</i> is not zero, and the range is nondegenerate (contains text), the text in the range is deleted (regardless of the values of 
     * 				<i>Unit </i> and 
     * 				<i>Count</i>), thereby creating an insertion point. Then, |
     * 				<i>Count</i>| - 1
     * 				 
     * 				<i>Unit</i>s are deleted in the logical direction given by the sign of 
     * 				<i>Count</i>. 
     * 
     * The text in the range can also be deleted by assigning a null string to the range (executing statement r = where r is the range). However, <b>ITextRange::Delete</b> does not require allocating a <b>BSTR</b>.
     * 
     * Deleting the end-of-paragraph mark (CR) results in the special behavior of the Microsoft Word UI. Four cases are of particular interest: 
     * 
     * <ul>
     * <li>If you delete just the CR but the paragraph includes text, then the CR is deleted, and the following paragraph gets the same paragraph formatting as current one. </li>
     * <li>If you delete the CR as well as some, but not all, of the characters in the following paragraph, the characters left over from the current paragraph get the paragraph formatting of the following paragraph. </li>
     * <li>If you select to the end of a paragraph, but not the whole paragraph, the CR is not deleted. </li>
     * <li>If you delete the whole paragraph (from the beginning through the CR), you delete the CR as well (unless it is the final CR in the file). </li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-delete
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-cut
     */
    Cut() {
        pVar := VARIANT()
        result := ComCall(48, this, "ptr", pVar, "HRESULT")
        return pVar
    }

    /**
     * Copies the text to a data object.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-cut">ITextRange::Cut</a>, 
     * 				<b>ITextRange::Copy</b>, and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-paste">ITextRange::Paste</a> methods let you perform the usual 
     * 				<b>Cut</b>, <b>Copy</b>, and 
     * 				<b>Paste</b> operations on a range object using an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a>, thereby not changing the contents of the clipboard. Among clipboard formats typically supported are <b>CF_TEXT</b> and <b>CF_RTF</b>. In addition, private clipboard formats can be used to reference a text solution's own internal rich text formats.
     * 
     * To copy and replace plain text, you can use the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-gettext">ITextRange::GetText</a> 
     * 				<b></b> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-settext">ITextRange::SetText</a> 
     * 				<b></b> methods. To copy formatted text from range r1 to range r2 without using the clipboard, you can use <b>Copy</b> and 
     * 				<b>Paste</b> and also the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-getformattedtext">ITextRange::GetFormattedText</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-setformattedtext">ITextRange::SetFormattedText</a> methods, as shown in the following Microsoft Visual Basic example:
     * 
     * <c>r2.GetFormattedText = r1.GetFormattedText</c>
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-copy
     */
    Copy() {
        pVar := VARIANT()
        result := ComCall(49, this, "ptr", pVar, "HRESULT")
        return pVar
    }

    /**
     * Pastes text from a specified data object.
     * @remarks
     * For more information, see<a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-copy">ITextRange::Copy</a>.
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
     * If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-paste
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-canpaste
     */
    CanPaste(pVar, Format) {
        result := ComCall(51, this, "ptr", pVar, "int", Format, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Determines whether the specified range can be edited.
     * @remarks
     * The range cannot be edited if any part of it is protected or if the document is read-only.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">tomBool</a> value indicating whether the range can be edited. It is <b>tomTrue</b> only if the specified range can be edited. The pointer can be null.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-canedit
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-changecase
     */
    ChangeCase(Type) {
        result := ComCall(53, this, "int", Type, "HRESULT")
        return result
    }

    /**
     * Retrieves screen coordinates for the start or end character position in the text range, along with the intra-line position.
     * @remarks
     * The <b>ITextRange::GetPoint</b> method gives <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a> the ability to emulate UI-pointer commands; it is also handy for accessibility purposes.
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
     * The method returns an <b>HRESULT</b> value. If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-getpoint
     */
    GetPoint(Type, px, py) {
        pxMarshal := px is VarRef ? "int*" : "ptr"
        pyMarshal := py is VarRef ? "int*" : "ptr"

        result := ComCall(54, this, "int", Type, pxMarshal, px, pyMarshal, py, "HRESULT")
        return result
    }

    /**
     * Changes the range based on a specified point at or up through (depending on Extend) the point (x, y) aligned according to Type.
     * @remarks
     * An application can use the specified point in the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-windowfrompoint">WindowFromPoint</a> function to get the handle  of the window, which usually can be used to find the client-rectangle coordinates (although a notable exception is with <a href="https://docs.microsoft.com/windows/desktop/Controls/windowless-rich-edit-controls">Windowless Controls</a>).
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-setpoint
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-scrollintoview
     */
    ScrollIntoView(Value) {
        result := ComCall(56, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Retrieves a pointer to the embedded object at the start of the specified range, that is, at cpFirst. The range must either be an insertion point or it must select only the embedded object.
     * @remarks
     * If the start of this range does not have an embedded object or if the range selects more than a single object, <i>ppObject</i> is set equal to <b>NULL</b>.
     * @returns {IUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * The pointer to the object.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextrange-getembeddedobject
     */
    GetEmbeddedObject() {
        result := ComCall(57, this, "ptr*", &ppObject := 0, "HRESULT")
        return IUnknown(ppObject)
    }
}
