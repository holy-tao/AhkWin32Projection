#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInclinometerReading.ahk
#Include .\IInclinometerReadingYawAccuracy.ahk
#Include .\IInclinometerReading2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an inclinometer reading.
 * @remarks
 * This object is accessed when you invoke the [GetCurrentReading](inclinometer_getcurrentreading_1416488181.md) method; and, it is accessed when you retrieve the [Reading](inclinometerreadingchangedeventargs_reading.md) property of the [InclinometerReadingChangedEventArgs](inclinometerreadingchangedeventargs.md) object in the event callback method.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.inclinometerreading
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class InclinometerReading extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInclinometerReading

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInclinometerReading.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the time at which the sensor reported the reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.inclinometerreading.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the rotation in degrees around the x-axis.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.inclinometerreading.pitchdegrees
     * @type {Float} 
     */
    PitchDegrees {
        get => this.get_PitchDegrees()
    }

    /**
     * Gets the rotation in degrees around the y-axis.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.inclinometerreading.rolldegrees
     * @type {Float} 
     */
    RollDegrees {
        get => this.get_RollDegrees()
    }

    /**
     * Gets the rotation in degrees around the z-axis.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.inclinometerreading.yawdegrees
     * @type {Float} 
     */
    YawDegrees {
        get => this.get_YawDegrees()
    }

    /**
     * Gets the inclinometer's z-axis accuracy.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.inclinometerreading.yawaccuracy
     * @type {Integer} 
     */
    YawAccuracy {
        get => this.get_YawAccuracy()
    }

    /**
     * Gets the performance count associated with the reading. This allows the reading to be synchronized with other devices and processes on the system.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.inclinometerreading.performancecount
     * @type {IReference<TimeSpan>} 
     */
    PerformanceCount {
        get => this.get_PerformanceCount()
    }

    /**
     * Gets a collection of key-value pairs that represent data properties reported by the sensor for the given reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.inclinometerreading.properties
     * @type {IMapView<HSTRING, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        if (!this.HasProp("__IInclinometerReading")) {
            if ((queryResult := this.QueryInterface(IInclinometerReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInclinometerReading := IInclinometerReading(outPtr)
        }

        return this.__IInclinometerReading.get_Timestamp()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PitchDegrees() {
        if (!this.HasProp("__IInclinometerReading")) {
            if ((queryResult := this.QueryInterface(IInclinometerReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInclinometerReading := IInclinometerReading(outPtr)
        }

        return this.__IInclinometerReading.get_PitchDegrees()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RollDegrees() {
        if (!this.HasProp("__IInclinometerReading")) {
            if ((queryResult := this.QueryInterface(IInclinometerReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInclinometerReading := IInclinometerReading(outPtr)
        }

        return this.__IInclinometerReading.get_RollDegrees()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_YawDegrees() {
        if (!this.HasProp("__IInclinometerReading")) {
            if ((queryResult := this.QueryInterface(IInclinometerReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInclinometerReading := IInclinometerReading(outPtr)
        }

        return this.__IInclinometerReading.get_YawDegrees()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_YawAccuracy() {
        if (!this.HasProp("__IInclinometerReadingYawAccuracy")) {
            if ((queryResult := this.QueryInterface(IInclinometerReadingYawAccuracy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInclinometerReadingYawAccuracy := IInclinometerReadingYawAccuracy(outPtr)
        }

        return this.__IInclinometerReadingYawAccuracy.get_YawAccuracy()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_PerformanceCount() {
        if (!this.HasProp("__IInclinometerReading2")) {
            if ((queryResult := this.QueryInterface(IInclinometerReading2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInclinometerReading2 := IInclinometerReading2(outPtr)
        }

        return this.__IInclinometerReading2.get_PerformanceCount()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__IInclinometerReading2")) {
            if ((queryResult := this.QueryInterface(IInclinometerReading2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInclinometerReading2 := IInclinometerReading2(outPtr)
        }

        return this.__IInclinometerReading2.get_Properties()
    }

;@endregion Instance Methods
}
