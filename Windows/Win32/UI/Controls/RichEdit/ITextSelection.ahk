#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ITextRange.ahk

/**
 * A text selection is a text range with selection highlighting.
 * @remarks
 * The selection is associated with some kind of view, and has some UI-oriented methods that allow one to emulate keyboard input. Thus, an application can use the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a> methods on a text selection, as well as the <b>ITextSelection</b> methods.
 * 
 * For keyboard input emulation, ranges used in selections use the concept of the <i>active end</i>, which is typically the end that was last moved. For example, if an <b>ITextRange::Move</b>* method operates on a range that is actually a text selection, the most recently moved end is the active one. The most familiar examples of the active end are those involving Shift+Arrow Key handling, where the active end is the one that moves. Accordingly, the <b>ITextSelection</b> methods include move methods for the active end, such as <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-moveleft">MoveLeft</a> or <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-moveright">MoveRight</a>, and methods to get and set the active end status. These methods manipulate selections in ways similar to the standard cursor-keypad operations. This allows you to implement, for example, a macro recorder facility.
 * 
 * To see how the cursor-keypad methods work, see the following table. A given method corresponds to a cursor-keypad key with the Ctrl and Shift keys. The <i>Unit</i> parameter is selected by pressing or not pressing the Ctrl key, while the <i>Extend</i> parameter is selected by pressing or not pressing the Shift key. Note, <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-moveup">MoveUp</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-movedown">MoveDown</a> correspond to more than one keypad key. For more information, see the descriptions of the methods.
 * 
 * <table class="clsStd">
 * <tr>
 * <th>Method</th>
 * <th>Cursor-keypad key</th>
 * <th>Unit given by CTRL pressed (not pressed)</th>
 * <th>Extend given by SHIFT pressed (not pressed)</th>
 * </tr>
 * <tr>
 * <td>EndKey</td>
 * <td>End</td>
 * <td>tomStory (tomLine)</td>
 * <td>tomExtend (tomMove)</td>
 * </tr>
 * <tr>
 * <td>HomeKey</td>
 * <td>Home</td>
 * <td>tomStory (tomLine)</td>
 * <td>tomExtend (tomMove)</td>
 * </tr>
 * <tr>
 * <td>MoveLeft</td>
 * <td>Left Arrow</td>
 * <td>tomWord (tomCharacter)</td>
 * <td>tomExtend (tomMove)</td>
 * </tr>
 * <tr>
 * <td>MoveRight</td>
 * <td>Right Arrow</td>
 * <td>tomWord (tomCharacter)</td>
 * <td>tomExtend (tomMove)</td>
 * </tr>
 * <tr>
 * <td>MoveUp</td>
 * <td>Up Arrow</td>
 * <td>tomParagraph (tomLine)</td>
 * <td>tomExtend (tomMove)</td>
 * </tr>
 * <tr>
 * <td>MoveDown</td>
 * <td>Down Arrow</td>
 * <td>tomParagraph (tomLine)</td>
 * <td>tomExtend (tomMove)</td>
 * </tr>
 * <tr>
 * <td>MoveUp</td>
 * <td>Page Up</td>
 * <td>tomWindow (tomScreen)</td>
 * <td>tomExtend (tomMove)</td>
 * </tr>
 * <tr>
 * <td>MoveDown</td>
 * <td>Page Down</td>
 * <td>tomWindow (tomScreen)</td>
 * <td>tomExtend (tomMove)</td>
 * </tr>
 * </table>
 *  
 * 
 * Applications typically do not implement the <b>ITextSelection</b> interface. Instead, Microsoft text solutions such as rich edit controls implement <b>ITextSelection</b> as part of their Text Object Model (TOM) implementation.
 * 
 * Applications can retrieve an <b>ITextSelection</b> pointer by calling the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextdocument-getselection">GetSelection</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/tom/nn-tom-itextselection
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ITextSelection extends ITextRange{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextSelection
     * @type {Guid}
     */
    static IID => Guid("{8cc497c1-a1df-11ce-8098-00aa0047be5d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 58

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFlags", "SetFlags", "GetType", "MoveLeft", "MoveRight", "MoveUp", "MoveDown", "HomeKey", "EndKey", "TypeText"]

    /**
     * Gets the text selection flags.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * Any combination of the following selection flags.
     *                
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Selection Flag</th>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td><b>tomSelStartActive</b></td>
     * <td>1</td>
     * <td>Start end is active.</td>
     * </tr>
     * <tr>
     * <td><b>tomSelAtEOL</b></td>
     * <td>2</td>
     * <td>For degenerate selections, the ambiguous 
     * 								character position corresponding to both the beginning of a line and the end of the preceding line should have the caret displayed at the end of the preceding line.</td>
     * </tr>
     * <tr>
     * <td><b>tomSelOvertype</b></td>
     * <td>4</td>
     * <td>Insert/Overtype mode is set to overtype. </td>
     * </tr>
     * <tr>
     * <td><b>tomSelActive</b></td>
     * <td>8</td>
     * <td>Selection is active.</td>
     * </tr>
     * <tr>
     * <td><b>tomSelReplace</b></td>
     * <td>16</td>
     * <td>Typing and pasting replaces selection.</td>
     * </tr>
     * </table>
     *  
     * 
     * Each of the table values is binary. Thus, if any value is not set, the text selection has the opposite property.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextselection-getflags
     */
    GetFlags() {
        result := ComCall(58, this, "int*", &pFlags := 0, "HRESULT")
        return pFlags
    }

    /**
     * Sets the text selection flags.
     * @remarks
     * To make sure that the start end is active and that the ambiguous 
     * 				character position is displayed at the end of the line, execute the following code: 
     * 
     * 
     * ```
     * selection.Flags = tomSelStartActive + tomSelAtEOL
     * ```
     * 
     * 
     * The 
     * 				Flags property is useful because an <a href="https://docs.microsoft.com/windows/desktop/api/tom/nn-tom-itextrange">ITextRange</a> object can select itself. With <b>SetFlags</b>, you can change the active end from the default value of End, select the caret position for an ambiguous 
     * 				character position, or change the Insert/Overtype mode.
     * @param {Integer} Flags Type: <b>long</b>
     * 
     * New flag values. It can be any combination of the following. 
     * 					
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Selection flag</th>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td><b>tomSelStartActive</b></td>
     * <td>1</td>
     * <td>Start end is active.</td>
     * </tr>
     * <tr>
     * <td><b>tomSelAtEOL</b></td>
     * <td>2</td>
     * <td>For degenerate selections, the ambiguous 
     * 								character position corresponding to both the beginning of a line and the end of the preceding line should have the caret displayed at the end of the preceding line.</td>
     * </tr>
     * <tr>
     * <td><b>tomSelOvertype</b></td>
     * <td>4</td>
     * <td>Insert/Overtype mode is set to overtype. </td>
     * </tr>
     * <tr>
     * <td><b>tomSelActive</b></td>
     * <td>8</td>
     * <td>Selection is active.</td>
     * </tr>
     * <tr>
     * <td><b>tomSelReplace</b></td>
     * <td>16</td>
     * <td>Typing and pasting replaces selection.</td>
     * </tr>
     * </table>
     *  
     * 
     * Each of the table values is binary. Thus, if any value is not set, the text selection has the opposite property.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextselection-setflags
     */
    SetFlags(Flags) {
        result := ComCall(59, this, "int", Flags, "HRESULT")
        return result
    }

    /**
     * Gets the type of text selection.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The selection type. The method returns <i>pType</i> with one of the values in the following table.
     * 
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Selection type</th>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td><b>tomNoSelection</b></td>
     * <td>0</td>
     * <td>No selection and no insertion point.</td>
     * </tr>
     * <tr>
     * <td><b>tomSelectionIP</b></td>
     * <td>1</td>
     * <td>Insertion point.</td>
     * </tr>
     * <tr>
     * <td><b>tomSelectionNormal</b></td>
     * <td>2</td>
     * <td>Single nondegenerate range.</td>
     * </tr>
     * <tr>
     * <td><b>tomSelectionFrame</b></td>
     * <td>3</td>
     * <td>Frame.</td>
     * </tr>
     * <tr>
     * <td><b>tomSelectionColumn</b></td>
     * <td>4</td>
     * <td>Table column.</td>
     * </tr>
     * <tr>
     * <td><b>tomSelectionRow</b></td>
     * <td>5</td>
     * <td>Table rows.</td>
     * </tr>
     * <tr>
     * <td><b>tomSelectionBlock</b></td>
     * <td>6</td>
     * <td>Block selection.</td>
     * </tr>
     * <tr>
     * <td><b>tomSelectionInlineShape</b></td>
     * <td>7</td>
     * <td>Picture.</td>
     * </tr>
     * <tr>
     * <td><b>tomSelectionShape</b></td>
     * <td>8</td>
     * <td>Shape.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextselection-gettype
     */
    GetType() {
        result := ComCall(60, this, "int*", &pType := 0, "HRESULT")
        return pType
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
     * @param {Integer} Unit Type: <b>long</b>
     * 
     * Unit to use. It can be one of the following. 
     * 					
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Value</th>
     * <th>Corresponding key combination</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td><b>tomCharacter</b></td>
     * <td>Left Arrow</td>
     * <td>Move one character position to the left. This is the default.</td>
     * </tr>
     * <tr>
     * <td><b>tomWord</b></td>
     * <td>Ctrl+Left Arrow</td>
     * <td>Move one word to the left.</td>
     * </tr>
     * </table>
     *  
     * 
     * Note: If 
     * 					<i>Count</i> is less than zero, movement is to the right.
     * @param {Integer} Count Type: <b>long</b>
     * 
     * Number of Units to move past. The default value is 1. If 
     * 					<i>Count</i> is less than zero, movement is to the right.
     * @param {Integer} Extend Type: <b>long</b>
     * 
     * Flag that indicates how to change the selection. If 
     * 					<i>Extend</i> is zero (or <b>tomMove</b>), the method collapses the selection to an insertion point at the active end and then moves it. If 
     * 					<i>Extend</i> is 1 (or <b>tomExtend</b>), the method moves the active end and leaves the other end alone. The default value is zero. A nonzero 
     * 					<i>Extend</i> value corresponds to the Shift key being pressed in addition to the key combination described in 
     * 					<i>Unit</i>.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The actual count of units the insertion point or active end is moved left. This parameter can be null. Collapsing the selection, when 
     * 					<i>Extend</i> is 0, counts as one unit.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextselection-moveleft
     */
    MoveLeft(Unit, Count, Extend) {
        result := ComCall(61, this, "int", Unit, "int", Count, "int", Extend, "int*", &pDelta := 0, "HRESULT")
        return pDelta
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
     * @param {Integer} Unit Type: <b>long</b>
     * 
     * Unit to use. It can be one of the following. 
     * 					
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Value</th>
     * <th>Corresponding key combination</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td><b>tomCharacter</b></td>
     * <td>Right Arrow</td>
     * <td>Move one character position to the right. This is the default.</td>
     * </tr>
     * <tr>
     * <td><b>tomWord</b></td>
     * <td>Ctrl+Right Arrow</td>
     * <td>Move one word to the right.</td>
     * </tr>
     * </table>
     *  
     * 
     * Note, if 
     * 					<i>Count</i> is less than zero, movement is to the left.
     * @param {Integer} Count Type: <b>long</b>
     * 
     * Number of Units to move past. The default value is 1. If <i>Count</i> is less than zero, movement is to the left.
     * @param {Integer} Extend Type: <b>long</b>
     * 
     * Flag that indicates how to change the selection. If 
     * 					<i>Extend</i> is zero (or <b>tomMove</b>), the method collapses the selection to an insertion point at the active end and then moves it. If <i>Extend</i> is 1 (or <b>tomExtend</b>), the method moves the active end and leaves the other end alone. The default value is zero. A nonzero <i>Extend</i> value corresponds to the Shift key being pressed in addition to the key combination described in <i>Unit</i>.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The actual count of units the insertion point or active end is moved left. This parameter can be null. Collapsing the selection, when <i>Extend</i> is 0, counts as one unit.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextselection-moveright
     */
    MoveRight(Unit, Count, Extend) {
        result := ComCall(62, this, "int", Unit, "int", Count, "int", Extend, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Mimics the functionality of the Up Arrow and Page Up keys.
     * @remarks
     * The <b>MoveUp</b> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-movedown">MoveDown</a> methods are similar to the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-moveleft">MoveLeft</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-moveright">MoveRight</a> methods, except that they reflect the behavior of the Up Arrow, Down Arrow, Page Up, and Page Down keys on the cursor-keypad.
     * @param {Integer} Unit Type: <b>long</b>
     * 
     * Unit to use in the operation. It can be one of the following. 
     * 					
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Value</th>
     * <th>Corresponding key combination</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td><b>tomLine</b></td>
     * <td>Up Arrow</td>
     * <td>Moves up one line. This is the default.</td>
     * </tr>
     * <tr>
     * <td><b>tomParagraph</b></td>
     * <td>Ctrl+Up Arrow</td>
     * <td>Moves up one paragraph.</td>
     * </tr>
     * <tr>
     * <td><b>tomScreen</b></td>
     * <td>Page Up</td>
     * <td>Moves up one screen.</td>
     * </tr>
     * <tr>
     * <td><b>tomWindow</b></td>
     * <td>Ctrl+Page Up</td>
     * <td>Moves to first character in window.</td>
     * </tr>
     * </table>
     * @param {Integer} Count Type: <b>long</b>
     * 
     * Number of <i>Units</i> to move past. The default value is 1.
     * @param {Integer} Extend Type: <b>long</b>
     * 
     * Flag that indicates how to change the selection. If 
     * 					<i>Extend</i> is zero (or <b>tomMove</b>), the method collapses the selection to an insertion point and then moves. If <i>Extend</i> is 1 (or <b>tomExtend</b>), the method moves the active end and leaves the other end alone. The default value is zero. A nonzero <i>Extend</i> value corresponds to the Shift key being pressed in addition to the key combination described in 
     * <i>Unit</i>.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * The actual count of units the insertion point or active end is moved down. This parameter can be null. Collapsing the selection counts as one unit.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextselection-moveup
     */
    MoveUp(Unit, Count, Extend) {
        result := ComCall(63, this, "int", Unit, "int", Count, "int", Extend, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Mimics the functionality of the Down Arrow and Page Down keys.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-moveup">ITextSelection::MoveUp</a> and <b>ITextSelection::MoveDown</b> methods are similar to the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-moveleft">ITextSelection::MoveLeft</a> and <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-moveright">ITextSelection::MoveRight</a> methods, except that they reflect the behavior of the Up Arrow, Down Arrow, Page Up, and Page Down keys on the cursor-keypad.
     * @param {Integer} Unit Type: <b>long</b>
     * 
     * Unit to use in the operation. It can be one of the following. 
     * 					
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Value</th>
     * <th>Corresponding key combination</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td><b>tomLine</b></td>
     * <td>Down Arrow</td>
     * <td>Moves down one line. This is the default.</td>
     * </tr>
     * <tr>
     * <td><b>tomParagraph</b></td>
     * <td>Ctrl+Down Arrow</td>
     * <td>Moves down one paragraph.</td>
     * </tr>
     * <tr>
     * <td><b>tomScreen</b></td>
     * <td>Page Down</td>
     * <td>Moves down one screen.</td>
     * </tr>
     * <tr>
     * <td><b>tomWindow</b></td>
     * <td>Ctrl+Page Down</td>
     * <td>Moves to last character in window.</td>
     * </tr>
     * </table>
     * @param {Integer} Count Type: <b>long</b>
     * 
     * Number of Units to move past. The default value is 1.
     * @param {Integer} Extend Type: <b>long</b>
     * 
     * Flag that indicates how to change the selection. If 
     * 					<i>Extend</i> is zero (or <b>tomMove</b>), the method collapses the selection to an insertion point and then moves. If 
     * 					<i>Extend</i> is 1 (or <b>tomExtend</b>), the method moves the active end and leaves the other end alone. The default value is zero. A nonzero 
     * 					<i>Extend</i> value corresponds to the Shift key being pressed in addition to the key combination described in 
     * 					<i>Unit</i>.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * Pointer to a variable that receives the actual count of units the insertion point or active end is moved down. Collapsing the selection counts as one unit. This parameter can be null.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextselection-movedown
     */
    MoveDown(Unit, Count, Extend) {
        result := ComCall(64, this, "int", Unit, "int", Count, "int", Extend, "int*", &pDelta := 0, "HRESULT")
        return pDelta
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
     * @param {Integer} Unit Type: <b>long</b>
     * @param {Integer} Extend Type: <b>long</b>
     * 
     * Flag that indicates how to change the selection. If 
     * 					<i>Extend</i> is zero (or <b>tomMove</b>), the method collapses the selection to an insertion point. If 
     * 					<i>Extend</i> is 1 (or <b>tomExtend</b>), the method moves the active end and leaves the other end alone. The default value is zero.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * Pointer to a variable that receives the count of characters that the insertion point or the active end is moved. This parameter can be null.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextselection-homekey
     */
    HomeKey(Unit, Extend) {
        result := ComCall(65, this, "int", Unit, "int", Extend, "int*", &pDelta := 0, "HRESULT")
        return pDelta
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
     * @param {Integer} Unit Type: <b>long</b>
     * 
     * Unit to use. It can be one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomLine"></a><a id="tomline"></a><a id="TOMLINE"></a><dl>
     * <dt><b>tomLine</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Depending on 
     * 								<i>Extend</i>, it moves either the insertion point or the active end to the end of the last line in the selection. This is the default.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomStory"></a><a id="tomstory"></a><a id="TOMSTORY"></a><dl>
     * <dt><b>tomStory</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Depending on 
     * 								<i>Extend</i>, it moves either the insertion point or the active end to the end of the last line in the story.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomColumn"></a><a id="tomcolumn"></a><a id="TOMCOLUMN"></a><dl>
     * <dt><b>tomColumn</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Depending on 
     * 								<i>Extend</i>, it moves either the insertion point or the active end to the end of the last column in the selection. This is available only if the TOM engine supports tables.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tomRow"></a><a id="tomrow"></a><a id="TOMROW"></a><dl>
     * <dt><b>tomRow</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Depending on 
     * 								<i>Extend</i>, it moves either the insertion point or the active end to the end of the last row in the selection. This is available only if the TOM engine supports tables.
     * 						
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} Extend Type: <b>long</b>
     * 
     * Flag that indicates how to change the selection. If 
     * 					<i>Extend</i> is zero (or <b>tomMove</b>), the method collapses the selection to an insertion point. If 
     * 					<i>Extend</i> is 1 (or <b>tomExtend</b>), the method moves the active end and leaves the other end alone. The default value is zero.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * Pointer to a variable that receives the count of characters that the insertion point or the active end is moved. This parameter can be null.
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextselection-endkey
     */
    EndKey(Unit, Extend) {
        result := ComCall(66, this, "int", Unit, "int", Extend, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Types the string given by bstr at this selection as if someone typed it. This is similar to the underlying SetText method, but is sensitive to the Insert/Overtype key state and UI settings like AutoCorrect and smart quotes.
     * @remarks
     * This method types the string given by <i>bstr</i> at this selection as if someone typed it. Using <b>TypeText</b> is faster than sending characters through the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-sendmessage">SendMessage</a> function, but it is slower than using <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-settext">SetText</a>. 
     * 
     * <b>TypeText</b> is similar to the underlying <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextrange-settext">SetText</a> method, however, it is sensitive to the Insert/Overtype key state and UI settings like AutoCorrect and smart quotes. For example, it deletes any nondegenerate selection and then inserts or overtypes (depending on the Insert/Overtype key state—see the <a href="https://docs.microsoft.com/windows/desktop/api/tom/nf-tom-itextselection-setflags">SetFlags</a> method) the string <i>bstr</i> at the insertion point, leaving this selection as an insertion point following the inserted text.
     * @param {BSTR} bstr Type: <b>BSTR</b>
     * 
     * String to type into this selection.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an 
     * 						<b>HRESULT</b> value. If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following error codes. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/tom/nf-tom-itextselection-typetext
     */
    TypeText(bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(67, this, "ptr", bstr, "HRESULT")
        return result
    }
}
