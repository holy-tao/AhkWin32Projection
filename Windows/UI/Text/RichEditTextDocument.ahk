#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITextDocument2.ahk
#Include .\ITextDocument3.ahk
#Include .\ITextDocument4.ahk
#Include .\ITextDocument.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a rich text document that can be loaded, saved, and edited.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextdocument
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class RichEditTextDocument extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITextDocument2

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITextDocument2.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether trailing white space is taken into account when text is aligned.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextdocument.alignmentincludestrailingwhitespace
     * @type {Boolean} 
     */
    AlignmentIncludesTrailingWhitespace {
        get => this.get_AlignmentIncludesTrailingWhitespace()
        set => this.put_AlignmentIncludesTrailingWhitespace(value)
    }

    /**
     * Gets or sets a value that indicates whether character spacing is applied to the last character in a line.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextdocument.ignoretrailingcharacterspacing
     * @type {Boolean} 
     */
    IgnoreTrailingCharacterSpacing {
        get => this.get_IgnoreTrailingCharacterSpacing()
        set => this.put_IgnoreTrailingCharacterSpacing(value)
    }

    /**
     * Gets or sets the caret type.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextdocument.carettype
     * @type {Integer} 
     */
    CaretType {
        get => this.get_CaretType()
        set => this.put_CaretType(value)
    }

    /**
     * Gets or sets the default tab spacing.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextdocument.defaulttabstop
     * @type {Float} 
     */
    DefaultTabStop {
        get => this.get_DefaultTabStop()
        set => this.put_DefaultTabStop(value)
    }

    /**
     * Gets the active text selection.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextdocument.selection
     * @type {ITextSelection} 
     */
    Selection {
        get => this.get_Selection()
    }

    /**
     * Gets or sets the maximum number of actions that can be stored in the undo queue.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextdocument.undolimit
     * @type {Integer} 
     */
    UndoLimit {
        get => this.get_UndoLimit()
        set => this.put_UndoLimit(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AlignmentIncludesTrailingWhitespace() {
        if (!this.HasProp("__ITextDocument2")) {
            if ((queryResult := this.QueryInterface(ITextDocument2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument2 := ITextDocument2(outPtr)
        }

        return this.__ITextDocument2.get_AlignmentIncludesTrailingWhitespace()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AlignmentIncludesTrailingWhitespace(value) {
        if (!this.HasProp("__ITextDocument2")) {
            if ((queryResult := this.QueryInterface(ITextDocument2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument2 := ITextDocument2(outPtr)
        }

        return this.__ITextDocument2.put_AlignmentIncludesTrailingWhitespace(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IgnoreTrailingCharacterSpacing() {
        if (!this.HasProp("__ITextDocument2")) {
            if ((queryResult := this.QueryInterface(ITextDocument2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument2 := ITextDocument2(outPtr)
        }

        return this.__ITextDocument2.get_IgnoreTrailingCharacterSpacing()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IgnoreTrailingCharacterSpacing(value) {
        if (!this.HasProp("__ITextDocument2")) {
            if ((queryResult := this.QueryInterface(ITextDocument2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument2 := ITextDocument2(outPtr)
        }

        return this.__ITextDocument2.put_IgnoreTrailingCharacterSpacing(value)
    }

    /**
     * Empties the undo and redo buffers.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextdocument.clearundoredohistory
     */
    ClearUndoRedoHistory() {
        if (!this.HasProp("__ITextDocument3")) {
            if ((queryResult := this.QueryInterface(ITextDocument3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument3 := ITextDocument3(outPtr)
        }

        return this.__ITextDocument3.ClearUndoRedoHistory()
    }

    /**
     * Sets the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) content to the specified [MathML](https://www.w3.org/Math/).
     * 
     * > [!IMPORTANT]
     * > **Windows 11, version 23H2 and earlier:** the math mode APIs are part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @remarks
     * This method fails if current math mode of the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) is set to [NoMath](richeditmathmode.md).
     * 
     * Math mode enables users to have input automatically recognized and converted to [MathML](https://www.w3.org/Math/) while being received. For example, "4^2" is converted to "4<sup>2</sup>", and "1/2" is converted to "½".
     * 
     * Math mode might change formatting (fonts), context menus, and other aspects of the input.
     * @param {HSTRING} value The [MathML](https://www.w3.org/Math/) content for the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextdocument.setmath
     */
    SetMath(value) {
        if (!this.HasProp("__ITextDocument4")) {
            if ((queryResult := this.QueryInterface(ITextDocument4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument4 := ITextDocument4(outPtr)
        }

        return this.__ITextDocument4.SetMath(value)
    }

    /**
     * Retrieves the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) content as [MathML](https://www.w3.org/Math/).
     * 
     * > [!IMPORTANT]
     * > **Windows 11, version 23H2 and earlier:** the math mode APIs are part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @remarks
     * This method fails if current math mode of the [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) is set to [NoMath](richeditmathmode.md).
     * 
     * Math mode enables users to have input automatically recognized and converted to [MathML](https://www.w3.org/Math/) while being received. For example, "4^2" is converted to "4<sup>2</sup>", and "1/2" is converted to "½".
     * 
     * Math mode might change formatting (fonts), context menus, and other aspects of the input.
     * @param {Pointer<HSTRING>} value The [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) content as [MathML](https://www.w3.org/Math/).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextdocument.getmath
     */
    GetMath(value) {
        if (!this.HasProp("__ITextDocument4")) {
            if ((queryResult := this.QueryInterface(ITextDocument4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument4 := ITextDocument4(outPtr)
        }

        return this.__ITextDocument4.GetMath(value)
    }

    /**
     * Configures a [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) to interpret input based on the specified math mode.
     * 
     * > [!IMPORTANT]
     * > **Windows 11, version 23H2 and earlier:** the math mode APIs are part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @remarks
     * Math mode enables users to have input automatically recognized and converted to [MathML](https://www.w3.org/Math/) while being received. For example, "4^2" is converted to "4<sup>2</sup>", and "1/2" is converted to "½".
     * 
     * Math mode might change formatting (fonts), context menus, and other aspects of the input.
     * @param {Integer} mode_ Specifies whether a [RichEditBox](../windows.ui.xaml.controls/richeditbox.md) interprets input as  ([MathML](https://www.w3.org/Math/)) or text.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextdocument.setmathmode
     */
    SetMathMode(mode_) {
        if (!this.HasProp("__ITextDocument4")) {
            if ((queryResult := this.QueryInterface(ITextDocument4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument4 := ITextDocument4(outPtr)
        }

        return this.__ITextDocument4.SetMathMode(mode_)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CaretType() {
        if (!this.HasProp("__ITextDocument")) {
            if ((queryResult := this.QueryInterface(ITextDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument := ITextDocument(outPtr)
        }

        return this.__ITextDocument.get_CaretType()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CaretType(value) {
        if (!this.HasProp("__ITextDocument")) {
            if ((queryResult := this.QueryInterface(ITextDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument := ITextDocument(outPtr)
        }

        return this.__ITextDocument.put_CaretType(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DefaultTabStop() {
        if (!this.HasProp("__ITextDocument")) {
            if ((queryResult := this.QueryInterface(ITextDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument := ITextDocument(outPtr)
        }

        return this.__ITextDocument.get_DefaultTabStop()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DefaultTabStop(value) {
        if (!this.HasProp("__ITextDocument")) {
            if ((queryResult := this.QueryInterface(ITextDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument := ITextDocument(outPtr)
        }

        return this.__ITextDocument.put_DefaultTabStop(value)
    }

    /**
     * 
     * @returns {ITextSelection} 
     */
    get_Selection() {
        if (!this.HasProp("__ITextDocument")) {
            if ((queryResult := this.QueryInterface(ITextDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument := ITextDocument(outPtr)
        }

        return this.__ITextDocument.get_Selection()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UndoLimit() {
        if (!this.HasProp("__ITextDocument")) {
            if ((queryResult := this.QueryInterface(ITextDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument := ITextDocument(outPtr)
        }

        return this.__ITextDocument.get_UndoLimit()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_UndoLimit(value) {
        if (!this.HasProp("__ITextDocument")) {
            if ((queryResult := this.QueryInterface(ITextDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument := ITextDocument(outPtr)
        }

        return this.__ITextDocument.put_UndoLimit(value)
    }

    /**
     * Determines whether document content can be copied to the Clipboard.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextdocument.cancopy
     */
    CanCopy() {
        if (!this.HasProp("__ITextDocument")) {
            if ((queryResult := this.QueryInterface(ITextDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument := ITextDocument(outPtr)
        }

        return this.__ITextDocument.CanCopy()
    }

    /**
     * Determines whether the Clipboard has content that can be pasted into the document.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextdocument.canpaste
     */
    CanPaste() {
        if (!this.HasProp("__ITextDocument")) {
            if ((queryResult := this.QueryInterface(ITextDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument := ITextDocument(outPtr)
        }

        return this.__ITextDocument.CanPaste()
    }

    /**
     * Determines whether one or more redo operations exist.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextdocument.canredo
     */
    CanRedo() {
        if (!this.HasProp("__ITextDocument")) {
            if ((queryResult := this.QueryInterface(ITextDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument := ITextDocument(outPtr)
        }

        return this.__ITextDocument.CanRedo()
    }

    /**
     * Determines whether one or more undo operations exist.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextdocument.canundo
     */
    CanUndo() {
        if (!this.HasProp("__ITextDocument")) {
            if ((queryResult := this.QueryInterface(ITextDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument := ITextDocument(outPtr)
        }

        return this.__ITextDocument.CanUndo()
    }

    /**
     * Decrements an internal counter that controls whether text updates are displayed immediately or batched.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextdocument.applydisplayupdates
     */
    ApplyDisplayUpdates() {
        if (!this.HasProp("__ITextDocument")) {
            if ((queryResult := this.QueryInterface(ITextDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument := ITextDocument(outPtr)
        }

        return this.__ITextDocument.ApplyDisplayUpdates()
    }

    /**
     * Increments an internal counter that controls whether text updates are displayed immediately or batched.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextdocument.batchdisplayupdates
     */
    BatchDisplayUpdates() {
        if (!this.HasProp("__ITextDocument")) {
            if ((queryResult := this.QueryInterface(ITextDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument := ITextDocument(outPtr)
        }

        return this.__ITextDocument.BatchDisplayUpdates()
    }

    /**
     * Turns on undo grouping.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextdocument.beginundogroup
     */
    BeginUndoGroup() {
        if (!this.HasProp("__ITextDocument")) {
            if ((queryResult := this.QueryInterface(ITextDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument := ITextDocument(outPtr)
        }

        return this.__ITextDocument.BeginUndoGroup()
    }

    /**
     * Turns off undo grouping.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextdocument.endundogroup
     */
    EndUndoGroup() {
        if (!this.HasProp("__ITextDocument")) {
            if ((queryResult := this.QueryInterface(ITextDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument := ITextDocument(outPtr)
        }

        return this.__ITextDocument.EndUndoGroup()
    }

    /**
     * Retrieves the default character formatting attributes of the document.
     * @returns {ITextCharacterFormat} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextdocument.getdefaultcharacterformat
     */
    GetDefaultCharacterFormat() {
        if (!this.HasProp("__ITextDocument")) {
            if ((queryResult := this.QueryInterface(ITextDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument := ITextDocument(outPtr)
        }

        return this.__ITextDocument.GetDefaultCharacterFormat()
    }

    /**
     * Retrieves the default paragraph formatting attributes of the document.
     * @returns {ITextParagraphFormat} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextdocument.getdefaultparagraphformat
     */
    GetDefaultParagraphFormat() {
        if (!this.HasProp("__ITextDocument")) {
            if ((queryResult := this.QueryInterface(ITextDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument := ITextDocument(outPtr)
        }

        return this.__ITextDocument.GetDefaultParagraphFormat()
    }

    /**
     * Retrieves a new text range for the active story of the document.
     * @param {Integer} startPosition The starting position of the new text range, relative to the beginning of the story.
     * @param {Integer} endPosition The ending position of the new text range.
     * @returns {ITextRange} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextdocument.getrange
     */
    GetRange(startPosition, endPosition) {
        if (!this.HasProp("__ITextDocument")) {
            if ((queryResult := this.QueryInterface(ITextDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument := ITextDocument(outPtr)
        }

        return this.__ITextDocument.GetRange(startPosition, endPosition)
    }

    /**
     * Retrieves the degenerate (empty) text range at, or nearest to, a particular point on the screen.
     * @param {POINT} point_ The location of the point on the screen, in screen coordinates.
     * @param {Integer} options The alignment type of the specified *point*.
     * @returns {ITextRange} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextdocument.getrangefrompoint
     */
    GetRangeFromPoint(point_, options) {
        if (!this.HasProp("__ITextDocument")) {
            if ((queryResult := this.QueryInterface(ITextDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument := ITextDocument(outPtr)
        }

        return this.__ITextDocument.GetRangeFromPoint(point_, options)
    }

    /**
     * Gets the text in the active story (document).
     * @param {Integer} options The text retrieval options.
     * @param {Pointer<HSTRING>} value The text in the active story.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextdocument.gettext
     */
    GetText(options, value) {
        if (!this.HasProp("__ITextDocument")) {
            if ((queryResult := this.QueryInterface(ITextDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument := ITextDocument(outPtr)
        }

        return this.__ITextDocument.GetText(options, value)
    }

    /**
     * Loads a document from a stream.
     * @param {Integer} options The text options to use for the loading the document.
     * @param {IRandomAccessStream} value The random access stream that contains the document.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextdocument.loadfromstream
     */
    LoadFromStream(options, value) {
        if (!this.HasProp("__ITextDocument")) {
            if ((queryResult := this.QueryInterface(ITextDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument := ITextDocument(outPtr)
        }

        return this.__ITextDocument.LoadFromStream(options, value)
    }

    /**
     * Reverses the most recent undo operation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextdocument.redo
     */
    Redo() {
        if (!this.HasProp("__ITextDocument")) {
            if ((queryResult := this.QueryInterface(ITextDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument := ITextDocument(outPtr)
        }

        return this.__ITextDocument.Redo()
    }

    /**
     * Saves the document to a stream.
     * @param {Integer} options The text options for saving the document.
     * @param {IRandomAccessStream} value The random access stream for saving the document.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextdocument.savetostream
     */
    SaveToStream(options, value) {
        if (!this.HasProp("__ITextDocument")) {
            if ((queryResult := this.QueryInterface(ITextDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument := ITextDocument(outPtr)
        }

        return this.__ITextDocument.SaveToStream(options, value)
    }

    /**
     * Sets the default character formatting attributes of the document.
     * @param {ITextCharacterFormat} value The new default character formatting attributes.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextdocument.setdefaultcharacterformat
     */
    SetDefaultCharacterFormat(value) {
        if (!this.HasProp("__ITextDocument")) {
            if ((queryResult := this.QueryInterface(ITextDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument := ITextDocument(outPtr)
        }

        return this.__ITextDocument.SetDefaultCharacterFormat(value)
    }

    /**
     * Sets the default paragraph formatting attributes of the document.
     * @param {ITextParagraphFormat} value The default paragraph formatting attributes.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextdocument.setdefaultparagraphformat
     */
    SetDefaultParagraphFormat(value) {
        if (!this.HasProp("__ITextDocument")) {
            if ((queryResult := this.QueryInterface(ITextDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument := ITextDocument(outPtr)
        }

        return this.__ITextDocument.SetDefaultParagraphFormat(value)
    }

    /**
     * Sets the text of the document.
     * @remarks
     * If the string is **NULL**, the text in the document is deleted.
     * @param {Integer} options Options that control how the text is inserted into the document.
     * @param {HSTRING} value The new text.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextdocument.settext
     */
    SetText(options, value) {
        if (!this.HasProp("__ITextDocument")) {
            if ((queryResult := this.QueryInterface(ITextDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument := ITextDocument(outPtr)
        }

        return this.__ITextDocument.SetText(options, value)
    }

    /**
     * Undoes the most recent undo group.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextdocument.undo
     */
    Undo() {
        if (!this.HasProp("__ITextDocument")) {
            if ((queryResult := this.QueryInterface(ITextDocument.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextDocument := ITextDocument(outPtr)
        }

        return this.__ITextDocument.Undo()
    }

;@endregion Instance Methods
}
