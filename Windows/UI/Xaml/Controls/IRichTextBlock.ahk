#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Media\FontFamily.ahk
#Include ..\..\Text\FontWeight.ahk
#Include ..\Media\Brush.ahk
#Include ..\Documents\BlockCollection.ahk
#Include ..\Thickness.ahk
#Include .\RichTextBlockOverflow.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Documents\TextPointer.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IRichTextBlock extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRichTextBlock
     * @type {Guid}
     */
    static IID => Guid("{e5fff9e2-b968-49e7-97d4-8cca2ac3ae7c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FontSize", "put_FontSize", "get_FontFamily", "put_FontFamily", "get_FontWeight", "put_FontWeight", "get_FontStyle", "put_FontStyle", "get_FontStretch", "put_FontStretch", "get_Foreground", "put_Foreground", "get_TextWrapping", "put_TextWrapping", "get_TextTrimming", "put_TextTrimming", "get_TextAlignment", "put_TextAlignment", "get_Blocks", "get_Padding", "put_Padding", "get_LineHeight", "put_LineHeight", "get_LineStackingStrategy", "put_LineStackingStrategy", "get_CharacterSpacing", "put_CharacterSpacing", "get_OverflowContentTarget", "put_OverflowContentTarget", "get_IsTextSelectionEnabled", "put_IsTextSelectionEnabled", "get_HasOverflowContent", "get_SelectedText", "get_ContentStart", "get_ContentEnd", "get_SelectionStart", "get_SelectionEnd", "get_BaselineOffset", "add_SelectionChanged", "remove_SelectionChanged", "add_ContextMenuOpening", "remove_ContextMenuOpening", "SelectAll", "Select", "GetPositionFromPoint", "Focus", "get_TextIndent", "put_TextIndent"]

    /**
     * @type {Float} 
     */
    FontSize {
        get => this.get_FontSize()
        set => this.put_FontSize(value)
    }

    /**
     * @type {FontFamily} 
     */
    FontFamily {
        get => this.get_FontFamily()
        set => this.put_FontFamily(value)
    }

    /**
     * @type {FontWeight} 
     */
    FontWeight {
        get => this.get_FontWeight()
        set => this.put_FontWeight(value)
    }

    /**
     * @type {Integer} 
     */
    FontStyle {
        get => this.get_FontStyle()
        set => this.put_FontStyle(value)
    }

    /**
     * @type {Integer} 
     */
    FontStretch {
        get => this.get_FontStretch()
        set => this.put_FontStretch(value)
    }

    /**
     * @type {Brush} 
     */
    Foreground {
        get => this.get_Foreground()
        set => this.put_Foreground(value)
    }

    /**
     * @type {Integer} 
     */
    TextWrapping {
        get => this.get_TextWrapping()
        set => this.put_TextWrapping(value)
    }

    /**
     * @type {Integer} 
     */
    TextTrimming {
        get => this.get_TextTrimming()
        set => this.put_TextTrimming(value)
    }

    /**
     * @type {Integer} 
     */
    TextAlignment {
        get => this.get_TextAlignment()
        set => this.put_TextAlignment(value)
    }

    /**
     * @type {BlockCollection} 
     */
    Blocks {
        get => this.get_Blocks()
    }

    /**
     * @type {Thickness} 
     */
    Padding {
        get => this.get_Padding()
        set => this.put_Padding(value)
    }

    /**
     * @type {Float} 
     */
    LineHeight {
        get => this.get_LineHeight()
        set => this.put_LineHeight(value)
    }

    /**
     * @type {Integer} 
     */
    LineStackingStrategy {
        get => this.get_LineStackingStrategy()
        set => this.put_LineStackingStrategy(value)
    }

    /**
     * @type {Integer} 
     */
    CharacterSpacing {
        get => this.get_CharacterSpacing()
        set => this.put_CharacterSpacing(value)
    }

    /**
     * @type {RichTextBlockOverflow} 
     */
    OverflowContentTarget {
        get => this.get_OverflowContentTarget()
        set => this.put_OverflowContentTarget(value)
    }

    /**
     * @type {Boolean} 
     */
    IsTextSelectionEnabled {
        get => this.get_IsTextSelectionEnabled()
        set => this.put_IsTextSelectionEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    HasOverflowContent {
        get => this.get_HasOverflowContent()
    }

    /**
     * @type {HSTRING} 
     */
    SelectedText {
        get => this.get_SelectedText()
    }

    /**
     * @type {TextPointer} 
     */
    ContentStart {
        get => this.get_ContentStart()
    }

    /**
     * @type {TextPointer} 
     */
    ContentEnd {
        get => this.get_ContentEnd()
    }

    /**
     * @type {TextPointer} 
     */
    SelectionStart {
        get => this.get_SelectionStart()
    }

    /**
     * @type {TextPointer} 
     */
    SelectionEnd {
        get => this.get_SelectionEnd()
    }

    /**
     * @type {Float} 
     */
    BaselineOffset {
        get => this.get_BaselineOffset()
    }

    /**
     * @type {Float} 
     */
    TextIndent {
        get => this.get_TextIndent()
        set => this.put_TextIndent(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FontSize() {
        result := ComCall(6, this, "double*", &value := 0, "int")
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
    put_FontSize(value) {
        result := ComCall(7, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {FontFamily} 
     */
    get_FontFamily() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FontFamily(value)
    }

    /**
     * 
     * @param {FontFamily} value 
     * @returns {HRESULT} 
     */
    put_FontFamily(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {FontWeight} 
     */
    get_FontWeight() {
        value := FontWeight()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {FontWeight} value 
     * @returns {HRESULT} 
     */
    put_FontWeight(value) {
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
    get_FontStyle() {
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
    put_FontStyle(value) {
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
    get_FontStretch() {
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
    put_FontStretch(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_Foreground() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_Foreground(value) {
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
    get_TextWrapping() {
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
    put_TextWrapping(value) {
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
    get_TextTrimming() {
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
    put_TextTrimming(value) {
        result := ComCall(21, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextAlignment() {
        result := ComCall(22, this, "int*", &value := 0, "int")
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
    put_TextAlignment(value) {
        result := ComCall(23, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BlockCollection} 
     */
    get_Blocks() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BlockCollection(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_Padding() {
        value := Thickness()
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_Padding(value) {
        result := ComCall(26, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LineHeight() {
        result := ComCall(27, this, "double*", &value := 0, "int")
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
    put_LineHeight(value) {
        result := ComCall(28, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LineStackingStrategy() {
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
    put_LineStackingStrategy(value) {
        result := ComCall(30, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CharacterSpacing() {
        result := ComCall(31, this, "int*", &value := 0, "int")
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
    put_CharacterSpacing(value) {
        result := ComCall(32, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {RichTextBlockOverflow} 
     */
    get_OverflowContentTarget() {
        result := ComCall(33, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RichTextBlockOverflow(value)
    }

    /**
     * 
     * @param {RichTextBlockOverflow} value 
     * @returns {HRESULT} 
     */
    put_OverflowContentTarget(value) {
        result := ComCall(34, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTextSelectionEnabled() {
        result := ComCall(35, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsTextSelectionEnabled(value) {
        result := ComCall(36, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasOverflowContent() {
        result := ComCall(37, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SelectedText() {
        value := HSTRING()
        result := ComCall(38, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TextPointer} 
     */
    get_ContentStart() {
        result := ComCall(39, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TextPointer(value)
    }

    /**
     * 
     * @returns {TextPointer} 
     */
    get_ContentEnd() {
        result := ComCall(40, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TextPointer(value)
    }

    /**
     * 
     * @returns {TextPointer} 
     */
    get_SelectionStart() {
        result := ComCall(41, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TextPointer(value)
    }

    /**
     * 
     * @returns {TextPointer} 
     */
    get_SelectionEnd() {
        result := ComCall(42, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TextPointer(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_BaselineOffset() {
        result := ComCall(43, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SelectionChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(44, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SelectionChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(45, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ContextMenuOpeningEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ContextMenuOpening(handler) {
        token := EventRegistrationToken()
        result := ComCall(46, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ContextMenuOpening(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(47, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SelectAll() {
        result := ComCall(48, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * An XPath query that identifies the events to include in the query result set.
     * @param {TextPointer} start 
     * @param {TextPointer} end 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WES/queryschema-select-querytype-element
     */
    Select(start, end) {
        result := ComCall(49, this, "ptr", start, "ptr", end, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {POINT} point_ 
     * @returns {TextPointer} 
     */
    GetPositionFromPoint(point_) {
        result := ComCall(50, this, "ptr", point_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TextPointer(result_)
    }

    /**
     * Configures the [FocusControl](focuscontrol.md) object with values specified in the provided [FocusSettings](focussettings.md) object.
     * @remarks
     * Autofocus mode, enabled by using the [FocusMode.Continuous](focusmode.md) value in the [FocusSettings](focussettings.md) object supplied to this method, is only supported while the preview stream is running. Check to make sure that the preview stream is running before turning on continuous autofocus.
     * @param {Integer} value 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.focuscontrol.configure
     */
    Focus(value) {
        result := ComCall(51, this, "int", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TextIndent() {
        result := ComCall(52, this, "double*", &value := 0, "int")
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
    put_TextIndent(value) {
        result := ComCall(53, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
