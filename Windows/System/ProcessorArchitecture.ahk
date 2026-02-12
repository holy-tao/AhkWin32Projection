#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Specifies the processor architecture supported by an app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.processorarchitecture
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class ProcessorArchitecture extends Win32Enum{

    /**
     * The x86 processor architecture.
     * @type {Integer (Int32)}
     */
    static X86 => 0

    /**
     * The ARM processor architecture.
     * @type {Integer (Int32)}
     */
    static Arm => 5

    /**
     * The x64 processor architecture.
     * @type {Integer (Int32)}
     */
    static X64 => 9

    /**
     * A neutral processor architecture.
     * @type {Integer (Int32)}
     */
    static Neutral => 11

    /**
     * The Arm64 processor architecture
     * @type {Integer (Int32)}
     */
    static Arm64 => 12

    /**
     * The Arm64 processor architecture emulating the X86 architecture
     * @type {Integer (Int32)}
     */
    static X86OnArm64 => 14

    /**
     * An unknown processor architecture.
     * @type {Integer (Int32)}
     */
    static Unknown => 65535
}
