#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\XboxLiveQualityOfServiceMetricResult.ahk
#Include .\XboxLiveQualityOfServicePrivatePayloadResult.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\XboxLiveDeviceAddress.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.XboxLive
 * @version WindowsRuntime 1.4
 */
class IXboxLiveQualityOfServiceMeasurement extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXboxLiveQualityOfServiceMeasurement
     * @type {Guid}
     */
    static IID => Guid("{4d682bce-a5d6-47e6-a236-cfde5fbdf2ed}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MeasureAsync", "GetMetricResultsForDevice", "GetMetricResultsForMetric", "GetMetricResult", "GetPrivatePayloadResult", "get_Metrics", "get_DeviceAddresses", "get_ShouldRequestPrivatePayloads", "put_ShouldRequestPrivatePayloads", "get_TimeoutInMilliseconds", "put_TimeoutInMilliseconds", "get_NumberOfProbesToAttempt", "put_NumberOfProbesToAttempt", "get_NumberOfResultsPending", "get_MetricResults", "get_PrivatePayloadResults"]

    /**
     * @type {IVector<Integer>} 
     */
    Metrics {
        get => this.get_Metrics()
    }

    /**
     * @type {IVector<XboxLiveDeviceAddress>} 
     */
    DeviceAddresses {
        get => this.get_DeviceAddresses()
    }

    /**
     * @type {Boolean} 
     */
    ShouldRequestPrivatePayloads {
        get => this.get_ShouldRequestPrivatePayloads()
        set => this.put_ShouldRequestPrivatePayloads(value)
    }

    /**
     * @type {Integer} 
     */
    TimeoutInMilliseconds {
        get => this.get_TimeoutInMilliseconds()
        set => this.put_TimeoutInMilliseconds(value)
    }

    /**
     * @type {Integer} 
     */
    NumberOfProbesToAttempt {
        get => this.get_NumberOfProbesToAttempt()
        set => this.put_NumberOfProbesToAttempt(value)
    }

    /**
     * @type {Integer} 
     */
    NumberOfResultsPending {
        get => this.get_NumberOfResultsPending()
    }

    /**
     * @type {IVectorView<XboxLiveQualityOfServiceMetricResult>} 
     */
    MetricResults {
        get => this.get_MetricResults()
    }

    /**
     * @type {IVectorView<XboxLiveQualityOfServicePrivatePayloadResult>} 
     */
    PrivatePayloadResults {
        get => this.get_PrivatePayloadResults()
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    MeasureAsync() {
        result := ComCall(6, this, "ptr*", &action := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(action)
    }

    /**
     * 
     * @param {XboxLiveDeviceAddress} deviceAddress 
     * @returns {IVectorView<XboxLiveQualityOfServiceMetricResult>} 
     */
    GetMetricResultsForDevice(deviceAddress) {
        result := ComCall(7, this, "ptr", deviceAddress, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(XboxLiveQualityOfServiceMetricResult, value)
    }

    /**
     * 
     * @param {Integer} metric 
     * @returns {IVectorView<XboxLiveQualityOfServiceMetricResult>} 
     */
    GetMetricResultsForMetric(metric) {
        result := ComCall(8, this, "int", metric, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(XboxLiveQualityOfServiceMetricResult, value)
    }

    /**
     * 
     * @param {XboxLiveDeviceAddress} deviceAddress 
     * @param {Integer} metric 
     * @returns {XboxLiveQualityOfServiceMetricResult} 
     */
    GetMetricResult(deviceAddress, metric) {
        result := ComCall(9, this, "ptr", deviceAddress, "int", metric, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XboxLiveQualityOfServiceMetricResult(value)
    }

    /**
     * 
     * @param {XboxLiveDeviceAddress} deviceAddress 
     * @returns {XboxLiveQualityOfServicePrivatePayloadResult} 
     */
    GetPrivatePayloadResult(deviceAddress) {
        result := ComCall(10, this, "ptr", deviceAddress, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XboxLiveQualityOfServicePrivatePayloadResult(value)
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_Metrics() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IVector<XboxLiveDeviceAddress>} 
     */
    get_DeviceAddresses() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(XboxLiveDeviceAddress, value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShouldRequestPrivatePayloads() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShouldRequestPrivatePayloads(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TimeoutInMilliseconds() {
        result := ComCall(15, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TimeoutInMilliseconds(value) {
        result := ComCall(16, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfProbesToAttempt() {
        result := ComCall(17, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_NumberOfProbesToAttempt(value) {
        result := ComCall(18, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfResultsPending() {
        result := ComCall(19, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<XboxLiveQualityOfServiceMetricResult>} 
     */
    get_MetricResults() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(XboxLiveQualityOfServiceMetricResult, value)
    }

    /**
     * 
     * @returns {IVectorView<XboxLiveQualityOfServicePrivatePayloadResult>} 
     */
    get_PrivatePayloadResults() {
        result := ComCall(21, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(XboxLiveQualityOfServicePrivatePayloadResult, value)
    }
}
