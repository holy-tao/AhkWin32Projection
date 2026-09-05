#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class TAPE_GET_DRIVE_PARAMETERS_FEATURES_HIGH extends Win32BitflagEnum {

    /**
     * Native name: TAPE_DRIVE_ABS_BLK_IMMED
     * @type {Integer (UInt32)}
     */
    static ABS_BLK_IMMED => 2147491840

    /**
     * Native name: TAPE_DRIVE_ABSOLUTE_BLK
     * @type {Integer (UInt32)}
     */
    static ABSOLUTE_BLK => 2147487744

    /**
     * Native name: TAPE_DRIVE_END_OF_DATA
     * @type {Integer (UInt32)}
     */
    static END_OF_DATA => 2147549184

    /**
     * Native name: TAPE_DRIVE_FILEMARKS
     * @type {Integer (UInt32)}
     */
    static FILEMARKS => 2147745792

    /**
     * Native name: TAPE_DRIVE_LOAD_UNLOAD
     * @type {Integer (UInt32)}
     */
    static LOAD_UNLOAD => 2147483649

    /**
     * Native name: TAPE_DRIVE_LOAD_UNLD_IMMED
     * @type {Integer (UInt32)}
     */
    static LOAD_UNLD_IMMED => 2147483680

    /**
     * Native name: TAPE_DRIVE_LOCK_UNLOCK
     * @type {Integer (UInt32)}
     */
    static LOCK_UNLOCK => 2147483652

    /**
     * Native name: TAPE_DRIVE_LOCK_UNLK_IMMED
     * @type {Integer (UInt32)}
     */
    static LOCK_UNLK_IMMED => 2147483776

    /**
     * Native name: TAPE_DRIVE_LOG_BLK_IMMED
     * @type {Integer (UInt32)}
     */
    static LOG_BLK_IMMED => 2147516416

    /**
     * Native name: TAPE_DRIVE_LOGICAL_BLK
     * @type {Integer (UInt32)}
     */
    static LOGICAL_BLK => 2147500032

    /**
     * Native name: TAPE_DRIVE_RELATIVE_BLKS
     * @type {Integer (UInt32)}
     */
    static RELATIVE_BLKS => 2147614720

    /**
     * Native name: TAPE_DRIVE_REVERSE_POSITION
     * @type {Integer (UInt32)}
     */
    static REVERSE_POSITION => 2151677952

    /**
     * Native name: TAPE_DRIVE_REWIND_IMMEDIATE
     * @type {Integer (UInt32)}
     */
    static REWIND_IMMEDIATE => 2147483656

    /**
     * Native name: TAPE_DRIVE_SEQUENTIAL_FMKS
     * @type {Integer (UInt32)}
     */
    static SEQUENTIAL_FMKS => 2148007936

    /**
     * Native name: TAPE_DRIVE_SEQUENTIAL_SMKS
     * @type {Integer (UInt32)}
     */
    static SEQUENTIAL_SMKS => 2149580800

    /**
     * Native name: TAPE_DRIVE_SET_BLOCK_SIZE
     * @type {Integer (UInt32)}
     */
    static SET_BLOCK_SIZE => 2147483664

    /**
     * Native name: TAPE_DRIVE_SET_COMPRESSION
     * @type {Integer (UInt32)}
     */
    static SET_COMPRESSION => 2147484160

    /**
     * Native name: TAPE_DRIVE_SET_ECC
     * @type {Integer (UInt32)}
     */
    static SET_ECC => 2147483904

    /**
     * Native name: TAPE_DRIVE_SET_PADDING
     * @type {Integer (UInt32)}
     */
    static SET_PADDING => 2147484672

    /**
     * Native name: TAPE_DRIVE_SET_REPORT_SMKS
     * @type {Integer (UInt32)}
     */
    static SET_REPORT_SMKS => 2147485696

    /**
     * Native name: TAPE_DRIVE_SETMARKS
     * @type {Integer (UInt32)}
     */
    static SETMARKS => 2148532224

    /**
     * Native name: TAPE_DRIVE_SPACE_IMMEDIATE
     * @type {Integer (UInt32)}
     */
    static SPACE_IMMEDIATE => 2155872256

    /**
     * Native name: TAPE_DRIVE_TENSION
     * @type {Integer (UInt32)}
     */
    static TENSION => 2147483650

    /**
     * Native name: TAPE_DRIVE_TENSION_IMMED
     * @type {Integer (UInt32)}
     */
    static TENSION_IMMED => 2147483712

    /**
     * Native name: TAPE_DRIVE_WRITE_FILEMARKS
     * @type {Integer (UInt32)}
     */
    static WRITE_FILEMARKS => 2181038080

    /**
     * Native name: TAPE_DRIVE_WRITE_LONG_FMKS
     * @type {Integer (UInt32)}
     */
    static WRITE_LONG_FMKS => 2281701376

    /**
     * Native name: TAPE_DRIVE_WRITE_MARK_IMMED
     * @type {Integer (UInt32)}
     */
    static WRITE_MARK_IMMED => 2415919104

    /**
     * Native name: TAPE_DRIVE_WRITE_SETMARKS
     * @type {Integer (UInt32)}
     */
    static WRITE_SETMARKS => 2164260864

    /**
     * Native name: TAPE_DRIVE_WRITE_SHORT_FMKS
     * @type {Integer (UInt32)}
     */
    static WRITE_SHORT_FMKS => 2214592512
}
