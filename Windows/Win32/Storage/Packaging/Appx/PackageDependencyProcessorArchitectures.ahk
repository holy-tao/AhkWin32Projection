#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ne-appmodel-packagedependencyprocessorarchitectures
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class PackageDependencyProcessorArchitectures{

    /**
     * @type {Integer (Int32)}
     */
    static PackageDependencyProcessorArchitectures_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static PackageDependencyProcessorArchitectures_Neutral => 1

    /**
     * @type {Integer (Int32)}
     */
    static PackageDependencyProcessorArchitectures_X86 => 2

    /**
     * @type {Integer (Int32)}
     */
    static PackageDependencyProcessorArchitectures_X64 => 4

    /**
     * @type {Integer (Int32)}
     */
    static PackageDependencyProcessorArchitectures_Arm => 8

    /**
     * @type {Integer (Int32)}
     */
    static PackageDependencyProcessorArchitectures_Arm64 => 16

    /**
     * @type {Integer (Int32)}
     */
    static PackageDependencyProcessorArchitectures_X86A64 => 32
}
