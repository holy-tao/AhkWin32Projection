#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the network registration status of a phone line.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonenetworkstate
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneNetworkState extends Win32Enum{

    /**
     * The registration status of the phone line is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Could not detect a signal on the phone line, or the phone line is limited to emergency calls only.
     * @type {Integer (Int32)}
     */
    static NoSignal => 1

    /**
     * The phone line has been de-registered.
     * @type {Integer (Int32)}
     */
    static Deregistered => 2

    /**
     * Could not register the phone line with any available network.
     * @type {Integer (Int32)}
     */
    static Denied => 3

    /**
     * Searching for a network for the phone line.
     * @type {Integer (Int32)}
     */
    static Searching => 4

    /**
     * The phone line is registered and is on the carrier's home network.
     * @type {Integer (Int32)}
     */
    static Home => 5

    /**
     * The phone line is registered and is roaming internationally on another carrier's network.
     * @type {Integer (Int32)}
     */
    static RoamingInternational => 6

    /**
     * The phone line is registered and is roaming domestically on another carrier's network.
     * @type {Integer (Int32)}
     */
    static RoamingDomestic => 7
}
