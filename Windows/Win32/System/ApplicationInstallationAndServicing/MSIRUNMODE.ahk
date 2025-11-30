#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class MSIRUNMODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_ADMIN => 0

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_ADVERTISE => 1

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_MAINTENANCE => 2

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_ROLLBACKENABLED => 3

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_LOGENABLED => 4

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_OPERATIONS => 5

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_REBOOTATEND => 6

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_REBOOTNOW => 7

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_CABINET => 8

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_SOURCESHORTNAMES => 9

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_TARGETSHORTNAMES => 10

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_RESERVED11 => 11

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_WINDOWS9X => 12

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_ZAWENABLED => 13

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_RESERVED14 => 14

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_RESERVED15 => 15

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_SCHEDULED => 16

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_ROLLBACK => 17

    /**
     * @type {Integer (Int32)}
     */
    static MSIRUNMODE_COMMIT => 18
}
