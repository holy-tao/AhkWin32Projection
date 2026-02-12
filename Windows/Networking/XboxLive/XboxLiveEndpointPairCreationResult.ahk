#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IXboxLiveEndpointPairCreationResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Encapulates the results of an attempt to instantiate a new **XboxLiveEndpointPair**. Includes a status value specifying the result of the attempt and (when the creation was successful) details about the resulting endpoint pair.
  * 
  * > [!IMPORTANT]
  * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @remarks
 * You don't instantiate this class using a constructor. Instead, an instance is created and returned to your code inside the **IAsyncOperation(XboxLiveEndpointPairCreationResult)** object returned by a call to **XboxLiveEndpointPairTemplate.CreateEndpointPairAsync**.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpaircreationresult
 * @namespace Windows.Networking.XboxLive
 * @version WindowsRuntime 1.4
 */
class XboxLiveEndpointPairCreationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IXboxLiveEndpointPairCreationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IXboxLiveEndpointPairCreationResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the device address of the remote endpoint.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpaircreationresult.deviceaddress
     * @type {XboxLiveDeviceAddress} 
     */
    DeviceAddress {
        get => this.get_DeviceAddress()
    }

    /**
     * Gets the status of the asynchronous creation operation. 
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpaircreationresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets a Boolean value that is `true` if the endpoint pair being returned already existed.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpaircreationresult.isexistingpathevaluation
     * @type {Boolean} 
     */
    IsExistingPathEvaluation {
        get => this.get_IsExistingPathEvaluation()
    }

    /**
     * Gets the endpoint pair that has been created. Throws an exception if **Status** is not *Succeeded*.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpaircreationresult.endpointpair
     * @type {XboxLiveEndpointPair} 
     */
    EndpointPair {
        get => this.get_EndpointPair()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {XboxLiveDeviceAddress} 
     */
    get_DeviceAddress() {
        if (!this.HasProp("__IXboxLiveEndpointPairCreationResult")) {
            if ((queryResult := this.QueryInterface(IXboxLiveEndpointPairCreationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveEndpointPairCreationResult := IXboxLiveEndpointPairCreationResult(outPtr)
        }

        return this.__IXboxLiveEndpointPairCreationResult.get_DeviceAddress()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IXboxLiveEndpointPairCreationResult")) {
            if ((queryResult := this.QueryInterface(IXboxLiveEndpointPairCreationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveEndpointPairCreationResult := IXboxLiveEndpointPairCreationResult(outPtr)
        }

        return this.__IXboxLiveEndpointPairCreationResult.get_Status()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsExistingPathEvaluation() {
        if (!this.HasProp("__IXboxLiveEndpointPairCreationResult")) {
            if ((queryResult := this.QueryInterface(IXboxLiveEndpointPairCreationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveEndpointPairCreationResult := IXboxLiveEndpointPairCreationResult(outPtr)
        }

        return this.__IXboxLiveEndpointPairCreationResult.get_IsExistingPathEvaluation()
    }

    /**
     * 
     * @returns {XboxLiveEndpointPair} 
     */
    get_EndpointPair() {
        if (!this.HasProp("__IXboxLiveEndpointPairCreationResult")) {
            if ((queryResult := this.QueryInterface(IXboxLiveEndpointPairCreationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveEndpointPairCreationResult := IXboxLiveEndpointPairCreationResult(outPtr)
        }

        return this.__IXboxLiveEndpointPairCreationResult.get_EndpointPair()
    }

;@endregion Instance Methods
}
