#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattServiceProviderAdvertisingParameters.ahk
#Include .\IGattServiceProviderAdvertisingParameters2.ahk
#Include .\IGattServiceProviderAdvertisingParameters3.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * This class is used to define a GATT service advertisement parameters.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceprovideradvertisingparameters
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattServiceProviderAdvertisingParameters extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattServiceProviderAdvertisingParameters

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattServiceProviderAdvertisingParameters.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a boolean that indicates if the GATT service is connectable.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceprovideradvertisingparameters.isconnectable
     * @type {Boolean} 
     */
    IsConnectable {
        get => this.get_IsConnectable()
        set => this.put_IsConnectable(value)
    }

    /**
     * Gets or sets a boolean indicating that the GATT service is discoverable.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceprovideradvertisingparameters.isdiscoverable
     * @type {Boolean} 
     */
    IsDiscoverable {
        get => this.get_IsDiscoverable()
        set => this.put_IsDiscoverable(value)
    }

    /**
     * For [Bluetooth Low Energy](/windows/uwp/devices-sensors/bluetooth-low-energy-overview), this parameter adds an additional **ServiceData** section to the advertisement payload for the service's [service UUID](/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceuuids) if space is available. If the service data is added to the advertisement, then the service UUID will also be included in the same section in the advertisement.
     * @remarks
     * The maximum size of the **ServiceData** section depends on the availability on the platform. But if the platform supports extended advertisement, and that's what's being requested, then the maximum theoretical size will be much larger. The actual value might be less than the theoretical value, depending on what's being shared on the system. The [GattServiceProviderAdvertisementStatus.StartedWithoutAllAdvertisementData](/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceprovideradvertisementstatus) status indicates that the system was successfully able to issue the advertisement request, but not all of the requested data could be included in the advertisement.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceprovideradvertisingparameters.servicedata
     * @type {IBuffer} 
     */
    ServiceData {
        get => this.get_ServiceData()
        set => this.put_ServiceData(value)
    }

    /**
     * @type {Boolean} 
     */
    UseLowEnergyUncoded1MPhyAsSecondaryPhy {
        get => this.get_UseLowEnergyUncoded1MPhyAsSecondaryPhy()
        set => this.put_UseLowEnergyUncoded1MPhyAsSecondaryPhy(value)
    }

    /**
     * @type {Boolean} 
     */
    UseLowEnergyUncoded2MPhyAsSecondaryPhy {
        get => this.get_UseLowEnergyUncoded2MPhyAsSecondaryPhy()
        set => this.put_UseLowEnergyUncoded2MPhyAsSecondaryPhy(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new GattServiceProviderAdvertisingParameters object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceProviderAdvertisingParameters")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsConnectable(value) {
        if (!this.HasProp("__IGattServiceProviderAdvertisingParameters")) {
            if ((queryResult := this.QueryInterface(IGattServiceProviderAdvertisingParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProviderAdvertisingParameters := IGattServiceProviderAdvertisingParameters(outPtr)
        }

        return this.__IGattServiceProviderAdvertisingParameters.put_IsConnectable(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsConnectable() {
        if (!this.HasProp("__IGattServiceProviderAdvertisingParameters")) {
            if ((queryResult := this.QueryInterface(IGattServiceProviderAdvertisingParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProviderAdvertisingParameters := IGattServiceProviderAdvertisingParameters(outPtr)
        }

        return this.__IGattServiceProviderAdvertisingParameters.get_IsConnectable()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDiscoverable(value) {
        if (!this.HasProp("__IGattServiceProviderAdvertisingParameters")) {
            if ((queryResult := this.QueryInterface(IGattServiceProviderAdvertisingParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProviderAdvertisingParameters := IGattServiceProviderAdvertisingParameters(outPtr)
        }

        return this.__IGattServiceProviderAdvertisingParameters.put_IsDiscoverable(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDiscoverable() {
        if (!this.HasProp("__IGattServiceProviderAdvertisingParameters")) {
            if ((queryResult := this.QueryInterface(IGattServiceProviderAdvertisingParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProviderAdvertisingParameters := IGattServiceProviderAdvertisingParameters(outPtr)
        }

        return this.__IGattServiceProviderAdvertisingParameters.get_IsDiscoverable()
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_ServiceData(value) {
        if (!this.HasProp("__IGattServiceProviderAdvertisingParameters2")) {
            if ((queryResult := this.QueryInterface(IGattServiceProviderAdvertisingParameters2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProviderAdvertisingParameters2 := IGattServiceProviderAdvertisingParameters2(outPtr)
        }

        return this.__IGattServiceProviderAdvertisingParameters2.put_ServiceData(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_ServiceData() {
        if (!this.HasProp("__IGattServiceProviderAdvertisingParameters2")) {
            if ((queryResult := this.QueryInterface(IGattServiceProviderAdvertisingParameters2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProviderAdvertisingParameters2 := IGattServiceProviderAdvertisingParameters2(outPtr)
        }

        return this.__IGattServiceProviderAdvertisingParameters2.get_ServiceData()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UseLowEnergyUncoded1MPhyAsSecondaryPhy() {
        if (!this.HasProp("__IGattServiceProviderAdvertisingParameters3")) {
            if ((queryResult := this.QueryInterface(IGattServiceProviderAdvertisingParameters3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProviderAdvertisingParameters3 := IGattServiceProviderAdvertisingParameters3(outPtr)
        }

        return this.__IGattServiceProviderAdvertisingParameters3.get_UseLowEnergyUncoded1MPhyAsSecondaryPhy()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_UseLowEnergyUncoded1MPhyAsSecondaryPhy(value) {
        if (!this.HasProp("__IGattServiceProviderAdvertisingParameters3")) {
            if ((queryResult := this.QueryInterface(IGattServiceProviderAdvertisingParameters3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProviderAdvertisingParameters3 := IGattServiceProviderAdvertisingParameters3(outPtr)
        }

        return this.__IGattServiceProviderAdvertisingParameters3.put_UseLowEnergyUncoded1MPhyAsSecondaryPhy(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UseLowEnergyUncoded2MPhyAsSecondaryPhy() {
        if (!this.HasProp("__IGattServiceProviderAdvertisingParameters3")) {
            if ((queryResult := this.QueryInterface(IGattServiceProviderAdvertisingParameters3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProviderAdvertisingParameters3 := IGattServiceProviderAdvertisingParameters3(outPtr)
        }

        return this.__IGattServiceProviderAdvertisingParameters3.get_UseLowEnergyUncoded2MPhyAsSecondaryPhy()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_UseLowEnergyUncoded2MPhyAsSecondaryPhy(value) {
        if (!this.HasProp("__IGattServiceProviderAdvertisingParameters3")) {
            if ((queryResult := this.QueryInterface(IGattServiceProviderAdvertisingParameters3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProviderAdvertisingParameters3 := IGattServiceProviderAdvertisingParameters3(outPtr)
        }

        return this.__IGattServiceProviderAdvertisingParameters3.put_UseLowEnergyUncoded2MPhyAsSecondaryPhy(value)
    }

;@endregion Instance Methods
}
