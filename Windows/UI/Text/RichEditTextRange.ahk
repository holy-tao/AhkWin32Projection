#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRichEditTextRange.ahk
#Include .\ITextRange.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a span of continuous text in a [RichEditTextDocument](richedittextdocument.md), and provides editing and data-binding properties and methods that allow an app to select, examine, and change document content.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class RichEditTextRange extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRichEditTextRange

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRichEditTextRange.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the content link information for this text range.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.contentlinkinfo
     * @type {ContentLinkInfo} 
     */
    ContentLinkInfo {
        get => this.get_ContentLinkInfo()
        set => this.put_ContentLinkInfo(value)
    }

    /**
     * Gets or sets the first character of the text range; that is, the character associated with the StartPosition property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.character
     * @type {Integer} 
     */
    Character {
        get => this.get_Character()
        set => this.put_Character(value)
    }

    /**
     * Gets or sets the character formatting attributes of the text range.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.characterformat
     * @type {ITextCharacterFormat} 
     */
    CharacterFormat {
        get => this.get_CharacterFormat()
        set => this.put_CharacterFormat(value)
    }

    /**
     * Gets or sets an ITextRange object with the formatted text of the specified range.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.formattedtext
     * @type {ITextRange} 
     */
    FormattedText {
        get => this.get_FormattedText()
        set => this.put_FormattedText(value)
    }

    /**
     * Gets or sets the end character position of the text range.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.endposition
     * @type {Integer} 
     */
    EndPosition {
        get => this.get_EndPosition()
        set => this.put_EndPosition(value)
    }

    /**
     * Gets or sets the gravity of the text range.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.gravity
     * @type {Integer} 
     */
    Gravity {
        get => this.get_Gravity()
        set => this.put_Gravity(value)
    }

    /**
     * Gets the count of characters in the text range.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.length
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
    }

    /**
     * Gets or sets the URL text associated with a text range.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.link
     * @type {HSTRING} 
     */
    Link {
        get => this.get_Link()
        set => this.put_Link(value)
    }

    /**
     * Gets or sets the paragraph formatting attributes of the text range.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.paragraphformat
     * @type {ITextParagraphFormat} 
     */
    ParagraphFormat {
        get => this.get_ParagraphFormat()
        set => this.put_ParagraphFormat(value)
    }

    /**
     * Gets or sets the start position of the text range.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.startposition
     * @type {Integer} 
     */
    StartPosition {
        get => this.get_StartPosition()
        set => this.put_StartPosition(value)
    }

    /**
     * Gets the count of characters in the story of the text range.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.storylength
     * @type {Integer} 
     */
    StoryLength {
        get => this.get_StoryLength()
    }

    /**
     * Gets or sets the plain text of the text range.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
        set => this.put_Text(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {ContentLinkInfo} 
     */
    get_ContentLinkInfo() {
        if (!this.HasProp("__IRichEditTextRange")) {
            if ((queryResult := this.QueryInterface(IRichEditTextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditTextRange := IRichEditTextRange(outPtr)
        }

        return this.__IRichEditTextRange.get_ContentLinkInfo()
    }

    /**
     * 
     * @param {ContentLinkInfo} value 
     * @returns {HRESULT} 
     */
    put_ContentLinkInfo(value) {
        if (!this.HasProp("__IRichEditTextRange")) {
            if ((queryResult := this.QueryInterface(IRichEditTextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditTextRange := IRichEditTextRange(outPtr)
        }

        return this.__IRichEditTextRange.put_ContentLinkInfo(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Character() {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.get_Character()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Character(value) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.put_Character(value)
    }

    /**
     * 
     * @returns {ITextCharacterFormat} 
     */
    get_CharacterFormat() {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.get_CharacterFormat()
    }

    /**
     * 
     * @param {ITextCharacterFormat} value 
     * @returns {HRESULT} 
     */
    put_CharacterFormat(value) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.put_CharacterFormat(value)
    }

    /**
     * 
     * @returns {ITextRange} 
     */
    get_FormattedText() {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.get_FormattedText()
    }

    /**
     * 
     * @param {ITextRange} value 
     * @returns {HRESULT} 
     */
    put_FormattedText(value) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.put_FormattedText(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EndPosition() {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.get_EndPosition()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_EndPosition(value) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.put_EndPosition(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Gravity() {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.get_Gravity()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Gravity(value) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.put_Gravity(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Length() {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.get_Length()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Link() {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.get_Link()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Link(value) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.put_Link(value)
    }

    /**
     * 
     * @returns {ITextParagraphFormat} 
     */
    get_ParagraphFormat() {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.get_ParagraphFormat()
    }

    /**
     * 
     * @param {ITextParagraphFormat} value 
     * @returns {HRESULT} 
     */
    put_ParagraphFormat(value) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.put_ParagraphFormat(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StartPosition() {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.get_StartPosition()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StartPosition(value) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.put_StartPosition(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StoryLength() {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.get_StoryLength()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.get_Text()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Text(value) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.put_Text(value)
    }

    /**
     * Determines whether the Clipboard contains content that can be pasted, using a specified format, into the current text range.
     * @param {Integer} format The clipboard format. Zero represents the best format, which usually is Rich Text Format (RTF), but CF_UNICODETEXT and other formats are also possible. The default value is zero.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.canpaste
     */
    CanPaste(format) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.CanPaste(format)
    }

    /**
     * Changes the case of letters in a text range.
     * @param {Integer} value The new case of letters in the text range. The default value is **Lower**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.changecase
     */
    ChangeCase(value) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.ChangeCase(value)
    }

    /**
     * Collapses the text range into a degenerate point at either the beginning or end of the range.
     * @param {Boolean} value **true** to collapse at the start of the text range. **false** to collapse at the end of the range. The default is **true**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.collapse
     */
    Collapse(value) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.Collapse(value)
    }

    /**
     * Copies the text of the text range to the Clipboard.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.copy
     */
    Copy() {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.Copy()
    }

    /**
     * Moves the text of the text range to the Clipboard.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.cut
     */
    Cut() {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.Cut()
    }

    /**
     * Deletes text from the text range.
     * @param {Integer} unit_ The unit of text to delete.
     * @param {Integer} count The number of _unit_s to delete.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.delete
     */
    Delete(unit_, count) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.Delete(unit_, count)
    }

    /**
     * Moves or extends the text range to the end of the nearest specified text unit. The text range is moved or extended forward in the document.
     * @param {Integer} unit_ The unit by which to move the end position of the text range.
     * @param {Boolean} extend **true** to extend the text range by moving just the end position of the range to the end of the specified unit. **false** to move both ends of the text range to the end of the specified unit. The default is **false**.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.endof
     */
    EndOf(unit_, extend) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.EndOf(unit_, extend)
    }

    /**
     * Expands a text range to completely contain any partial text units.
     * @param {Integer} unit_ The text unit to use to expand the range. The default value is **Word**.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.expand
     */
    Expand(unit_) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.Expand(unit_)
    }

    /**
     * Searches for a particular text string in a range and, if found, selects the string.
     * @param {HSTRING} value The text string to search for.
     * @param {Integer} scanLength The maximum number of characters to search. It can be one of the following.
     * @param {Integer} options The options to use when doing the text search.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.findtext
     */
    FindText(value, scanLength, options) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.FindText(value, scanLength, options)
    }

    /**
     * Retrieves the Unicode Transformation Format (UTF)-32 character code of the character at the specified offset from the end of the text range.
     * @param {Pointer<UInt32>} value The character value.
     * @param {Integer} offset The offset from the end of the text range.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.getcharacterutf32
     */
    GetCharacterUtf32(value, offset) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.GetCharacterUtf32(value, offset)
    }

    /**
     * Creates a new object that is identical to this text range object.
     * @returns {ITextRange} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.getclone
     */
    GetClone() {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.GetClone()
    }

    /**
     * Retrieves the story index of the text unit (word, line, sentence, paragraph, and so on) at the starting character position of the text range.
     * @param {Integer} unit_ The text unit that is indexed.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.getindex
     */
    GetIndex(unit_) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.GetIndex(unit_)
    }

    /**
     * Retrieves the screen coordinates of a particular location in the text range.
     * @param {Integer} horizontalAlign The horizontal position to retrieve, relative to the bounding rectangle of the text range.
     * @param {Integer} verticalAlign The vertical position to retrieve, relative to the bounding rectangle of the text range.
     * @param {Integer} options The options for retrieving the coordinates of the specified location in the text range.
     * @param {Pointer<POINT>} point_ A structure that receives the coordinates of the specified location in the text range, represented as an ordered pair of floating-point x- and y-coordinates that define a point in a two-dimensional plane.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.getpoint
     */
    GetPoint(horizontalAlign, verticalAlign, options, point_) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.GetPoint(horizontalAlign, verticalAlign, options, point_)
    }

    /**
     * Retrieves the bounding rectangle that encompasses the text range on the screen.
     * @param {Integer} options A value that indicates the rectangle to retrieve.
     * @param {Pointer<RECT>} rect_ A structure that contains four floating-point numbers that represent the location and size of the bounding rectangle.
     * @param {Pointer<Int32>} hit The hit-test value for the text range.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.getrect
     */
    GetRect(options, rect_, hit) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.GetRect(options, rect_, hit)
    }

    /**
     * Retrieves the text in a text range according to the specified conversion flags.
     * @param {Integer} options The conversion flags that control how the text is retrieved.
     * @param {Pointer<HSTRING>} value The text in the text range.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.gettext
     */
    GetText(options, value) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.GetText(options, value)
    }

    /**
     * Retrieves the text in the text range according to the specified conversion flags, as a random access stream.
     * @param {Integer} options The conversion flags that control how the text is retrieved. A value of default retrieves the plain text in the text range.
     * @param {IRandomAccessStream} value The text stream.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.gettextviastream
     */
    GetTextViaStream(options, value) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.GetTextViaStream(options, value)
    }

    /**
     * Determines whether this range is in or at the same text as a specified range.
     * @param {ITextRange} range Text that is compared to the current range.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.inrange
     */
    InRange(range) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.InRange(range)
    }

    /**
     * Inserts an image into this range.
     * @param {Integer} width The width of the image, in Device-independent pixels (DIPs).
     * @param {Integer} height The height of the image, in DIPs.
     * @param {Integer} ascent If _verticalAlign_ is **Baseline**, this parameter is the distance, in DIPs, that the top of the image extends above the text baseline. If _verticalAlign_ is **Baseline** and ascent is zero, the bottom of the image is placed at the text baseline.
     * @param {Integer} verticalAlign The vertical alignment of the image.
     * @param {HSTRING} alternateText The alternate text for the image.
     * @param {IRandomAccessStream} value The stream that contains the image data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.insertimage
     */
    InsertImage(width, height, ascent, verticalAlign, alternateText, value) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.InsertImage(width, height, ascent, verticalAlign, alternateText, value)
    }

    /**
     * Determines whether this range's story is the same as a specified range's story.
     * @param {ITextRange} range The ITextRange object whose story is compared to this range's story.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.instory
     */
    InStory(range) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.InStory(range)
    }

    /**
     * Determines whether this range has the same character positions and story as those of a specified range.
     * @remarks
     * **true** if this text range has the same character positions and story as range; otherwise, **false**.
     * @param {ITextRange} range The text range to compare to this text range.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.isequal
     */
    IsEqual(range) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.IsEqual(range)
    }

    /**
     * Moves the insertion point forward or backward by the specified number of _unit_s. If the text range is nondegenerate, it is collapsed to an insertion point at the start or end position of the text range, depending on _count_, and then is moved.
     * @param {Integer} unit_ The units to move the insertion point. The default value is **Character**.
     * @param {Integer} count The number of _unit_s to move the insertion point. The default value is 1. If _count_ is greater than zero, the insertion point moves forward, toward the end of the story. If _count_ is less than zero, the insertion point moves backward, toward the beginning of the story. If _count_ is zero, the range is unchanged.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.move
     */
    Move(unit_, count) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.Move(unit_, count)
    }

    /**
     * Moves the end position of the text range.
     * @param {Integer} unit_ The unit by which to move the end position of the text range. The default value is Character.
     * @param {Integer} count The number of _unit_s to move the end position of the text range. The default value is 1. If _count_ is greater than zero, the end position moves forward, toward the end of the story. If _count_ is less than zero, the end position move backward, toward the beginning of the story. If _count_ is zero, the end position does not move.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.moveend
     */
    MoveEnd(unit_, count) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.MoveEnd(unit_, count)
    }

    /**
     * Moves the start position of a text range.
     * @param {Integer} unit_ The unit by which to move the start position of the text range. The default value is **Character**.
     * @param {Integer} count The number of _unit_s to move the start position of the text range. The default value is 1. If _count_ is greater than zero, the start position of the text range moves forward, toward the end of the story. If _count_ is less than zero, the start position of the text range moves backward, toward the beginning of the story. If _count_ is zero, the start position doesn't move.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.movestart
     */
    MoveStart(unit_, count) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.MoveStart(unit_, count)
    }

    /**
     * Pastes text from the Clipboard into the text range.
     * @param {Integer} format The clipboard format to use in the paste operation. Zero represents the best format, which usually is Rich Text Format (RTF), but CF_UNICODETEXT and other formats are also possible. The default value is zero.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.paste
     */
    Paste(format) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.Paste(format)
    }

    /**
     * Scrolls this text range into view.
     * @param {Integer} value The end of the text range to scroll into view. This function uses only the **Start**, **NoHorizontalScroll**, and **NoVerticalScroll** values of the PointOptions enumeration.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.scrollintoview
     */
    ScrollIntoView(value) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.ScrollIntoView(value)
    }

    /**
     * Sets the start and end positions of this range to match the active selection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.matchselection
     */
    MatchSelection() {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.MatchSelection()
    }

    /**
     * Moves the text range to the specified unit of the story.
     * @param {Integer} unit_ The unit used to move the text range.
     * @param {Integer} index The index of the specified unit. The text range is relocated to the unit that has this index. If unit is positive, the numbering of units begins at the start of the story and proceeds forward. If negative, the numbering begins at the end of the story and proceeds backward. The start of the story corresponds to index = 1 for all existing units, and the last unit in the story corresponds to index = – 1.
     * @param {Boolean} extend Indicates how to change the text range. True extends the text range to include the unit by moving only the end position of the text range. False collapses the text range to an insertion point and then moves the insertion point. The default value is false.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.setindex
     */
    SetIndex(unit_, index, extend) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.SetIndex(unit_, index, extend)
    }

    /**
     * Changes the text range based on the specified point.
     * @param {POINT} point_ An ordered pair of floating-point x- and y-coordinates that defines a point in a two-dimensional plane.
     * @param {Integer} options The alignment type of the specified _point_.
     * @param {Boolean} extend Indicates how to set the endpoints of the text range. If extend is 0, the text range is an insertion point located at the specified point, or at the nearest point with selectable text. If extend is 1, the endpoint specified by options is moved to the point and the other endpoint is left alone. The default is 0.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.setpoint
     */
    SetPoint(point_, options, extend) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.SetPoint(point_, options, extend)
    }

    /**
     * Sets the endpoints of the text range to the specified values.
     * @param {Integer} startPosition The character position for the start of the text range. This parameter must be less than _endPosition_.
     * @param {Integer} endPosition The character position for the end of the text range.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.setrange
     */
    SetRange(startPosition, endPosition) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.SetRange(startPosition, endPosition)
    }

    /**
     * Replaces the text in the text range.
     * @param {Integer} options The conversion flags that control how the text is inserted in the text range.
     * @param {HSTRING} value The new text.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.settext
     */
    SetText(options, value) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.SetText(options, value)
    }

    /**
     * Sets the text in the text range based on the contents of a random access stream.
     * @param {Integer} options The text options.
     * @param {IRandomAccessStream} value The random access stream.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.settextviastream
     */
    SetTextViaStream(options, value) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.SetTextViaStream(options, value)
    }

    /**
     * Moves or extends the text range to the start of the nearest specified text unit. The text range is moved or extended backward in the document.
     * @param {Integer} unit_ The unit by which to move the start position of the text range. The default value is **Word**.
     * @param {Boolean} extend **true** to extend the text range by moving just the start position of the range to the start of the specified unit. **false** to move both ends of the text range to the start of the specified unit. The default is **false**.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.richedittextrange.startof
     */
    StartOf(unit_, extend) {
        if (!this.HasProp("__ITextRange")) {
            if ((queryResult := this.QueryInterface(ITextRange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextRange := ITextRange(outPtr)
        }

        return this.__ITextRange.StartOf(unit_, extend)
    }

;@endregion Instance Methods
}
