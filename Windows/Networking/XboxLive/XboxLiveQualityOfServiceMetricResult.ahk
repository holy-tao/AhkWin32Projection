#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IXboxLiveQualityOfServiceMetricResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * An **XboxLiveQualityOfServiceMetricResult** object encapsulates data from a single measurement of a specific metric, to a remote device.
  * 
  * > [!IMPORTANT]
  * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofservicemetricresult
 * @namespace Windows.Networking.XboxLive
 * @version WindowsRuntime 1.4
 */
class XboxLiveQualityOfServiceMetricResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IXboxLiveQualityOfServiceMetricResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IXboxLiveQualityOfServiceMetricResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of the measurement.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofservicemetricresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the address of the remote device that was the target of the measurement.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofservicemetricresult.deviceaddress
     * @type {XboxLiveDeviceAddress} 
     */
    DeviceAddress {
        get => this.get_DeviceAddress()
    }

    /**
     * Gets the specific metric measured in this result.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofservicemetricresult.metric
     * @type {Integer} 
     */
    Metric {
        get => this.get_Metric()
    }

    /**
     * Gets the value of the measurement.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofservicemetricresult.value
     * @type {Integer} 
     */
    Value {
        get => this.get_Value()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IXboxLiveQualityOfServiceMetricResult")) {
            if ((queryResult := this.QueryInterface(IXboxLiveQualityOfServiceMetricResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveQualityOfServiceMetricResult := IXboxLiveQualityOfServiceMetricResult(outPtr)
        }

        return this.__IXboxLiveQualityOfServiceMetricResult.get_Status()
    }

    /**
     * 
     * @returns {XboxLiveDeviceAddress} 
     */
    get_DeviceAddress() {
        if (!this.HasProp("__IXboxLiveQualityOfServiceMetricResult")) {
            if ((queryResult := this.QueryInterface(IXboxLiveQualityOfServiceMetricResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveQualityOfServiceMetricResult := IXboxLiveQualityOfServiceMetricResult(outPtr)
        }

        return this.__IXboxLiveQualityOfServiceMetricResult.get_DeviceAddress()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Metric() {
        if (!this.HasProp("__IXboxLiveQualityOfServiceMetricResult")) {
            if ((queryResult := this.QueryInterface(IXboxLiveQualityOfServiceMetricResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveQualityOfServiceMetricResult := IXboxLiveQualityOfServiceMetricResult(outPtr)
        }

        return this.__IXboxLiveQualityOfServiceMetricResult.get_Metric()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Value() {
        if (!this.HasProp("__IXboxLiveQualityOfServiceMetricResult")) {
            if ((queryResult := this.QueryInterface(IXboxLiveQualityOfServiceMetricResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveQualityOfServiceMetricResult := IXboxLiveQualityOfServiceMetricResult(outPtr)
        }

        return this.__IXboxLiveQualityOfServiceMetricResult.get_Value()
    }

;@endregion Instance Methods
}
