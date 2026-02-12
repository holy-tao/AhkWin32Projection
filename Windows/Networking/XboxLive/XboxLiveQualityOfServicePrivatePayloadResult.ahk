#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IXboxLiveQualityOfServicePrivatePayloadResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Encapsulates the private payload from a Quality of Service (QoS) measurement when the **XboxLiveQualityOfServiceMeasurement.ShouldRequestPrivatePayloads** flag has been specified.
  * 
  * > [!IMPORTANT]
  * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofserviceprivatepayloadresult
 * @namespace Windows.Networking.XboxLive
 * @version WindowsRuntime 1.4
 */
class XboxLiveQualityOfServicePrivatePayloadResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IXboxLiveQualityOfServicePrivatePayloadResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IXboxLiveQualityOfServicePrivatePayloadResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of the measurement that includes this private payload retrieval.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofserviceprivatepayloadresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the device address of the device that returned this private payload.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofserviceprivatepayloadresult.deviceaddress
     * @type {XboxLiveDeviceAddress} 
     */
    DeviceAddress {
        get => this.get_DeviceAddress()
    }

    /**
     * Gets the private payload. Format and meaning of the private payload bytes are determined by each individual app.
     * 
     * Private payload data bytes are not interpreted or validated by **XboxLiveQualityOfServiceMeasurement** objects. They are transmitted as-is. As with all messages exchanged with remote devices over the network, apps should be mindful that the remote device publishing or receiving the private payload might not be running the same version of the app that's running locally. Consider using a versioning scheme, and always check that a payload is well-formed before acting on it.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxlivequalityofserviceprivatepayloadresult.value
     * @type {IBuffer} 
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
        if (!this.HasProp("__IXboxLiveQualityOfServicePrivatePayloadResult")) {
            if ((queryResult := this.QueryInterface(IXboxLiveQualityOfServicePrivatePayloadResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveQualityOfServicePrivatePayloadResult := IXboxLiveQualityOfServicePrivatePayloadResult(outPtr)
        }

        return this.__IXboxLiveQualityOfServicePrivatePayloadResult.get_Status()
    }

    /**
     * 
     * @returns {XboxLiveDeviceAddress} 
     */
    get_DeviceAddress() {
        if (!this.HasProp("__IXboxLiveQualityOfServicePrivatePayloadResult")) {
            if ((queryResult := this.QueryInterface(IXboxLiveQualityOfServicePrivatePayloadResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveQualityOfServicePrivatePayloadResult := IXboxLiveQualityOfServicePrivatePayloadResult(outPtr)
        }

        return this.__IXboxLiveQualityOfServicePrivatePayloadResult.get_DeviceAddress()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Value() {
        if (!this.HasProp("__IXboxLiveQualityOfServicePrivatePayloadResult")) {
            if ((queryResult := this.QueryInterface(IXboxLiveQualityOfServicePrivatePayloadResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveQualityOfServicePrivatePayloadResult := IXboxLiveQualityOfServicePrivatePayloadResult(outPtr)
        }

        return this.__IXboxLiveQualityOfServicePrivatePayloadResult.get_Value()
    }

;@endregion Instance Methods
}
