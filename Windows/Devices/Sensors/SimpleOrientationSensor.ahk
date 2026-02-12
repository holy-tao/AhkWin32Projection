#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISimpleOrientationSensor.ahk
#Include .\ISimpleOrientationSensorDeviceId.ahk
#Include .\ISimpleOrientationSensor2.ahk
#Include .\ISimpleOrientationSensorStatics.ahk
#Include .\ISimpleOrientationSensorStatics2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\SimpleOrientationSensor.ahk
#Include .\SimpleOrientationSensorOrientationChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a simple orientation sensor.
  * 
  * For an example implementation, see the [simple orientation sensor sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/SimpleOrientationSensor).
  * 
  * This sensor detects the current quadrant orientation of the specified device as well as its face-up or face-down status.
 * @remarks
 * The following example demonstrates how a UWP app built with XAML and C# uses the [GetDefault](simpleorientationsensor_getdefault_846721868.md) method to establish a connection to a simple orientation sensor. If no simple orientation sensor is found, the method will return a null value.
 * 
 * [!code-csharp[GetDefaultCS](../windows.devices.sensors/code/simpleorientation/csharp/Scenario1.xaml.cs#SnippetGetDefaultCS)]
 * 
 * The following example demonstrates how a UWP app built with XAML registers a [OrientationChanged](simpleorientationsensor_orientationchanged.md) event handler.
 * 
 * [!code-csharp[EnableReadingChangedCS](../windows.devices.sensors/code/simpleorientation/csharp/Scenario1.xaml.cs#SnippetEnableReadingChangedCS)]
 * 
 * The following example contains the XAML code for the event handler which writes the orientation readings to the application's form.
 * 
 * [!code-csharp[ReadingChangedCS](../windows.devices.sensors/code/simpleorientation/csharp/Scenario1.xaml.cs#SnippetReadingChangedCS)]
 * 
 * [!code-csharp[ReadingChanged2CS](../windows.devices.sensors/code/simpleorientation/csharp/Scenario1.xaml.cs#SnippetReadingChanged2CS)]
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.simpleorientationsensor
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class SimpleOrientationSensor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISimpleOrientationSensor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISimpleOrientationSensor.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the default simple orientation sensor.
     * @remarks
     * This method only returns values for hardware that has been integrated into the computer by the manufacturer. (The simple orientation-sensor readings are derived from an accelerometer.) A null value will be returned if the specified sensor is not available in the system.
     * 
     * When a system is in Connected Standby, a call to the [GetDefault](/uwp/api/windows.devices.sensors.orientationsensor.getdefault) method will return immediately with a null result.
     * @returns {SimpleOrientationSensor} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.simpleorientationsensor.getdefault
     */
    static GetDefault() {
        if (!SimpleOrientationSensor.HasProp("__ISimpleOrientationSensorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.SimpleOrientationSensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISimpleOrientationSensorStatics.IID)
            SimpleOrientationSensor.__ISimpleOrientationSensorStatics := ISimpleOrientationSensorStatics(factoryPtr)
        }

        return SimpleOrientationSensor.__ISimpleOrientationSensorStatics.GetDefault()
    }

    /**
     * Retrieves an Advanced Query Syntax (AQS) string used to enumerate the available [SimpleOrientationSensor](simpleorientationsensor.md) devices.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.simpleorientationsensor.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!SimpleOrientationSensor.HasProp("__ISimpleOrientationSensorStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.SimpleOrientationSensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISimpleOrientationSensorStatics2.IID)
            SimpleOrientationSensor.__ISimpleOrientationSensorStatics2 := ISimpleOrientationSensorStatics2(factoryPtr)
        }

        return SimpleOrientationSensor.__ISimpleOrientationSensorStatics2.GetDeviceSelector()
    }

    /**
     * Asynchronously retrieves a [SimpleOrientationSensor](simpleorientationsensor.md) object based on the specified device identifier.
     * @param {HSTRING} deviceId The [SimpleOrientationSensor](simpleorientationsensor.md) device identifier.
     * @returns {IAsyncOperation<SimpleOrientationSensor>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.simpleorientationsensor.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!SimpleOrientationSensor.HasProp("__ISimpleOrientationSensorStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.SimpleOrientationSensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISimpleOrientationSensorStatics2.IID)
            SimpleOrientationSensor.__ISimpleOrientationSensorStatics2 := ISimpleOrientationSensorStatics2(factoryPtr)
        }

        return SimpleOrientationSensor.__ISimpleOrientationSensorStatics2.FromIdAsync(deviceId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the device identifier used in the [SimpleOrientationSensor.FromIdAsync](simpleorientationsensor_fromidasync_1322863552.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.simpleorientationsensor.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets or sets the transformation that needs to be applied to sensor data. Transformations to be applied are tied to the display orientation with which to align the sensor data.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.simpleorientationsensor.readingtransform
     * @type {Integer} 
     */
    ReadingTransform {
        get => this.get_ReadingTransform()
        set => this.put_ReadingTransform(value)
    }

    /**
     * Occurs each time the simple orientation sensor reports a new sensor reading
     * @type {TypedEventHandler<SimpleOrientationSensor, SimpleOrientationSensorOrientationChangedEventArgs>}
    */
    OnOrientationChanged {
        get {
            if(!this.HasProp("__OnOrientationChanged")){
                this.__OnOrientationChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{92437fa7-ea7b-5fc5-8ecf-1b911bea2bfc}"),
                    SimpleOrientationSensor,
                    SimpleOrientationSensorOrientationChangedEventArgs
                )
                this.__OnOrientationChangedToken := this.add_OrientationChanged(this.__OnOrientationChanged.iface)
            }
            return this.__OnOrientationChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnOrientationChangedToken")) {
            this.remove_OrientationChanged(this.__OnOrientationChangedToken)
            this.__OnOrientationChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Gets the default simple orientation sensor.
     * @remarks
     * An application may use this method to poll the sensor for the current reading as an alternative to registering a [OrientationChanged](simpleorientationsensor_orientationchanged.md) event handler. This would be the preferred alternative for an application that updates its user interface at a specific frame rate.
     * 
     * The following example demonstrates how a UWP app built for Windows using JavaScript retrieved the current device orientation by using the simple orientation sensor.
     * 
     * 
     * 
     * [!code-js[GetReadingJS](../windows.devices.sensors/code/simpleorientation/javascript/scenario2.js#SnippetGetReadingJS)]
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.simpleorientationsensor.getcurrentorientation
     */
    GetCurrentOrientation() {
        if (!this.HasProp("__ISimpleOrientationSensor")) {
            if ((queryResult := this.QueryInterface(ISimpleOrientationSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISimpleOrientationSensor := ISimpleOrientationSensor(outPtr)
        }

        return this.__ISimpleOrientationSensor.GetCurrentOrientation()
    }

    /**
     * 
     * @param {TypedEventHandler<SimpleOrientationSensor, SimpleOrientationSensorOrientationChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_OrientationChanged(handler) {
        if (!this.HasProp("__ISimpleOrientationSensor")) {
            if ((queryResult := this.QueryInterface(ISimpleOrientationSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISimpleOrientationSensor := ISimpleOrientationSensor(outPtr)
        }

        return this.__ISimpleOrientationSensor.add_OrientationChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_OrientationChanged(token) {
        if (!this.HasProp("__ISimpleOrientationSensor")) {
            if ((queryResult := this.QueryInterface(ISimpleOrientationSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISimpleOrientationSensor := ISimpleOrientationSensor(outPtr)
        }

        return this.__ISimpleOrientationSensor.remove_OrientationChanged(token)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__ISimpleOrientationSensorDeviceId")) {
            if ((queryResult := this.QueryInterface(ISimpleOrientationSensorDeviceId.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISimpleOrientationSensorDeviceId := ISimpleOrientationSensorDeviceId(outPtr)
        }

        return this.__ISimpleOrientationSensorDeviceId.get_DeviceId()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReadingTransform(value) {
        if (!this.HasProp("__ISimpleOrientationSensor2")) {
            if ((queryResult := this.QueryInterface(ISimpleOrientationSensor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISimpleOrientationSensor2 := ISimpleOrientationSensor2(outPtr)
        }

        return this.__ISimpleOrientationSensor2.put_ReadingTransform(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReadingTransform() {
        if (!this.HasProp("__ISimpleOrientationSensor2")) {
            if ((queryResult := this.QueryInterface(ISimpleOrientationSensor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISimpleOrientationSensor2 := ISimpleOrientationSensor2(outPtr)
        }

        return this.__ISimpleOrientationSensor2.get_ReadingTransform()
    }

;@endregion Instance Methods
}
