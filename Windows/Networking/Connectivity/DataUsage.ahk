#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDataUsage.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!NOTE]
  * > DataUsage may be altered or unavailable for releases after Windows 8.1. Instead, use [NetworkUsage](networkusage.md)
  * 
  * Represents data usage information returned by the [ConnectionProfile.GetLocalUsage](connectionprofile_getlocalusage_2102872925.md) method.
 * @remarks
 * `DataUsage` values are available only when the platform implements `GetLocalUsage`. For Windows 10 and later you should
 * prefer [ConnectionProfile.GetNetworkUsageAsync](connectionprofile_getnetworkusageasync_665790436.md), which returns
 * richer [NetworkUsage](networkusage.md) data and supports per-app attribution.
 * 
 * When `GetLocalUsage` succeeds, treat the result as a coarse aggregate for the requested time range. The reported bytes may
 * lag behind real traffic and might not match the current metered plan counters exposed by the network operator.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.datausage
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class DataUsage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDataUsage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDataUsage.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * > [!NOTE]
     * > [DataUsage](datausage.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [NetworkUsage](networkusage.md)
     * 
     * Gets a value indicating the number of bytes sent by the connection over a specific period of time.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.datausage.bytessent
     * @type {Integer} 
     */
    BytesSent {
        get => this.get_BytesSent()
    }

    /**
     * > [!NOTE]
     * > [DataUsage](datausage.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [NetworkUsage](networkusage.md)
     * 
     * Gets a value indicating the number of bytes received by a connection over a specific period of time.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.datausage.bytesreceived
     * @type {Integer} 
     */
    BytesReceived {
        get => this.get_BytesReceived()
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
        if (!this.HasProp("__IDataUsage")) {
            if ((queryResult := this.QueryInterface(IDataUsage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataUsage := IDataUsage(outPtr)
        }

        return this.__IDataUsage.get_BytesSent()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BytesReceived() {
        if (!this.HasProp("__IDataUsage")) {
            if ((queryResult := this.QueryInterface(IDataUsage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataUsage := IDataUsage(outPtr)
        }

        return this.__IDataUsage.get_BytesReceived()
    }

;@endregion Instance Methods
}
