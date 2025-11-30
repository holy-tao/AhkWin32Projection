#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class GET_CHANGER_PARAMETERS_FEATURES1 extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_CLEANER_AUTODISMOUNT => 2147483652

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_CLEANER_OPS_NOT_SUPPORTED => 2147483712

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_IEPORT_USER_CONTROL_CLOSE => 2147483904

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_IEPORT_USER_CONTROL_OPEN => 2147483776

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_MOVE_EXTENDS_IEPORT => 2147484160

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_MOVE_RETRACTS_IEPORT => 2147484672

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_PREDISMOUNT_ALIGN_TO_DRIVE => 2147483650

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_PREDISMOUNT_ALIGN_TO_SLOT => 2147483649

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_RTN_MEDIA_TO_ORIGINAL_ADDR => 2147483680

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_SLOTS_USE_TRAYS => 2147483664

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_TRUE_EXCHANGE_CAPABLE => 2147483656
}
