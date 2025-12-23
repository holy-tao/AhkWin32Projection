#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RASPROJECTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RASP_Amb => 65536

    /**
     * @type {Integer (Int32)}
     */
    static RASP_PppNbf => 32831

    /**
     * @type {Integer (Int32)}
     */
    static RASP_PppIpx => 32811

    /**
     * @type {Integer (Int32)}
     */
    static RASP_PppIp => 32801

    /**
     * @type {Integer (Int32)}
     */
    static RASP_PppCcp => 33021

    /**
     * @type {Integer (Int32)}
     */
    static RASP_PppLcp => 49185

    /**
     * @type {Integer (Int32)}
     */
    static RASP_PppIpv6 => 32855
}
