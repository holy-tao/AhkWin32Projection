#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPowerThermalChannelDataConsumer.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include .\IPowerThermalChannelDataConsumerFactory.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\PowerThermalChannelDataConsumer.ahk
#Include .\PowerThermalChannelDataReceivedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a consumer that receives power/thermal channel data and raises events when new data is available.
 * @remarks
 * When instantiated with an array of [PowerThermalChannelId](./powerthermalchannelid.md) values, the consumer claims exclusive ownership of the specified output channels; construction fails with HRESULT STG_E_INUSE if any requested channel IDs are already claimed.
 * 
 * The [ChannelDataReceived](./powerthermalchanneldataconsumer_channeldatareceived.md) event fires with batches of output channel data (approximately once per second). Handlers receive [PowerThermalChannelDataReceivedEventArgs](./powerthermalchanneldatareceivedeventargs.md) containing the samples.
 * @see https://learn.microsoft.com/uwp/api/windows.system.power.thermal.powerthermalchanneldataconsumer
 * @namespace Windows.System.Power.Thermal
 * @version WindowsRuntime 1.4
 */
class PowerThermalChannelDataConsumer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPowerThermalChannelDataConsumer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPowerThermalChannelDataConsumer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Integer} channelIds_length 
     * @param {Pointer<PowerThermalChannelId>} channelIds 
     * @returns {PowerThermalChannelDataConsumer} 
     */
    static CreateInstance(channelIds_length, channelIds) {
        if (!PowerThermalChannelDataConsumer.HasProp("__IPowerThermalChannelDataConsumerFactory")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.Thermal.PowerThermalChannelDataConsumer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPowerThermalChannelDataConsumerFactory.IID)
            PowerThermalChannelDataConsumer.__IPowerThermalChannelDataConsumerFactory := IPowerThermalChannelDataConsumerFactory(factoryPtr)
        }

        return PowerThermalChannelDataConsumer.__IPowerThermalChannelDataConsumerFactory.CreateInstance(channelIds_length, channelIds)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the backend status of the channel data consumer. Use this property to determine whether the consumer backend is started or stopped.
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.thermal.powerthermalchanneldataconsumer.backendstatus
     * @type {Integer} 
     */
    BackEndStatus {
        get => this.get_BackEndStatus()
    }

    /**
     * Raised when the channel data consumer receives new power/thermal channel samples; handlers receive event args containing the data.
     * @type {TypedEventHandler<PowerThermalChannelDataConsumer, PowerThermalChannelDataReceivedEventArgs>}
    */
    OnChannelDataReceived {
        get {
            if(!this.HasProp("__OnChannelDataReceived")){
                this.__OnChannelDataReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b59910ad-a826-5040-885b-c89fc0ad2cf3}"),
                    PowerThermalChannelDataConsumer,
                    PowerThermalChannelDataReceivedEventArgs
                )
                this.__OnChannelDataReceivedToken := this.add_ChannelDataReceived(this.__OnChannelDataReceived.iface)
            }
            return this.__OnChannelDataReceived
        }
    }

    /**
     * Raised when the backend status of a channel data consumer changes, for example when the backend starts or stops.
     * @type {TypedEventHandler<PowerThermalChannelDataConsumer, IInspectable>}
    */
    OnBackEndStatusChanged {
        get {
            if(!this.HasProp("__OnBackEndStatusChanged")){
                this.__OnBackEndStatusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{fb816e05-b649-5baf-bb41-c1a7051773f0}"),
                    PowerThermalChannelDataConsumer,
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
        if(this.HasProp("__OnChannelDataReceivedToken")) {
            this.remove_ChannelDataReceived(this.__OnChannelDataReceivedToken)
            this.__OnChannelDataReceived.iface.Dispose()
        }

        if(this.HasProp("__OnBackEndStatusChangedToken")) {
            this.remove_BackEndStatusChanged(this.__OnBackEndStatusChangedToken)
            this.__OnBackEndStatusChanged.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * Retrieves the identifiers of the channels available to this consumer.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} An array of [PowerThermalChannelId](./powerthermalchannelid.md) values representing available channels.
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.thermal.powerthermalchanneldataconsumer.getchannelids
     */
    GetChannelIds(result_) {
        if (!this.HasProp("__IPowerThermalChannelDataConsumer")) {
            if ((queryResult := this.QueryInterface(IPowerThermalChannelDataConsumer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPowerThermalChannelDataConsumer := IPowerThermalChannelDataConsumer(outPtr)
        }

        return this.__IPowerThermalChannelDataConsumer.GetChannelIds(result_)
    }

    /**
     * Returns the map of available channel identifiers to their configurations that the consumer can access.
     * @returns {IMapView<PowerThermalChannelId, PowerThermalChannelConfiguration>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.thermal.powerthermalchanneldataconsumer.getchannelconfigurations
     */
    GetChannelConfigurations() {
        if (!this.HasProp("__IPowerThermalChannelDataConsumer")) {
            if ((queryResult := this.QueryInterface(IPowerThermalChannelDataConsumer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPowerThermalChannelDataConsumer := IPowerThermalChannelDataConsumer(outPtr)
        }

        return this.__IPowerThermalChannelDataConsumer.GetChannelConfigurations()
    }

    /**
     * Starts the channel data consumer so it begins receiving data for its subscribed channels.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.thermal.powerthermalchanneldataconsumer.start
     */
    Start() {
        if (!this.HasProp("__IPowerThermalChannelDataConsumer")) {
            if ((queryResult := this.QueryInterface(IPowerThermalChannelDataConsumer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPowerThermalChannelDataConsumer := IPowerThermalChannelDataConsumer(outPtr)
        }

        return this.__IPowerThermalChannelDataConsumer.Start()
    }

    /**
     * Stops the channel data consumer from receiving channel data until restarted.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.thermal.powerthermalchanneldataconsumer.stop
     */
    Stop() {
        if (!this.HasProp("__IPowerThermalChannelDataConsumer")) {
            if ((queryResult := this.QueryInterface(IPowerThermalChannelDataConsumer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPowerThermalChannelDataConsumer := IPowerThermalChannelDataConsumer(outPtr)
        }

        return this.__IPowerThermalChannelDataConsumer.Stop()
    }

    /**
     * 
     * @param {TypedEventHandler<PowerThermalChannelDataConsumer, PowerThermalChannelDataReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ChannelDataReceived(handler) {
        if (!this.HasProp("__IPowerThermalChannelDataConsumer")) {
            if ((queryResult := this.QueryInterface(IPowerThermalChannelDataConsumer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPowerThermalChannelDataConsumer := IPowerThermalChannelDataConsumer(outPtr)
        }

        return this.__IPowerThermalChannelDataConsumer.add_ChannelDataReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ChannelDataReceived(token) {
        if (!this.HasProp("__IPowerThermalChannelDataConsumer")) {
            if ((queryResult := this.QueryInterface(IPowerThermalChannelDataConsumer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPowerThermalChannelDataConsumer := IPowerThermalChannelDataConsumer(outPtr)
        }

        return this.__IPowerThermalChannelDataConsumer.remove_ChannelDataReceived(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BackEndStatus() {
        if (!this.HasProp("__IPowerThermalChannelDataConsumer")) {
            if ((queryResult := this.QueryInterface(IPowerThermalChannelDataConsumer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPowerThermalChannelDataConsumer := IPowerThermalChannelDataConsumer(outPtr)
        }

        return this.__IPowerThermalChannelDataConsumer.get_BackEndStatus()
    }

    /**
     * 
     * @param {TypedEventHandler<PowerThermalChannelDataConsumer, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BackEndStatusChanged(handler) {
        if (!this.HasProp("__IPowerThermalChannelDataConsumer")) {
            if ((queryResult := this.QueryInterface(IPowerThermalChannelDataConsumer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPowerThermalChannelDataConsumer := IPowerThermalChannelDataConsumer(outPtr)
        }

        return this.__IPowerThermalChannelDataConsumer.add_BackEndStatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BackEndStatusChanged(token) {
        if (!this.HasProp("__IPowerThermalChannelDataConsumer")) {
            if ((queryResult := this.QueryInterface(IPowerThermalChannelDataConsumer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPowerThermalChannelDataConsumer := IPowerThermalChannelDataConsumer(outPtr)
        }

        return this.__IPowerThermalChannelDataConsumer.remove_BackEndStatusChanged(token)
    }

    /**
     * Closes the channel data consumer and releases any resources associated with it.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.thermal.powerthermalchanneldataconsumer.close
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
