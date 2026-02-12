#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProviderNetworkUsage.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents per-provider aggregated usage (bytes sent / bytes received) returned by
  * [ConnectionProfile.GetProviderNetworkUsageAsync](connectionprofile_getprovidernetworkusageasync_1442391607.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.providernetworkusage
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class ProviderNetworkUsage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProviderNetworkUsage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProviderNetworkUsage.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating the number of bytes sent by the connection over a specific period of time.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.providernetworkusage.bytessent
     * @type {Integer} 
     */
    BytesSent {
        get => this.get_BytesSent()
    }

    /**
     * Gets a value indicating the number of bytes received by a connection over a specific period of time.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.providernetworkusage.bytesreceived
     * @type {Integer} 
     */
    BytesReceived {
        get => this.get_BytesReceived()
    }

    /**
     * Gets the ProviderId (a combination of MCC and MNC).
     * @remarks
     * The MCC/MNC combo is expressed in the API as a single numeric (0-9) string named ProviderId that is a concatenation of a 3-digit MCC and a 2 or 3-digit MNC to be compliant with E.212.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.providernetworkusage.providerid
     * @type {HSTRING} 
     */
    ProviderId {
        get => this.get_ProviderId()
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
    get_BytesSent() {
        if (!this.HasProp("__IProviderNetworkUsage")) {
            if ((queryResult := this.QueryInterface(IProviderNetworkUsage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProviderNetworkUsage := IProviderNetworkUsage(outPtr)
        }

        return this.__IProviderNetworkUsage.get_BytesSent()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BytesReceived() {
        if (!this.HasProp("__IProviderNetworkUsage")) {
            if ((queryResult := this.QueryInterface(IProviderNetworkUsage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProviderNetworkUsage := IProviderNetworkUsage(outPtr)
        }

        return this.__IProviderNetworkUsage.get_BytesReceived()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProviderId() {
        if (!this.HasProp("__IProviderNetworkUsage")) {
            if ((queryResult := this.QueryInterface(IProviderNetworkUsage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProviderNetworkUsage := IProviderNetworkUsage(outPtr)
        }

        return this.__IProviderNetworkUsage.get_ProviderId()
    }

;@endregion Instance Methods
}
