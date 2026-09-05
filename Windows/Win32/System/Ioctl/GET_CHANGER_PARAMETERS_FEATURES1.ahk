#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class GET_CHANGER_PARAMETERS_FEATURES1 extends Win32BitflagEnum {

    /**
     * Native name: CHANGER_CLEANER_AUTODISMOUNT
     * @type {Integer (UInt32)}
     */
    static CLEANER_AUTODISMOUNT => 2147483652

    /**
     * Native name: CHANGER_CLEANER_OPS_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static CLEANER_OPS_NOT_SUPPORTED => 2147483712

    /**
     * Native name: CHANGER_IEPORT_USER_CONTROL_CLOSE
     * @type {Integer (UInt32)}
     */
    static IEPORT_USER_CONTROL_CLOSE => 2147483904

    /**
     * Native name: CHANGER_IEPORT_USER_CONTROL_OPEN
     * @type {Integer (UInt32)}
     */
    static IEPORT_USER_CONTROL_OPEN => 2147483776

    /**
     * Native name: CHANGER_MOVE_EXTENDS_IEPORT
     * @type {Integer (UInt32)}
     */
    static MOVE_EXTENDS_IEPORT => 2147484160

    /**
     * Native name: CHANGER_MOVE_RETRACTS_IEPORT
     * @type {Integer (UInt32)}
     */
    static MOVE_RETRACTS_IEPORT => 2147484672

    /**
     * Native name: CHANGER_PREDISMOUNT_ALIGN_TO_DRIVE
     * @type {Integer (UInt32)}
     */
    static PREDISMOUNT_ALIGN_TO_DRIVE => 2147483650

    /**
     * Native name: CHANGER_PREDISMOUNT_ALIGN_TO_SLOT
     * @type {Integer (UInt32)}
     */
    static PREDISMOUNT_ALIGN_TO_SLOT => 2147483649

    /**
     * Native name: CHANGER_RTN_MEDIA_TO_ORIGINAL_ADDR
     * @type {Integer (UInt32)}
     */
    static RTN_MEDIA_TO_ORIGINAL_ADDR => 2147483680

    /**
     * Native name: CHANGER_SLOTS_USE_TRAYS
     * @type {Integer (UInt32)}
     */
    static SLOTS_USE_TRAYS => 2147483664

    /**
     * Native name: CHANGER_TRUE_EXCHANGE_CAPABLE
     * @type {Integer (UInt32)}
     */
    static TRUE_EXCHANGE_CAPABLE => 2147483656
}
