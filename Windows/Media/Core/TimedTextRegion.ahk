#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITimedTextRegion.ahk
#Include ..\..\..\Guid.ahk

/**
 * Exposes properties for customizing the appearance of the rendering area of a [TimedTextCue](timedtextcue.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextregion
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class TimedTextRegion extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITimedTextRegion

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITimedTextRegion.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a string representing the name of the [TimedTextRegion](timedtextregion.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextregion.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * Gets or sets the position of the [TimedTextRegion](timedtextregion.md), relative to the top left corner of the video frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextregion.position
     * @type {TimedTextPoint} 
     */
    Position {
        get => this.get_Position()
        set => this.put_Position(value)
    }

    /**
     * Gets or sets the extent of the [TimedTextRegion](timedtextregion.md), which is the rendered size of the region either in pixels or in percentage of available space.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextregion.extent
     * @type {TimedTextSize} 
     */
    Extent {
        get => this.get_Extent()
        set => this.put_Extent(value)
    }

    /**
     * Gets or sets the background color of the [TimedTextRegion](timedtextregion.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextregion.background
     * @type {Color} 
     */
    Background {
        get => this.get_Background()
        set => this.put_Background(value)
    }

    /**
     * Gets or sets a value indicating the direction that text flows within the [TimedTextRegion](timedtextregion.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextregion.writingmode
     * @type {Integer} 
     */
    WritingMode {
        get => this.get_WritingMode()
        set => this.put_WritingMode(value)
    }

    /**
     * Gets or sets the display alignment of the [TimedTextRegion](timedtextregion.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextregion.displayalignment
     * @type {Integer} 
     */
    DisplayAlignment {
        get => this.get_DisplayAlignment()
        set => this.put_DisplayAlignment(value)
    }

    /**
     * Gets or sets a value that indicates the height of each line of content.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextregion.lineheight
     * @type {TimedTextDouble} 
     */
    LineHeight {
        get => this.get_LineHeight()
        set => this.put_LineHeight(value)
    }

    /**
     * Gets or sets a value indicating whether text overflowing the region is clipped.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextregion.isoverflowclipped
     * @type {Boolean} 
     */
    IsOverflowClipped {
        get => this.get_IsOverflowClipped()
        set => this.put_IsOverflowClipped(value)
    }

    /**
     * Gets or sets a value that indicates the thickness of padding space between the boundaries of the content area and the content displayed by a [TimedTextRegion](timedtextregion.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextregion.padding
     * @type {TimedTextPadding} 
     */
    Padding {
        get => this.get_Padding()
        set => this.put_Padding(value)
    }

    /**
     * Gets or sets a value indicating whether text wraps when it reaches the edge of the [TimedTextRegion](timedtextregion.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextregion.textwrapping
     * @type {Integer} 
     */
    TextWrapping {
        get => this.get_TextWrapping()
        set => this.put_TextWrapping(value)
    }

    /**
     * Gets or sets the Z-order of the [TimedTextRegion](timedtextregion.md), relative to other active regions on the screen, in case they overlap.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextregion.zindex
     * @type {Integer} 
     */
    ZIndex {
        get => this.get_ZIndex()
        set => this.put_ZIndex(value)
    }

    /**
     * Gets a value indicating the method in which lines of text scroll through the region.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextregion.scrollmode
     * @type {Integer} 
     */
    ScrollMode {
        get => this.get_ScrollMode()
        set => this.put_ScrollMode(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [TimedTextRegion](timedtextregion.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.TimedTextRegion")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__ITimedTextRegion")) {
            if ((queryResult := this.QueryInterface(ITimedTextRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextRegion := ITimedTextRegion(outPtr)
        }

        return this.__ITimedTextRegion.get_Name()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Name(value) {
        if (!this.HasProp("__ITimedTextRegion")) {
            if ((queryResult := this.QueryInterface(ITimedTextRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextRegion := ITimedTextRegion(outPtr)
        }

        return this.__ITimedTextRegion.put_Name(value)
    }

    /**
     * 
     * @returns {TimedTextPoint} 
     */
    get_Position() {
        if (!this.HasProp("__ITimedTextRegion")) {
            if ((queryResult := this.QueryInterface(ITimedTextRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextRegion := ITimedTextRegion(outPtr)
        }

        return this.__ITimedTextRegion.get_Position()
    }

    /**
     * 
     * @param {TimedTextPoint} value 
     * @returns {HRESULT} 
     */
    put_Position(value) {
        if (!this.HasProp("__ITimedTextRegion")) {
            if ((queryResult := this.QueryInterface(ITimedTextRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextRegion := ITimedTextRegion(outPtr)
        }

        return this.__ITimedTextRegion.put_Position(value)
    }

    /**
     * 
     * @returns {TimedTextSize} 
     */
    get_Extent() {
        if (!this.HasProp("__ITimedTextRegion")) {
            if ((queryResult := this.QueryInterface(ITimedTextRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextRegion := ITimedTextRegion(outPtr)
        }

        return this.__ITimedTextRegion.get_Extent()
    }

    /**
     * 
     * @param {TimedTextSize} value 
     * @returns {HRESULT} 
     */
    put_Extent(value) {
        if (!this.HasProp("__ITimedTextRegion")) {
            if ((queryResult := this.QueryInterface(ITimedTextRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextRegion := ITimedTextRegion(outPtr)
        }

        return this.__ITimedTextRegion.put_Extent(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Background() {
        if (!this.HasProp("__ITimedTextRegion")) {
            if ((queryResult := this.QueryInterface(ITimedTextRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextRegion := ITimedTextRegion(outPtr)
        }

        return this.__ITimedTextRegion.get_Background()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_Background(value) {
        if (!this.HasProp("__ITimedTextRegion")) {
            if ((queryResult := this.QueryInterface(ITimedTextRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextRegion := ITimedTextRegion(outPtr)
        }

        return this.__ITimedTextRegion.put_Background(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WritingMode() {
        if (!this.HasProp("__ITimedTextRegion")) {
            if ((queryResult := this.QueryInterface(ITimedTextRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextRegion := ITimedTextRegion(outPtr)
        }

        return this.__ITimedTextRegion.get_WritingMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_WritingMode(value) {
        if (!this.HasProp("__ITimedTextRegion")) {
            if ((queryResult := this.QueryInterface(ITimedTextRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextRegion := ITimedTextRegion(outPtr)
        }

        return this.__ITimedTextRegion.put_WritingMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DisplayAlignment() {
        if (!this.HasProp("__ITimedTextRegion")) {
            if ((queryResult := this.QueryInterface(ITimedTextRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextRegion := ITimedTextRegion(outPtr)
        }

        return this.__ITimedTextRegion.get_DisplayAlignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DisplayAlignment(value) {
        if (!this.HasProp("__ITimedTextRegion")) {
            if ((queryResult := this.QueryInterface(ITimedTextRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextRegion := ITimedTextRegion(outPtr)
        }

        return this.__ITimedTextRegion.put_DisplayAlignment(value)
    }

    /**
     * 
     * @returns {TimedTextDouble} 
     */
    get_LineHeight() {
        if (!this.HasProp("__ITimedTextRegion")) {
            if ((queryResult := this.QueryInterface(ITimedTextRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextRegion := ITimedTextRegion(outPtr)
        }

        return this.__ITimedTextRegion.get_LineHeight()
    }

    /**
     * 
     * @param {TimedTextDouble} value 
     * @returns {HRESULT} 
     */
    put_LineHeight(value) {
        if (!this.HasProp("__ITimedTextRegion")) {
            if ((queryResult := this.QueryInterface(ITimedTextRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextRegion := ITimedTextRegion(outPtr)
        }

        return this.__ITimedTextRegion.put_LineHeight(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOverflowClipped() {
        if (!this.HasProp("__ITimedTextRegion")) {
            if ((queryResult := this.QueryInterface(ITimedTextRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextRegion := ITimedTextRegion(outPtr)
        }

        return this.__ITimedTextRegion.get_IsOverflowClipped()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsOverflowClipped(value) {
        if (!this.HasProp("__ITimedTextRegion")) {
            if ((queryResult := this.QueryInterface(ITimedTextRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextRegion := ITimedTextRegion(outPtr)
        }

        return this.__ITimedTextRegion.put_IsOverflowClipped(value)
    }

    /**
     * 
     * @returns {TimedTextPadding} 
     */
    get_Padding() {
        if (!this.HasProp("__ITimedTextRegion")) {
            if ((queryResult := this.QueryInterface(ITimedTextRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextRegion := ITimedTextRegion(outPtr)
        }

        return this.__ITimedTextRegion.get_Padding()
    }

    /**
     * 
     * @param {TimedTextPadding} value 
     * @returns {HRESULT} 
     */
    put_Padding(value) {
        if (!this.HasProp("__ITimedTextRegion")) {
            if ((queryResult := this.QueryInterface(ITimedTextRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextRegion := ITimedTextRegion(outPtr)
        }

        return this.__ITimedTextRegion.put_Padding(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextWrapping() {
        if (!this.HasProp("__ITimedTextRegion")) {
            if ((queryResult := this.QueryInterface(ITimedTextRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextRegion := ITimedTextRegion(outPtr)
        }

        return this.__ITimedTextRegion.get_TextWrapping()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TextWrapping(value) {
        if (!this.HasProp("__ITimedTextRegion")) {
            if ((queryResult := this.QueryInterface(ITimedTextRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextRegion := ITimedTextRegion(outPtr)
        }

        return this.__ITimedTextRegion.put_TextWrapping(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ZIndex() {
        if (!this.HasProp("__ITimedTextRegion")) {
            if ((queryResult := this.QueryInterface(ITimedTextRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextRegion := ITimedTextRegion(outPtr)
        }

        return this.__ITimedTextRegion.get_ZIndex()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ZIndex(value) {
        if (!this.HasProp("__ITimedTextRegion")) {
            if ((queryResult := this.QueryInterface(ITimedTextRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextRegion := ITimedTextRegion(outPtr)
        }

        return this.__ITimedTextRegion.put_ZIndex(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ScrollMode() {
        if (!this.HasProp("__ITimedTextRegion")) {
            if ((queryResult := this.QueryInterface(ITimedTextRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextRegion := ITimedTextRegion(outPtr)
        }

        return this.__ITimedTextRegion.get_ScrollMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ScrollMode(value) {
        if (!this.HasProp("__ITimedTextRegion")) {
            if ((queryResult := this.QueryInterface(ITimedTextRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextRegion := ITimedTextRegion(outPtr)
        }

        return this.__ITimedTextRegion.put_ScrollMode(value)
    }

;@endregion Instance Methods
}
