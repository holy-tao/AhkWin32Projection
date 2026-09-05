#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class MSIRUNMODE extends Win32Enum {

    /**
     * Native name: MSIRUNMODE_ADMIN
     * @type {Integer (Int32)}
     */
    static ADMIN => 0

    /**
     * Native name: MSIRUNMODE_ADVERTISE
     * @type {Integer (Int32)}
     */
    static ADVERTISE => 1

    /**
     * Native name: MSIRUNMODE_MAINTENANCE
     * @type {Integer (Int32)}
     */
    static MAINTENANCE => 2

    /**
     * Native name: MSIRUNMODE_ROLLBACKENABLED
     * @type {Integer (Int32)}
     */
    static ROLLBACKENABLED => 3

    /**
     * Native name: MSIRUNMODE_LOGENABLED
     * @type {Integer (Int32)}
     */
    static LOGENABLED => 4

    /**
     * Native name: MSIRUNMODE_OPERATIONS
     * @type {Integer (Int32)}
     */
    static OPERATIONS => 5

    /**
     * Native name: MSIRUNMODE_REBOOTATEND
     * @type {Integer (Int32)}
     */
    static REBOOTATEND => 6

    /**
     * Native name: MSIRUNMODE_REBOOTNOW
     * @type {Integer (Int32)}
     */
    static REBOOTNOW => 7

    /**
     * Native name: MSIRUNMODE_CABINET
     * @type {Integer (Int32)}
     */
    static CABINET => 8

    /**
     * Native name: MSIRUNMODE_SOURCESHORTNAMES
     * @type {Integer (Int32)}
     */
    static SOURCESHORTNAMES => 9

    /**
     * Native name: MSIRUNMODE_TARGETSHORTNAMES
     * @type {Integer (Int32)}
     */
    static TARGETSHORTNAMES => 10

    /**
     * Native name: MSIRUNMODE_RESERVED11
     * @type {Integer (Int32)}
     */
    static RESERVED11 => 11

    /**
     * Native name: MSIRUNMODE_WINDOWS9X
     * @type {Integer (Int32)}
     */
    static WINDOWS9X => 12

    /**
     * Native name: MSIRUNMODE_ZAWENABLED
     * @type {Integer (Int32)}
     */
    static ZAWENABLED => 13

    /**
     * Native name: MSIRUNMODE_RESERVED14
     * @type {Integer (Int32)}
     */
    static RESERVED14 => 14

    /**
     * Native name: MSIRUNMODE_RESERVED15
     * @type {Integer (Int32)}
     */
    static RESERVED15 => 15

    /**
     * Native name: MSIRUNMODE_SCHEDULED
     * @type {Integer (Int32)}
     */
    static SCHEDULED => 16

    /**
     * Native name: MSIRUNMODE_ROLLBACK
     * @type {Integer (Int32)}
     */
    static ROLLBACK => 17

    /**
     * Native name: MSIRUNMODE_COMMIT
     * @type {Integer (Int32)}
     */
    static COMMIT => 18
}
