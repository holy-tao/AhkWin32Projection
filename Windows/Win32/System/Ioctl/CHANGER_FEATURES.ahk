#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CHANGER_FEATURES extends Win32BitflagEnum {

    /**
     * Native name: CHANGER_BAR_CODE_SCANNER_INSTALLED
     * @type {Integer (UInt32)}
     */
    static BAR_CODE_SCANNER_INSTALLED => 1

    /**
     * Native name: CHANGER_CARTRIDGE_MAGAZINE
     * @type {Integer (UInt32)}
     */
    static CARTRIDGE_MAGAZINE => 256

    /**
     * Native name: CHANGER_CLEANER_ACCESS_NOT_VALID
     * @type {Integer (UInt32)}
     */
    static CLEANER_ACCESS_NOT_VALID => 262144

    /**
     * Native name: CHANGER_CLEANER_SLOT
     * @type {Integer (UInt32)}
     */
    static CLEANER_SLOT => 64

    /**
     * Native name: CHANGER_CLOSE_IEPORT
     * @type {Integer (UInt32)}
     */
    static CLOSE_IEPORT => 4

    /**
     * Native name: CHANGER_DEVICE_REINITIALIZE_CAPABLE
     * @type {Integer (UInt32)}
     */
    static DEVICE_REINITIALIZE_CAPABLE => 134217728

    /**
     * Native name: CHANGER_DRIVE_CLEANING_REQUIRED
     * @type {Integer (UInt32)}
     */
    static DRIVE_CLEANING_REQUIRED => 65536

    /**
     * Native name: CHANGER_DRIVE_EMPTY_ON_DOOR_ACCESS
     * @type {Integer (UInt32)}
     */
    static DRIVE_EMPTY_ON_DOOR_ACCESS => 536870912

    /**
     * Native name: CHANGER_EXCHANGE_MEDIA
     * @type {Integer (UInt32)}
     */
    static EXCHANGE_MEDIA => 32

    /**
     * Native name: CHANGER_INIT_ELEM_STAT_WITH_RANGE
     * @type {Integer (UInt32)}
     */
    static INIT_ELEM_STAT_WITH_RANGE => 2

    /**
     * Native name: CHANGER_KEYPAD_ENABLE_DISABLE
     * @type {Integer (UInt32)}
     */
    static KEYPAD_ENABLE_DISABLE => 268435456

    /**
     * Native name: CHANGER_LOCK_UNLOCK
     * @type {Integer (UInt32)}
     */
    static LOCK_UNLOCK => 128

    /**
     * Native name: CHANGER_MEDIUM_FLIP
     * @type {Integer (UInt32)}
     */
    static MEDIUM_FLIP => 512

    /**
     * Native name: CHANGER_OPEN_IEPORT
     * @type {Integer (UInt32)}
     */
    static OPEN_IEPORT => 8

    /**
     * Native name: CHANGER_POSITION_TO_ELEMENT
     * @type {Integer (UInt32)}
     */
    static POSITION_TO_ELEMENT => 1024

    /**
     * Native name: CHANGER_PREDISMOUNT_EJECT_REQUIRED
     * @type {Integer (UInt32)}
     */
    static PREDISMOUNT_EJECT_REQUIRED => 131072

    /**
     * Native name: CHANGER_PREMOUNT_EJECT_REQUIRED
     * @type {Integer (UInt32)}
     */
    static PREMOUNT_EJECT_REQUIRED => 524288

    /**
     * Native name: CHANGER_REPORT_IEPORT_STATE
     * @type {Integer (UInt32)}
     */
    static REPORT_IEPORT_STATE => 2048

    /**
     * Native name: CHANGER_SERIAL_NUMBER_VALID
     * @type {Integer (UInt32)}
     */
    static SERIAL_NUMBER_VALID => 67108864

    /**
     * Native name: CHANGER_STATUS_NON_VOLATILE
     * @type {Integer (UInt32)}
     */
    static STATUS_NON_VOLATILE => 16

    /**
     * Native name: CHANGER_STORAGE_DRIVE
     * @type {Integer (UInt32)}
     */
    static STORAGE_DRIVE => 4096

    /**
     * Native name: CHANGER_STORAGE_IEPORT
     * @type {Integer (UInt32)}
     */
    static STORAGE_IEPORT => 8192

    /**
     * Native name: CHANGER_STORAGE_SLOT
     * @type {Integer (UInt32)}
     */
    static STORAGE_SLOT => 16384

    /**
     * Native name: CHANGER_STORAGE_TRANSPORT
     * @type {Integer (UInt32)}
     */
    static STORAGE_TRANSPORT => 32768

    /**
     * Native name: CHANGER_VOLUME_ASSERT
     * @type {Integer (UInt32)}
     */
    static VOLUME_ASSERT => 4194304

    /**
     * Native name: CHANGER_VOLUME_IDENTIFICATION
     * @type {Integer (UInt32)}
     */
    static VOLUME_IDENTIFICATION => 1048576

    /**
     * Native name: CHANGER_VOLUME_REPLACE
     * @type {Integer (UInt32)}
     */
    static VOLUME_REPLACE => 8388608

    /**
     * Native name: CHANGER_VOLUME_SEARCH
     * @type {Integer (UInt32)}
     */
    static VOLUME_SEARCH => 2097152

    /**
     * Native name: CHANGER_VOLUME_UNDEFINE
     * @type {Integer (UInt32)}
     */
    static VOLUME_UNDEFINE => 16777216
}
