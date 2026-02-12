#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMagnetometerReading.ahk
#Include .\IMagnetometerReading2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a magnetometer reading.
 * @remarks
 * This object is accessed when you invoke the [GetCurrentReading](magnetometer_getcurrentreading_1416488181.md) method; and, it is accessed when you retrieve the [Reading](magnetometerreadingchangedeventargs_reading.md) property of the [MagnetometerReadingChangedEventArgs](magnetometerreadingchangedeventargs.md) object in the event callback method.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.magnetometerreading
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class MagnetometerReading extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMagnetometerReading

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMagnetometerReading.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the time at which the sensor reported the reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.magnetometerreading.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the magnetic field strength in microteslas along the X axis.
     * @remarks
     * The accuracy of this value depends on the state of magnetometer calibration reflected in the [DirectionalAccuracy](magnetometerreading_directionalaccuracy.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.magnetometerreading.magneticfieldx
     * @type {Float} 
     */
    MagneticFieldX {
        get => this.get_MagneticFieldX()
    }

    /**
     * Gets the magnetic field strength in microteslas along the Y axis.
     * @remarks
     * The accuracy of this value depends on the state of magnetometer calibration reflected in the [DirectionalAccuracy](magnetometerreading_directionalaccuracy.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.magnetometerreading.magneticfieldy
     * @type {Float} 
     */
    MagneticFieldY {
        get => this.get_MagneticFieldY()
    }

    /**
     * Gets the magnetic field strength in microteslas along the Z axis.
     * @remarks
     * The accuracy of this value depends on the state of magnetometer calibration reflected in the [DirectionalAccuracy](magnetometerreading_directionalaccuracy.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.magnetometerreading.magneticfieldz
     * @type {Float} 
     */
    MagneticFieldZ {
        get => this.get_MagneticFieldZ()
    }

    /**
     * Gets the magnetometer's directional accuracy.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.magnetometerreading.directionalaccuracy
     * @type {Integer} 
     */
    DirectionalAccuracy {
        get => this.get_DirectionalAccuracy()
    }

    /**
     * Gets the performance count associated with the reading. This allows the reading to be synchronized with other devices and processes on the system.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.magnetometerreading.performancecount
     * @type {IReference<TimeSpan>} 
     */
    PerformanceCount {
        get => this.get_PerformanceCount()
    }

    /**
     * Gets the data properties reported by the sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.magnetometerreading.properties
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
        if (!this.HasProp("__IMagnetometerReading")) {
            if ((queryResult := this.QueryInterface(IMagnetometerReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagnetometerReading := IMagnetometerReading(outPtr)
        }

        return this.__IMagnetometerReading.get_Timestamp()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MagneticFieldX() {
        if (!this.HasProp("__IMagnetometerReading")) {
            if ((queryResult := this.QueryInterface(IMagnetometerReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagnetometerReading := IMagnetometerReading(outPtr)
        }

        return this.__IMagnetometerReading.get_MagneticFieldX()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MagneticFieldY() {
        if (!this.HasProp("__IMagnetometerReading")) {
            if ((queryResult := this.QueryInterface(IMagnetometerReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagnetometerReading := IMagnetometerReading(outPtr)
        }

        return this.__IMagnetometerReading.get_MagneticFieldY()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MagneticFieldZ() {
        if (!this.HasProp("__IMagnetometerReading")) {
            if ((queryResult := this.QueryInterface(IMagnetometerReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagnetometerReading := IMagnetometerReading(outPtr)
        }

        return this.__IMagnetometerReading.get_MagneticFieldZ()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DirectionalAccuracy() {
        if (!this.HasProp("__IMagnetometerReading")) {
            if ((queryResult := this.QueryInterface(IMagnetometerReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagnetometerReading := IMagnetometerReading(outPtr)
        }

        return this.__IMagnetometerReading.get_DirectionalAccuracy()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_PerformanceCount() {
        if (!this.HasProp("__IMagnetometerReading2")) {
            if ((queryResult := this.QueryInterface(IMagnetometerReading2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagnetometerReading2 := IMagnetometerReading2(outPtr)
        }

        return this.__IMagnetometerReading2.get_PerformanceCount()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__IMagnetometerReading2")) {
            if ((queryResult := this.QueryInterface(IMagnetometerReading2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMagnetometerReading2 := IMagnetometerReading2(outPtr)
        }

        return this.__IMagnetometerReading2.get_Properties()
    }

;@endregion Instance Methods
}
