#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILocalLocationHoursOfOperationItem.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains the hours of operation for a location.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * This class is retrieved by accessing the [HoursOfOperation](locallocation_hoursofoperation.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.locallocationhoursofoperationitem
 * @namespace Windows.Services.Maps.LocalSearch
 * @version WindowsRuntime 1.4
 */
class LocalLocationHoursOfOperationItem extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILocalLocationHoursOfOperationItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILocalLocationHoursOfOperationItem.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the day the property is in operation.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.locallocationhoursofoperationitem.day
     * @type {Integer} 
     */
    Day {
        get => this.get_Day()
    }

    /**
     * Gets the start of operation for the location.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.locallocationhoursofoperationitem.start
     * @type {TimeSpan} 
     */
    Start {
        get => this.get_Start()
    }

    /**
     * Gets the time span of operation for the property.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.locallocationhoursofoperationitem.span
     * @type {TimeSpan} 
     */
    Span {
        get => this.get_Span()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Day() {
        if (!this.HasProp("__ILocalLocationHoursOfOperationItem")) {
            if ((queryResult := this.QueryInterface(ILocalLocationHoursOfOperationItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILocalLocationHoursOfOperationItem := ILocalLocationHoursOfOperationItem(outPtr)
        }

        return this.__ILocalLocationHoursOfOperationItem.get_Day()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Start() {
        if (!this.HasProp("__ILocalLocationHoursOfOperationItem")) {
            if ((queryResult := this.QueryInterface(ILocalLocationHoursOfOperationItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILocalLocationHoursOfOperationItem := ILocalLocationHoursOfOperationItem(outPtr)
        }

        return this.__ILocalLocationHoursOfOperationItem.get_Start()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Span() {
        if (!this.HasProp("__ILocalLocationHoursOfOperationItem")) {
            if ((queryResult := this.QueryInterface(ILocalLocationHoursOfOperationItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILocalLocationHoursOfOperationItem := ILocalLocationHoursOfOperationItem(outPtr)
        }

        return this.__ILocalLocationHoursOfOperationItem.get_Span()
    }

;@endregion Instance Methods
}
