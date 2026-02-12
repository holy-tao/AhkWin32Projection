#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBattery.ahk
#Include .\IBatteryStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\Battery.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides information about a battery controller that is currently connected to the device. For more info, see [Get battery information](/previous-versions/windows/apps/dn895210(v=win.10)).
 * @remarks
 * In this context, *device* refers to the hardware that your app is running on. *Battery controller* refers to the electronics that interface between the physical battery and the operating system. A battery controller appears in Device Manager as a "Battery" under the **Batteries** node.
 * 
 * Depending on the device, it may be possible to remove the physical battery while the device remains running. For example, a laptop that's plugged into A/C power. In that case, if the battery controller were part of the laptop enclosure, you could potentially create a Battery object when no battery is connected to the device. However, if the battery controller resided on the physical battery, it would no longer be visible to the operating system and therefore you could not create a corresponding Battery object for an individual battery.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.power.battery
 * @namespace Windows.Devices.Power
 * @version WindowsRuntime 1.4
 */
class Battery extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBattery

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBattery.IID

    /**
     * Gets a [Battery](battery.md) object that represents all battery controllers connected to the device.
     * @remarks
     * When created with AggregateBattery, the [Battery](battery.md) object represents an aggregate of all battery controllers connected to the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.power.battery.aggregatebattery
     * @type {Battery} 
     */
    static AggregateBattery {
        get => Battery.get_AggregateBattery()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Battery} 
     */
    static get_AggregateBattery() {
        if (!Battery.HasProp("__IBatteryStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Power.Battery")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBatteryStatics.IID)
            Battery.__IBatteryStatics := IBatteryStatics(factoryPtr)
        }

        return Battery.__IBatteryStatics.get_AggregateBattery()
    }

    /**
     * Gets a [Battery](battery.md) object that represents an individual battery controller connected to the device.
     * @remarks
     * FromIdAsync will return null if the battery controller does not exist and the *deviceId* value is well-formed. If the *deviceId* value is not well-formed, such as "`AggregateBattery`," then the method will fail with `STATUS_OBJECT_NAME_INVALID`.
     * 
     * You can use a [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) object for a battery controller to use that object's [Id](../windows.devices.enumeration/deviceinformation_id.md) property value as the *deviceId* parameter in FromIdAsync to create a [Battery](battery.md) object
     * @param {HSTRING} deviceId The device ID of the battery controller ([DeviceId](battery_deviceid.md)).
     * @returns {IAsyncOperation<Battery>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.power.battery.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!Battery.HasProp("__IBatteryStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Power.Battery")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBatteryStatics.IID)
            Battery.__IBatteryStatics := IBatteryStatics(factoryPtr)
        }

        return Battery.__IBatteryStatics.FromIdAsync(deviceId)
    }

    /**
     * Gets an Advanced Query Syntax (AQS) string that can be used to find all battery controllers that are connected to the device.
     * @remarks
     * Use the AQS string returned by GetDeviceSelector with the [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) APIs to find all battery controllers that are connected to the device. See [FromIdAsync](battery_fromidasync_1322863552.md) for information on how to create a [Battery](battery.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.power.battery.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!Battery.HasProp("__IBatteryStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Power.Battery")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBatteryStatics.IID)
            Battery.__IBatteryStatics := IBatteryStatics(factoryPtr)
        }

        return Battery.__IBatteryStatics.GetDeviceSelector()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the identifier (ID) for an individual battery controller.
     * @remarks
     * When the [Battery](battery.md) object represents an individual battery controller, this property value can be used with the [FromIdAsync](battery_fromidasync_1322863552.md) method to re-create an object that represents the same battery controller (if it's still connected to the device). When the Battery object is an aggregate of battery controllers, this property is equal to "`AggregateBattery` ".
     * @see https://learn.microsoft.com/uwp/api/windows.devices.power.battery.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * <!--***in what increments does this change? Can it return a battery  aggregate?***-->
     * Occurs when the charge, capacity, or status of a battery changes.
     * @remarks
     * The ReportUpdated event is triggered by any change in status, charge rate, or power capacity on any of the batteries connected to the device. This typically happens immediately for status changes and periodically for all other changes.
     * @type {TypedEventHandler<Battery, IInspectable>}
    */
    OnReportUpdated {
        get {
            if(!this.HasProp("__OnReportUpdated")){
                this.__OnReportUpdated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4d4aa646-767f-5645-af5c-546464d3ec09}"),
                    Battery,
                    IInspectable
                )
                this.__OnReportUpdatedToken := this.add_ReportUpdated(this.__OnReportUpdated.iface)
            }
            return this.__OnReportUpdated
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnReportUpdatedToken")) {
            this.remove_ReportUpdated(this.__OnReportUpdatedToken)
            this.__OnReportUpdated.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IBattery")) {
            if ((queryResult := this.QueryInterface(IBattery.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBattery := IBattery(outPtr)
        }

        return this.__IBattery.get_DeviceId()
    }

    /**
     * Gets a [BatteryReport](batteryreport.md) object that indicates the charge, capacity, and status of the battery or aggregate.
     * @returns {BatteryReport} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.power.battery.getreport
     */
    GetReport() {
        if (!this.HasProp("__IBattery")) {
            if ((queryResult := this.QueryInterface(IBattery.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBattery := IBattery(outPtr)
        }

        return this.__IBattery.GetReport()
    }

    /**
     * 
     * @param {TypedEventHandler<Battery, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReportUpdated(handler) {
        if (!this.HasProp("__IBattery")) {
            if ((queryResult := this.QueryInterface(IBattery.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBattery := IBattery(outPtr)
        }

        return this.__IBattery.add_ReportUpdated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ReportUpdated(token) {
        if (!this.HasProp("__IBattery")) {
            if ((queryResult := this.QueryInterface(IBattery.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBattery := IBattery(outPtr)
        }

        return this.__IBattery.remove_ReportUpdated(token)
    }

;@endregion Instance Methods
}
