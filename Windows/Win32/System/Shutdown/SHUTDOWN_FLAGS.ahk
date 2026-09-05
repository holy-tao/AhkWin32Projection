#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Shutdown
 */
class SHUTDOWN_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: SHUTDOWN_FORCE_OTHERS
     * @type {Integer (UInt32)}
     */
    static FORCE_OTHERS => 1

    /**
     * Native name: SHUTDOWN_FORCE_SELF
     * @type {Integer (UInt32)}
     */
    static FORCE_SELF => 2

    /**
     * Native name: SHUTDOWN_RESTART
     * @type {Integer (UInt32)}
     */
    static RESTART => 4

    /**
     * Native name: SHUTDOWN_POWEROFF
     * @type {Integer (UInt32)}
     */
    static POWEROFF => 8

    /**
     * Native name: SHUTDOWN_NOREBOOT
     * @type {Integer (UInt32)}
     */
    static NOREBOOT => 16

    /**
     * Native name: SHUTDOWN_GRACE_OVERRIDE
     * @type {Integer (UInt32)}
     */
    static GRACE_OVERRIDE => 32

    /**
     * Native name: SHUTDOWN_INSTALL_UPDATES
     * @type {Integer (UInt32)}
     */
    static INSTALL_UPDATES => 64

    /**
     * Native name: SHUTDOWN_RESTARTAPPS
     * @type {Integer (UInt32)}
     */
    static RESTARTAPPS => 128

    /**
     * Native name: SHUTDOWN_SKIP_SVC_PRESHUTDOWN
     * @type {Integer (UInt32)}
     */
    static SKIP_SVC_PRESHUTDOWN => 256

    /**
     * Native name: SHUTDOWN_HYBRID
     * @type {Integer (UInt32)}
     */
    static HYBRID => 512

    /**
     * Native name: SHUTDOWN_RESTART_BOOTOPTIONS
     * @type {Integer (UInt32)}
     */
    static RESTART_BOOTOPTIONS => 1024

    /**
     * Native name: SHUTDOWN_SOFT_REBOOT
     * @type {Integer (UInt32)}
     */
    static SOFT_REBOOT => 2048

    /**
     * Native name: SHUTDOWN_MOBILE_UI
     * @type {Integer (UInt32)}
     */
    static MOBILE_UI => 4096

    /**
     * Native name: SHUTDOWN_ARSO
     * @type {Integer (UInt32)}
     */
    static ARSO => 8192

    /**
     * Native name: SHUTDOWN_CHECK_SAFE_FOR_SERVER
     * @type {Integer (UInt32)}
     */
    static CHECK_SAFE_FOR_SERVER => 16384

    /**
     * Native name: SHUTDOWN_VAIL_CONTAINER
     * @type {Integer (UInt32)}
     */
    static VAIL_CONTAINER => 32768

    /**
     * Native name: SHUTDOWN_SYSTEM_INITIATED
     * @type {Integer (UInt32)}
     */
    static SYSTEM_INITIATED => 65536

    /**
     * Native name: SHUTDOWN_UPDATE_POWEROFF
     * @type {Integer (UInt32)}
     */
    static UPDATE_POWEROFF => 131072
}
