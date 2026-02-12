#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INetworkUsage.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents per-interval network usage statistics returned by
  * [ConnectionProfile.GetNetworkUsageAsync](connectionprofile_getnetworkusageasync_665790436.md).
 * @remarks
 * Each `NetworkUsage` entry represents aggregated usage over a contiguous interval defined by the granularity supplied to
 * [ConnectionProfile.GetNetworkUsageAsync](connectionprofile_getnetworkusageasync_665790436.md).
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkusage
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class NetworkUsage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INetworkUsage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INetworkUsage.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Indicates the number of bytes sent by a connection over a specific period of time.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkusage.bytessent
     * @type {Integer} 
     */
    BytesSent {
        get => this.get_BytesSent()
    }

    /**
     * Indicates the number of bytes received by the connection of a specific period of time.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkusage.bytesreceived
     * @type {Integer} 
     */
    BytesReceived {
        get => this.get_BytesReceived()
    }

    /**
     * Indicates the duration of connectivity.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkusage.connectionduration
     * @type {TimeSpan} 
     */
    ConnectionDuration {
        get => this.get_ConnectionDuration()
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
        if (!this.HasProp("__INetworkUsage")) {
            if ((queryResult := this.QueryInterface(INetworkUsage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkUsage := INetworkUsage(outPtr)
        }

        return this.__INetworkUsage.get_BytesSent()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BytesReceived() {
        if (!this.HasProp("__INetworkUsage")) {
            if ((queryResult := this.QueryInterface(INetworkUsage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkUsage := INetworkUsage(outPtr)
        }

        return this.__INetworkUsage.get_BytesReceived()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_ConnectionDuration() {
        if (!this.HasProp("__INetworkUsage")) {
            if ((queryResult := this.QueryInterface(INetworkUsage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkUsage := INetworkUsage(outPtr)
        }

        return this.__INetworkUsage.get_ConnectionDuration()
    }

;@endregion Instance Methods
}
