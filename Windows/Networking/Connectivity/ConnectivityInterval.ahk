#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IConnectivityInterval.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a contiguous connectivity span (start timestamp plus duration) for a connection profile.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectivityinterval
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class ConnectivityInterval extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IConnectivityInterval

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IConnectivityInterval.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Start timestamp of this connectivity interval.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectivityinterval.starttime
     * @type {DateTime} 
     */
    StartTime {
        get => this.get_StartTime()
    }

    /**
     * Length of this connectivity interval.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectivityinterval.connectionduration
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
     * @returns {DateTime} 
     */
    get_StartTime() {
        if (!this.HasProp("__IConnectivityInterval")) {
            if ((queryResult := this.QueryInterface(IConnectivityInterval.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectivityInterval := IConnectivityInterval(outPtr)
        }

        return this.__IConnectivityInterval.get_StartTime()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_ConnectionDuration() {
        if (!this.HasProp("__IConnectivityInterval")) {
            if ((queryResult := this.QueryInterface(IConnectivityInterval.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectivityInterval := IConnectivityInterval(outPtr)
        }

        return this.__IConnectivityInterval.get_ConnectionDuration()
    }

;@endregion Instance Methods
}
