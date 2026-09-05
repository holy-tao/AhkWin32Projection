#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemInformation
 */
class PROCESSOR_ARCHITECTURE extends Win32Enum {

    /**
     * Native name: PROCESSOR_ARCHITECTURE_INTEL
     * @type {Integer (UInt16)}
     */
    static INTEL => 0

    /**
     * Native name: PROCESSOR_ARCHITECTURE_MIPS
     * @type {Integer (UInt16)}
     */
    static MIPS => 1

    /**
     * Native name: PROCESSOR_ARCHITECTURE_ALPHA
     * @type {Integer (UInt16)}
     */
    static ALPHA => 2

    /**
     * Native name: PROCESSOR_ARCHITECTURE_PPC
     * @type {Integer (UInt16)}
     */
    static PPC => 3

    /**
     * Native name: PROCESSOR_ARCHITECTURE_SHX
     * @type {Integer (UInt16)}
     */
    static SHX => 4

    /**
     * Native name: PROCESSOR_ARCHITECTURE_ARM
     * @type {Integer (UInt16)}
     */
    static ARM => 5

    /**
     * Native name: PROCESSOR_ARCHITECTURE_IA64
     * @type {Integer (UInt16)}
     */
    static IA64 => 6

    /**
     * Native name: PROCESSOR_ARCHITECTURE_ALPHA64
     * @type {Integer (UInt16)}
     */
    static ALPHA64 => 7

    /**
     * Native name: PROCESSOR_ARCHITECTURE_MSIL
     * @type {Integer (UInt16)}
     */
    static MSIL => 8

    /**
     * Native name: PROCESSOR_ARCHITECTURE_AMD64
     * @type {Integer (UInt16)}
     */
    static AMD64 => 9

    /**
     * Native name: PROCESSOR_ARCHITECTURE_IA32_ON_WIN64
     * @type {Integer (UInt16)}
     */
    static IA32_ON_WIN64 => 10

    /**
     * Native name: PROCESSOR_ARCHITECTURE_NEUTRAL
     * @type {Integer (UInt16)}
     */
    static NEUTRAL => 11

    /**
     * Native name: PROCESSOR_ARCHITECTURE_ARM64
     * @type {Integer (UInt16)}
     */
    static ARM64 => 12

    /**
     * Native name: PROCESSOR_ARCHITECTURE_ARM32_ON_WIN64
     * @type {Integer (UInt16)}
     */
    static ARM32_ON_WIN64 => 13

    /**
     * Native name: PROCESSOR_ARCHITECTURE_IA32_ON_ARM64
     * @type {Integer (UInt16)}
     */
    static IA32_ON_ARM64 => 14

    /**
     * Native name: PROCESSOR_ARCHITECTURE_UNKNOWN
     * @type {Integer (UInt16)}
     */
    static UNKNOWN => 65535
}
