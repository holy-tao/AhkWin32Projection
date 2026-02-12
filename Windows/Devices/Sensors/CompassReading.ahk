#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICompassReading.ahk
#Include .\ICompassReadingHeadingAccuracy.ahk
#Include .\ICompassReading2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a compass reading.
 * @remarks
 * This object is accessed when you invoke the [GetCurrentReading](compass_getcurrentreading_1416488181.md) method; and, it is accessed when you retrieve the [Reading](compassreadingchangedeventargs_reading.md) property of the [CompassReadingChangedEventArgs](compassreadingchangedeventargs.md) object in the event callback method.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.compassreading
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class CompassReading extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompassReading

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompassReading.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the time at which the sensor reported the reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.compassreading.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the heading in degrees relative to magnetic-north.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.compassreading.headingmagneticnorth
     * @type {Float} 
     */
    HeadingMagneticNorth {
        get => this.get_HeadingMagneticNorth()
    }

    /**
     * Gets the heading in degrees relative to geographic true-north.
     * @remarks
     * Before retrieving this property, your code should first check to verify that the value is not null. (If the value is null and you attempt to retrieve it, Windows will generate an exception.)
     * 
     * In order to retrieve the declination, your app needs to have access to the device's current location. If the location is not available, the declination defaults to 0 degrees. In this scenario, HeadingTrueNorth equals [HeadingMagneticNorth](compassreading_headingmagneticnorth.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.compassreading.headingtruenorth
     * @type {IReference<Float>} 
     */
    HeadingTrueNorth {
        get => this.get_HeadingTrueNorth()
    }

    /**
     * Gets the compass's heading accuracy.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.compassreading.headingaccuracy
     * @type {Integer} 
     */
    HeadingAccuracy {
        get => this.get_HeadingAccuracy()
    }

    /**
     * Gets the performance count associated with the reading. This allows the reading to be synchronized with other devices and processes on the system.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.compassreading.performancecount
     * @type {IReference<TimeSpan>} 
     */
    PerformanceCount {
        get => this.get_PerformanceCount()
    }

    /**
     * Gets the data properties reported by the sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.compassreading.properties
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
        if (!this.HasProp("__ICompassReading")) {
            if ((queryResult := this.QueryInterface(ICompassReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompassReading := ICompassReading(outPtr)
        }

        return this.__ICompassReading.get_Timestamp()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HeadingMagneticNorth() {
        if (!this.HasProp("__ICompassReading")) {
            if ((queryResult := this.QueryInterface(ICompassReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompassReading := ICompassReading(outPtr)
        }

        return this.__ICompassReading.get_HeadingMagneticNorth()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_HeadingTrueNorth() {
        if (!this.HasProp("__ICompassReading")) {
            if ((queryResult := this.QueryInterface(ICompassReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompassReading := ICompassReading(outPtr)
        }

        return this.__ICompassReading.get_HeadingTrueNorth()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HeadingAccuracy() {
        if (!this.HasProp("__ICompassReadingHeadingAccuracy")) {
            if ((queryResult := this.QueryInterface(ICompassReadingHeadingAccuracy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompassReadingHeadingAccuracy := ICompassReadingHeadingAccuracy(outPtr)
        }

        return this.__ICompassReadingHeadingAccuracy.get_HeadingAccuracy()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_PerformanceCount() {
        if (!this.HasProp("__ICompassReading2")) {
            if ((queryResult := this.QueryInterface(ICompassReading2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompassReading2 := ICompassReading2(outPtr)
        }

        return this.__ICompassReading2.get_PerformanceCount()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__ICompassReading2")) {
            if ((queryResult := this.QueryInterface(ICompassReading2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompassReading2 := ICompassReading2(outPtr)
        }

        return this.__ICompassReading2.get_Properties()
    }

;@endregion Instance Methods
}
