#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILineDisplay.ahk
#Include .\ILineDisplay2.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\ILineDisplayStatics.ahk
#Include .\ILineDisplayStatics2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a line display device.
 * @remarks
 * This object is created when a [GetDefaultAsync](linedisplay_getdefaultasync_1549573963.md) or [FromIdAsync](linedisplay_fromidasync_1322863552.md) method completes.
 * 
 * See the [line display sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/LineDisplay) for an example implementation.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplay
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class LineDisplay extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILineDisplay

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILineDisplay.IID

    /**
     * Gets the standard UnifiedPOS statistics category selector strings.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplay.statisticscategoryselector
     * @type {LineDisplayStatisticsCategorySelector} 
     */
    static StatisticsCategorySelector {
        get => LineDisplay.get_StatisticsCategorySelector()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [LineDisplay](linedisplay.md) object from the [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md).
     * @param {HSTRING} deviceId The [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md) that identifies a specific line display, which can be retrieved from the [DeviceId](barcodescanner_deviceid.md) property.
     * @returns {IAsyncOperation<LineDisplay>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplay.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!LineDisplay.HasProp("__ILineDisplayStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.LineDisplay")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILineDisplayStatics.IID)
            LineDisplay.__ILineDisplayStatics := ILineDisplayStatics(factoryPtr)
        }

        return LineDisplay.__ILineDisplayStatics.FromIdAsync(deviceId)
    }

    /**
     * Returns the first available line display.
     * @returns {IAsyncOperation<LineDisplay>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplay.getdefaultasync
     */
    static GetDefaultAsync() {
        if (!LineDisplay.HasProp("__ILineDisplayStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.LineDisplay")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILineDisplayStatics.IID)
            LineDisplay.__ILineDisplayStatics := ILineDisplayStatics(factoryPtr)
        }

        return LineDisplay.__ILineDisplayStatics.GetDefaultAsync()
    }

    /**
     * Gets an Advanced Query Syntax (AQS) string that you can use to list the line displays available over the specified connection types
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplay.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!LineDisplay.HasProp("__ILineDisplayStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.LineDisplay")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILineDisplayStatics.IID)
            LineDisplay.__ILineDisplayStatics := ILineDisplayStatics(factoryPtr)
        }

        return LineDisplay.__ILineDisplayStatics.GetDeviceSelector()
    }

    /**
     * Gets an Advanced Query Syntax (AQS) string that you can use to list the available line displays.
     * @param {Integer} connectionTypes 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplay.getdeviceselector
     */
    static GetDeviceSelectorWithConnectionTypes(connectionTypes) {
        if (!LineDisplay.HasProp("__ILineDisplayStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.LineDisplay")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILineDisplayStatics.IID)
            LineDisplay.__ILineDisplayStatics := ILineDisplayStatics(factoryPtr)
        }

        return LineDisplay.__ILineDisplayStatics.GetDeviceSelectorWithConnectionTypes(connectionTypes)
    }

    /**
     * 
     * @returns {LineDisplayStatisticsCategorySelector} 
     */
    static get_StatisticsCategorySelector() {
        if (!LineDisplay.HasProp("__ILineDisplayStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.LineDisplay")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILineDisplayStatics2.IID)
            LineDisplay.__ILineDisplayStatics2 := ILineDisplayStatics2(factoryPtr)
        }

        return LineDisplay.__ILineDisplayStatics2.get_StatisticsCategorySelector()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md) of the line display.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplay.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the capabilities of the specified line display.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplay.capabilities
     * @type {LineDisplayCapabilities} 
     */
    Capabilities {
        get => this.get_Capabilities()
    }

    /**
     * Gets the physical device name.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplay.physicaldevicename
     * @type {HSTRING} 
     */
    PhysicalDeviceName {
        get => this.get_PhysicalDeviceName()
    }

    /**
     * Gets the physical device description.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplay.physicaldevicedescription
     * @type {HSTRING} 
     */
    PhysicalDeviceDescription {
        get => this.get_PhysicalDeviceDescription()
    }

    /**
     * Gets the device control description of the line display.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplay.devicecontroldescription
     * @type {HSTRING} 
     */
    DeviceControlDescription {
        get => this.get_DeviceControlDescription()
    }

    /**
     * Gets the device control version number of the line display.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplay.devicecontrolversion
     * @type {HSTRING} 
     */
    DeviceControlVersion {
        get => this.get_DeviceControlVersion()
    }

    /**
     * Gets the service version number of the line display.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplay.deviceserviceversion
     * @type {HSTRING} 
     */
    DeviceServiceVersion {
        get => this.get_DeviceServiceVersion()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__ILineDisplay")) {
            if ((queryResult := this.QueryInterface(ILineDisplay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplay := ILineDisplay(outPtr)
        }

        return this.__ILineDisplay.get_DeviceId()
    }

    /**
     * 
     * @returns {LineDisplayCapabilities} 
     */
    get_Capabilities() {
        if (!this.HasProp("__ILineDisplay")) {
            if ((queryResult := this.QueryInterface(ILineDisplay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplay := ILineDisplay(outPtr)
        }

        return this.__ILineDisplay.get_Capabilities()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PhysicalDeviceName() {
        if (!this.HasProp("__ILineDisplay")) {
            if ((queryResult := this.QueryInterface(ILineDisplay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplay := ILineDisplay(outPtr)
        }

        return this.__ILineDisplay.get_PhysicalDeviceName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PhysicalDeviceDescription() {
        if (!this.HasProp("__ILineDisplay")) {
            if ((queryResult := this.QueryInterface(ILineDisplay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplay := ILineDisplay(outPtr)
        }

        return this.__ILineDisplay.get_PhysicalDeviceDescription()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceControlDescription() {
        if (!this.HasProp("__ILineDisplay")) {
            if ((queryResult := this.QueryInterface(ILineDisplay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplay := ILineDisplay(outPtr)
        }

        return this.__ILineDisplay.get_DeviceControlDescription()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceControlVersion() {
        if (!this.HasProp("__ILineDisplay")) {
            if ((queryResult := this.QueryInterface(ILineDisplay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplay := ILineDisplay(outPtr)
        }

        return this.__ILineDisplay.get_DeviceControlVersion()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceServiceVersion() {
        if (!this.HasProp("__ILineDisplay")) {
            if ((queryResult := this.QueryInterface(ILineDisplay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplay := ILineDisplay(outPtr)
        }

        return this.__ILineDisplay.get_DeviceServiceVersion()
    }

    /**
     * Attempts to gain exclusive access to the line display.
     * @returns {IAsyncOperation<ClaimedLineDisplay>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplay.claimasync
     */
    ClaimAsync() {
        if (!this.HasProp("__ILineDisplay")) {
            if ((queryResult := this.QueryInterface(ILineDisplay.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplay := ILineDisplay(outPtr)
        }

        return this.__ILineDisplay.ClaimAsync()
    }

    /**
     * Gets the current power status of the device.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplay.checkpowerstatusasync
     */
    CheckPowerStatusAsync() {
        if (!this.HasProp("__ILineDisplay2")) {
            if ((queryResult := this.QueryInterface(ILineDisplay2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplay2 := ILineDisplay2(outPtr)
        }

        return this.__ILineDisplay2.CheckPowerStatusAsync()
    }

    /**
     * Close the line display session, allowing it to be claimed by another client. For C++ and JavaScript, use Close(). For C# and Visual Basic, use Dispose().
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplay.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
