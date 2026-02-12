#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ITextParagraphFormat.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines the default paragraph formatting attributes of a document, or the current paragraph formatting attributes of a text range.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class ITextParagraphFormat extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextParagraphFormat
     * @type {Guid}
     */
    static IID => Guid("{2cf8cfa6-4676-498a-93f5-bbdbfc0bd883}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Alignment", "put_Alignment", "get_FirstLineIndent", "get_KeepTogether", "put_KeepTogether", "get_KeepWithNext", "put_KeepWithNext", "get_LeftIndent", "get_LineSpacing", "get_LineSpacingRule", "get_ListAlignment", "put_ListAlignment", "get_ListLevelIndex", "put_ListLevelIndex", "get_ListStart", "put_ListStart", "get_ListStyle", "put_ListStyle", "get_ListTab", "put_ListTab", "get_ListType", "put_ListType", "get_NoLineNumber", "put_NoLineNumber", "get_PageBreakBefore", "put_PageBreakBefore", "get_RightIndent", "put_RightIndent", "get_RightToLeft", "put_RightToLeft", "get_Style", "put_Style", "get_SpaceAfter", "put_SpaceAfter", "get_SpaceBefore", "put_SpaceBefore", "get_WidowControl", "put_WidowControl", "get_TabCount", "AddTab", "ClearAllTabs", "DeleteTab", "GetClone", "GetTab", "IsEqual", "SetClone", "SetIndents", "SetLineSpacing"]

    /**
     * Gets or sets the paragraph alignment.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat.alignment
     * @type {Integer} 
     */
    Alignment {
        get => this.get_Alignment()
        set => this.put_Alignment(value)
    }

    /**
     * Gets the amount used to indent the first line of a paragraph relative to the left indent.
     * @remarks
     * The left indent applies to all lines of the paragraph except the first line.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat.firstlineindent
     * @type {Float} 
     */
    FirstLineIndent {
        get => this.get_FirstLineIndent()
    }

    /**
     * Gets or sets whether page breaks are allowed in paragraphs.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat.keeptogether
     * @type {Integer} 
     */
    KeepTogether {
        get => this.get_KeepTogether()
        set => this.put_KeepTogether(value)
    }

    /**
     * Gets or sets whether page breaks are allowed between paragraphs in a range.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat.keepwithnext
     * @type {Integer} 
     */
    KeepWithNext {
        get => this.get_KeepWithNext()
        set => this.put_KeepWithNext(value)
    }

    /**
     * Gets the amount used to indent all lines except the first line of a paragraph.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat.leftindent
     * @type {Float} 
     */
    LeftIndent {
        get => this.get_LeftIndent()
    }

    /**
     * Gets the paragraph line-spacing value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat.linespacing
     * @type {Float} 
     */
    LineSpacing {
        get => this.get_LineSpacing()
    }

    /**
     * Gets the paragraph line-spacing rule.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat.linespacingrule
     * @type {Integer} 
     */
    LineSpacingRule {
        get => this.get_LineSpacingRule()
    }

    /**
     * Gets or sets the alignment to use for bulleted and numbered lists.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat.listalignment
     * @type {Integer} 
     */
    ListAlignment {
        get => this.get_ListAlignment()
        set => this.put_ListAlignment(value)
    }

    /**
     * Gets or sets the list level index used with paragraphs.
     * @remarks
     * Setting the list level index doesn't automatically change a list's indentation and other paragraph properties.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat.listlevelindex
     * @type {Integer} 
     */
    ListLevelIndex {
        get => this.get_ListLevelIndex()
        set => this.put_ListLevelIndex(value)
    }

    /**
     * Gets or sets the starting value or code of a list numbering sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat.liststart
     * @type {Integer} 
     */
    ListStart {
        get => this.get_ListStart()
        set => this.put_ListStart(value)
    }

    /**
     * Gets or sets the style used to mark the item paragraphs in a list.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat.liststyle
     * @type {Integer} 
     */
    ListStyle {
        get => this.get_ListStyle()
        set => this.put_ListStyle(value)
    }

    /**
     * Gets or sets the list tab setting, which is the distance between the first indent and the start of the text on the first line.
     * @remarks
     * Numbered or bulleted text is left-justified, centered, or right-justified at the first-line indent value. Use [ITextParagraphFormat.ListAlignment](itextparagraphformat_listalignment.md) to determine the text position.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat.listtab
     * @type {Float} 
     */
    ListTab {
        get => this.get_ListTab()
        set => this.put_ListTab(value)
    }

    /**
     * Gets or sets the kind of characters used to mark the item paragraphs in a list.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat.listtype
     * @type {Integer} 
     */
    ListType {
        get => this.get_ListType()
        set => this.put_ListType(value)
    }

    /**
     * Gets or sets whether paragraph numbering is suppressed.
     * @remarks
     * When the paragraphs are numbered, the number appears on the first line of the paragraph.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat.nolinenumber
     * @type {Integer} 
     */
    NoLineNumber {
        get => this.get_NoLineNumber()
        set => this.put_NoLineNumber(value)
    }

    /**
     * Gets or sets whether there is a page break before a paragraph.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat.pagebreakbefore
     * @type {Integer} 
     */
    PageBreakBefore {
        get => this.get_PageBreakBefore()
        set => this.put_PageBreakBefore(value)
    }

    /**
     * Gets or sets the right margin of a paragraph.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat.rightindent
     * @type {Float} 
     */
    RightIndent {
        get => this.get_RightIndent()
        set => this.put_RightIndent(value)
    }

    /**
     * Gets or sets whether the paragraph uses right-to-left formatting.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat.righttoleft
     * @type {Integer} 
     */
    RightToLeft {
        get => this.get_RightToLeft()
        set => this.put_RightToLeft(value)
    }

    /**
     * Gets or sets the paragraph style.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat.style
     * @type {Integer} 
     */
    Style {
        get => this.get_Style()
        set => this.put_Style(value)
    }

    /**
     * Gets or sets the amount of vertical space that follows a paragraph.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat.spaceafter
     * @type {Float} 
     */
    SpaceAfter {
        get => this.get_SpaceAfter()
        set => this.put_SpaceAfter(value)
    }

    /**
     * Gets or sets the amount of vertical space above a paragraph.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat.spacebefore
     * @type {Float} 
     */
    SpaceBefore {
        get => this.get_SpaceBefore()
        set => this.put_SpaceBefore(value)
    }

    /**
     * Gets or sets whether widow and orphan suppression is on or off.
     * @remarks
     * A widow is created when the last line of a paragraph is printed by itself at the top of a page. An orphan is when the first line of a paragraph is printed by itself at the bottom of a page.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat.widowcontrol
     * @type {Integer} 
     */
    WidowControl {
        get => this.get_WidowControl()
        set => this.put_WidowControl(value)
    }

    /**
     * Retrieves the tab count.
     * @remarks
     * The tab count of a new instance can be nonzero; for example, Microsoft Word stories begin with no explicit tabs defined, while rich edit instances start with a single explicit tab. To ensure there are no explicit tabs (that is, to set the tab count to zero), call the [ITextParagraphFormat.ClearAllTabs](itextparagraphformat_clearalltabs_28978480.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat.tabcount
     * @type {Integer} 
     */
    TabCount {
        get => this.get_TabCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Alignment() {
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
    put_Alignment(value) {
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
    get_FirstLineIndent() {
        result := ComCall(8, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_KeepTogether() {
        result := ComCall(9, this, "int*", &value := 0, "int")
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
    put_KeepTogether(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_KeepWithNext() {
        result := ComCall(11, this, "int*", &value := 0, "int")
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
    put_KeepWithNext(value) {
        result := ComCall(12, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LeftIndent() {
        result := ComCall(13, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LineSpacing() {
        result := ComCall(14, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LineSpacingRule() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ListAlignment() {
        result := ComCall(16, this, "int*", &value := 0, "int")
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
    put_ListAlignment(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ListLevelIndex() {
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
    put_ListLevelIndex(value) {
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
    get_ListStart() {
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
    put_ListStart(value) {
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
    get_ListStyle() {
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
    put_ListStyle(value) {
        result := ComCall(23, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ListTab() {
        result := ComCall(24, this, "float*", &value := 0, "int")
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
    put_ListTab(value) {
        result := ComCall(25, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ListType() {
        result := ComCall(26, this, "int*", &value := 0, "int")
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
    put_ListType(value) {
        result := ComCall(27, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NoLineNumber() {
        result := ComCall(28, this, "int*", &value := 0, "int")
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
    put_NoLineNumber(value) {
        result := ComCall(29, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PageBreakBefore() {
        result := ComCall(30, this, "int*", &value := 0, "int")
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
    put_PageBreakBefore(value) {
        result := ComCall(31, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RightIndent() {
        result := ComCall(32, this, "float*", &value := 0, "int")
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
    put_RightIndent(value) {
        result := ComCall(33, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RightToLeft() {
        result := ComCall(34, this, "int*", &value := 0, "int")
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
    put_RightToLeft(value) {
        result := ComCall(35, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Style() {
        result := ComCall(36, this, "int*", &value := 0, "int")
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
    put_Style(value) {
        result := ComCall(37, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SpaceAfter() {
        result := ComCall(38, this, "float*", &value := 0, "int")
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
    put_SpaceAfter(value) {
        result := ComCall(39, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SpaceBefore() {
        result := ComCall(40, this, "float*", &value := 0, "int")
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
    put_SpaceBefore(value) {
        result := ComCall(41, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WidowControl() {
        result := ComCall(42, this, "int*", &value := 0, "int")
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
    put_WidowControl(value) {
        result := ComCall(43, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TabCount() {
        result := ComCall(44, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Adds a new tab at the specified position.
     * @param {Float} position The position of the new tab, in floating-point points relative to the left side of the page for left-to-right paragraphs, or the right side of the page for right-to-left paragraphs. A maximum of 63 tabs are allowed. Tabs beyond the page are ignored. Negative tabs are not valid.
     * @param {Integer} align The alignment option for the tab position.
     * @param {Integer} leader The character used to fill the space taken by a tab character.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat.addtab
     */
    AddTab(position, align, leader) {
        result := ComCall(45, this, "float", position, "int", align, "int", leader, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Clears all tabs, reverting to equally spaced tabs with the default tab spacing.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat.clearalltabs
     */
    ClearAllTabs() {
        result := ComCall(46, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Deletes the tab at the specified position.
     * @param {Float} position The position of the tab to delete, in floating-point points.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat.deletetab
     */
    DeleteTab(position) {
        result := ComCall(47, this, "float", position, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a new object that is identical to this paragraph format object.
     * @returns {ITextParagraphFormat} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat.getclone
     */
    GetClone() {
        result := ComCall(48, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITextParagraphFormat(result_)
    }

    /**
     * Retrieves information about the specified tab.
     * @param {Integer} index The zero-based index of the tab to retrieve.
     * @param {Pointer<Single>} position The tab's position, in floating-point points. This parameter is zero if the tab does not exist.
     * @param {Pointer<Int32>} align The alignment option for the tab position.
     * @param {Pointer<Int32>} leader The character used to fill the space taken by a tab character.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat.gettab
     */
    GetTab(index, position, align, leader) {
        result := ComCall(49, this, "int", index, "ptr", position, "ptr", align, "ptr", leader, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines whether this paragraph format object has the same properties as the specified paragraph format object.
     * @param {ITextParagraphFormat} format The paragraph format object to compare against.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat.isequal
     */
    IsEqual(format) {
        result := ComCall(50, this, "ptr", format, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Sets the paragraph formatting by copying another paragraph formatting object.
     * @remarks
     * Any paragraph formatting values that are undefined in *value* have no effect.
     * @param {ITextParagraphFormat} format The paragraph formatting to apply.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat.setclone
     */
    SetClone(format) {
        result := ComCall(51, this, "ptr", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the first-line indent, the left indent, and the right indent for a paragraph.
     * @remarks
     * Line indents cannot position text in the margins. If the first-line indent is set to a negative value, for an outdented paragraph, while the left indent is zero, the first-line indent is reset to zero. To avoid this problem while retaining property sets, explicitly set the first-line indent value equal to zero, and then call SetIndents to set a nonnegative, left-indent value and set the desired first-line indent.
     * @param {Float} start The indent of the first line in a paragraph, relative to the left indent. The value is in floating-point points and can be positive or negative.
     * @param {Float} left The left indent of all lines except the first line in a paragraph, relative to the left margin. The value is in floating-point points and can be positive or negative.
     * @param {Float} right The right indent of all lines in a paragraph, relative to the right margin. The value is in floating-point points and can be positive or negative. This value is optional.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat.setindents
     */
    SetIndents(start, left, right) {
        result := ComCall(52, this, "float", start, "float", left, "float", right, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the paragraph line-spacing rule and the amount of line spacing for a paragraph.
     * @remarks
     * Because the line-spacing rule and line spacing work together, they must be set together.
     * @param {Integer} rule The new line-spacing rule.
     * @param {Float} spacing The new line spacing amount. If the line-spacing *rule* interprets the *spacing* value as a linear dimension, *spacing* is given in floating-point points.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.itextparagraphformat.setlinespacing
     */
    SetLineSpacing(rule, spacing) {
        result := ComCall(53, this, "int", rule, "float", spacing, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
