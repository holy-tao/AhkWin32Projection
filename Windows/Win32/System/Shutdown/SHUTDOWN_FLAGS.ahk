#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Shutdown
 * @version v4.0.30319
 */
class SHUTDOWN_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static SHUTDOWN_FORCE_OTHERS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SHUTDOWN_FORCE_SELF => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SHUTDOWN_RESTART => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SHUTDOWN_POWEROFF => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SHUTDOWN_NOREBOOT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SHUTDOWN_GRACE_OVERRIDE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SHUTDOWN_INSTALL_UPDATES => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SHUTDOWN_RESTARTAPPS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SHUTDOWN_SKIP_SVC_PRESHUTDOWN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SHUTDOWN_HYBRID => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SHUTDOWN_RESTART_BOOTOPTIONS => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SHUTDOWN_SOFT_REBOOT => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static SHUTDOWN_MOBILE_UI => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SHUTDOWN_ARSO => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SHUTDOWN_CHECK_SAFE_FOR_SERVER => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SHUTDOWN_VAIL_CONTAINER => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static SHUTDOWN_SYSTEM_INITIATED => 65536
}
