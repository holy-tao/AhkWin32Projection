#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITimedTextStyle.ahk
#Include .\ITimedTextStyle2.ahk
#Include .\ITimedTextStyle3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Defines the style of the rendered text in a [TimedTextCue](timedtextcue.md). You can set the style of a substring within a [TimedTextLine](timedtextline.md) by using the [Subformats](timedtextline_subformats.md) property.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextstyle
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class TimedTextStyle extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITimedTextStyle

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITimedTextStyle.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the name of the timed text style.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextstyle.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * Gets or sets the font family of timed text.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextstyle.fontfamily
     * @type {HSTRING} 
     */
    FontFamily {
        get => this.get_FontFamily()
        set => this.put_FontFamily(value)
    }

    /**
     * Gets or sets the font size of timed text.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextstyle.fontsize
     * @type {TimedTextDouble} 
     */
    FontSize {
        get => this.get_FontSize()
        set => this.put_FontSize(value)
    }

    /**
     * Gets or sets the weight of timed text.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextstyle.fontweight
     * @type {Integer} 
     */
    FontWeight {
        get => this.get_FontWeight()
        set => this.put_FontWeight(value)
    }

    /**
     * Gets or sets the color of the timed text glyphs.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextstyle.foreground
     * @type {Color} 
     */
    Foreground {
        get => this.get_Foreground()
        set => this.put_Foreground(value)
    }

    /**
     * Gets or sets the background color of timed text.
     * @remarks
     * This **TimedTextStyle.Background** color is rendered behind character glyphs or spaces in timed text content. The [TimedTextRegion.Background](timedtextregion_background.md) color sets the color of the background of the container in which the timed text lines are rendered.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextstyle.background
     * @type {Color} 
     */
    Background {
        get => this.get_Background()
        set => this.put_Background(value)
    }

    /**
     * Gets or sets a value indicating if the background color stays visible when no text is being displayed.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextstyle.isbackgroundalwaysshown
     * @type {Boolean} 
     */
    IsBackgroundAlwaysShown {
        get => this.get_IsBackgroundAlwaysShown()
        set => this.put_IsBackgroundAlwaysShown(value)
    }

    /**
     * Gets or sets a value indicating the direction that timed text is flowed.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextstyle.flowdirection
     * @type {Integer} 
     */
    FlowDirection {
        get => this.get_FlowDirection()
        set => this.put_FlowDirection(value)
    }

    /**
     * Gets or sets the alignment of timed text lines.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextstyle.linealignment
     * @type {Integer} 
     */
    LineAlignment {
        get => this.get_LineAlignment()
        set => this.put_LineAlignment(value)
    }

    /**
     * Gets or sets the outline color of timed text.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextstyle.outlinecolor
     * @type {Color} 
     */
    OutlineColor {
        get => this.get_OutlineColor()
        set => this.put_OutlineColor(value)
    }

    /**
     * Gets or sets the thickness of the outline of the timed text.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextstyle.outlinethickness
     * @type {TimedTextDouble} 
     */
    OutlineThickness {
        get => this.get_OutlineThickness()
        set => this.put_OutlineThickness(value)
    }

    /**
     * Gets or sets the radius of the blur applied to outline of the timed text.
     * @remarks
     * A value of zero results in no blurring of the text outline. Set the thickness of the outline with [OutlineThickness](timedtextstyle_outlinethickness.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextstyle.outlineradius
     * @type {TimedTextDouble} 
     */
    OutlineRadius {
        get => this.get_OutlineRadius()
        set => this.put_OutlineRadius(value)
    }

    /**
     * Gets or sets a value that specifies the font style of timed text.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextstyle.fontstyle
     * @type {Integer} 
     */
    FontStyle {
        get => this.get_FontStyle()
        set => this.put_FontStyle(value)
    }

    /**
     * Gets or sets a value indicating whether underline text is enabled for the timed text.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextstyle.isunderlineenabled
     * @type {Boolean} 
     */
    IsUnderlineEnabled {
        get => this.get_IsUnderlineEnabled()
        set => this.put_IsUnderlineEnabled(value)
    }

    /**
     * Gets or sets a value indicating whether strikethrough text is enabled for the timed text.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextstyle.islinethroughenabled
     * @type {Boolean} 
     */
    IsLineThroughEnabled {
        get => this.get_IsLineThroughEnabled()
        set => this.put_IsLineThroughEnabled(value)
    }

    /**
     * Gets or sets a value indicating whether overline text is enabled for the timed text.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextstyle.isoverlineenabled
     * @type {Boolean} 
     */
    IsOverlineEnabled {
        get => this.get_IsOverlineEnabled()
        set => this.put_IsOverlineEnabled(value)
    }

    /**
     * Gets the ruby text associated with the timed text.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextstyle.ruby
     * @type {TimedTextRuby} 
     */
    Ruby {
        get => this.get_Ruby()
    }

    /**
     * Gets the bouten mark associated with the timed text.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextstyle.bouten
     * @type {TimedTextBouten} 
     */
    Bouten {
        get => this.get_Bouten()
    }

    /**
     * Gets or sets a boolean value specifying whether the timed text is combined on a single line.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextstyle.istextcombined
     * @type {Boolean} 
     */
    IsTextCombined {
        get => this.get_IsTextCombined()
        set => this.put_IsTextCombined(value)
    }

    /**
     * Gets or sets the font angle of slanted text, in degrees.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextstyle.fontangleindegrees
     * @type {Float} 
     */
    FontAngleInDegrees {
        get => this.get_FontAngleInDegrees()
        set => this.put_FontAngleInDegrees(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [TimedTextStyle](timedtextstyle.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.TimedTextStyle")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__ITimedTextStyle")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle := ITimedTextStyle(outPtr)
        }

        return this.__ITimedTextStyle.get_Name()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Name(value) {
        if (!this.HasProp("__ITimedTextStyle")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle := ITimedTextStyle(outPtr)
        }

        return this.__ITimedTextStyle.put_Name(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FontFamily() {
        if (!this.HasProp("__ITimedTextStyle")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle := ITimedTextStyle(outPtr)
        }

        return this.__ITimedTextStyle.get_FontFamily()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_FontFamily(value) {
        if (!this.HasProp("__ITimedTextStyle")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle := ITimedTextStyle(outPtr)
        }

        return this.__ITimedTextStyle.put_FontFamily(value)
    }

    /**
     * 
     * @returns {TimedTextDouble} 
     */
    get_FontSize() {
        if (!this.HasProp("__ITimedTextStyle")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle := ITimedTextStyle(outPtr)
        }

        return this.__ITimedTextStyle.get_FontSize()
    }

    /**
     * 
     * @param {TimedTextDouble} value 
     * @returns {HRESULT} 
     */
    put_FontSize(value) {
        if (!this.HasProp("__ITimedTextStyle")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle := ITimedTextStyle(outPtr)
        }

        return this.__ITimedTextStyle.put_FontSize(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FontWeight() {
        if (!this.HasProp("__ITimedTextStyle")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle := ITimedTextStyle(outPtr)
        }

        return this.__ITimedTextStyle.get_FontWeight()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FontWeight(value) {
        if (!this.HasProp("__ITimedTextStyle")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle := ITimedTextStyle(outPtr)
        }

        return this.__ITimedTextStyle.put_FontWeight(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Foreground() {
        if (!this.HasProp("__ITimedTextStyle")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle := ITimedTextStyle(outPtr)
        }

        return this.__ITimedTextStyle.get_Foreground()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_Foreground(value) {
        if (!this.HasProp("__ITimedTextStyle")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle := ITimedTextStyle(outPtr)
        }

        return this.__ITimedTextStyle.put_Foreground(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Background() {
        if (!this.HasProp("__ITimedTextStyle")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle := ITimedTextStyle(outPtr)
        }

        return this.__ITimedTextStyle.get_Background()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_Background(value) {
        if (!this.HasProp("__ITimedTextStyle")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle := ITimedTextStyle(outPtr)
        }

        return this.__ITimedTextStyle.put_Background(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBackgroundAlwaysShown() {
        if (!this.HasProp("__ITimedTextStyle")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle := ITimedTextStyle(outPtr)
        }

        return this.__ITimedTextStyle.get_IsBackgroundAlwaysShown()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsBackgroundAlwaysShown(value) {
        if (!this.HasProp("__ITimedTextStyle")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle := ITimedTextStyle(outPtr)
        }

        return this.__ITimedTextStyle.put_IsBackgroundAlwaysShown(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FlowDirection() {
        if (!this.HasProp("__ITimedTextStyle")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle := ITimedTextStyle(outPtr)
        }

        return this.__ITimedTextStyle.get_FlowDirection()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FlowDirection(value) {
        if (!this.HasProp("__ITimedTextStyle")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle := ITimedTextStyle(outPtr)
        }

        return this.__ITimedTextStyle.put_FlowDirection(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LineAlignment() {
        if (!this.HasProp("__ITimedTextStyle")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle := ITimedTextStyle(outPtr)
        }

        return this.__ITimedTextStyle.get_LineAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_LineAlignment(value) {
        if (!this.HasProp("__ITimedTextStyle")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle := ITimedTextStyle(outPtr)
        }

        return this.__ITimedTextStyle.put_LineAlignment(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_OutlineColor() {
        if (!this.HasProp("__ITimedTextStyle")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle := ITimedTextStyle(outPtr)
        }

        return this.__ITimedTextStyle.get_OutlineColor()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_OutlineColor(value) {
        if (!this.HasProp("__ITimedTextStyle")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle := ITimedTextStyle(outPtr)
        }

        return this.__ITimedTextStyle.put_OutlineColor(value)
    }

    /**
     * 
     * @returns {TimedTextDouble} 
     */
    get_OutlineThickness() {
        if (!this.HasProp("__ITimedTextStyle")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle := ITimedTextStyle(outPtr)
        }

        return this.__ITimedTextStyle.get_OutlineThickness()
    }

    /**
     * 
     * @param {TimedTextDouble} value 
     * @returns {HRESULT} 
     */
    put_OutlineThickness(value) {
        if (!this.HasProp("__ITimedTextStyle")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle := ITimedTextStyle(outPtr)
        }

        return this.__ITimedTextStyle.put_OutlineThickness(value)
    }

    /**
     * 
     * @returns {TimedTextDouble} 
     */
    get_OutlineRadius() {
        if (!this.HasProp("__ITimedTextStyle")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle := ITimedTextStyle(outPtr)
        }

        return this.__ITimedTextStyle.get_OutlineRadius()
    }

    /**
     * 
     * @param {TimedTextDouble} value 
     * @returns {HRESULT} 
     */
    put_OutlineRadius(value) {
        if (!this.HasProp("__ITimedTextStyle")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle := ITimedTextStyle(outPtr)
        }

        return this.__ITimedTextStyle.put_OutlineRadius(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FontStyle() {
        if (!this.HasProp("__ITimedTextStyle2")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle2 := ITimedTextStyle2(outPtr)
        }

        return this.__ITimedTextStyle2.get_FontStyle()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FontStyle(value) {
        if (!this.HasProp("__ITimedTextStyle2")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle2 := ITimedTextStyle2(outPtr)
        }

        return this.__ITimedTextStyle2.put_FontStyle(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsUnderlineEnabled() {
        if (!this.HasProp("__ITimedTextStyle2")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle2 := ITimedTextStyle2(outPtr)
        }

        return this.__ITimedTextStyle2.get_IsUnderlineEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsUnderlineEnabled(value) {
        if (!this.HasProp("__ITimedTextStyle2")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle2 := ITimedTextStyle2(outPtr)
        }

        return this.__ITimedTextStyle2.put_IsUnderlineEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLineThroughEnabled() {
        if (!this.HasProp("__ITimedTextStyle2")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle2 := ITimedTextStyle2(outPtr)
        }

        return this.__ITimedTextStyle2.get_IsLineThroughEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsLineThroughEnabled(value) {
        if (!this.HasProp("__ITimedTextStyle2")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle2 := ITimedTextStyle2(outPtr)
        }

        return this.__ITimedTextStyle2.put_IsLineThroughEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOverlineEnabled() {
        if (!this.HasProp("__ITimedTextStyle2")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle2 := ITimedTextStyle2(outPtr)
        }

        return this.__ITimedTextStyle2.get_IsOverlineEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsOverlineEnabled(value) {
        if (!this.HasProp("__ITimedTextStyle2")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle2 := ITimedTextStyle2(outPtr)
        }

        return this.__ITimedTextStyle2.put_IsOverlineEnabled(value)
    }

    /**
     * 
     * @returns {TimedTextRuby} 
     */
    get_Ruby() {
        if (!this.HasProp("__ITimedTextStyle3")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle3 := ITimedTextStyle3(outPtr)
        }

        return this.__ITimedTextStyle3.get_Ruby()
    }

    /**
     * 
     * @returns {TimedTextBouten} 
     */
    get_Bouten() {
        if (!this.HasProp("__ITimedTextStyle3")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle3 := ITimedTextStyle3(outPtr)
        }

        return this.__ITimedTextStyle3.get_Bouten()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTextCombined() {
        if (!this.HasProp("__ITimedTextStyle3")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle3 := ITimedTextStyle3(outPtr)
        }

        return this.__ITimedTextStyle3.get_IsTextCombined()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsTextCombined(value) {
        if (!this.HasProp("__ITimedTextStyle3")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle3 := ITimedTextStyle3(outPtr)
        }

        return this.__ITimedTextStyle3.put_IsTextCombined(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FontAngleInDegrees() {
        if (!this.HasProp("__ITimedTextStyle3")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle3 := ITimedTextStyle3(outPtr)
        }

        return this.__ITimedTextStyle3.get_FontAngleInDegrees()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_FontAngleInDegrees(value) {
        if (!this.HasProp("__ITimedTextStyle3")) {
            if ((queryResult := this.QueryInterface(ITimedTextStyle3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextStyle3 := ITimedTextStyle3(outPtr)
        }

        return this.__ITimedTextStyle3.put_FontAngleInDegrees(value)
    }

;@endregion Instance Methods
}
