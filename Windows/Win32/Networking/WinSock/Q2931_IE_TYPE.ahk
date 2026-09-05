#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class Q2931_IE_TYPE extends Win32Enum {

    /**
     * Native name: IE_AALParameters
     * @type {Integer (Int32)}
     */
    static AALParameters => 0

    /**
     * Native name: IE_TrafficDescriptor
     * @type {Integer (Int32)}
     */
    static TrafficDescriptor => 1

    /**
     * Native name: IE_BroadbandBearerCapability
     * @type {Integer (Int32)}
     */
    static BroadbandBearerCapability => 2

    /**
     * Native name: IE_BHLI
     * @type {Integer (Int32)}
     */
    static BHLI => 3

    /**
     * Native name: IE_BLLI
     * @type {Integer (Int32)}
     */
    static BLLI => 4

    /**
     * Native name: IE_CalledPartyNumber
     * @type {Integer (Int32)}
     */
    static CalledPartyNumber => 5

    /**
     * Native name: IE_CalledPartySubaddress
     * @type {Integer (Int32)}
     */
    static CalledPartySubaddress => 6

    /**
     * Native name: IE_CallingPartyNumber
     * @type {Integer (Int32)}
     */
    static CallingPartyNumber => 7

    /**
     * Native name: IE_CallingPartySubaddress
     * @type {Integer (Int32)}
     */
    static CallingPartySubaddress => 8

    /**
     * Native name: IE_Cause
     * @type {Integer (Int32)}
     */
    static Cause => 9

    /**
     * Native name: IE_QOSClass
     * @type {Integer (Int32)}
     */
    static QOSClass => 10

    /**
     * Native name: IE_TransitNetworkSelection
     * @type {Integer (Int32)}
     */
    static TransitNetworkSelection => 11
}
