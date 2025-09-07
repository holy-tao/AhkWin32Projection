#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the processor architectures for a framework package dependency that you create by using the TryCreatePackageDependency function.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ne-appmodel-packagedependencyprocessorarchitectures
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class PackageDependencyProcessorArchitectures{

    /**
     * No processor architecture is specified.
     * @type {Integer (Int32)}
     */
    static PackageDependencyProcessorArchitectures_None => 0

    /**
     * Specifies the neutral architecture.
     * @type {Integer (Int32)}
     */
    static PackageDependencyProcessorArchitectures_Neutral => 1

    /**
     * Specifies the x86 architecture.
     * @type {Integer (Int32)}
     */
    static PackageDependencyProcessorArchitectures_X86 => 2

    /**
     * Specifies the x64 architecture.
     * @type {Integer (Int32)}
     */
    static PackageDependencyProcessorArchitectures_X64 => 4

    /**
     * Specifies the ARM architecture.
     * @type {Integer (Int32)}
     */
    static PackageDependencyProcessorArchitectures_Arm => 8

    /**
     * Specifies the ARM64 architecture.
     * @type {Integer (Int32)}
     */
    static PackageDependencyProcessorArchitectures_Arm64 => 16

    /**
     * Specifies the x86/A64 architecture.
     * @type {Integer (Int32)}
     */
    static PackageDependencyProcessorArchitectures_X86A64 => 32
}
