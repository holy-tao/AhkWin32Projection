#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHingeAngleSensor.ahk
#Include .\IHingeAngleSensorStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\HingeAngleSensor.ahk
#Include .\HingeAngleSensorReadingChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents the hinge angle sensor in a dual-screen device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.hingeanglesensor
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class HingeAngleSensor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHingeAngleSensor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHingeAngleSensor.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets an Advanced Query Syntax (AQS) string for identifying instances of the display panels in a hinged dual-screen device. This string is passed to the [HingeAngleSensor.GetRelatedToAdjacentPanelsAsync](hingeanglesensor_getrelatedtoadjacentpanelsasync_1690986040.md) method.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.hingeanglesensor.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!HingeAngleSensor.HasProp("__IHingeAngleSensorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.HingeAngleSensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHingeAngleSensorStatics.IID)
            HingeAngleSensor.__IHingeAngleSensorStatics := IHingeAngleSensorStatics(factoryPtr)
        }

        return HingeAngleSensor.__IHingeAngleSensorStatics.GetDeviceSelector()
    }

    /**
     * Asynchronously retrieves the default hinge angle sensor.
     * @returns {IAsyncOperation<HingeAngleSensor>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.hingeanglesensor.getdefaultasync
     */
    static GetDefaultAsync() {
        if (!HingeAngleSensor.HasProp("__IHingeAngleSensorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.HingeAngleSensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHingeAngleSensorStatics.IID)
            HingeAngleSensor.__IHingeAngleSensorStatics := IHingeAngleSensorStatics(factoryPtr)
        }

        return HingeAngleSensor.__IHingeAngleSensorStatics.GetDefaultAsync()
    }

    /**
     * Asynchronously retrieves a hinge angle sensor for two adjacent display panels.
     * @param {HSTRING} firstPanelId The device Id of one of the hinged panels.
     * @param {HSTRING} secondPanelId The device Id of the other hinged panel.
     * @returns {IAsyncOperation<HingeAngleSensor>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.hingeanglesensor.getrelatedtoadjacentpanelsasync
     */
    static GetRelatedToAdjacentPanelsAsync(firstPanelId, secondPanelId) {
        if (!HingeAngleSensor.HasProp("__IHingeAngleSensorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.HingeAngleSensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHingeAngleSensorStatics.IID)
            HingeAngleSensor.__IHingeAngleSensorStatics := IHingeAngleSensorStatics(factoryPtr)
        }

        return HingeAngleSensor.__IHingeAngleSensorStatics.GetRelatedToAdjacentPanelsAsync(firstPanelId, secondPanelId)
    }

    /**
     * Obtains the hinge angle sensor from the identifier.
     * @param {HSTRING} deviceId The sensor identifier.
     * @returns {IAsyncOperation<HingeAngleSensor>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.hingeanglesensor.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!HingeAngleSensor.HasProp("__IHingeAngleSensorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sensors.HingeAngleSensor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHingeAngleSensorStatics.IID)
            HingeAngleSensor.__IHingeAngleSensorStatics := IHingeAngleSensorStatics(factoryPtr)
        }

        return HingeAngleSensor.__IHingeAngleSensorStatics.FromIdAsync(deviceId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the device identifier.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.hingeanglesensor.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the minimum reporting threshold for the hinge angle sensor, measured in degrees.
     * @remarks
     * A report is generated only if the delta between the previous reported data reading and a new sample is greater than the [HingeAngleSensor.MinReportThresholdInDegrees](hingeanglesensor_minreportthresholdindegrees.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.hingeanglesensor.minreportthresholdindegrees
     * @type {Float} 
     */
    MinReportThresholdInDegrees {
        get => this.get_MinReportThresholdInDegrees()
    }

    /**
     * Gets the reporting threshold for the hinge angle sensor, measured in degrees.
     * @remarks
     * A report is generated only if the delta between the previous reported data reading and a new sample is greater than the [HingeAngleSensor.ReportThresholdInDegrees](hingeanglesensor_reportthresholdindegrees.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.hingeanglesensor.reportthresholdindegrees
     * @type {Float} 
     */
    ReportThresholdInDegrees {
        get => this.get_ReportThresholdInDegrees()
        set => this.put_ReportThresholdInDegrees(value)
    }

    /**
     * Occurs when the hinge angle sensor in a dual-screen device reports a change in opening angle.
     * @type {TypedEventHandler<HingeAngleSensor, HingeAngleSensorReadingChangedEventArgs>}
    */
    OnReadingChanged {
        get {
            if(!this.HasProp("__OnReadingChanged")){
                this.__OnReadingChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{68de2bf4-243c-5aee-9dd9-d2e5e3165866}"),
                    HingeAngleSensor,
                    HingeAngleSensorReadingChangedEventArgs
                )
                this.__OnReadingChangedToken := this.add_ReadingChanged(this.__OnReadingChanged.iface)
            }
            return this.__OnReadingChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnReadingChangedToken")) {
            this.remove_ReadingChanged(this.__OnReadingChangedToken)
            this.__OnReadingChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Asynchronously retrieves the current data from the hinge angle sensor.
     * @returns {IAsyncOperation<HingeAngleReading>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.hingeanglesensor.getcurrentreadingasync
     */
    GetCurrentReadingAsync() {
        if (!this.HasProp("__IHingeAngleSensor")) {
            if ((queryResult := this.QueryInterface(IHingeAngleSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHingeAngleSensor := IHingeAngleSensor(outPtr)
        }

        return this.__IHingeAngleSensor.GetCurrentReadingAsync()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IHingeAngleSensor")) {
            if ((queryResult := this.QueryInterface(IHingeAngleSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHingeAngleSensor := IHingeAngleSensor(outPtr)
        }

        return this.__IHingeAngleSensor.get_DeviceId()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinReportThresholdInDegrees() {
        if (!this.HasProp("__IHingeAngleSensor")) {
            if ((queryResult := this.QueryInterface(IHingeAngleSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHingeAngleSensor := IHingeAngleSensor(outPtr)
        }

        return this.__IHingeAngleSensor.get_MinReportThresholdInDegrees()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ReportThresholdInDegrees() {
        if (!this.HasProp("__IHingeAngleSensor")) {
            if ((queryResult := this.QueryInterface(IHingeAngleSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHingeAngleSensor := IHingeAngleSensor(outPtr)
        }

        return this.__IHingeAngleSensor.get_ReportThresholdInDegrees()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ReportThresholdInDegrees(value) {
        if (!this.HasProp("__IHingeAngleSensor")) {
            if ((queryResult := this.QueryInterface(IHingeAngleSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHingeAngleSensor := IHingeAngleSensor(outPtr)
        }

        return this.__IHingeAngleSensor.put_ReportThresholdInDegrees(value)
    }

    /**
     * 
     * @param {TypedEventHandler<HingeAngleSensor, HingeAngleSensorReadingChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReadingChanged(handler) {
        if (!this.HasProp("__IHingeAngleSensor")) {
            if ((queryResult := this.QueryInterface(IHingeAngleSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHingeAngleSensor := IHingeAngleSensor(outPtr)
        }

        return this.__IHingeAngleSensor.add_ReadingChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ReadingChanged(token) {
        if (!this.HasProp("__IHingeAngleSensor")) {
            if ((queryResult := this.QueryInterface(IHingeAngleSensor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHingeAngleSensor := IHingeAngleSensor(outPtr)
        }

        return this.__IHingeAngleSensor.remove_ReadingChanged(token)
    }

;@endregion Instance Methods
}
