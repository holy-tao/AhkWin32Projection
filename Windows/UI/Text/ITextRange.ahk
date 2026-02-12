#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ITextCharacterFormat.ahk
#Include .\ITextRange.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ITextParagraphFormat.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a span of continuous text in a document, and provides powerful editing and data-binding properties and methods that allow an app to select, examine, and change document text.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextrange
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class ITextRange extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextRange
     * @type {Guid}
     */
    static IID => Guid("{5b9e4e57-c072-42a0-8945-af503ee54768}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Character", "put_Character", "get_CharacterFormat", "put_CharacterFormat", "get_FormattedText", "put_FormattedText", "get_EndPosition", "put_EndPosition", "get_Gravity", "put_Gravity", "get_Length", "get_Link", "put_Link", "get_ParagraphFormat", "put_ParagraphFormat", "get_StartPosition", "put_StartPosition", "get_StoryLength", "get_Text", "put_Text", "CanPaste", "ChangeCase", "Collapse", "Copy", "Cut", "Delete", "EndOf", "Expand", "FindText", "GetCharacterUtf32", "GetClone", "GetIndex", "GetPoint", "GetRect", "GetText", "GetTextViaStream", "InRange", "InsertImage", "InStory", "IsEqual", "Move", "MoveEnd", "MoveStart", "Paste", "ScrollIntoView", "MatchSelection", "SetIndex", "SetPoint", "SetRange", "SetText", "SetTextViaStream", "StartOf"]

    /**
     * Gets or sets the first character of the text range; that is, the character associated with the [StartPosition](itextrange_startposition.md) property.
     * @remarks
     * When setting this property, the new character overwrites the first character in the text range.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextrange.character
     * @type {Integer} 
     */
    Character {
        get => this.get_Character()
        set => this.put_Character(value)
    }

    /**
     * Gets or sets the character formatting attributes of the text range.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextrange.characterformat
     * @type {ITextCharacterFormat} 
     */
    CharacterFormat {
        get => this.get_CharacterFormat()
        set => this.put_CharacterFormat(value)
    }

    /**
     * Gets or sets an [ITextRange](itextrange.md) object with the formatted text of the specified range.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextrange.formattedtext
     * @type {ITextRange} 
     */
    FormattedText {
        get => this.get_FormattedText()
        set => this.put_FormattedText(value)
    }

    /**
     * Gets or sets the end character position of the text range.
     * @remarks
     * A text range object remains valid when the text is edited, but a character position is volatile. That is, a character position becomes invalid when text is inserted or deleted before the character position. Be careful when using character positions, especially if you store them for a significant length of time.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextrange.endposition
     * @type {Integer} 
     */
    EndPosition {
        get => this.get_EndPosition()
        set => this.put_EndPosition(value)
    }

    /**
     * Gets or sets the gravity of the text range.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextrange.gravity
     * @type {Integer} 
     */
    Gravity {
        get => this.get_Gravity()
        set => this.put_Gravity(value)
    }

    /**
     * Gets the count of characters in the text range.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextrange.length
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
    }

    /**
     * Gets or sets the URL text associated with a text range.
     * @remarks
     * This method sets the start and end of the text range to include the entire hyperlink, including the friendly name, if any.
     * 
     * The URL string isn't validated. The text it contains must be enclosed in quotes, optionally preceded by the sentinel character 0xFDDF. For example: "http://www.msn.com" or 0xFDDF"http://www.msn.com".
     * 
     * The text range must be nondegenerate. The following actions are possible: 
     * + If part of a link's friendly name is selected, the URL part is replaced with the Link property value.
     * + If part of a regular URL is selected, it becomes the link's friendly name, with the Link property value as the URL.
     * + If nonlink text is selected:    + If the text immediately follows a link's friendly name and the Link property value matches the URL, the text is appended to the friendly name.
     *    + Otherwise, the text becomes the friendly name of a link with the Link property value as the URL.
     * 
     *  The text range can be adjusted to different character positions after this method is called.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextrange.link
     * @type {HSTRING} 
     */
    Link {
        get => this.get_Link()
        set => this.put_Link(value)
    }

    /**
     * Gets or sets the paragraph formatting attributes of the text range.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextrange.paragraphformat
     * @type {ITextParagraphFormat} 
     */
    ParagraphFormat {
        get => this.get_ParagraphFormat()
        set => this.put_ParagraphFormat(value)
    }

    /**
     * Gets or sets the start position of the text range.
     * @remarks
     * If the start position is greater than the end position, this method sets the end position to be equal to the start position, resulting in a degenerate range (insertion point).
     * 
     * If this text range represents the active selection, the start position becomes the active end of the selection and is scrolled into view if the display is not frozen.
     * 
     * The following example shows how to convert a nondegenerate range into a degenerate range. `range.End = range.Start`
     * 
     * Similarly, the following example converts the text range into a degenerate range at the end of the range. `range.Start = range.End`
     * 
     * The following example adds 1 to end of the text range, if the range is not at the end of the story. `range.End = range.End + 1`
     * 
     * The preceding example also makes the end of the text range the active end, and can turn a degenerate range into a nondegenerate one.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextrange.startposition
     * @type {Integer} 
     */
    StartPosition {
        get => this.get_StartPosition()
        set => this.put_StartPosition(value)
    }

    /**
     * Gets the count of characters in the story of the text range.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextrange.storylength
     * @type {Integer} 
     */
    StoryLength {
        get => this.get_StoryLength()
    }

    /**
     * Gets or sets the plain text of the text range.
     * @remarks
     * The Text property is the default property for [ITextRange](itextrange.md). As such, it is automatically invoked for the text range. For example: Some of the examples below use this fact. `print range`
     * 
     * The Text method substitutes a string for the range text. For processing a single character, the [ITextRange.Character](itextrange_character.md) property is more efficient than the Text property and doesn't require creating a single character range for storing a character.
     * 
     * If the range is degenerate, the Text property lets you insert text easily. You can also delete the text in a range:`range.delete
     * range = ""`
     * 
     * You can use the Text property to copy plain text from one place to another, simply by setting one range equal to another. The following statement sets the text of one range to that of another:`range1 = range2`
     * 
     * These ranges can be in different stories or even in different apps. However, they do imply copying the text first into a string and then from that string to the target location.
     * 
     * For large amounts of text, the [ITextRange.Copy](itextrange_copy_4862135.md) and [ITextRange.Paste](itextrange_paste_955889140.md) methods can be faster, because they can perform the copy directly from source to target and with any format supported by the source and target.
     * 
     * The text returned by the Text property is given in Unicode. The end-of-paragraph mark may be given by one of the following depending on the original file:
     * + 0x2029 (the Unicode paragraph separator)
     * + carriage return/line feed (CRLF) (0xd, 0xa)
     * + CR alone (0xd)
     * 
     * 
     * The placeholder for an embedded object is given by the special character, WCH_EMBEDDING, which has the official Unicode value 0xFFFC.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextrange.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
        set => this.put_Text(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Character() {
        result := ComCall(6, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Character(value) {
        result := ComCall(7, this, "char", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ITextCharacterFormat} 
     */
    get_CharacterFormat() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITextCharacterFormat(value)
    }

    /**
     * 
     * @param {ITextCharacterFormat} value 
     * @returns {HRESULT} 
     */
    put_CharacterFormat(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ITextRange} 
     */
    get_FormattedText() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITextRange(value)
    }

    /**
     * 
     * @param {ITextRange} value 
     * @returns {HRESULT} 
     */
    put_FormattedText(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EndPosition() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_EndPosition(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Gravity() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Gravity(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Length() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Link() {
        value := HSTRING()
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Link(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ITextParagraphFormat} 
     */
    get_ParagraphFormat() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITextParagraphFormat(value)
    }

    /**
     * 
     * @param {ITextParagraphFormat} value 
     * @returns {HRESULT} 
     */
    put_ParagraphFormat(value) {
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StartPosition() {
        result := ComCall(21, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StartPosition(value) {
        result := ComCall(22, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StoryLength() {
        result := ComCall(23, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        value := HSTRING()
        result := ComCall(24, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Text(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines if a data object can be pasted, using a specified format, into the current range.
     * @param {Integer} format 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextrange-canpaste
     */
    CanPaste(format) {
        result := ComCall(26, this, "int", format, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Changes the case of letters in a text range.
     * @param {Integer} value The new case of letters in the text range. The default value is **Lower**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextrange.changecase
     */
    ChangeCase(value) {
        result := ComCall(27, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Collapses the text range into a degenerate point at either the beginning or end of the range.
     * @param {Boolean} value True collapses at the start of the text range, and false collapses at the end of the range. The default value is true.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextrange.collapse
     */
    Collapse(value) {
        result := ComCall(28, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
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
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method returns an 
     * 						<b>HRESULT</b> value. If successful, it returns <b>S_OK</b>. Otherwise, it returns <b>E_OUTOFMEMORY</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextrange-copy
     */
    Copy() {
        result := ComCall(29, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Cuts the plain or rich text to a data object or to the Clipboard, depending on the pVar parameter.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method returns an 
     * 						<b>HRESULT</b> value. If successful, it returns <b>S_OK</b>. Otherwise it returns one of the following values. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextrange-cut
     */
    Cut() {
        result := ComCall(30, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
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
     * @param {Integer} unit_ 
     * @param {Integer} count 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextrange-delete
     */
    Delete(unit_, count) {
        result := ComCall(31, this, "int", unit_, "int", count, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Moves this range's ends to the end of the last overlapping Unit in the range.
     * @remarks
     * For comparison, the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-startof">ITextRange::StartOf</a> method moves the range ends to the beginning of the first overlapping <i>Unit</i> in the range. Note, the <b>ITextRange::StartOf</b> and <b>ITextRange::EndOf</b> methods differ from the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-homekey">HomeKey</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-endkey">EndKey</a> methods in that the latter extend from the active end, whereas <b>ITextRange::StartOf</b> extends from Start and <b>ITextRange::EndOf</b> extends from End. If the range is an insertion point on a boundary between <i>Unit</i>s, <b>ITextRange::EndOf</b> does not change End. In particular, calling <b>ITextRange::EndOf</b> (<i>tomCharacter</i>, *, *) does not change End except for an insertion point at the beginning of a story.
     * @param {Integer} unit_ 
     * @param {Boolean} extend 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextrange-endof
     */
    EndOf(unit_, extend) {
        result := ComCall(32, this, "int", unit_, "int", extend, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Expands this range so that any partial units it contains are completely contained.
     * @remarks
     * For example, if an insertion point is at the beginning, the end, or within a word, <b>ITextRange::Expand</b> expands the range to include that word. If the range already includes one word and part of another, <b>ITextRange::Expand</b> expands the range to include both words. <b>ITextRange::Expand</b> expands the range to include the visible portion of the range's story.
     * @param {Integer} unit_ 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextrange-expand
     */
    Expand(unit_) {
        result := ComCall(33, this, "int", unit_, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
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
     * @param {HSTRING} value 
     * @param {Integer} scanLength 
     * @param {Integer} options 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextrange-findtext
     */
    FindText(value, scanLength, options) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(34, this, "ptr", value, "int", scanLength, "uint", options, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Retrieves the Unicode Transformation Format (UTF)-32 character code of the character at the specified offset from the end of the text range.
     * @remarks
     * This method differs from [ITextRange.Character](itextrange_character.md) in the following ways: 
     * + It returns the Unicode Transformation Format (UTF)-32 character code for a Unicode Transformation Format (UTF)-16 surrogate pair instead of the pair’s lead code (see Sections 3.8 and 3.9 and Table 3-5 in [The Unicode Standard](https://www.unicode.org/versions/Unicode6.0.0/) for explanations of this notation).
     * + It gets the code for the character at the specified offset from the end of the text range instead of the character at the start of the range.
     * 
     * 
     * If you try to retrieve a character that is before the start of the story or at the end of the story, *value* is set to the character code 0.
     * 
     * If *offset* is 0, this method retrieves the character at the end of the range.
     * 
     * If *offset* is in the middle of a surrogate pair, this method retrieves the corresponding Unicode Transformation Format (UTF)-32 character.
     * @param {Pointer<UInt32>} value The character value.
     * @param {Integer} offset The offset from the end of the text range.<table>
     *    <tr><th>If *offset* is</th><th>The method returns this character</th></tr>
     *    <tr><td>0</td><td>The character at the end of the range</td></tr>
     *    <tr><td>in the middle of a surrogate pair</td><td>The corresponding UTF-32 character</td></tr>
     * </table>
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextrange.getcharacterutf32
     */
    GetCharacterUtf32(value, offset) {
        result := ComCall(35, this, "ptr", value, "int", offset, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a new object that is identical to this text range object.
     * @remarks
     * To create an insertion point to traverse a text range, first clone the range and then collapse the duplicate at its starting character position.
     * @returns {ITextRange} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextrange.getclone
     */
    GetClone() {
        result := ComCall(36, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITextRange(result_)
    }

    /**
     * Retrieves the story index of the Unit parameter at the specified range Start character position.
     * @remarks
     * The <b>ITextRange::GetIndex</b> method retrieves the story index of a word, line, sentence, paragraph, and so forth, at the range Start. <i>Unit</i> specifies which kind of entity to index, such as words (<b>tomWord</b>), lines (<b>tomLine</b>), sentences (<b>tomSentence</b>), or paragraphs (<b>tomParagraph</b>). For example, <b>ITextRange::GetIndex</b> sets <i>pIndex</i> equal to the line number of the first line in the range. For a range at the end of the story, <b>ITextRange::GetIndex</b>, returns the number of <i>Unit</i>s in the story. Thus, you can get the number of words, lines, objects, and so forth, in a story.
     * 
     * The index value returned by the <b>ITextRange::GetIndex</b> method is not valid if the text is subsequently edited. Thus, users should be careful about using methods that return index values, especially if the values are to be stored for any duration. This is in contrast to a pointer to a range, which does remain valid when the text is edited.
     * @param {Integer} unit_ 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextrange-getindex
     */
    GetIndex(unit_) {
        result := ComCall(37, this, "int", unit_, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Retrieves the screen coordinates of a particular location in the text range.
     * @remarks
     * This method lets an app emulate pointer commands, which is particularly useful for implementing accessibility scenarios.
     * @param {Integer} horizontalAlign The horizontal position to retrieve, relative to the bounding rectangle of the text range.
     * @param {Integer} verticalAlign The vertical position to retrieve, relative to the bounding rectangle of the text range.
     * @param {Integer} options The options for retrieving the coordinates of the specified location in the text range.
     * @param {Pointer<POINT>} point_ A structure that receives the coordinates of the specified location in the text range, represented as an ordered pair of floating-point x- and y-coordinates that define a point in a two-dimensional plane.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextrange.getpoint
     */
    GetPoint(horizontalAlign, verticalAlign, options, point_) {
        result := ComCall(38, this, "int", horizontalAlign, "int", verticalAlign, "uint", options, "ptr", point_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the bounding rectangle that encompasses the text range on the screen.
     * @param {Integer} options A value that indicates the rectangle to retrieve.
     * @param {Pointer<RECT>} rect_ A structure that contains four floating-point numbers that represent the location and size of the bounding rectangle.
     * @param {Pointer<Int32>} hit The hit-test value for the text range.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextrange.getrect
     */
    GetRect(options, rect_, hit) {
        result := ComCall(39, this, "uint", options, "ptr", rect_, "ptr", hit, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the text in a text range according to the specified conversion flags.
     * @param {Integer} options The conversion flags that control how the text is retrieved.
     * @param {Pointer<HSTRING>} value The text in the text range.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextrange.gettext
     */
    GetText(options, value) {
        result := ComCall(40, this, "uint", options, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the text in the text range according to the specified conversion flags, as a random access stream.
     * @param {Integer} options The conversion flags that control how the text is retrieved. A value of **default** retrieves the plain text in the text range.
     * @param {IRandomAccessStream} value The text stream.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextrange.gettextviastream
     */
    GetTextViaStream(options, value) {
        result := ComCall(41, this, "uint", options, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @param {ITextRange} range 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextrange-inrange
     */
    InRange(range) {
        result := ComCall(42, this, "ptr", range, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Inserts an image into this range.
     * @param {Integer} width The width of the image, in Device-independent pixels (DIPs).
     * @param {Integer} height The height of the image, in DIPs.
     * @param {Integer} ascent If *verticalAlign* is **Baseline**, this parameter is the distance, in DIPs, that the top of the image extends above the text baseline. If *verticalAlign* is **Baseline** and ascent is zero, the bottom of the image is placed at the text baseline.
     * @param {Integer} verticalAlign The vertical alignment of the image.
     * @param {HSTRING} alternateText The alternate text for the image.
     * @param {IRandomAccessStream} value The stream that contains the image data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextrange.insertimage
     */
    InsertImage(width, height, ascent, verticalAlign, alternateText, value) {
        if(alternateText is String) {
            pin := HSTRING.Create(alternateText)
            alternateText := pin.Value
        }
        alternateText := alternateText is Win32Handle ? NumGet(alternateText, "ptr") : alternateText

        result := ComCall(43, this, "int", width, "int", height, "int", ascent, "int", verticalAlign, "ptr", alternateText, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines whether this range's story is the same as a specified range's story.
     * @param {ITextRange} range 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextrange-instory
     */
    InStory(range) {
        result := ComCall(44, this, "ptr", range, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Determines whether this range has the same character positions and story as those of a specified range.
     * @remarks
     * The 
     * 				<b>ITextRange::IsEqual</b> method returns <b>tomTrue</b> only if the range points at the same text as <i>pRange</i>. See <a href="https://docs.microsoft.com/windows/desktop/Controls/about-text-object-model">Finding Rich Text</a> for code that compares two different pieces of text to see if they contain the same plain text and the same character formatting.
     * @param {ITextRange} range 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextrange-isequal
     */
    IsEqual(range) {
        result := ComCall(45, this, "ptr", range, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
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
     * @param {Integer} unit_ 
     * @param {Integer} count 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextrange-move
     */
    Move(unit_, count) {
        result := ComCall(46, this, "int", unit_, "int", count, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Moves the end position of the range.
     * @remarks
     * If the new end position precedes the old start position, the new start position is set equal to the new end position; that is, it becomes a degenerate range or an insertion point.
     * 
     * The motion described by <b>ITextRange::MoveEnd</b> is logical rather than geometric. That is, motion is toward the end or toward the start of a story. Depending on the language, moving to the end of the story could be moving left or moving right. 
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-move">ITextRange::Move</a>.
     * @param {Integer} unit_ 
     * @param {Integer} count 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextrange-moveend
     */
    MoveEnd(unit_, count) {
        result := ComCall(47, this, "int", unit_, "int", count, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Moves the start position of the range the specified number of units in the specified direction.
     * @remarks
     * If the new start follows the old end, the new end is set equal to the new start.
     * 
     * The motion described by <b>ITextRange::MoveStart</b> is logical rather than geometric. That is, motion is toward the end or toward the start of a story. Depending on the language, moving to the end of the story could be moving left or moving right. 
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-move">ITextRange::Move</a>.
     * @param {Integer} unit_ 
     * @param {Integer} count 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextrange-movestart
     */
    MoveStart(unit_, count) {
        result := ComCall(48, this, "int", unit_, "int", count, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Pastes text from the Clipboard into the text range.
     * @remarks
     * > [!NOTE]
     * > On Windows Phone, this method throws an exception. Programmatic access to the clipboard is not supported on Windows Phone.
     * @param {Integer} format The clipboard format to use in the paste operation. Zero represents the best format, which usually is Rich Text Format (RTF), but CF_UNICODETEXT and other formats are also possible. The default value is zero.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextrange.paste
     */
    Paste(format) {
        result := ComCall(49, this, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Scrolls this text range into view.
     * @param {Integer} value The end of the text range to scroll into view. This function uses only the **Start**, **NoHorizontalScroll**, and **NoVerticalScroll** values of the [PointOptions](pointoptions.md) enumeration.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextrange.scrollintoview
     */
    ScrollIntoView(value) {
        result := ComCall(50, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the start and end positions of this range to match the active selection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextrange.matchselection
     */
    MatchSelection() {
        result := ComCall(51, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Moves the text range to the specified unit of the story.
     * @remarks
     * This method allows an app to work with line-oriented text, such as source code listings, in a convenient way. For example, `ITextRange.SetIndex(Line, 10, 0)` converts the text range to an insertion point at the start of the tenth line.
     * @param {Integer} unit_ The *unit* used to move the text range.
     * @param {Integer} index The index of the specified *unit*. The text range is relocated to the *unit* that has this index. If *unit* is positive, the numbering of units begins at the start of the story and proceeds forward. If negative, the numbering begins at the end of the story and proceeds backward. The start of the story corresponds to *index* = 1 for all existing units, and the last *unit* in the story corresponds to *index* = – 1.
     * @param {Boolean} extend Indicates how to change the text range. True extends the text range to include the *unit* by moving only the end position of the text range. False collapses the text range to an insertion point and then moves the insertion point. The default value is false.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextrange.setindex
     */
    SetIndex(unit_, index, extend) {
        result := ComCall(52, this, "int", unit_, "int", index, "int", extend, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Changes the text range based on the specified point.
     * @param {POINT} point_ An ordered pair of floating-point x- and y-coordinates that defines a point in a two-dimensional plane.
     * @param {Integer} options The alignment type of the specified *point*.
     * @param {Boolean} extend Indicates how to set the endpoints of the text range. If *extend* is 0, the text range is an insertion point located at the specified point, or at the nearest point with selectable text. If *extend* is 1, the endpoint specified by *options* is moved to the *point* and the other endpoint is left alone. The default value is 0.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextrange.setpoint
     */
    SetPoint(point_, options, extend) {
        result := ComCall(53, this, "ptr", point_, "uint", options, "int", extend, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the endpoints of the text range to the specified values.
     * @remarks
     * If the text range is a nondegenerate selection, *endPosition* is the active end.
     * @param {Integer} startPosition The character position for the start of the text range. This parameter must be less than *endPosition*.
     * @param {Integer} endPosition The character position for the end of the text range.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextrange.setrange
     */
    SetRange(startPosition, endPosition) {
        result := ComCall(54, this, "int", startPosition, "int", endPosition, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Replaces the text in the text range.
     * @remarks
     * If *value* is null, the text in the range is deleted.
     * @param {Integer} options The conversion flags that control how the text is inserted in the text range.
     * @param {HSTRING} value The new text.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextrange.settext
     */
    SetText(options, value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(55, this, "uint", options, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the text in the text range based on the contents of a random access stream.
     * @param {Integer} options The text options.
     * @param {IRandomAccessStream} value The random access stream.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextrange.settextviastream
     */
    SetTextViaStream(options, value) {
        result := ComCall(56, this, "uint", options, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Moves the range ends to the start of the first overlapping Unit in the range.
     * @remarks
     * If the range is an insertion point on a boundary between <i>Unit</i>s, <b>ITextRange::StartOf</b> does not change the start position. 
     * 
     * The <b>ITextRange::StartOf</b> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-endof">ITextRange::EndOf</a> methods differ from the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-homekey">HomeKey</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-endkey">EndKey</a> methods in that the latter extend from the active end, whereas <b>ITextRange::StartOf</b> extends from the start position and <b>ITextRange::EndOf</b> extends from the end position.
     * @param {Integer} unit_ 
     * @param {Boolean} extend 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextrange-startof
     */
    StartOf(unit_, extend) {
        result := ComCall(57, this, "int", unit_, "int", extend, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
