#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemInformation
 * @version v4.0.30319
 */
class IMAGE_FILE_MACHINE extends Win32Enum{

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_AXP64 => 644

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_I386 => 332

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_IA64 => 512

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_AMD64 => 34404

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_UNKNOWN => 0

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_TARGET_HOST => 1

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_R3000 => 354

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_R4000 => 358

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_R10000 => 360

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_WCEMIPSV2 => 361

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_ALPHA => 388

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_SH3 => 418

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_SH3DSP => 419

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_SH3E => 420

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_SH4 => 422

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_SH5 => 424

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_ARM => 448

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_THUMB => 450

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_ARMNT => 452

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_AM33 => 467

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_POWERPC => 496

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_POWERPCFP => 497

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_MIPS16 => 614

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_ALPHA64 => 644

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_MIPSFPU => 870

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_MIPSFPU16 => 1126

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_TRICORE => 1312

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_CEF => 3311

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_EBC => 3772

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_M32R => 36929

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_ARM64 => 43620

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_FILE_MACHINE_CEE => 49390
}
