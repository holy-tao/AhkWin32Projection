#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPowerThermalChannelDataProducer.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include .\IPowerThermalChannelDataProducerFactory.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\PowerThermalChannelDataProducer.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a producer that publishes power/thermal channel data to consumers.
 * @remarks
 * Constructing **PowerThermalChannelDataProducer** with an array of [PowerThermalChannelId](./powerthermalchannelid.md) claims exclusive ownership of the specified input channels. Construction fails with HRESULT STG_E_INUSE if any requested channel IDs are already claimed.
 * 
 * In a typical usage scenario, create a producer for the desired channel IDs, call [GetChannelConfigurations](./powerthermalchanneldataproducer_getchannelconfigurations_1473707459.md) to obtain per-channel configuration, then call [Start](./powerthermalchanneldataproducer_start_1587696324.md) and use [PublishInputChannelData](./powerthermalchanneldataproducer_publishinputchanneldata_1736334526.md) to supply samples. Producer instances are intended to be long‑lived.
 * 
 * Calling [PublishInputChannelData](./powerthermalchanneldataproducer_publishinputchanneldata_1736334526.md) for a disabled channel will re‑enable that channel; use [DisableChannel](./powerthermalchanneldataproducer_disablechannel_6125057.md) to prevent publishing until explicitly re‑enabled. Passing an invalid channel identifier to [PublishInputChannelData](./powerthermalchanneldataproducer_publishinputchanneldata_1736334526.md) results in HRESULT_INVALID_ARGUMENT.
 * 
 * The **BackEndStatus** property and **BackEndStatusChanged** event indicate whether the MPTF backend is **Started** or **Stopped**; clients should stop publishing while the backend is **Stopped**.
 * @see https://learn.microsoft.com/uwp/api/windows.system.power.thermal.powerthermalchanneldataproducer
 * @namespace Windows.System.Power.Thermal
 * @version WindowsRuntime 1.4
 */
