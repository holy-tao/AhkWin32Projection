#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class PM_APPLICATION_STATE extends Win32Enum {

    /**
     * Native name: PM_APPLICATION_STATE_MIN
     * @type {Integer (Int32)}
     */
    static MIN => 0

    /**
     * Native name: PM_APPLICATION_STATE_INSTALLED
     * @type {Integer (Int32)}
     */
    static INSTALLED => 1

    /**
     * Native name: PM_APPLICATION_STATE_INSTALLING
     * @type {Integer (Int32)}
     */
    static INSTALLING => 2

    /**
     * Native name: PM_APPLICATION_STATE_UPDATING
     * @type {Integer (Int32)}
     */
    static UPDATING => 3

    /**
     * Native name: PM_APPLICATION_STATE_UNINSTALLING
     * @type {Integer (Int32)}
     */
    static UNINSTALLING => 4

    /**
     * Native name: PM_APPLICATION_STATE_LICENSE_UPDATING
     * @type {Integer (Int32)}
     */
    static LICENSE_UPDATING => 5

    /**
     * Native name: PM_APPLICATION_STATE_MOVING
     * @type {Integer (Int32)}
     */
    static MOVING => 6

    /**
     * Native name: PM_APPLICATION_STATE_DISABLED_SD_CARD
     * @type {Integer (Int32)}
     */
    static DISABLED_SD_CARD => 7

    /**
     * Native name: PM_APPLICATION_STATE_DISABLED_ENTERPRISE
     * @type {Integer (Int32)}
     */
    static DISABLED_ENTERPRISE => 8

    /**
     * Native name: PM_APPLICATION_STATE_DISABLED_BACKING_UP
     * @type {Integer (Int32)}
     */
    static DISABLED_BACKING_UP => 9

    /**
     * Native name: PM_APPLICATION_STATE_DISABLED_MDIL_BINDING
     * @type {Integer (Int32)}
     */
    static DISABLED_MDIL_BINDING => 10

    /**
     * Native name: PM_APPLICATION_STATE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 10

    /**
     * Native name: PM_APPLICATION_STATE_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 11
}
