#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IOrientationSensorReading.ahk
#Include .\IOrientationSensorReadingYawAccuracy.ahk
#Include .\IOrientationSensorReading2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an orientation-sensor reading.
 * @remarks
 * This object is accessed when you invoke the [GetCurrentReading](orientationsensor_getcurrentreading_1416488181.md) method; and, it is accessed when you retrieve the [Reading](orientationsensorreadingchangedeventargs_reading.md) property of the [OrientationSensorReadingChangedEventArgs](orientationsensorreadingchangedeventargs.md) object in the event callback method..
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.orientationsensorreading
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class OrientationSensorReading extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IOrientationSensorReading

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IOrientationSensorReading.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the time at which the sensor reported the reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.orientationsensorreading.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the rotation matrix for the current orientation-sensor reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.orientationsensorreading.rotationmatrix
     * @type {SensorRotationMatrix} 
     */
    RotationMatrix {
        get => this.get_RotationMatrix()
    }

    /**
     * Gets the Quaternion for the current orientation-sensor reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.orientationsensorreading.quaternion
     * @type {SensorQuaternion} 
     */
    Quaternion {
        get => this.get_Quaternion()
    }

    /**
     * Gets the orientation sensor's z-axis accuracy.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.orientationsensorreading.yawaccuracy
     * @type {Integer} 
     */
    YawAccuracy {
        get => this.get_YawAccuracy()
    }

    /**
     * Gets the performance count associated with the reading. This allows the reading to be synchronized with other devices and processes on the system.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.orientationsensorreading.performancecount
     * @type {IReference<TimeSpan>} 
     */
    PerformanceCount {
        get => this.get_PerformanceCount()
    }

    /**
     * Gets the data properties reported by the sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.orientationsensorreading.properties
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
        if (!this.HasProp("__IOrientationSensorReading")) {
            if ((queryResult := this.QueryInterface(IOrientationSensorReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientationSensorReading := IOrientationSensorReading(outPtr)
        }

        return this.__IOrientationSensorReading.get_Timestamp()
    }

    /**
     * 
     * @returns {SensorRotationMatrix} 
     */
    get_RotationMatrix() {
        if (!this.HasProp("__IOrientationSensorReading")) {
            if ((queryResult := this.QueryInterface(IOrientationSensorReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientationSensorReading := IOrientationSensorReading(outPtr)
        }

        return this.__IOrientationSensorReading.get_RotationMatrix()
    }

    /**
     * 
     * @returns {SensorQuaternion} 
     */
    get_Quaternion() {
        if (!this.HasProp("__IOrientationSensorReading")) {
            if ((queryResult := this.QueryInterface(IOrientationSensorReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientationSensorReading := IOrientationSensorReading(outPtr)
        }

        return this.__IOrientationSensorReading.get_Quaternion()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_YawAccuracy() {
        if (!this.HasProp("__IOrientationSensorReadingYawAccuracy")) {
            if ((queryResult := this.QueryInterface(IOrientationSensorReadingYawAccuracy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientationSensorReadingYawAccuracy := IOrientationSensorReadingYawAccuracy(outPtr)
        }

        return this.__IOrientationSensorReadingYawAccuracy.get_YawAccuracy()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_PerformanceCount() {
        if (!this.HasProp("__IOrientationSensorReading2")) {
            if ((queryResult := this.QueryInterface(IOrientationSensorReading2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientationSensorReading2 := IOrientationSensorReading2(outPtr)
        }

        return this.__IOrientationSensorReading2.get_PerformanceCount()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__IOrientationSensorReading2")) {
            if ((queryResult := this.QueryInterface(IOrientationSensorReading2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOrientationSensorReading2 := IOrientationSensorReading2(outPtr)
        }

        return this.__IOrientationSensorReading2.get_Properties()
    }

;@endregion Instance Methods
}
