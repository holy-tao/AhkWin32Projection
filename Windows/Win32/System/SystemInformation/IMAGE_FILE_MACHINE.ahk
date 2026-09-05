#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemInformation
 */
class IMAGE_FILE_MACHINE extends Win32Enum {

    /**
     * Native name: IMAGE_FILE_MACHINE_AXP64
     * @type {Integer (UInt16)}
     */
    static AXP64 => 644

    /**
     * Native name: IMAGE_FILE_MACHINE_I386
     * @type {Integer (UInt16)}
     */
    static I386 => 332

    /**
     * Native name: IMAGE_FILE_MACHINE_IA64
     * @type {Integer (UInt16)}
     */
    static IA64 => 512

    /**
     * Native name: IMAGE_FILE_MACHINE_AMD64
     * @type {Integer (UInt16)}
     */
    static AMD64 => 34404

    /**
     * Native name: IMAGE_FILE_MACHINE_UNKNOWN
     * @type {Integer (UInt16)}
     */
    static UNKNOWN => 0

    /**
     * Native name: IMAGE_FILE_MACHINE_TARGET_HOST
     * @type {Integer (UInt16)}
     */
    static TARGET_HOST => 1

    /**
     * Native name: IMAGE_FILE_MACHINE_R3000
     * @type {Integer (UInt16)}
     */
    static R3000 => 354

    /**
     * Native name: IMAGE_FILE_MACHINE_R4000
     * @type {Integer (UInt16)}
     */
    static R4000 => 358

    /**
     * Native name: IMAGE_FILE_MACHINE_R10000
     * @type {Integer (UInt16)}
     */
    static R10000 => 360

    /**
     * Native name: IMAGE_FILE_MACHINE_WCEMIPSV2
     * @type {Integer (UInt16)}
     */
    static WCEMIPSV2 => 361

    /**
     * Native name: IMAGE_FILE_MACHINE_ALPHA
     * @type {Integer (UInt16)}
     */
    static ALPHA => 388

    /**
     * Native name: IMAGE_FILE_MACHINE_SH3
     * @type {Integer (UInt16)}
     */
    static SH3 => 418

    /**
     * Native name: IMAGE_FILE_MACHINE_SH3DSP
     * @type {Integer (UInt16)}
     */
    static SH3DSP => 419

    /**
     * Native name: IMAGE_FILE_MACHINE_SH3E
     * @type {Integer (UInt16)}
     */
    static SH3E => 420

    /**
     * Native name: IMAGE_FILE_MACHINE_SH4
     * @type {Integer (UInt16)}
     */
    static SH4 => 422

    /**
     * Native name: IMAGE_FILE_MACHINE_SH5
     * @type {Integer (UInt16)}
     */
    static SH5 => 424

    /**
     * Native name: IMAGE_FILE_MACHINE_ARM
     * @type {Integer (UInt16)}
     */
    static ARM => 448

    /**
     * Native name: IMAGE_FILE_MACHINE_THUMB
     * @type {Integer (UInt16)}
     */
    static THUMB => 450

    /**
     * Native name: IMAGE_FILE_MACHINE_ARMNT
     * @type {Integer (UInt16)}
     */
    static ARMNT => 452

    /**
     * Native name: IMAGE_FILE_MACHINE_AM33
     * @type {Integer (UInt16)}
     */
    static AM33 => 467

    /**
     * Native name: IMAGE_FILE_MACHINE_POWERPC
     * @type {Integer (UInt16)}
     */
    static POWERPC => 496

    /**
     * Native name: IMAGE_FILE_MACHINE_POWERPCFP
     * @type {Integer (UInt16)}
     */
    static POWERPCFP => 497

    /**
     * Native name: IMAGE_FILE_MACHINE_MIPS16
     * @type {Integer (UInt16)}
     */
    static MIPS16 => 614

    /**
     * Native name: IMAGE_FILE_MACHINE_ALPHA64
     * @type {Integer (UInt16)}
     */
    static ALPHA64 => 644

    /**
     * Native name: IMAGE_FILE_MACHINE_MIPSFPU
     * @type {Integer (UInt16)}
     */
    static MIPSFPU => 870

    /**
     * Native name: IMAGE_FILE_MACHINE_MIPSFPU16
     * @type {Integer (UInt16)}
     */
    static MIPSFPU16 => 1126

    /**
     * Native name: IMAGE_FILE_MACHINE_TRICORE
     * @type {Integer (UInt16)}
     */
    static TRICORE => 1312

    /**
     * Native name: IMAGE_FILE_MACHINE_CEF
     * @type {Integer (UInt16)}
     */
    static CEF => 3311

    /**
     * Native name: IMAGE_FILE_MACHINE_EBC
     * @type {Integer (UInt16)}
     */
    static EBC => 3772

    /**
     * Native name: IMAGE_FILE_MACHINE_M32R
     * @type {Integer (UInt16)}
     */
    static M32R => 36929

    /**
     * Native name: IMAGE_FILE_MACHINE_ARM64
     * @type {Integer (UInt16)}
     */
    static ARM64 => 43620

    /**
     * Native name: IMAGE_FILE_MACHINE_CEE
     * @type {Integer (UInt16)}
     */
    static CEE => 49390
}
