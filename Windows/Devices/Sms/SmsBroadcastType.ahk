#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Values that describe the type of a broadcast (emergency alert) message.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsbroadcasttype
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class SmsBroadcastType extends Win32Enum{

    /**
     * An unknown broadcast type.
     * @type {Integer (Int32)}
     */
    static Other => 0

    /**
     * A Commercial Mobile Alert System (CMAS) Presidential alert message.
     * @type {Integer (Int32)}
     */
    static CmasPresidential => 1

    /**
     * A CMAS Extreme alert message.
     * @type {Integer (Int32)}
     */
    static CmasExtreme => 2

    /**
     * A CMAS Severe alert message.
     * @type {Integer (Int32)}
     */
    static CmasSevere => 3

    /**
     * A CMAS Amber alert message.
     * @type {Integer (Int32)}
     */
    static CmasAmber => 4

    /**
     * A CMAS Test message.
     * @type {Integer (Int32)}
     */
    static CmasTest => 5

    /**
     * An EU Alert 1 message.
     * @type {Integer (Int32)}
     */
    static EUAlert1 => 6

    /**
     * An EU Alert 2 message.
     * @type {Integer (Int32)}
     */
    static EUAlert2 => 7

    /**
     * An EU Alert 3 message.
     * @type {Integer (Int32)}
     */
    static EUAlert3 => 8

    /**
     * An EU Amber Alert message.
     * @type {Integer (Int32)}
     */
    static EUAlertAmber => 9

    /**
     * An EU informational message.
     * @type {Integer (Int32)}
     */
    static EUAlertInfo => 10

    /**
     * An Earthquake and Tsunami Warning System (ETWS) earthquake alert message.
     * @type {Integer (Int32)}
     */
    static EtwsEarthquake => 11

    /**
     * An ETWS tsunami alert message.
     * @type {Integer (Int32)}
     */
    static EtwsTsunami => 12

    /**
     * An ETWS tsunami and earthquake alert message.
     * @type {Integer (Int32)}
     */
    static EtwsTsunamiAndEarthquake => 13

    /**
     * A local LAT alert broadcast message.
     * @type {Integer (Int32)}
     */
    static LatAlertLocal => 14
}
