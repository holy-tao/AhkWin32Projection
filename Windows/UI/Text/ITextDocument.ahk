#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ITextSelection.ahk
#Include .\ITextCharacterFormat.ahk
#Include .\ITextParagraphFormat.ahk
#Include .\ITextRange.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides access to the content of a document, providing a way to load and save the document to a stream, retrieve text ranges, get the active selection, set default formatting attributes, and so on.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextdocument
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class ITextDocument extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextDocument
     * @type {Guid}
     */
    static IID => Guid("{beee4ddb-90b2-408c-a2f6-0a0ac31e33e4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CaretType", "put_CaretType", "get_DefaultTabStop", "put_DefaultTabStop", "get_Selection", "get_UndoLimit", "put_UndoLimit", "CanCopy", "CanPaste", "CanRedo", "CanUndo", "ApplyDisplayUpdates", "BatchDisplayUpdates", "BeginUndoGroup", "EndUndoGroup", "GetDefaultCharacterFormat", "GetDefaultParagraphFormat", "GetRange", "GetRangeFromPoint", "GetText", "LoadFromStream", "Redo", "SaveToStream", "SetDefaultCharacterFormat", "SetDefaultParagraphFormat", "SetText", "Undo"]

    /**
     * Gets or sets the caret type.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextdocument.carettype
     * @type {Integer} 
     */
    CaretType {
        get => this.get_CaretType()
        set => this.put_CaretType(value)
    }

    /**
     * Gets or sets the default tab spacing.
     * @remarks
     * The default tab spacing is used whenever no tab exists beyond the desired display position.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextdocument.defaulttabstop
     * @type {Float} 
     */
    DefaultTabStop {
        get => this.get_DefaultTabStop()
        set => this.put_DefaultTabStop(value)
    }

    /**
     * Gets the active text selection.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextdocument.selection
     * @type {ITextSelection} 
     */
    Selection {
        get => this.get_Selection()
    }

    /**
     * Gets or sets the maximum number of actions that can be stored in the undo queue.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextdocument.undolimit
     * @type {Integer} 
     */
    UndoLimit {
        get => this.get_UndoLimit()
        set => this.put_UndoLimit(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CaretType() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_CaretType(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DefaultTabStop() {
        result := ComCall(8, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DefaultTabStop(value) {
        result := ComCall(9, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ITextSelection} 
     */
    get_Selection() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITextSelection(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UndoLimit() {
        result := ComCall(11, this, "uint*", &value := 0, "int")
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
    put_UndoLimit(value) {
        result := ComCall(12, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines whether document content can be copied to the Clipboard.
     * @remarks
     * Copying is allowed unless the document is copy-protected.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextdocument.cancopy
     */
    CanCopy() {
        result := ComCall(13, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Determines whether the Clipboard has content that can be pasted into the document.
     * @remarks
     * Pasting is allowed unless the control is read-only or the selection is protected and the client refuses permission to paste.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextdocument.canpaste
     */
    CanPaste() {
        result := ComCall(14, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Determines whether one or more redo operations exist.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextdocument.canredo
     */
    CanRedo() {
        result := ComCall(15, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Determines whether one or more undo operations exist.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextdocument.canundo
     */
    CanUndo() {
        result := ComCall(16, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Decrements an internal counter that controls whether text updates are displayed immediately or batched.
     * @remarks
     * If the internal counter goes to zero, text updates are displayed immediately instead of batched.
     * 
     * This method cannot decrement the internal counter below zero, and no error occurs if it is called when the counter is already zero.
     * 
     * To increment the internal counter, call the [ITextDocument.BatchDisplayUpdates](itextdocument_batchdisplayupdates_505749236.md) method.
     * 
     * 
     * 
     * > [!NOTE]
     * > If undo grouping is on (see [ITextDocument.BeginUndoGroup](itextdocument_beginundogroup_1705396921.md)), screen updating is suppressed regardless of the internal counter's value.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextdocument.applydisplayupdates
     */
    ApplyDisplayUpdates() {
        result := ComCall(17, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Increments an internal counter that controls whether text updates are displayed immediately or batched.
     * @remarks
     * If the internal counter is nonzero, text updates are batched. This lets you perform a sequence of editing operations without the performance loss and flicker of screen updating.
     * 
     * To decrement the internal counter, call the [ITextDocument.ApplyDisplayUpdates](itextdocument_applydisplayupdates_1551145521.md) method.
     * 
     * 
     * 
     * > [!NOTE]
     * > If undo grouping is on (see [ITextDocument.BeginUndoGroup](itextdocument_beginundogroup_1705396921.md)), screen updating is suppressed regardless of the internal counter's value.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextdocument.batchdisplayupdates
     */
    BatchDisplayUpdates() {
        result := ComCall(18, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Turns on undo grouping.
     * @remarks
     * An undo group collects undo anti-events for editing changes even when additional undo groups would normally be created. For example, typing anti-events are normally grouped into a single undo group that can be undone with a single Ctrl+Z key combination. A paste or change in insertion point terminates the current undo group and starts another. After you call BeginUndoGroup, such terminations do not occur; only one undo group is used until you call the [EndUndoGroup](itextdocument_endundogroup_1549565818.md) method. The entire group is undone by a single Ctrl+Z key combination.
     * 
     * When undo grouping is on:
     * + The undo manager adds undo anti-events for text changes to the current undo group.
     * + A single undo command executes all of the undo anti-events in the undo group. This restores the text state to the one that was active when undo grouping was turned on.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextdocument.beginundogroup
     */
    BeginUndoGroup() {
        result := ComCall(19, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Turns off undo grouping.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextdocument.endundogroup
     */
    EndUndoGroup() {
        result := ComCall(20, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the default character formatting attributes of the document.
     * @returns {ITextCharacterFormat} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextdocument.getdefaultcharacterformat
     */
    GetDefaultCharacterFormat() {
        result := ComCall(21, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITextCharacterFormat(result_)
    }

    /**
     * Retrieves the default paragraph formatting attributes of the document.
     * @returns {ITextParagraphFormat} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextdocument.getdefaultparagraphformat
     */
    GetDefaultParagraphFormat() {
        result := ComCall(22, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITextParagraphFormat(result_)
    }

    /**
     * Retrieves a new text range for the active story of the document.
     * @param {Integer} startPosition The starting position of the new text range, relative to the beginning of the story.
     * @param {Integer} endPosition The ending position of the new text range.
     * @returns {ITextRange} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextdocument.getrange
     */
    GetRange(startPosition, endPosition) {
        result := ComCall(23, this, "int", startPosition, "int", endPosition, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITextRange(result_)
    }

    /**
     * Retrieves the degenerate (empty) text range at, or nearest to, a particular point on the screen.
     * @param {POINT} point_ The location of the point on the screen, in screen coordinates.
     * @param {Integer} options The alignment type of the specified *point*.
     * @returns {ITextRange} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextdocument.getrangefrompoint
     */
    GetRangeFromPoint(point_, options) {
        result := ComCall(24, this, "ptr", point_, "uint", options, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITextRange(result_)
    }

    /**
     * Gets the text in the active story (document).
     * @param {Integer} options The text retrieval options.
     * @param {Pointer<HSTRING>} value The text in the active story.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextdocument.gettext
     */
    GetText(options, value) {
        result := ComCall(25, this, "uint", options, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Loads a document from a stream.
     * @param {Integer} options The text options to use for the loading the document.
     * @param {IRandomAccessStream} value The random access stream that contains the document.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextdocument.loadfromstream
     */
    LoadFromStream(options, value) {
        result := ComCall(26, this, "uint", options, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Performs a specified number of redo operations.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds it returns <b>S_OK</b>. If the method fails, it returns the following COM error code. For more information on COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Less than <i>Count</i> redo operations were performed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextdocument-redo
     */
    Redo() {
        result := ComCall(27, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Saves the document to a stream.
     * @param {Integer} options The text options for saving the document.
     * @param {IRandomAccessStream} value The random access stream for saving the document.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextdocument.savetostream
     */
    SaveToStream(options, value) {
        result := ComCall(28, this, "uint", options, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the default character formatting attributes of the document.
     * @param {ITextCharacterFormat} value The new default character formatting attributes.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextdocument.setdefaultcharacterformat
     */
    SetDefaultCharacterFormat(value) {
        result := ComCall(29, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the default paragraph formatting attributes of the document.
     * @param {ITextParagraphFormat} value The default paragraph formatting attributes.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextdocument.setdefaultparagraphformat
     */
    SetDefaultParagraphFormat(value) {
        result := ComCall(30, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the text of the document.
     * @remarks
     * If the string is **NULL**, the text in the document is deleted.
     * @param {Integer} options Options controlling how the text is inserted into the document.
     * @param {HSTRING} value The new text.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextdocument.settext
     */
    SetText(options, value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(31, this, "uint", options, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Performs a specified number of undo operations.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If all of the 
     * 						<i>Count</i> undo operations were performed, it returns <b>S_OK</b>. If the method fails, it returns <b>S_FALSE</b>, indicating that less than 
     * 						<i>Count</i> undo operations were performed. For more information on COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/com/error-handling-in-com">Error Handling in COM</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/tom/nf-tom-itextdocument-undo
     */
    Undo() {
        result := ComCall(32, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
