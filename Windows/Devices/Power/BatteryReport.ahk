#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBatteryReport.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides properties that indicate the charge, capacity, and status of the battery. For more info, see [Get battery information](/previous-versions/windows/apps/dn895210(v=win.10)).
 * @remarks
 * All properties in BatteryReport will return **null** when the battery is not present or the value is not reported by the battery controller.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.power.batteryreport
 * @namespace Windows.Devices.Power
 * @version WindowsRuntime 1.4
 */
class BatteryReport extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBatteryReport

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBatteryReport.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the rate that the battery is charging.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.power.batteryreport.chargerateinmilliwatts
     * @type {IReference<Integer>} 
     */
    ChargeRateInMilliwatts {
        get => this.get_ChargeRateInMilliwatts()
    }

    /**
     * Gets the estimated energy capacity of a new battery of this type.
     * @remarks
     * This property is not supported by all battery controllers. Some battery controllers might return the same value as [FullChargeCapacityInMilliwattHours](batteryreport_fullchargecapacityinmilliwatthours.md) or return no value at all.
     * 
     * When this property is supported, the capacity ratio is the ratio of [FullChargeCapacityInMilliwattHours](batteryreport_fullchargecapacityinmilliwatthours.md) to DesignCapacityInMilliwattHours. [FullChargeCapacityInMilliwattHours](batteryreport_fullchargecapacityinmilliwatthours.md) is used in this way because the full charge capacity typically changes with battery wear.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.power.batteryreport.designcapacityinmilliwatthours
     * @type {IReference<Integer>} 
     */
    DesignCapacityInMilliwattHours {
        get => this.get_DesignCapacityInMilliwattHours()
    }

    /**
     * Gets the fully-charged energy capacity of the battery.
     * @remarks
     * FullChargeCapacityInMilliwattHours is used by the capacity ratio to estimate battery health.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.power.batteryreport.fullchargecapacityinmilliwatthours
     * @type {IReference<Integer>} 
     */
    FullChargeCapacityInMilliwattHours {
        get => this.get_FullChargeCapacityInMilliwattHours()
    }

    /**
     * Gets the remaining power capacity of the battery.
     * @remarks
     * To calculate the battery level, divide RemainingCapacityInMilliwattHours by [FullChargeCapacityInMilliwattHours](batteryreport_fullchargecapacityinmilliwatthours.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.power.batteryreport.remainingcapacityinmilliwatthours
     * @type {IReference<Integer>} 
     */
    RemainingCapacityInMilliwattHours {
        get => this.get_RemainingCapacityInMilliwattHours()
    }

    /**
     * Gets a [BatteryStatus](../windows.system.power/batterystatus.md) enumeration that indicates the status of the battery.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.power.batteryreport.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ChargeRateInMilliwatts() {
        if (!this.HasProp("__IBatteryReport")) {
            if ((queryResult := this.QueryInterface(IBatteryReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBatteryReport := IBatteryReport(outPtr)
        }

        return this.__IBatteryReport.get_ChargeRateInMilliwatts()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_DesignCapacityInMilliwattHours() {
        if (!this.HasProp("__IBatteryReport")) {
            if ((queryResult := this.QueryInterface(IBatteryReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBatteryReport := IBatteryReport(outPtr)
        }

        return this.__IBatteryReport.get_DesignCapacityInMilliwattHours()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_FullChargeCapacityInMilliwattHours() {
        if (!this.HasProp("__IBatteryReport")) {
            if ((queryResult := this.QueryInterface(IBatteryReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBatteryReport := IBatteryReport(outPtr)
        }

        return this.__IBatteryReport.get_FullChargeCapacityInMilliwattHours()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_RemainingCapacityInMilliwattHours() {
        if (!this.HasProp("__IBatteryReport")) {
            if ((queryResult := this.QueryInterface(IBatteryReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBatteryReport := IBatteryReport(outPtr)
        }

        return this.__IBatteryReport.get_RemainingCapacityInMilliwattHours()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IBatteryReport")) {
            if ((queryResult := this.QueryInterface(IBatteryReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBatteryReport := IBatteryReport(outPtr)
        }

        return this.__IBatteryReport.get_Status()
    }

;@endregion Instance Methods
}
