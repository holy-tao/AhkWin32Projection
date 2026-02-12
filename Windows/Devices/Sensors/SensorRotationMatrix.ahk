#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISensorRotationMatrix.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a 3x3 rotation matrix.
 * @remarks
 * This object is accessed when your app supports the [ReadingChanged](orientationsensor_readingchanged.md) event for the OrientationSensor object.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.sensorrotationmatrix
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class SensorRotationMatrix extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISensorRotationMatrix

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISensorRotationMatrix.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the value at row 1, column 1 of the given rotation matrix.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.sensorrotationmatrix.m11
     * @type {Float} 
     */
    M11 {
        get => this.get_M11()
    }

    /**
     * Gets the value at row 1, column 2 of the given rotation matrix.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.sensorrotationmatrix.m12
     * @type {Float} 
     */
    M12 {
        get => this.get_M12()
    }

    /**
     * Gets the value at row 1, column 3 of the given rotation matrix.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.sensorrotationmatrix.m13
     * @type {Float} 
     */
    M13 {
        get => this.get_M13()
    }

    /**
     * Gets the value at row 2, column 1 of the given rotation matrix.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.sensorrotationmatrix.m21
     * @type {Float} 
     */
    M21 {
        get => this.get_M21()
    }

    /**
     * Gets the value at row 2, column 2 of the given rotation matrix.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.sensorrotationmatrix.m22
     * @type {Float} 
     */
    M22 {
        get => this.get_M22()
    }

    /**
     * Gets the value at row 2, column 3 of the given rotation matrix.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.sensorrotationmatrix.m23
     * @type {Float} 
     */
    M23 {
        get => this.get_M23()
    }

    /**
     * Gets the value at row 3, column 1 of the given rotation matrix.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.sensorrotationmatrix.m31
     * @type {Float} 
     */
    M31 {
        get => this.get_M31()
    }

    /**
     * Gets the value at row 3, column 2 of the given rotation matrix.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.sensorrotationmatrix.m32
     * @type {Float} 
     */
    M32 {
        get => this.get_M32()
    }

    /**
     * Gets the value at row 3, column 3 of the given rotation matrix.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.sensorrotationmatrix.m33
     * @type {Float} 
     */
    M33 {
        get => this.get_M33()
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
    get_M11() {
        if (!this.HasProp("__ISensorRotationMatrix")) {
            if ((queryResult := this.QueryInterface(ISensorRotationMatrix.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISensorRotationMatrix := ISensorRotationMatrix(outPtr)
        }

        return this.__ISensorRotationMatrix.get_M11()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_M12() {
        if (!this.HasProp("__ISensorRotationMatrix")) {
            if ((queryResult := this.QueryInterface(ISensorRotationMatrix.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISensorRotationMatrix := ISensorRotationMatrix(outPtr)
        }

        return this.__ISensorRotationMatrix.get_M12()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_M13() {
        if (!this.HasProp("__ISensorRotationMatrix")) {
            if ((queryResult := this.QueryInterface(ISensorRotationMatrix.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISensorRotationMatrix := ISensorRotationMatrix(outPtr)
        }

        return this.__ISensorRotationMatrix.get_M13()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_M21() {
        if (!this.HasProp("__ISensorRotationMatrix")) {
            if ((queryResult := this.QueryInterface(ISensorRotationMatrix.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISensorRotationMatrix := ISensorRotationMatrix(outPtr)
        }

        return this.__ISensorRotationMatrix.get_M21()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_M22() {
        if (!this.HasProp("__ISensorRotationMatrix")) {
            if ((queryResult := this.QueryInterface(ISensorRotationMatrix.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISensorRotationMatrix := ISensorRotationMatrix(outPtr)
        }

        return this.__ISensorRotationMatrix.get_M22()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_M23() {
        if (!this.HasProp("__ISensorRotationMatrix")) {
            if ((queryResult := this.QueryInterface(ISensorRotationMatrix.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISensorRotationMatrix := ISensorRotationMatrix(outPtr)
        }

        return this.__ISensorRotationMatrix.get_M23()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_M31() {
        if (!this.HasProp("__ISensorRotationMatrix")) {
            if ((queryResult := this.QueryInterface(ISensorRotationMatrix.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISensorRotationMatrix := ISensorRotationMatrix(outPtr)
        }

        return this.__ISensorRotationMatrix.get_M31()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_M32() {
        if (!this.HasProp("__ISensorRotationMatrix")) {
            if ((queryResult := this.QueryInterface(ISensorRotationMatrix.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISensorRotationMatrix := ISensorRotationMatrix(outPtr)
        }

        return this.__ISensorRotationMatrix.get_M32()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_M33() {
        if (!this.HasProp("__ISensorRotationMatrix")) {
            if ((queryResult := this.QueryInterface(ISensorRotationMatrix.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISensorRotationMatrix := ISensorRotationMatrix(outPtr)
        }

        return this.__ISensorRotationMatrix.get_M33()
    }

;@endregion Instance Methods
}
