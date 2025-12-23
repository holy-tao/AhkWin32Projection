#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class PMTUD_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IP_PMTUDISC_NOT_SET => 0

    /**
     * @type {Integer (Int32)}
     */
    static IP_PMTUDISC_DO => 1

    /**
     * @type {Integer (Int32)}
     */
    static IP_PMTUDISC_DONT => 2

    /**
     * @type {Integer (Int32)}
     */
    static IP_PMTUDISC_PROBE => 3

    /**
     * @type {Integer (Int32)}
     */
    static IP_PMTUDISC_MAX => 4
}
