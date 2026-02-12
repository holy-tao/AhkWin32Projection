#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISensorQuaternion.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a Quaternion.
 * @remarks
 * This object is accessed when your app supports the [ReadingChanged](orientationsensor_readingchanged.md) event for the OrientationSensor object.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.sensorquaternion
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class SensorQuaternion extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISensorQuaternion

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISensorQuaternion.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the w-value of the Quaternion.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.sensorquaternion.w
     * @type {Float} 
     */
    W {
        get => this.get_W()
    }

    /**
     * Gets the x-value of the Quaternion.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.sensorquaternion.x
     * @type {Float} 
     */
    X {
        get => this.get_X()
    }

    /**
     * Gets the y-value of the Quaternion.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.sensorquaternion.y
     * @type {Float} 
     */
    Y {
        get => this.get_Y()
    }

    /**
     * Gets the z-value of the Quaternion.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.sensorquaternion.z
     * @type {Float} 
     */
    Z {
        get => this.get_Z()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_W() {
        if (!this.HasProp("__ISensorQuaternion")) {
            if ((queryResult := this.QueryInterface(ISensorQuaternion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISensorQuaternion := ISensorQuaternion(outPtr)
        }

        return this.__ISensorQuaternion.get_W()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_X() {
        if (!this.HasProp("__ISensorQuaternion")) {
            if ((queryResult := this.QueryInterface(ISensorQuaternion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISensorQuaternion := ISensorQuaternion(outPtr)
        }

        return this.__ISensorQuaternion.get_X()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Y() {
        if (!this.HasProp("__ISensorQuaternion")) {
            if ((queryResult := this.QueryInterface(ISensorQuaternion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISensorQuaternion := ISensorQuaternion(outPtr)
        }

        return this.__ISensorQuaternion.get_Y()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Z() {
        if (!this.HasProp("__ISensorQuaternion")) {
            if ((queryResult := this.QueryInterface(ISensorQuaternion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISensorQuaternion := ISensorQuaternion(outPtr)
        }

        return this.__ISensorQuaternion.get_Z()
    }

;@endregion Instance Methods
}
