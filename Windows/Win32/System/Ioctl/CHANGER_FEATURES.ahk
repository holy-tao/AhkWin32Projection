#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class CHANGER_FEATURES extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_BAR_CODE_SCANNER_INSTALLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_CARTRIDGE_MAGAZINE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_CLEANER_ACCESS_NOT_VALID => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_CLEANER_SLOT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_CLOSE_IEPORT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_DEVICE_REINITIALIZE_CAPABLE => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_DRIVE_CLEANING_REQUIRED => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_DRIVE_EMPTY_ON_DOOR_ACCESS => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_EXCHANGE_MEDIA => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_INIT_ELEM_STAT_WITH_RANGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_KEYPAD_ENABLE_DISABLE => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_LOCK_UNLOCK => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_MEDIUM_FLIP => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_OPEN_IEPORT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_POSITION_TO_ELEMENT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_PREDISMOUNT_EJECT_REQUIRED => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_PREMOUNT_EJECT_REQUIRED => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_REPORT_IEPORT_STATE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_SERIAL_NUMBER_VALID => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_STATUS_NON_VOLATILE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_STORAGE_DRIVE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_STORAGE_IEPORT => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_STORAGE_SLOT => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_STORAGE_TRANSPORT => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_VOLUME_ASSERT => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_VOLUME_IDENTIFICATION => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_VOLUME_REPLACE => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_VOLUME_SEARCH => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static CHANGER_VOLUME_UNDEFINE => 16777216
}
