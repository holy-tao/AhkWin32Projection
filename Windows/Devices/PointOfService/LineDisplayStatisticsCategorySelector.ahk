#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILineDisplayStatisticsCategorySelector.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a standard statistics category selector.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaystatisticscategoryselector
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class LineDisplayStatisticsCategorySelector extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILineDisplayStatisticsCategorySelector

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILineDisplayStatisticsCategorySelector.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Retrieves all device statistics when provided to [ClaimedLineDisplay.GetStatisticsAsync(IEnumerable<String>)](claimedlinedisplay_getstatisticsasync_980600774.md).
     * @remarks
     * [ClaimedLineDisplay.GetStatisticsAsync(IEnumerable<String>)](claimedlinedisplay_getstatisticsasync_980600774.md)
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaystatisticscategoryselector.allstatistics
     * @type {HSTRING} 
     */
    AllStatistics {
        get => this.get_AllStatistics()
    }

    /**
     * Retrieves UnifiedPOS statistics when provided to [ClaimedLineDisplay.GetStatisticsAsync(IEnumerable<String>)](claimedlinedisplay_getstatisticsasync_980600774.md).
     * @remarks
     * [ClaimedLineDisplay.GetStatisticsAsync(IEnumerable<String>)](claimedlinedisplay_getstatisticsasync_980600774.md)
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaystatisticscategoryselector.unifiedposstatistics
     * @type {HSTRING} 
     */
    UnifiedPosStatistics {
        get => this.get_UnifiedPosStatistics()
    }

    /**
     * Retrieves manufacturer-defined statistics when provided to [ClaimedLineDisplay.GetStatisticsAsync(IEnumerable<String>)](claimedlinedisplay_getstatisticsasync_980600774.md.
     * @remarks
     * [ClaimedLineDisplay.GetStatisticsAsync(IEnumerable<String>)](claimedlinedisplay_getstatisticsasync_980600774.md)
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaystatisticscategoryselector.manufacturerstatistics
     * @type {HSTRING} 
     */
    ManufacturerStatistics {
        get => this.get_ManufacturerStatistics()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AllStatistics() {
        if (!this.HasProp("__ILineDisplayStatisticsCategorySelector")) {
            if ((queryResult := this.QueryInterface(ILineDisplayStatisticsCategorySelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayStatisticsCategorySelector := ILineDisplayStatisticsCategorySelector(outPtr)
        }

        return this.__ILineDisplayStatisticsCategorySelector.get_AllStatistics()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UnifiedPosStatistics() {
        if (!this.HasProp("__ILineDisplayStatisticsCategorySelector")) {
            if ((queryResult := this.QueryInterface(ILineDisplayStatisticsCategorySelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayStatisticsCategorySelector := ILineDisplayStatisticsCategorySelector(outPtr)
        }

        return this.__ILineDisplayStatisticsCategorySelector.get_UnifiedPosStatistics()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ManufacturerStatistics() {
        if (!this.HasProp("__ILineDisplayStatisticsCategorySelector")) {
            if ((queryResult := this.QueryInterface(ILineDisplayStatisticsCategorySelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayStatisticsCategorySelector := ILineDisplayStatisticsCategorySelector(outPtr)
        }

        return this.__ILineDisplayStatisticsCategorySelector.get_ManufacturerStatistics()
    }

;@endregion Instance Methods
}
