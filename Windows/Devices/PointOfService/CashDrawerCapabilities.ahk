#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICashDrawerCapabilities.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the cash drawer capabilities.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawercapabilities
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class CashDrawerCapabilities extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICashDrawerCapabilities

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICashDrawerCapabilities.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Whether the cash drawer has standard or advanced power reporting.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawercapabilities.powerreportingtype
     * @type {Integer} 
     */
    PowerReportingType {
        get => this.get_PowerReportingType()
    }

    /**
     * Whether statistics reporting is supported by the cash drawer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawercapabilities.isstatisticsreportingsupported
     * @type {Boolean} 
     */
    IsStatisticsReportingSupported {
        get => this.get_IsStatisticsReportingSupported()
    }

    /**
     * Whether statistics updating is supported by the cash drawer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawercapabilities.isstatisticsupdatingsupported
     * @type {Boolean} 
     */
    IsStatisticsUpdatingSupported {
        get => this.get_IsStatisticsUpdatingSupported()
    }

    /**
     * Whether status reporting is supported by the cash drawer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawercapabilities.isstatusreportingsupported
     * @type {Boolean} 
     */
    IsStatusReportingSupported {
        get => this.get_IsStatusReportingSupported()
    }

    /**
     * Whether the status from multiple drawers is supported.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawercapabilities.isstatusmultidrawerdetectsupported
     * @type {Boolean} 
     */
    IsStatusMultiDrawerDetectSupported {
        get => this.get_IsStatusMultiDrawerDetectSupported()
    }

    /**
     * Indicated whether cash drawer open sensor is available.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawercapabilities.isdraweropensensoravailable
     * @type {Boolean} 
     */
    IsDrawerOpenSensorAvailable {
        get => this.get_IsDrawerOpenSensorAvailable()
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
    get_PowerReportingType() {
        if (!this.HasProp("__ICashDrawerCapabilities")) {
            if ((queryResult := this.QueryInterface(ICashDrawerCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawerCapabilities := ICashDrawerCapabilities(outPtr)
        }

        return this.__ICashDrawerCapabilities.get_PowerReportingType()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStatisticsReportingSupported() {
        if (!this.HasProp("__ICashDrawerCapabilities")) {
            if ((queryResult := this.QueryInterface(ICashDrawerCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawerCapabilities := ICashDrawerCapabilities(outPtr)
        }

        return this.__ICashDrawerCapabilities.get_IsStatisticsReportingSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStatisticsUpdatingSupported() {
        if (!this.HasProp("__ICashDrawerCapabilities")) {
            if ((queryResult := this.QueryInterface(ICashDrawerCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawerCapabilities := ICashDrawerCapabilities(outPtr)
        }

        return this.__ICashDrawerCapabilities.get_IsStatisticsUpdatingSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStatusReportingSupported() {
        if (!this.HasProp("__ICashDrawerCapabilities")) {
            if ((queryResult := this.QueryInterface(ICashDrawerCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawerCapabilities := ICashDrawerCapabilities(outPtr)
        }

        return this.__ICashDrawerCapabilities.get_IsStatusReportingSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStatusMultiDrawerDetectSupported() {
        if (!this.HasProp("__ICashDrawerCapabilities")) {
            if ((queryResult := this.QueryInterface(ICashDrawerCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawerCapabilities := ICashDrawerCapabilities(outPtr)
        }

        return this.__ICashDrawerCapabilities.get_IsStatusMultiDrawerDetectSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDrawerOpenSensorAvailable() {
        if (!this.HasProp("__ICashDrawerCapabilities")) {
            if ((queryResult := this.QueryInterface(ICashDrawerCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawerCapabilities := ICashDrawerCapabilities(outPtr)
        }

        return this.__ICashDrawerCapabilities.get_IsDrawerOpenSensorAvailable()
    }

;@endregion Instance Methods
}