class PowerThermalChannelDataProducer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPowerThermalChannelDataProducer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPowerThermalChannelDataProducer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Integer} channelIds_length 
     * @param {Pointer<PowerThermalChannelId>} channelIds 
     * @returns {PowerThermalChannelDataProducer} 
     */
    static CreateInstance(channelIds_length, channelIds) {
        if (!PowerThermalChannelDataProducer.HasProp("__IPowerThermalChannelDataProducerFactory")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.Thermal.PowerThermalChannelDataProducer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPowerThermalChannelDataProducerFactory.IID)
            PowerThermalChannelDataProducer.__IPowerThermalChannelDataProducerFactory := IPowerThermalChannelDataProducerFactory(factoryPtr)
        }

        return PowerThermalChannelDataProducer.__IPowerThermalChannelDataProducerFactory.CreateInstance(channelIds_length, channelIds)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the backend status of the channel data producer, indicating whether the producer backend is started or stopped.
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.thermal.powerthermalchanneldataproducer.backendstatus
     * @type {Integer} 
     */
    BackEndStatus {
        get => this.get_BackEndStatus()
    }

    /**
     * Raised when the backend status of a channel data producer changes, such as when the backend starts or stops.
     * @type {TypedEventHandler<PowerThermalChannelDataProducer, IInspectable>}
    */
    OnBackEndStatusChanged {
        get {
            if(!this.HasProp("__OnBackEndStatusChanged")){
                this.__OnBackEndStatusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{790afc3f-625e-52ac-8769-fbb5b0ba7386}"),
                    PowerThermalChannelDataProducer,
                    IInspectable
                )
                this.__OnBackEndStatusChangedToken := this.add_BackEndStatusChanged(this.__OnBackEndStatusChanged.iface)
            }
            return this.__OnBackEndStatusChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnBackEndStatusChangedToken")) {
            this.remove_BackEndStatusChanged(this.__OnBackEndStatusChangedToken)
            this.__OnBackEndStatusChanged.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * Retrieves the identifiers of channels the producer can publish to.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} An array of [PowerThermalChannelId](./powerthermalchannelid.md) values representing channels exposed by the producer.
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.thermal.powerthermalchanneldataproducer.getchannelids
     */
    GetChannelIds(result_) {
        if (!this.HasProp("__IPowerThermalChannelDataProducer")) {
            if ((queryResult := this.QueryInterface(IPowerThermalChannelDataProducer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPowerThermalChannelDataProducer := IPowerThermalChannelDataProducer(outPtr)
        }

        return this.__IPowerThermalChannelDataProducer.GetChannelIds(result_)
    }

    /**
     * Returns the set of channel configurations the producer supports or exposes.
     * @returns {IMapView<PowerThermalChannelId, PowerThermalChannelConfiguration>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.thermal.powerthermalchanneldataproducer.getchannelconfigurations
     */
    GetChannelConfigurations() {
        if (!this.HasProp("__IPowerThermalChannelDataProducer")) {
            if ((queryResult := this.QueryInterface(IPowerThermalChannelDataProducer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPowerThermalChannelDataProducer := IPowerThermalChannelDataProducer(outPtr)
        }

        return this.__IPowerThermalChannelDataProducer.GetChannelConfigurations()
    }

    /**
     * Disables the specified input channel so its value is not used by power/thermal algorithms that depend on it
     * @param {PowerThermalChannelId} channelId The PowerThermalChannelId of the channel to disable.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.thermal.powerthermalchanneldataproducer.disablechannel
     */
    DisableChannel(channelId) {
        if (!this.HasProp("__IPowerThermalChannelDataProducer")) {
            if ((queryResult := this.QueryInterface(IPowerThermalChannelDataProducer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPowerThermalChannelDataProducer := IPowerThermalChannelDataProducer(outPtr)
        }

        return this.__IPowerThermalChannelDataProducer.DisableChannel(channelId)
    }

    /**
     * Starts the producer so it begins accepting and publishing channel data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.thermal.powerthermalchanneldataproducer.start
     */
    Start() {
        if (!this.HasProp("__IPowerThermalChannelDataProducer")) {
            if ((queryResult := this.QueryInterface(IPowerThermalChannelDataProducer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPowerThermalChannelDataProducer := IPowerThermalChannelDataProducer(outPtr)
        }

        return this.__IPowerThermalChannelDataProducer.Start()
    }

    /**
     * Stops the producer from publishing channel data until it is started again.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.thermal.powerthermalchanneldataproducer.stop
     */
    Stop() {
        if (!this.HasProp("__IPowerThermalChannelDataProducer")) {
            if ((queryResult := this.QueryInterface(IPowerThermalChannelDataProducer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPowerThermalChannelDataProducer := IPowerThermalChannelDataProducer(outPtr)
        }

        return this.__IPowerThermalChannelDataProducer.Stop()
    }

    /**
     * Publishes one or more channel data samples to the producer's configured channels.
     * @remarks
     * **PublishInputChannelData** publishes values to configured channels; calling it for a disabled channel will re-enable that channel. Passing an invalid channel ID results in HRESULT_INVALID_ARGUMENT.
     * @param {Integer} data_length 
     * @param {Pointer<PowerThermalChannelData>} data An array of [PowerThermalChannelData](./powerthermalchanneldata.md) structures containing the samples to publish.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.thermal.powerthermalchanneldataproducer.publishinputchanneldata
     */
    PublishInputChannelData(data_length, data) {
        if (!this.HasProp("__IPowerThermalChannelDataProducer")) {
            if ((queryResult := this.QueryInterface(IPowerThermalChannelDataProducer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPowerThermalChannelDataProducer := IPowerThermalChannelDataProducer(outPtr)
        }

        return this.__IPowerThermalChannelDataProducer.PublishInputChannelData(data_length, data)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BackEndStatus() {
        if (!this.HasProp("__IPowerThermalChannelDataProducer")) {
            if ((queryResult := this.QueryInterface(IPowerThermalChannelDataProducer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPowerThermalChannelDataProducer := IPowerThermalChannelDataProducer(outPtr)
        }

        return this.__IPowerThermalChannelDataProducer.get_BackEndStatus()
    }

    /**
     * 
     * @param {TypedEventHandler<PowerThermalChannelDataProducer, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BackEndStatusChanged(handler) {
        if (!this.HasProp("__IPowerThermalChannelDataProducer")) {
            if ((queryResult := this.QueryInterface(IPowerThermalChannelDataProducer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPowerThermalChannelDataProducer := IPowerThermalChannelDataProducer(outPtr)
        }

        return this.__IPowerThermalChannelDataProducer.add_BackEndStatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BackEndStatusChanged(token) {
        if (!this.HasProp("__IPowerThermalChannelDataProducer")) {
            if ((queryResult := this.QueryInterface(IPowerThermalChannelDataProducer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPowerThermalChannelDataProducer := IPowerThermalChannelDataProducer(outPtr)
        }

        return this.__IPowerThermalChannelDataProducer.remove_BackEndStatusChanged(token)
    }

    /**
     * Closes the channel data producer and releases any resources it holds.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.thermal.powerthermalchanneldataproducer.close
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
