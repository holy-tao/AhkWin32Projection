#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILineDisplayCapabilities.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the line display capabilities.
 * @remarks
 * This object is accessed when you retrieve the [Capabilities](linedisplay_capabilities.md) property of the [LineDisplay](linedisplay.md) object.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycapabilities
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class LineDisplayCapabilities extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILineDisplayCapabilities

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILineDisplayCapabilities.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets whether the line display supports reporting statistics.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycapabilities.isstatisticsreportingsupported
     * @type {Boolean} 
     */
    IsStatisticsReportingSupported {
        get => this.get_IsStatisticsReportingSupported()
    }

    /**
     * Gets whether the line display supports updating (or resetting) statistics.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycapabilities.isstatisticsupdatingsupported
     * @type {Boolean} 
     */
    IsStatisticsUpdatingSupported {
        get => this.get_IsStatisticsUpdatingSupported()
    }

    /**
     * Gets the type of power reporting supported by the line display.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycapabilities.powerreportingtype
     * @type {Integer} 
     */
    PowerReportingType {
        get => this.get_PowerReportingType()
    }

    /**
     * Gets whether the line display supports changing its screen size.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycapabilities.canchangescreensize
     * @type {Boolean} 
     */
    CanChangeScreenSize {
        get => this.get_CanChangeScreenSize()
    }

    /**
     * Gets whether the line display supports displaying bitmaps.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycapabilities.candisplaybitmaps
     * @type {Boolean} 
     */
    CanDisplayBitmaps {
        get => this.get_CanDisplayBitmaps()
    }

    /**
     * Gets whether the line display supports reading characters at the current cursor position.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycapabilities.canreadcharacteratcursor
     * @type {Boolean} 
     */
    CanReadCharacterAtCursor {
        get => this.get_CanReadCharacterAtCursor()
    }

    /**
     * Gets whether the line display supports mapping characters sets.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycapabilities.canmapcharactersets
     * @type {Boolean} 
     */
    CanMapCharacterSets {
        get => this.get_CanMapCharacterSets()
    }

    /**
     * Gets whether the line display supports displaying custom glyphs.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycapabilities.candisplaycustomglyphs
     * @type {Boolean} 
     */
    CanDisplayCustomGlyphs {
        get => this.get_CanDisplayCustomGlyphs()
    }

    /**
     * Gets whether the line display supports reversing the video display.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycapabilities.canreverse
     * @type {Integer} 
     */
    CanReverse {
        get => this.get_CanReverse()
    }

    /**
     * Gets whether the line display supports blinking
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycapabilities.canblink
     * @type {Integer} 
     */
    CanBlink {
        get => this.get_CanBlink()
    }

    /**
     * Gets whether the line display supports changing its blink rate.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycapabilities.canchangeblinkrate
     * @type {Boolean} 
     */
    CanChangeBlinkRate {
        get => this.get_CanChangeBlinkRate()
    }

    /**
     * Gets whether the line display supports adjusting the screen brightness.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycapabilities.isbrightnesssupported
     * @type {Boolean} 
     */
    IsBrightnessSupported {
        get => this.get_IsBrightnessSupported()
    }

    /**
     * Gets whether the line display supports a cursor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycapabilities.iscursorsupported
     * @type {Boolean} 
     */
    IsCursorSupported {
        get => this.get_IsCursorSupported()
    }

    /**
     * Gets whether the line display supports horizontal marquee scrolling.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycapabilities.ishorizontalmarqueesupported
     * @type {Boolean} 
     */
    IsHorizontalMarqueeSupported {
        get => this.get_IsHorizontalMarqueeSupported()
    }

    /**
     * Gets whether the line display supports vertical marquee scrolling.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycapabilities.isverticalmarqueesupported
     * @type {Boolean} 
     */
    IsVerticalMarqueeSupported {
        get => this.get_IsVerticalMarqueeSupported()
    }

    /**
     * Gets whether the line display supports delaying between displaying successive characters.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycapabilities.isintercharacterwaitsupported
     * @type {Boolean} 
     */
    IsInterCharacterWaitSupported {
        get => this.get_IsInterCharacterWaitSupported()
    }

    /**
     * Gets the number of descriptors supported by the line display.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycapabilities.supporteddescriptors
     * @type {Integer} 
     */
    SupportedDescriptors {
        get => this.get_SupportedDescriptors()
    }

    /**
     * Gets the maximum number of windows supported by the line display.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycapabilities.supportedwindows
     * @type {Integer} 
     */
    SupportedWindows {
        get => this.get_SupportedWindows()
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
    get_IsStatisticsReportingSupported() {
        if (!this.HasProp("__ILineDisplayCapabilities")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCapabilities := ILineDisplayCapabilities(outPtr)
        }

        return this.__ILineDisplayCapabilities.get_IsStatisticsReportingSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStatisticsUpdatingSupported() {
        if (!this.HasProp("__ILineDisplayCapabilities")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCapabilities := ILineDisplayCapabilities(outPtr)
        }

        return this.__ILineDisplayCapabilities.get_IsStatisticsUpdatingSupported()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PowerReportingType() {
        if (!this.HasProp("__ILineDisplayCapabilities")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCapabilities := ILineDisplayCapabilities(outPtr)
        }

        return this.__ILineDisplayCapabilities.get_PowerReportingType()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanChangeScreenSize() {
        if (!this.HasProp("__ILineDisplayCapabilities")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCapabilities := ILineDisplayCapabilities(outPtr)
        }

        return this.__ILineDisplayCapabilities.get_CanChangeScreenSize()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanDisplayBitmaps() {
        if (!this.HasProp("__ILineDisplayCapabilities")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCapabilities := ILineDisplayCapabilities(outPtr)
        }

        return this.__ILineDisplayCapabilities.get_CanDisplayBitmaps()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanReadCharacterAtCursor() {
        if (!this.HasProp("__ILineDisplayCapabilities")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCapabilities := ILineDisplayCapabilities(outPtr)
        }

        return this.__ILineDisplayCapabilities.get_CanReadCharacterAtCursor()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanMapCharacterSets() {
        if (!this.HasProp("__ILineDisplayCapabilities")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCapabilities := ILineDisplayCapabilities(outPtr)
        }

        return this.__ILineDisplayCapabilities.get_CanMapCharacterSets()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanDisplayCustomGlyphs() {
        if (!this.HasProp("__ILineDisplayCapabilities")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCapabilities := ILineDisplayCapabilities(outPtr)
        }

        return this.__ILineDisplayCapabilities.get_CanDisplayCustomGlyphs()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CanReverse() {
        if (!this.HasProp("__ILineDisplayCapabilities")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCapabilities := ILineDisplayCapabilities(outPtr)
        }

        return this.__ILineDisplayCapabilities.get_CanReverse()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CanBlink() {
        if (!this.HasProp("__ILineDisplayCapabilities")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCapabilities := ILineDisplayCapabilities(outPtr)
        }

        return this.__ILineDisplayCapabilities.get_CanBlink()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanChangeBlinkRate() {
        if (!this.HasProp("__ILineDisplayCapabilities")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCapabilities := ILineDisplayCapabilities(outPtr)
        }

        return this.__ILineDisplayCapabilities.get_CanChangeBlinkRate()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBrightnessSupported() {
        if (!this.HasProp("__ILineDisplayCapabilities")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCapabilities := ILineDisplayCapabilities(outPtr)
        }

        return this.__ILineDisplayCapabilities.get_IsBrightnessSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCursorSupported() {
        if (!this.HasProp("__ILineDisplayCapabilities")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCapabilities := ILineDisplayCapabilities(outPtr)
        }

        return this.__ILineDisplayCapabilities.get_IsCursorSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHorizontalMarqueeSupported() {
        if (!this.HasProp("__ILineDisplayCapabilities")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCapabilities := ILineDisplayCapabilities(outPtr)
        }

        return this.__ILineDisplayCapabilities.get_IsHorizontalMarqueeSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVerticalMarqueeSupported() {
        if (!this.HasProp("__ILineDisplayCapabilities")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCapabilities := ILineDisplayCapabilities(outPtr)
        }

        return this.__ILineDisplayCapabilities.get_IsVerticalMarqueeSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInterCharacterWaitSupported() {
        if (!this.HasProp("__ILineDisplayCapabilities")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCapabilities := ILineDisplayCapabilities(outPtr)
        }

        return this.__ILineDisplayCapabilities.get_IsInterCharacterWaitSupported()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SupportedDescriptors() {
        if (!this.HasProp("__ILineDisplayCapabilities")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCapabilities := ILineDisplayCapabilities(outPtr)
        }

        return this.__ILineDisplayCapabilities.get_SupportedDescriptors()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SupportedWindows() {
        if (!this.HasProp("__ILineDisplayCapabilities")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCapabilities := ILineDisplayCapabilities(outPtr)
        }

        return this.__ILineDisplayCapabilities.get_SupportedWindows()
    }

;@endregion Instance Methods
}
