#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the status of a request to set the modem passthrough status by calling [SetIsPassthroughEnabledAsync](mobilebroadbandmodem_setispassthroughenabledasync_1308076323.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodemstatus
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandModemStatus extends Win32Enum{

    /**
     * The call was successful.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * An unspecified failure occurred.
     * @type {Integer (Int32)}
     */
    static OtherFailure => 1

    /**
     * The modem is busy.
     * @type {Integer (Int32)}
     */
    static Busy => 2

    /**
     * The modem does not support the request.
     * @type {Integer (Int32)}
     */
    static NoDeviceSupport => 3
}
