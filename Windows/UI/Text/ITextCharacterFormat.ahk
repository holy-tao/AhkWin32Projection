#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Color.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ITextCharacterFormat.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines the default character formatting attributes of a document, or the current character formatting attributes of a text range.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextcharacterformat
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class ITextCharacterFormat extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextCharacterFormat
     * @type {Guid}
     */
    static IID => Guid("{5adef3db-05fb-442d-8065-642afea02ced}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllCaps", "put_AllCaps", "get_BackgroundColor", "put_BackgroundColor", "get_Bold", "put_Bold", "get_FontStretch", "put_FontStretch", "get_FontStyle", "put_FontStyle", "get_ForegroundColor", "put_ForegroundColor", "get_Hidden", "put_Hidden", "get_Italic", "put_Italic", "get_Kerning", "put_Kerning", "get_LanguageTag", "put_LanguageTag", "get_LinkType", "get_Name", "put_Name", "get_Outline", "put_Outline", "get_Position", "put_Position", "get_ProtectedText", "put_ProtectedText", "get_Size", "put_Size", "get_SmallCaps", "put_SmallCaps", "get_Spacing", "put_Spacing", "get_Strikethrough", "put_Strikethrough", "get_Subscript", "put_Subscript", "get_Superscript", "put_Superscript", "get_TextScript", "put_TextScript", "get_Underline", "put_Underline", "get_Weight", "put_Weight", "SetClone", "GetClone", "IsEqual"]

    /**
     * Gets or sets whether the characters are all uppercase.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextcharacterformat.allcaps
     * @type {Integer} 
     */
    AllCaps {
        get => this.get_AllCaps()
        set => this.put_AllCaps(value)
    }

    /**
     * Gets or sets the text background (highlight) color.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextcharacterformat.backgroundcolor
     * @type {Color} 
     */
    BackgroundColor {
        get => this.get_BackgroundColor()
        set => this.put_BackgroundColor(value)
    }

    /**
     * Gets or sets whether the characters are bold.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextcharacterformat.bold
     * @type {Integer} 
     */
    Bold {
        get => this.get_Bold()
        set => this.put_Bold(value)
    }

    /**
     * Gets or sets the degree to which the font is stretched, compared to the normal aspect ratio of the font.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextcharacterformat.fontstretch
     * @type {Integer} 
     */
    FontStretch {
        get => this.get_FontStretch()
        set => this.put_FontStretch(value)
    }

    /**
     * Gets or sets the style of the font face, such as normal or italic.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextcharacterformat.fontstyle
     * @type {Integer} 
     */
    FontStyle {
        get => this.get_FontStyle()
        set => this.put_FontStyle(value)
    }

    /**
     * Gets or sets the foreground, or text, color.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextcharacterformat.foregroundcolor
     * @type {Color} 
     */
    ForegroundColor {
        get => this.get_ForegroundColor()
        set => this.put_ForegroundColor(value)
    }

    /**
     * Gets or sets whether characters are hidden.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextcharacterformat.hidden
     * @type {Integer} 
     */
    Hidden {
        get => this.get_Hidden()
        set => this.put_Hidden(value)
    }

    /**
     * Gets or sets whether characters are in italics.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextcharacterformat.italic
     * @type {Integer} 
     */
    Italic {
        get => this.get_Italic()
        set => this.put_Italic(value)
    }

    /**
     * Gets or sets the minimum font size at which kerning occurs.
     * @remarks
     * If the value is zero, kerning is turned off. Positive values turn on pair kerning for font point sizes greater than or equal to the kerning value. For example, the value 1 turns on kerning for all legible sizes, whereas 16 turns on kerning only for font sizes of 16 points and larger.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextcharacterformat.kerning
     * @type {Float} 
     */
    Kerning {
        get => this.get_Kerning()
        set => this.put_Kerning(value)
    }

    /**
     * Gets or sets the Internet Engineering Task Force (IETF) language tag (BCP 47 standard) that identifies the language currently associated with the characters.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextcharacterformat.languagetag
     * @type {HSTRING} 
     */
    LanguageTag {
        get => this.get_LanguageTag()
        set => this.put_LanguageTag(value)
    }

    /**
     * Gets the link type of the text.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextcharacterformat.linktype
     * @type {Integer} 
     */
    LinkType {
        get => this.get_LinkType()
    }

    /**
     * Gets or sets the font name.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextcharacterformat.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * Gets or sets whether characters are displayed as outlined characters.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextcharacterformat.outline
     * @type {Integer} 
     */
    Outline {
        get => this.get_Outline()
        set => this.put_Outline(value)
    }

    /**
     * Gets or sets the character offset relative to the baseline.
     * @remarks
     * Typically, the value of this property is zero. Positive values raise the characters relative to the baseline, and negative values lower them.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextcharacterformat.position
     * @type {Float} 
     */
    Position {
        get => this.get_Position()
        set => this.put_Position(value)
    }

    /**
     * Gets or sets whether the characters are protected against attempts to modify them.
     * @remarks
     * In general, calling methods in the [Windows.UI.Text](windows_ui_text.md) namespace that attempt to change the formatting or content of a text range will fail if any part of the range is protected, or if the document is read-only. To change protected text, an app should attempt to turn off the protection of the text to be modified. The owner of the document might permit this to happen.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextcharacterformat.protectedtext
     * @type {Integer} 
     */
    ProtectedText {
        get => this.get_ProtectedText()
        set => this.put_ProtectedText(value)
    }

    /**
     * Gets or sets the font size.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextcharacterformat.size
     * @type {Float} 
     */
    Size {
        get => this.get_Size()
        set => this.put_Size(value)
    }

    /**
     * Gets or sets whether characters are in small capital letters.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextcharacterformat.smallcaps
     * @type {Integer} 
     */
    SmallCaps {
        get => this.get_SmallCaps()
        set => this.put_SmallCaps(value)
    }

    /**
     * Gets or sets the amount of horizontal spacing between characters.
     * @remarks
     * Typically, the value of this property is zero. Positive values increase the horizontal spacing between characters, and negative values decrease it.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextcharacterformat.spacing
     * @type {Float} 
     */
    Spacing {
        get => this.get_Spacing()
        set => this.put_Spacing(value)
    }

    /**
     * Gets or sets whether characters are displayed with a horizontal line through the center.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextcharacterformat.strikethrough
     * @type {Integer} 
     */
    Strikethrough {
        get => this.get_Strikethrough()
        set => this.put_Strikethrough(value)
    }

    /**
     * Gets or sets whether characters are displayed as subscript.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextcharacterformat.subscript
     * @type {Integer} 
     */
    Subscript {
        get => this.get_Subscript()
        set => this.put_Subscript(value)
    }

    /**
     * Gets or sets whether characters are displayed as superscript.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextcharacterformat.superscript
     * @type {Integer} 
     */
    Superscript {
        get => this.get_Superscript()
        set => this.put_Superscript(value)
    }

    /**
     * Gets or sets the character repertoire.
     * @remarks
     * Character repertoires are typically scripts like Arabic and Latin, but there are also character repertoires for symbols and Emoji.
     * 
     * To learn more about character repertoires, see [RichEdit Font Binding](/windows/win32/controls/use-font-binding-in-rich-edit-controls).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextcharacterformat.textscript
     * @type {Integer} 
     */
    TextScript {
        get => this.get_TextScript()
        set => this.put_TextScript(value)
    }

    /**
     * Gets or sets the type of underlining that the characters use.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextcharacterformat.underline
     * @type {Integer} 
     */
    Underline {
        get => this.get_Underline()
        set => this.put_Underline(value)
    }

    /**
     * Gets or sets the font weight of the characters.
     * @remarks
     * In standard typography API, the weight of a font is typically expressed as a constant name, such as "Bold". Using constant names to set the Weight property is supported through type converter behaviors and by the [FontWeights](fontweights.md) support class.
     * 
     * The [FontWeights](fontweights.md) values correspond to the "usWeightClass" definition in the [OpenType specification](/typography/opentype/spec/). The "usWeightClass" represents an integer value between 1 and 999. Lower values indicate lighter weights; higher values indicate heavier weights.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextcharacterformat.weight
     * @type {Integer} 
     */
    Weight {
        get => this.get_Weight()
        set => this.put_Weight(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AllCaps() {
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
    put_AllCaps(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Color} 
     */
    get_BackgroundColor() {
        value := Color()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_BackgroundColor(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Bold() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
    put_Bold(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FontStretch() {
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
    put_FontStretch(value) {
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
    get_FontStyle() {
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
    put_FontStyle(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Color} 
     */
    get_ForegroundColor() {
        value := Color()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_ForegroundColor(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Hidden() {
        result := ComCall(18, this, "int*", &value := 0, "int")
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
    put_Hidden(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Italic() {
        result := ComCall(20, this, "int*", &value := 0, "int")
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
    put_Italic(value) {
        result := ComCall(21, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Kerning() {
        result := ComCall(22, this, "float*", &value := 0, "int")
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
    put_Kerning(value) {
        result := ComCall(23, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LanguageTag() {
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
    put_LanguageTag(value) {
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
     * 
     * @returns {Integer} 
     */
    get_LinkType() {
        result := ComCall(26, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        value := HSTRING()
        result := ComCall(27, this, "ptr", value, "int")
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
    put_Name(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(28, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Outline() {
        result := ComCall(29, this, "int*", &value := 0, "int")
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
    put_Outline(value) {
        result := ComCall(30, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Position() {
        result := ComCall(31, this, "float*", &value := 0, "int")
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
    put_Position(value) {
        result := ComCall(32, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProtectedText() {
        result := ComCall(33, this, "int*", &value := 0, "int")
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
    put_ProtectedText(value) {
        result := ComCall(34, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Size() {
        result := ComCall(35, this, "float*", &value := 0, "int")
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
    put_Size(value) {
        result := ComCall(36, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SmallCaps() {
        result := ComCall(37, this, "int*", &value := 0, "int")
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
    put_SmallCaps(value) {
        result := ComCall(38, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Spacing() {
        result := ComCall(39, this, "float*", &value := 0, "int")
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
    put_Spacing(value) {
        result := ComCall(40, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Strikethrough() {
        result := ComCall(41, this, "int*", &value := 0, "int")
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
    put_Strikethrough(value) {
        result := ComCall(42, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Subscript() {
        result := ComCall(43, this, "int*", &value := 0, "int")
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
    put_Subscript(value) {
        result := ComCall(44, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Superscript() {
        result := ComCall(45, this, "int*", &value := 0, "int")
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
    put_Superscript(value) {
        result := ComCall(46, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextScript() {
        result := ComCall(47, this, "int*", &value := 0, "int")
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
    put_TextScript(value) {
        result := ComCall(48, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Underline() {
        result := ComCall(49, this, "int*", &value := 0, "int")
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
    put_Underline(value) {
        result := ComCall(50, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Weight() {
        result := ComCall(51, this, "int*", &value := 0, "int")
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
    put_Weight(value) {
        result := ComCall(52, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the character formatting by copying another text character formatting object.
     * @remarks
     * Any character formatting values that are undefined in *value* have no effect.
     * @param {ITextCharacterFormat} value The character formatting to apply.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextcharacterformat.setclone
     */
    SetClone(value) {
        result := ComCall(53, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a new object that is identical to this character format object.
     * @returns {ITextCharacterFormat} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextcharacterformat.getclone
     */
    GetClone() {
        result := ComCall(54, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITextCharacterFormat(result_)
    }

    /**
     * Determines whether this character format object has the same properties as the specified character format object.
     * @param {ITextCharacterFormat} format The character format object to compare against.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextcharacterformat.isequal
     */
    IsEqual(format) {
        result := ComCall(55, this, "ptr", format, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
