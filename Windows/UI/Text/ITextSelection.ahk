#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents the currently selected text of a document.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextselection
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class ITextSelection extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextSelection
     * @type {Guid}
     */
    static IID => Guid("{a6d36724-f28f-430a-b2cf-c343671ec0e9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Options", "put_Options", "get_Type", "EndKey", "HomeKey", "MoveDown", "MoveLeft", "MoveRight", "MoveUp", "TypeText"]

    /**
     * Gets and sets text selection options.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextselection.options
     * @type {Integer} 
     */
    Options {
        get => this.get_Options()
        set => this.put_Options(value)
    }

    /**
     * Retrieves the type of text selection.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextselection.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Options() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
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
    put_Options(value) {
        result := ComCall(7, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Mimics the functionality of the End key.
     * @remarks
     * Setting <i>Extend</i> to <b>tomExtend</b> (or nonzero) corresponds to the Shift key being pressed. Setting <i>Unit</i> to <b>tomLine</b> corresponds to the Ctrl key not being pressed.  Setting <i>Unit</i> to <b>tomStory</b> to Ctrl being pressed. The <i>pDelta</i> parameters receives the number of characters that the insertion point or active end is moved.
     * 			
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-homekey">ITextSelection::HomeKey</a> and <b>ITextSelection::EndKey</b> methods are used to mimic the standard Home/End key behavior.
     * 
     * The <b>tomLine</b> value mimics the Home or End key behavior 
     * 				<i>without</i> the Ctrl key pressed, while <b>tomStory</b> mimics the behavior 
     * 				<i>with</i> the Ctrl
     * 				key pressed. Similarly, <b>tomMove</b> mimics the Home or End key behavior 
     * 				<i>without</i> the Shift key pressed, while <b>tomExtend</b> mimics the behavior 
     * 				<i>with</i> the Shift key pressed. So 
     * 				<c>EndKey(tomStory)</code> converts the selection into an insertion point at the end of the associated story, while <code>EndKey(tomStory, tomExtend)</c> moves the active end of the selection to the end of the story and leaves the other end where it was.
     * 
     * The 
     * 				<a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-homekey">HomeKey</a> and <b>EndKey</b> methods are logical methods like the <b>Move*</b> methods, rather than directional methods. Thus, they depend on the language that is involved. For example, in Arabic text, 
     * 				<b>HomeKey</b> moves to the right end of a line, whereas in English text, it moves to the left. Thus, 
     * 				<b>HomeKey</b> and <b>EndKey</b> are different than the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-moveleft">MoveLeft</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-moveright">MoveRight</a> methods. Also, note that the <b>EndKey</b> method is quite different from the 
     * 				<b>End</b> property, which is the <c>cp</c> at the end of the selection. 
     * 				<b>HomeKey</b> and <b>EndKey</b> also differ from the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-startof">StartOf</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-endof">EndOf</a> methods in that they extend from the active end, whereas 
     * 				<b>StartOf</b> extends from Start and 
     * 				<b>EndOf</b> extends from End.
     * @param {Integer} unit_ 
     * @param {Boolean} extend 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextselection-endkey
     */
    EndKey(unit_, extend) {
        result := ComCall(9, this, "int", unit_, "int", extend, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Generalizes the functionality of the Home key.
     * @remarks
     * The <b>ITextSelection::HomeKey</b> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-endkey">ITextSelection::EndKey</a> methods are used to mimic the standard Home/End key behavior.
     * 
     * <b>tomLine</b> mimics the Home or End key behavior 
     * 				<i>without</i> the Ctrl key pressed, while <b>tomStory</b> mimics the behavior 
     * 				<i>with</i> the Ctrl key pressed. Similarly, <b>tomMove</b> mimics the Home or End key behavior 
     * 				<i>without</i> the Shift key pressed, while <b>tomExtend</b> mimics the behavior 
     * 				<i>with</i> the Shift key pressed. So 
     * 				<c>HomeKey(tomStory)</c> converts the selection into an insertion point at the beginning of the associated story, while <b>HomeKey</b>(tomStory, tomExtend) moves the active end of the selection to the beginning of the story and leaves the other end where it was.
     * 
     * The <b>HomeKey</b> and 
     * 				<b>EndKey</b> methods are logical methods like the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-move">Move</a> methods, rather than directional methods. Thus, they depend on the language that is involved. For example, in Arabic text, <b>HomeKey</b> moves to the right end of a line, whereas in English text, it moves to the left. Thus, <b>HomeKey</b> and 
     * 				<a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-endkey">EndKey</a> methods are different than the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-moveleft">ITextSelection::MoveLeft</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-moveright">ITextSelection::MoveRight</a> methods. Also, note that the <b>HomeKey</b> method is quite different from the 
     * 				<b>Start</b> property, which is the cp at the beginning of the selection. <b>HomeKey</b> and 
     * 				<b>EndKey</b> also differ from the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-startof">StartOf</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-endof">EndOf</a> methods in that they extend from the active end, whereas 
     * 				<b>StartOf</b> extends from Start and 
     * 				<b>EndOf</b> extends from End.
     * @param {Integer} unit_ 
     * @param {Boolean} extend 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextselection-homekey
     */
    HomeKey(unit_, extend) {
        result := ComCall(10, this, "int", unit_, "int", extend, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Mimics the functionality of the Down Arrow and Page Down keys.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-moveup">ITextSelection::MoveUp</a> and <b>ITextSelection::MoveDown</b> methods are similar to the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-moveleft">ITextSelection::MoveLeft</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-moveright">ITextSelection::MoveRight</a> methods, except that they reflect the behavior of the Up Arrow, Down Arrow, Page Up, and Page Down keys on the cursor-keypad.
     * @param {Integer} unit_ 
     * @param {Integer} count 
     * @param {Boolean} extend 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextselection-movedown
     */
    MoveDown(unit_, count, extend) {
        result := ComCall(11, this, "int", unit_, "int", count, "int", extend, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Generalizes the functionality of the Left Arrow key.
     * @remarks
     * The WordBasic move methods like 
     * 				<b>CharRight</b>, 
     * 				<b>CharLeft</b>, 
     * 				<b>WordRight</b>, and 
     * 				<b>WordLeft</b> are hybrids that can do four things that are closely related to the standard arrow-key edit behavior: 
     * 
     * <ul>
     * <li>Move the current insertion point if there's no selection. </li>
     * <li>Move the active end of the selection if there is a selection. </li>
     * <li>Turn an insertion point into a selection and vice versa. </li>
     * <li>Return a Boolean stating if movement occurred. </li>
     * </ul>
     * The 
     * 				<i>Extend</i> argument of 
     * 				<b>MoveLeft</b> and
     * 				 <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-moveright">MoveRight</a> enables you to be consistent with the first three items above, and the 
     * 				<i>pDelta</i> is a generalization of the fourth. For example, given a selection consisting of a single range, you have the following correspondences (for left-to-right characters).
     * 
     * <table class="clsStd">
     * <tr>
     * <th>ITextSelection</th>
     * <th>WordBasic</th>
     * <th>Function</th>
     * </tr>
     * <tr>
     * <td>selection.MoveRight tomWord, 1, 1</td>
     * <td>WordRight 1,1</td>
     * <td>Moves active end one word right.</td>
     * </tr>
     * <tr>
     * <td>selection.MoveLeft tomCharacter, 1, 1</td>
     * <td>CharLeft 1,1</td>
     * <td>Moves active end one character left.</td>
     * </tr>
     * </table>
     *  
     * 
     * As in WordBasic, if 
     * 				<i>Count</i> is less than zero, the meanings of left and right are interchanged, that is <c>MoveLeft (Unit, Count, Extend)</code> is equivalent to <code>MoveRight (Unit, -Count, Extend)</c>. 
     * 
     * Similar to WordBasic and the Left Arrow key UI behavior, calling <code>MoveLeft (
     * 				Unit, Count)</code> on a degenerate selection moves the insertion point the specified number of 
     * 				<i>Unit</i>s. On a degenerate range, calling 
     * 				<code>MoveLeft(
     * 				Unit, Count, 1)</code> where <c>Count</c> is greater than zero  causes the range to become nondegenerate with the left end being the active end. 
     * 
     * When 
     * 				<i>Extend</i> is <b>tomExtend</b> (or is nonzero), <b>MoveLeft</b> moves only the active end of the selection, leaving the other end where it is. However, if 
     * 				<i>Extend</i> equals zero and the selection starts as a nondegenerate range, <c>MoveLeft(Unit, Count)</code> where <code>Count</c> is greater than zero
     * 				 moves the active end <c>Count</c> - 1 units left, and then moves the other end to the active end. In other words, it makes an insertion point at the active end. Collapsing the range counts as one 
     * 				unit. Thus, 
     * 				<c>MoveLeft(tomCharacter)</c> converts a nondegenerate selection into a degenerate one at the selection's left end. Here, 
     * 				<i>Count</i> has the default value of 1 and 
     * 				<i>Extend</i> has the default value of zero. This example corresponds to pressing the Left Arrow key. 
     * 				<b>MoveLeft</b> and 
     * 				<a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-moveright">MoveRight</a> are related to the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a> move methods, but differ in that they explicitly use the active end (the end moved by pressing the Shift key).
     * @param {Integer} unit_ 
     * @param {Integer} count 
     * @param {Boolean} extend 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextselection-moveleft
     */
    MoveLeft(unit_, count, extend) {
        result := ComCall(12, this, "int", unit_, "int", count, "int", extend, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Generalizes the functionality of the Right Arrow key.
     * @remarks
     * Microsoft WordBasic move methods like 
     * 				<b>CharRight</b>, 
     * 				<b>CharLeft</b>, 
     * 				<b>WordRight</b>, and 
     * 				<b>WordLeft</b> are hybrids that can do four things that are closely related to the standard arrow-key edit behavior: 
     * 
     * <ul>
     * <li>Move the current insertion point if there's no selection. </li>
     * <li>Move the active end of the selection if there is a selection. </li>
     * <li>Turn an insertion point into a selection and vice versa. </li>
     * <li>Return a Boolean stating if movement occurred. </li>
     * </ul>
     * The 
     * 				<i>Extend</i> argument of <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-moveleft">MoveLeft</a>  and <b>MoveRight</b> enables you to be consistent with the first three items above, and the 
     * 				<i>pDelta</i> is a generalization of the fourth. For example, given a selection, s, consisting of a single range, you have the following correspondences (for left-to-right characters).
     * 
     * <table class="clsStd">
     * <tr>
     * <th>ITextSelection</th>
     * <th>WordBasic</th>
     * <th>Function</th>
     * </tr>
     * <tr>
     * <td>s.MoveRight tomWord, 1, 1</td>
     * <td>WordRight 1,1</td>
     * <td>Moves active end one word right.</td>
     * </tr>
     * <tr>
     * <td>s.MoveLeft tomCharacter, 1, 1</td>
     * <td>CharLeft 1,1</td>
     * <td>Moves active end one character left.</td>
     * </tr>
     * </table>
     *  
     * 
     * As in WordBasic, if 
     * 				<i>Count</i> is less than zero, the meanings of left and right are interchanged, that is <c>MoveLeft (Unit, Count, Extend)</code> is equivalent to <code>MoveRight(Unit, -Count, Extend)</c>. 
     * 
     * Similar to WordBasic and the Right Arrow key UI behavior, calling <c>MoveRight(Unit, Count)</c> on a degenerate selection moves the insertion point the specified number of 
     * 				units. On a degenerate range, calling <c>MoveRight(Unit, Count, 1)</code>  where <code>Count</c> is greater than zero causes the range to become nondegenerate with the right end being the active end.
     * 
     * When 
     * 				<i>Extend</i> is <b>tomExtend</b> (or is nonzero), <b>MoveRight</b> moves only the active end of the selection, leaving the other end where it is. However, if 
     * 				<i>Extend</i> equals zero and the selection starts as a nondegenerate range, <c>MoveRight(Unit, Count)</code> where <code>Count</code> is greater than zero moves the active end <code>Count</c> - 1 units right, and then moves the other end to the active end. In other words, it makes an insertion point at the active end. Collapsing the range counts as one 
     * 				unit. Thus, <c>MoveRight(tomCharacter)</c> converts a nondegenerate selection into a degenerate one at the selection's right end. Here, <i>Count</i> has the default value of 1 and <i>Extend</i> has the default value of zero. This example corresponds to pressing the Right Arrow key. <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-moveleft">MoveLeft</a> and <b>MoveRight</b> are related to the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a> move methods, but differ in that they explicitly use the active end (the end moved by pressing the Shift key).
     * @param {Integer} unit_ 
     * @param {Integer} count 
     * @param {Boolean} extend 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextselection-moveright
     */
    MoveRight(unit_, count, extend) {
        result := ComCall(13, this, "int", unit_, "int", count, "int", extend, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Mimics the functionality of the Up Arrow and Page Up keys.
     * @remarks
     * The <b>MoveUp</b> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-movedown">MoveDown</a> methods are similar to the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-moveleft">MoveLeft</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-moveright">MoveRight</a> methods, except that they reflect the behavior of the Up Arrow, Down Arrow, Page Up, and Page Down keys on the cursor-keypad.
     * @param {Integer} unit_ 
     * @param {Integer} count 
     * @param {Boolean} extend 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextselection-moveup
     */
    MoveUp(unit_, count, extend) {
        result := ComCall(14, this, "int", unit_, "int", count, "int", extend, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Enters text into the selection as if someone typed it.
     * @remarks
     * This method is similar to the underlying [ITextDocument.SetText](itextdocument_settext_522499431.md) method, but is sensitive to the Insert or Overtype key state and UI settings like AutoCorrect and smart quotes.
     * @param {HSTRING} value The text string to type into this selection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextselection.typetext
     */
    TypeText(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
