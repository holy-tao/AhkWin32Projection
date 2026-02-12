#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IXboxLiveInboundEndpointPairCreatedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Encapsulates details about an **InboundEndpointPairCreated** event.
  * 
  * > [!IMPORTANT]
  * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveinboundendpointpaircreatedeventargs
 * @namespace Windows.Networking.XboxLive
 * @version WindowsRuntime 1.4
 */
class XboxLiveInboundEndpointPairCreatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IXboxLiveInboundEndpointPairCreatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IXboxLiveInboundEndpointPairCreatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the **XboxLiveEndpointPair** that a remote device has created with the local device.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveinboundendpointpaircreatedeventargs.endpointpair
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
     * @returns {XboxLiveEndpointPair} 
     */
    get_EndpointPair() {
        if (!this.HasProp("__IXboxLiveInboundEndpointPairCreatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IXboxLiveInboundEndpointPairCreatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveInboundEndpointPairCreatedEventArgs := IXboxLiveInboundEndpointPairCreatedEventArgs(outPtr)
        }

        return this.__IXboxLiveInboundEndpointPairCreatedEventArgs.get_EndpointPair()
    }

;@endregion Instance Methods
}
