#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class Q2931_IE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IE_AALParameters => 0

    /**
     * @type {Integer (Int32)}
     */
    static IE_TrafficDescriptor => 1

    /**
     * @type {Integer (Int32)}
     */
    static IE_BroadbandBearerCapability => 2

    /**
     * @type {Integer (Int32)}
     */
    static IE_BHLI => 3

    /**
     * @type {Integer (Int32)}
     */
    static IE_BLLI => 4

    /**
     * @type {Integer (Int32)}
     */
    static IE_CalledPartyNumber => 5

    /**
     * @type {Integer (Int32)}
     */
    static IE_CalledPartySubaddress => 6

    /**
     * @type {Integer (Int32)}
     */
    static IE_CallingPartyNumber => 7

    /**
     * @type {Integer (Int32)}
     */
    static IE_CallingPartySubaddress => 8

    /**
     * @type {Integer (Int32)}
     */
    static IE_Cause => 9

    /**
     * @type {Integer (Int32)}
     */
    static IE_QOSClass => 10

    /**
     * @type {Integer (Int32)}
     */
    static IE_TransitNetworkSelection => 11
}
