#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemInformation
 * @version v4.0.30319
 */
class PROCESSOR_ARCHITECTURE extends Win32Enum{

    /**
     * @type {Integer (UInt16)}
     */
    static PROCESSOR_ARCHITECTURE_INTEL => 0

    /**
     * @type {Integer (UInt16)}
     */
    static PROCESSOR_ARCHITECTURE_MIPS => 1

    /**
     * @type {Integer (UInt16)}
     */
    static PROCESSOR_ARCHITECTURE_ALPHA => 2

    /**
     * @type {Integer (UInt16)}
     */
    static PROCESSOR_ARCHITECTURE_PPC => 3

    /**
     * @type {Integer (UInt16)}
     */
    static PROCESSOR_ARCHITECTURE_SHX => 4

    /**
     * @type {Integer (UInt16)}
     */
    static PROCESSOR_ARCHITECTURE_ARM => 5

    /**
     * @type {Integer (UInt16)}
     */
    static PROCESSOR_ARCHITECTURE_IA64 => 6

    /**
     * @type {Integer (UInt16)}
     */
    static PROCESSOR_ARCHITECTURE_ALPHA64 => 7

    /**
     * @type {Integer (UInt16)}
     */
    static PROCESSOR_ARCHITECTURE_MSIL => 8

    /**
     * @type {Integer (UInt16)}
     */
    static PROCESSOR_ARCHITECTURE_AMD64 => 9

    /**
     * @type {Integer (UInt16)}
     */
    static PROCESSOR_ARCHITECTURE_IA32_ON_WIN64 => 10

    /**
     * @type {Integer (UInt16)}
     */
    static PROCESSOR_ARCHITECTURE_NEUTRAL => 11

    /**
     * @type {Integer (UInt16)}
     */
    static PROCESSOR_ARCHITECTURE_ARM64 => 12

    /**
     * @type {Integer (UInt16)}
     */
    static PROCESSOR_ARCHITECTURE_ARM32_ON_WIN64 => 13

    /**
     * @type {Integer (UInt16)}
     */
    static PROCESSOR_ARCHITECTURE_IA32_ON_ARM64 => 14

    /**
     * @type {Integer (UInt16)}
     */
    static PROCESSOR_ARCHITECTURE_UNKNOWN => 65535
}
