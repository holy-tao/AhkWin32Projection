#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IXboxLiveQualityOfServiceMeasurement.ahk
#Include .\IXboxLiveQualityOfServiceMeasurementStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Describes the operating parameters of a network Quality of Service (QoS) measurement, and provides access to the results of such measurements.
  * 
  * > [!IMPORTANT]
  * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofservicemeasurement
 * @namespace Windows.Networking.XboxLive
 * @version WindowsRuntime 1.4
 */
class XboxLiveQualityOfServiceMeasurement extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IXboxLiveQualityOfServiceMeasurement

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IXboxLiveQualityOfServiceMeasurement.IID

    /**
     * Static property that gets or sets the maximum number of simultaneous measurement probe connections.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofservicemeasurement.maxsimultaneousprobeconnections
     * @type {Integer} 
     */
    static MaxSimultaneousProbeConnections {
        get => XboxLiveQualityOfServiceMeasurement.get_MaxSimultaneousProbeConnections()
        set => XboxLiveQualityOfServiceMeasurement.put_MaxSimultaneousProbeConnections(value)
    }

    /**
     * Gets or sets a Boolean value configuring whether Quality of Service (QoS) measurements and other **Windows.Networking.XboxLive** internal network operations attempt to constrain their outbound bandwidth consumption. Constraining consumption in this way reduces the impact of those operations on your app's outgoing bandwidth usage, at the expense of longer delays or increased failure rates for them.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofservicemeasurement.issystemoutboundbandwidthconstrained
     * @type {Boolean} 
     */
    static IsSystemOutboundBandwidthConstrained {
        get => XboxLiveQualityOfServiceMeasurement.get_IsSystemOutboundBandwidthConstrained()
        set => XboxLiveQualityOfServiceMeasurement.put_IsSystemOutboundBandwidthConstrained(value)
    }

    /**
     * Gets or sets a Boolean value that configures whether Quality of Service (QoS) measurements and other **Windows.Networking.XboxLive** internal network operations attempt to constrain their inbound bandwidth consumption. Constraining consumption in this way reduces the impact of those operations on your app's inbound bandwidth usage, at the expense of longer delays or increased failure rates for them.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofservicemeasurement.issysteminboundbandwidthconstrained
     * @type {Boolean} 
     */
    static IsSystemInboundBandwidthConstrained {
        get => XboxLiveQualityOfServiceMeasurement.get_IsSystemInboundBandwidthConstrained()
        set => XboxLiveQualityOfServiceMeasurement.put_IsSystemInboundBandwidthConstrained(value)
    }

    /**
     * Gets or sets the private payload published for the local device.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @remarks
     * The buffer is not permitted to exceed **MaxPrivatePayloadSize**, in Bytes.
     * 
     * The private payload is used by your app to pass app-specific state about the currently running game without creating an **XboxLiveEndpointPair**. An example could be: number of slots available in game, or time left in the current round. 
     * 
     * Private payload data bytes aren't interpreted or validated by **XboxLiveQualityOfServiceMeasurement** objects. They are transmitted as-is. As with all messages exchanged with remote devices over the network, apps should be mindful that the remote device publishing or receiving the private payload might not be running the same version of the app that's running locally. Consider using a versioning scheme, and always check that a payload is well-formed before acting on it.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofservicemeasurement.publishedprivatepayload
     * @type {IBuffer} 
     */
    static PublishedPrivatePayload {
        get => XboxLiveQualityOfServiceMeasurement.get_PublishedPrivatePayload()
        set => XboxLiveQualityOfServiceMeasurement.put_PublishedPrivatePayload(value)
    }

    /**
     * Static property that gets the maximum number of bytes permitted for private payload buffers.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @remarks
     * This value is constant, and never changes.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofservicemeasurement.maxprivatepayloadsize
     * @type {Integer} 
     */
    static MaxPrivatePayloadSize {
        get => XboxLiveQualityOfServiceMeasurement.get_MaxPrivatePayloadSize()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Sets the private payload that's returned when a remote host queries for the private payload.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @remarks
     * The private payload data being published is used by your app to pass app-specific state about the currently running game without creating an **XboxLiveEndpointPair**. Examples could be: number of slots available in game, or time left in the current round. 
     * 
     * Private payload data bytes aren't interpreted or validated by **XboxLiveQualityOfServiceMeasurement** objects. They are transmitted as-is. As with all messages exchanged with remote devices over the network, apps should be mindful that the remote device publishing or receiving the private payload might not be running the same version of the app that is running locally. Consider using a versioning scheme, and always check that a payload is well-formed before acting on it.
     * @param {Integer} payload_length 
     * @param {Pointer<Integer>} payload The payload to publish when this host is queried for the private payload. The **MaxPrivatePayloadSize** property value specifies the maximum permitted size of the private payload, in bytes.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofservicemeasurement.publishprivatepayloadbytes
     */
    static PublishPrivatePayloadBytes(payload_length, payload) {
        if (!XboxLiveQualityOfServiceMeasurement.HasProp("__IXboxLiveQualityOfServiceMeasurementStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXboxLiveQualityOfServiceMeasurementStatics.IID)
            XboxLiveQualityOfServiceMeasurement.__IXboxLiveQualityOfServiceMeasurementStatics := IXboxLiveQualityOfServiceMeasurementStatics(factoryPtr)
        }

        return XboxLiveQualityOfServiceMeasurement.__IXboxLiveQualityOfServiceMeasurementStatics.PublishPrivatePayloadBytes(payload_length, payload)
    }

    /**
     * Clears the private payload established with **PublishPrivatePayloadBytes**.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofservicemeasurement.clearprivatepayload
     */
    static ClearPrivatePayload() {
        if (!XboxLiveQualityOfServiceMeasurement.HasProp("__IXboxLiveQualityOfServiceMeasurementStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXboxLiveQualityOfServiceMeasurementStatics.IID)
            XboxLiveQualityOfServiceMeasurement.__IXboxLiveQualityOfServiceMeasurementStatics := IXboxLiveQualityOfServiceMeasurementStatics(factoryPtr)
        }

        return XboxLiveQualityOfServiceMeasurement.__IXboxLiveQualityOfServiceMeasurementStatics.ClearPrivatePayload()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MaxSimultaneousProbeConnections() {
        if (!XboxLiveQualityOfServiceMeasurement.HasProp("__IXboxLiveQualityOfServiceMeasurementStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXboxLiveQualityOfServiceMeasurementStatics.IID)
            XboxLiveQualityOfServiceMeasurement.__IXboxLiveQualityOfServiceMeasurementStatics := IXboxLiveQualityOfServiceMeasurementStatics(factoryPtr)
        }

        return XboxLiveQualityOfServiceMeasurement.__IXboxLiveQualityOfServiceMeasurementStatics.get_MaxSimultaneousProbeConnections()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    static put_MaxSimultaneousProbeConnections(value) {
        if (!XboxLiveQualityOfServiceMeasurement.HasProp("__IXboxLiveQualityOfServiceMeasurementStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXboxLiveQualityOfServiceMeasurementStatics.IID)
            XboxLiveQualityOfServiceMeasurement.__IXboxLiveQualityOfServiceMeasurementStatics := IXboxLiveQualityOfServiceMeasurementStatics(factoryPtr)
        }

        return XboxLiveQualityOfServiceMeasurement.__IXboxLiveQualityOfServiceMeasurementStatics.put_MaxSimultaneousProbeConnections(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsSystemOutboundBandwidthConstrained() {
        if (!XboxLiveQualityOfServiceMeasurement.HasProp("__IXboxLiveQualityOfServiceMeasurementStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXboxLiveQualityOfServiceMeasurementStatics.IID)
            XboxLiveQualityOfServiceMeasurement.__IXboxLiveQualityOfServiceMeasurementStatics := IXboxLiveQualityOfServiceMeasurementStatics(factoryPtr)
        }

        return XboxLiveQualityOfServiceMeasurement.__IXboxLiveQualityOfServiceMeasurementStatics.get_IsSystemOutboundBandwidthConstrained()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    static put_IsSystemOutboundBandwidthConstrained(value) {
        if (!XboxLiveQualityOfServiceMeasurement.HasProp("__IXboxLiveQualityOfServiceMeasurementStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXboxLiveQualityOfServiceMeasurementStatics.IID)
            XboxLiveQualityOfServiceMeasurement.__IXboxLiveQualityOfServiceMeasurementStatics := IXboxLiveQualityOfServiceMeasurementStatics(factoryPtr)
        }

        return XboxLiveQualityOfServiceMeasurement.__IXboxLiveQualityOfServiceMeasurementStatics.put_IsSystemOutboundBandwidthConstrained(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsSystemInboundBandwidthConstrained() {
        if (!XboxLiveQualityOfServiceMeasurement.HasProp("__IXboxLiveQualityOfServiceMeasurementStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXboxLiveQualityOfServiceMeasurementStatics.IID)
            XboxLiveQualityOfServiceMeasurement.__IXboxLiveQualityOfServiceMeasurementStatics := IXboxLiveQualityOfServiceMeasurementStatics(factoryPtr)
        }

        return XboxLiveQualityOfServiceMeasurement.__IXboxLiveQualityOfServiceMeasurementStatics.get_IsSystemInboundBandwidthConstrained()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    static put_IsSystemInboundBandwidthConstrained(value) {
        if (!XboxLiveQualityOfServiceMeasurement.HasProp("__IXboxLiveQualityOfServiceMeasurementStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXboxLiveQualityOfServiceMeasurementStatics.IID)
            XboxLiveQualityOfServiceMeasurement.__IXboxLiveQualityOfServiceMeasurementStatics := IXboxLiveQualityOfServiceMeasurementStatics(factoryPtr)
        }

        return XboxLiveQualityOfServiceMeasurement.__IXboxLiveQualityOfServiceMeasurementStatics.put_IsSystemInboundBandwidthConstrained(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    static get_PublishedPrivatePayload() {
        if (!XboxLiveQualityOfServiceMeasurement.HasProp("__IXboxLiveQualityOfServiceMeasurementStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXboxLiveQualityOfServiceMeasurementStatics.IID)
            XboxLiveQualityOfServiceMeasurement.__IXboxLiveQualityOfServiceMeasurementStatics := IXboxLiveQualityOfServiceMeasurementStatics(factoryPtr)
        }

        return XboxLiveQualityOfServiceMeasurement.__IXboxLiveQualityOfServiceMeasurementStatics.get_PublishedPrivatePayload()
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    static put_PublishedPrivatePayload(value) {
        if (!XboxLiveQualityOfServiceMeasurement.HasProp("__IXboxLiveQualityOfServiceMeasurementStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXboxLiveQualityOfServiceMeasurementStatics.IID)
            XboxLiveQualityOfServiceMeasurement.__IXboxLiveQualityOfServiceMeasurementStatics := IXboxLiveQualityOfServiceMeasurementStatics(factoryPtr)
        }

        return XboxLiveQualityOfServiceMeasurement.__IXboxLiveQualityOfServiceMeasurementStatics.put_PublishedPrivatePayload(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MaxPrivatePayloadSize() {
        if (!XboxLiveQualityOfServiceMeasurement.HasProp("__IXboxLiveQualityOfServiceMeasurementStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXboxLiveQualityOfServiceMeasurementStatics.IID)
            XboxLiveQualityOfServiceMeasurement.__IXboxLiveQualityOfServiceMeasurementStatics := IXboxLiveQualityOfServiceMeasurementStatics(factoryPtr)
        }

        return XboxLiveQualityOfServiceMeasurement.__IXboxLiveQualityOfServiceMeasurementStatics.get_MaxPrivatePayloadSize()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the list of the metrics to be measured in this Quality of Service (QoS) measurement. You can modify the list using **IVector** interface methods.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofservicemeasurement.metrics
     * @type {IVector<Integer>} 
     */
    Metrics {
        get => this.get_Metrics()
    }

    /**
     * Gets the list of addresses to probe. The contents of the list can be changed using **IVector** interface methods. 
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofservicemeasurement.deviceaddresses
     * @type {IVector<XboxLiveDeviceAddress>} 
     */
    DeviceAddresses {
        get => this.get_DeviceAddresses()
    }

    /**
     * Gets or sets a Boolean value indicating whether private payloads should be retrieved from the devices involved in this Quality of Service (QoS) measurement.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofservicemeasurement.shouldrequestprivatepayloads
     * @type {Boolean} 
     */
    ShouldRequestPrivatePayloads {
        get => this.get_ShouldRequestPrivatePayloads()
        set => this.put_ShouldRequestPrivatePayloads(value)
    }

    /**
     * Gets or sets the timeout for this Quality of Service (QoS) measurement.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofservicemeasurement.timeoutinmilliseconds
     * @type {Integer} 
     */
    TimeoutInMilliseconds {
        get => this.get_TimeoutInMilliseconds()
        set => this.put_TimeoutInMilliseconds(value)
    }

    /**
     * Gets or sets the number of probes to attempt to each device while performing this Quality of Service (QoS) measurement.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofservicemeasurement.numberofprobestoattempt
     * @type {Integer} 
     */
    NumberOfProbesToAttempt {
        get => this.get_NumberOfProbesToAttempt()
        set => this.put_NumberOfProbesToAttempt(value)
    }

    /**
     * Gets the number of pending results for the current Quality of Service (QoS) measurement while it is in progress. It is 0 if the measurement action has completed.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofservicemeasurement.numberofresultspending
     * @type {Integer} 
     */
    NumberOfResultsPending {
        get => this.get_NumberOfResultsPending()
    }

    /**
     * Gets a list of all metrics for all devices specified in the current Quality of Service (QoS) measurement.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @remarks
     * A list of QoS metric results.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofservicemeasurement.metricresults
     * @type {IVectorView<XboxLiveQualityOfServiceMetricResult>} 
     */
    MetricResults {
        get => this.get_MetricResults()
    }

    /**
     * Gets a list of private payloads that have been retrieved in this Quality of Service (QoS) measurement.
     * 
     * Note that private payloads are retrieved only when the **ShouldRequestPrivatePayloads** property is set to `true` before **MeasureAsync** is called.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofservicemeasurement.privatepayloadresults
     * @type {IVectorView<XboxLiveQualityOfServicePrivatePayloadResult>} 
     */
    PrivatePayloadResults {
        get => this.get_PrivatePayloadResults()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an **XboxLiveQualityOfServiceMeasurement** object.
     * 
     * To perform a Quality of Service (QoS) measurement, create an instance of this class, then set the parameters of the measurement using the **DeviceAddresses**, **Metrics**, **NumberOfProbesToAttempt**, **ShouldRequestPrivatePayloads**, and **TimeoutInMilliseconds** members. Then call **MeasureAsync** to initiate measurements. You can query results while the measurement is in progress, or you can wait until the operation finishes, and then query final results.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Networking.XboxLive.XboxLiveQualityOfServiceMeasurement")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Initiates Quality of Service (QoS) measurements as specified by the properties of this instance. 
     * 
     * Your code can retrieve current measurement results as soon as this method has been called, before all measurements have been completed. The metrics you retrieve can change at any time as long as a measurement is still in progress.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofservicemeasurement.measureasync
     */
    MeasureAsync() {
        if (!this.HasProp("__IXboxLiveQualityOfServiceMeasurement")) {
            if ((queryResult := this.QueryInterface(IXboxLiveQualityOfServiceMeasurement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveQualityOfServiceMeasurement := IXboxLiveQualityOfServiceMeasurement(outPtr)
        }

        return this.__IXboxLiveQualityOfServiceMeasurement.MeasureAsync()
    }

    /**
     * Gets all metric results for a given device.
     * 
     * Your code specifies a set of metrics, device addresses, timeouts, and number of probes to attempt, and then calls **XboxLiveQualityOfServiceMeasurement.MeasureAsync** to begin making the specified measurements. You can call **GetMetricResultsForDevice** at any time while measurements are in progress or after they have finished, and retrieve current values. Note that if you repeatedly call **GetMetricResultsForDevice**, and inspect a given metric while the relevant measurements are in progress, you might get different values as the measurement proceeds.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @param {XboxLiveDeviceAddress} deviceAddress The address of the device.
     * @returns {IVectorView<XboxLiveQualityOfServiceMetricResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofservicemeasurement.getmetricresultsfordevice
     */
    GetMetricResultsForDevice(deviceAddress) {
        if (!this.HasProp("__IXboxLiveQualityOfServiceMeasurement")) {
            if ((queryResult := this.QueryInterface(IXboxLiveQualityOfServiceMeasurement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveQualityOfServiceMeasurement := IXboxLiveQualityOfServiceMeasurement(outPtr)
        }

        return this.__IXboxLiveQualityOfServiceMeasurement.GetMetricResultsForDevice(deviceAddress)
    }

    /**
     * Gets the most recent values of a given metric, across all devices being measured.
     * 
     * Your code specifies a set of metrics, device addresses, timeouts, and number of probes to attempt, and then calls **XboxLiveQualityOfServiceMeasurement.MeasureAsync** to begin making the specified measurements. You can call **GetMetricResultsForMetric** at any time while measurements are in progress or after they have finished, and retrieve current values. Note that if you repeatedly call **GetMetricResultsForMetric**. and inspect a given metric for a particular device while the relevant measurements are in progress, you might get different values as the measurement proceeds.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @param {Integer} metric The metric to be retrieved.
     * @returns {IVectorView<XboxLiveQualityOfServiceMetricResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofservicemeasurement.getmetricresultsformetric
     */
    GetMetricResultsForMetric(metric) {
        if (!this.HasProp("__IXboxLiveQualityOfServiceMeasurement")) {
            if ((queryResult := this.QueryInterface(IXboxLiveQualityOfServiceMeasurement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveQualityOfServiceMeasurement := IXboxLiveQualityOfServiceMeasurement(outPtr)
        }

        return this.__IXboxLiveQualityOfServiceMeasurement.GetMetricResultsForMetric(metric)
    }

    /**
     * Gets the results of the most recent measurement of a given metric on the connection to a given address.
     * 
     * Your code specifies a set of metrics, device addresses, timeouts, and number of probes to attempt, and then calls **XboxLiveQualityOfServiceMeasurement.MeasureAsync** to begin making the specified measurements. You can call **GetMetricResult** at any time while measurements are in progress or after they have finished, and retrieve its current value. Note that if you repeatedly call **GetMetricResult** for a given metric while the relevant measurements are in progress, you might get different values as the measurement proceeds.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @param {XboxLiveDeviceAddress} deviceAddress The target address of the measurement.
     * @param {Integer} metric The metric value to retrieve.
     * @returns {XboxLiveQualityOfServiceMetricResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofservicemeasurement.getmetricresult
     */
    GetMetricResult(deviceAddress, metric) {
        if (!this.HasProp("__IXboxLiveQualityOfServiceMeasurement")) {
            if ((queryResult := this.QueryInterface(IXboxLiveQualityOfServiceMeasurement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveQualityOfServiceMeasurement := IXboxLiveQualityOfServiceMeasurement(outPtr)
        }

        return this.__IXboxLiveQualityOfServiceMeasurement.GetMetricResult(deviceAddress, metric)
    }

    /**
     * Gets the private payload for a device currently being measured, if **ShouldRequestPrivatePayloads** was set to `true` for this measurement.
     * 
     * Your code specifies a set of metrics, device addresses, timeouts, number of probes to attempt, and whether to request private payloads, and then calls **XboxLiveQualityOfServiceMeasurement.MeasureAsync** to begin making the specified measurements, and to retrieve any private payloads.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @param {XboxLiveDeviceAddress} deviceAddress Device address of the device whose private payload is being retrieved.
     * @returns {XboxLiveQualityOfServicePrivatePayloadResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofservicemeasurement.getprivatepayloadresult
     */
    GetPrivatePayloadResult(deviceAddress) {
        if (!this.HasProp("__IXboxLiveQualityOfServiceMeasurement")) {
            if ((queryResult := this.QueryInterface(IXboxLiveQualityOfServiceMeasurement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveQualityOfServiceMeasurement := IXboxLiveQualityOfServiceMeasurement(outPtr)
        }

        return this.__IXboxLiveQualityOfServiceMeasurement.GetPrivatePayloadResult(deviceAddress)
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_Metrics() {
        if (!this.HasProp("__IXboxLiveQualityOfServiceMeasurement")) {
            if ((queryResult := this.QueryInterface(IXboxLiveQualityOfServiceMeasurement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveQualityOfServiceMeasurement := IXboxLiveQualityOfServiceMeasurement(outPtr)
        }

        return this.__IXboxLiveQualityOfServiceMeasurement.get_Metrics()
    }

    /**
     * 
     * @returns {IVector<XboxLiveDeviceAddress>} 
     */
    get_DeviceAddresses() {
        if (!this.HasProp("__IXboxLiveQualityOfServiceMeasurement")) {
            if ((queryResult := this.QueryInterface(IXboxLiveQualityOfServiceMeasurement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveQualityOfServiceMeasurement := IXboxLiveQualityOfServiceMeasurement(outPtr)
        }

        return this.__IXboxLiveQualityOfServiceMeasurement.get_DeviceAddresses()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShouldRequestPrivatePayloads() {
        if (!this.HasProp("__IXboxLiveQualityOfServiceMeasurement")) {
            if ((queryResult := this.QueryInterface(IXboxLiveQualityOfServiceMeasurement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveQualityOfServiceMeasurement := IXboxLiveQualityOfServiceMeasurement(outPtr)
        }

        return this.__IXboxLiveQualityOfServiceMeasurement.get_ShouldRequestPrivatePayloads()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShouldRequestPrivatePayloads(value) {
        if (!this.HasProp("__IXboxLiveQualityOfServiceMeasurement")) {
            if ((queryResult := this.QueryInterface(IXboxLiveQualityOfServiceMeasurement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveQualityOfServiceMeasurement := IXboxLiveQualityOfServiceMeasurement(outPtr)
        }

        return this.__IXboxLiveQualityOfServiceMeasurement.put_ShouldRequestPrivatePayloads(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TimeoutInMilliseconds() {
        if (!this.HasProp("__IXboxLiveQualityOfServiceMeasurement")) {
            if ((queryResult := this.QueryInterface(IXboxLiveQualityOfServiceMeasurement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveQualityOfServiceMeasurement := IXboxLiveQualityOfServiceMeasurement(outPtr)
        }

        return this.__IXboxLiveQualityOfServiceMeasurement.get_TimeoutInMilliseconds()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TimeoutInMilliseconds(value) {
        if (!this.HasProp("__IXboxLiveQualityOfServiceMeasurement")) {
            if ((queryResult := this.QueryInterface(IXboxLiveQualityOfServiceMeasurement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveQualityOfServiceMeasurement := IXboxLiveQualityOfServiceMeasurement(outPtr)
        }

        return this.__IXboxLiveQualityOfServiceMeasurement.put_TimeoutInMilliseconds(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfProbesToAttempt() {
        if (!this.HasProp("__IXboxLiveQualityOfServiceMeasurement")) {
            if ((queryResult := this.QueryInterface(IXboxLiveQualityOfServiceMeasurement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveQualityOfServiceMeasurement := IXboxLiveQualityOfServiceMeasurement(outPtr)
        }

        return this.__IXboxLiveQualityOfServiceMeasurement.get_NumberOfProbesToAttempt()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_NumberOfProbesToAttempt(value) {
        if (!this.HasProp("__IXboxLiveQualityOfServiceMeasurement")) {
            if ((queryResult := this.QueryInterface(IXboxLiveQualityOfServiceMeasurement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveQualityOfServiceMeasurement := IXboxLiveQualityOfServiceMeasurement(outPtr)
        }

        return this.__IXboxLiveQualityOfServiceMeasurement.put_NumberOfProbesToAttempt(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfResultsPending() {
        if (!this.HasProp("__IXboxLiveQualityOfServiceMeasurement")) {
            if ((queryResult := this.QueryInterface(IXboxLiveQualityOfServiceMeasurement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveQualityOfServiceMeasurement := IXboxLiveQualityOfServiceMeasurement(outPtr)
        }

        return this.__IXboxLiveQualityOfServiceMeasurement.get_NumberOfResultsPending()
    }

    /**
     * 
     * @returns {IVectorView<XboxLiveQualityOfServiceMetricResult>} 
     */
    get_MetricResults() {
        if (!this.HasProp("__IXboxLiveQualityOfServiceMeasurement")) {
            if ((queryResult := this.QueryInterface(IXboxLiveQualityOfServiceMeasurement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveQualityOfServiceMeasurement := IXboxLiveQualityOfServiceMeasurement(outPtr)
        }

        return this.__IXboxLiveQualityOfServiceMeasurement.get_MetricResults()
    }

    /**
     * 
     * @returns {IVectorView<XboxLiveQualityOfServicePrivatePayloadResult>} 
     */
    get_PrivatePayloadResults() {
        if (!this.HasProp("__IXboxLiveQualityOfServiceMeasurement")) {
            if ((queryResult := this.QueryInterface(IXboxLiveQualityOfServiceMeasurement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveQualityOfServiceMeasurement := IXboxLiveQualityOfServiceMeasurement(outPtr)
        }

        return this.__IXboxLiveQualityOfServiceMeasurement.get_PrivatePayloadResults()
    }

;@endregion Instance Methods
}
