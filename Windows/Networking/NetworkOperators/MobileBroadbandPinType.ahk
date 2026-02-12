#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the possible types for a mobile broadband PIN.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpintype
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandPinType extends Win32Enum{

    /**
     * Not used (only for initialization).
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * This is a custom vendor-defined PIN type. It is not included in the list.
     * @type {Integer (Int32)}
     */
    static Custom => 1

    /**
     * For GSM-based devices, this is a Subscriber Identity Module (SIM) PIN. For CDMA-based devices, power-on device lock is reported as PIN1.
     * @type {Integer (Int32)}
     */
    static Pin1 => 2

    /**
     * This is a SIM PIN2 that protects certain SIM functionality.
     * @type {Integer (Int32)}
     */
    static Pin2 => 3

    /**
     * This is a PIN that locks the device to a specific SIM card.
     * @type {Integer (Int32)}
     */
    static SimPin => 4

    /**
     * This is a PIN that locks the device to the very first inserted SIM card.
     * @type {Integer (Int32)}
     */
    static FirstSimPin => 5

    /**
     * This is a PIN that allows the device to be personalized to a network. For more information about this PIN type, see section 22.022 of the 3GPP specification.
     * @type {Integer (Int32)}
     */
    static NetworkPin => 6

    /**
     * This is a PIN that allows the device to be personalized to a subset of a network. For more information about this PIN type, see section 22.022 of the 3GPP specification.
     * @type {Integer (Int32)}
     */
    static NetworkSubsetPin => 7

    /**
     * This is a PIN that allows the device to be personalized to a service provider. For more information about this PIN type, see section 22.022 of the 3GPP specification.
     * @type {Integer (Int32)}
     */
    static ServiceProviderPin => 8

    /**
     * This is a PIN that allows the device to be personalized to a specific company. For more information about this PIN type, see section 22.022 of the 3GPP specification.
     * @type {Integer (Int32)}
     */
    static CorporatePin => 9

    /**
     * This is a PIN that allows the device to be restricted to operate on a specific network. For more information about this PIN type, see section 22.022 of the 3GPP specification.
     * @type {Integer (Int32)}
     */
    static SubsidyLock => 10
}
