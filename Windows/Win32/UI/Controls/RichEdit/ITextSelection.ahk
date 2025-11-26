#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ITextRange.ahk

/**
 * A text selection is a text range with selection highlighting.
 * @remarks
 * 
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
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tom/nn-tom-itextselection
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
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextselection-getflags
     */
    GetFlags() {
        result := ComCall(58, this, "int*", &pFlags := 0, "HRESULT")
        return pFlags
    }

    /**
     * Sets the text selection flags.
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
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextselection-setflags
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
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextselection-gettype
     */
    GetType() {
        result := ComCall(60, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * Generalizes the functionality of the Left Arrow key.
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
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextselection-moveleft
     */
    MoveLeft(Unit, Count, Extend) {
        result := ComCall(61, this, "int", Unit, "int", Count, "int", Extend, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Generalizes the functionality of the Right Arrow key.
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
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextselection-moveright
     */
    MoveRight(Unit, Count, Extend) {
        result := ComCall(62, this, "int", Unit, "int", Count, "int", Extend, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Mimics the functionality of the Up Arrow and Page Up keys.
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
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextselection-moveup
     */
    MoveUp(Unit, Count, Extend) {
        result := ComCall(63, this, "int", Unit, "int", Count, "int", Extend, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Mimics the functionality of the Down Arrow and Page Down keys.
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
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextselection-movedown
     */
    MoveDown(Unit, Count, Extend) {
        result := ComCall(64, this, "int", Unit, "int", Count, "int", Extend, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Generalizes the functionality of the Home key.
     * @param {Integer} Unit Type: <b>long</b>
     * @param {Integer} Extend Type: <b>long</b>
     * 
     * Flag that indicates how to change the selection. If 
     * 					<i>Extend</i> is zero (or <b>tomMove</b>), the method collapses the selection to an insertion point. If 
     * 					<i>Extend</i> is 1 (or <b>tomExtend</b>), the method moves the active end and leaves the other end alone. The default value is zero.
     * @returns {Integer} Type: <b>long*</b>
     * 
     * Pointer to a variable that receives the count of characters that the insertion point or the active end is moved. This parameter can be null.
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextselection-homekey
     */
    HomeKey(Unit, Extend) {
        result := ComCall(65, this, "int", Unit, "int", Extend, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Mimics the functionality of the End key.
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
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextselection-endkey
     */
    EndKey(Unit, Extend) {
        result := ComCall(66, this, "int", Unit, "int", Extend, "int*", &pDelta := 0, "HRESULT")
        return pDelta
    }

    /**
     * Types the string given by bstr at this selection as if someone typed it. This is similar to the underlying SetText method, but is sensitive to the Insert/Overtype key state and UI settings like AutoCorrect and smart quotes.
     * @param {BSTR} bstr Type: <b>BSTR</b>
     * 
     * String to type into this selection.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an 
     * 						<b>HRESULT</b> value. If the method succeeds, it returns <b>S_OK</b>. If the method fails, it returns one of the following error codes. For more information about COM error codes, see <a href="/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//tom/nf-tom-itextselection-typetext
     */
    TypeText(bstr) {
        bstr := bstr is String ? BSTR.Alloc(bstr).Value : bstr

        result := ComCall(67, this, "ptr", bstr, "HRESULT")
        return result
    }
}
