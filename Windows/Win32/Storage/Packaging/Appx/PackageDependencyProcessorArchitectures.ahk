#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines the processor architectures for a framework package dependency that you create by using the TryCreatePackageDependency function.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ne-appmodel-packagedependencyprocessorarchitectures
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
class PackageDependencyProcessorArchitectures extends Win32BitflagEnum {

    /**
     * No processor architecture is specified.
     * Native name: PackageDependencyProcessorArchitectures_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Specifies the neutral architecture.
     * Native name: PackageDependencyProcessorArchitectures_Neutral
     * @type {Integer (Int32)}
     */
    static Neutral => 1

    /**
     * Specifies the x86 architecture.
     * Native name: PackageDependencyProcessorArchitectures_X86
     * @type {Integer (Int32)}
     */
    static X86 => 2

    /**
     * Specifies the x64 architecture.
     * Native name: PackageDependencyProcessorArchitectures_X64
     * @type {Integer (Int32)}
     */
    static X64 => 4

    /**
     * Specifies the ARM architecture.
     * Native name: PackageDependencyProcessorArchitectures_Arm
     * @type {Integer (Int32)}
     */
    static Arm => 8

    /**
     * Specifies the ARM64 architecture.
     * Native name: PackageDependencyProcessorArchitectures_Arm64
     * @type {Integer (Int32)}
     */
    static Arm64 => 16

    /**
     * Specifies the x86/A64 architecture.
     * Native name: PackageDependencyProcessorArchitectures_X86A64
     * @type {Integer (Int32)}
     */
    static X86A64 => 32
}
