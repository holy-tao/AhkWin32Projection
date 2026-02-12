#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Defines the relationship between packages to be retrieved.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagerelationship
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class PackageRelationship extends Win32Enum{

    /**
     * Gets dependencies of the current package.
     * @type {Integer (Int32)}
     */
    static Dependencies => 0

    /**
     * Gets dependents of the current package.
     * @type {Integer (Int32)}
     */
    static Dependents => 1

    /**
     * Gets dependencies and dependents of the current package.
     * @type {Integer (Int32)}
     */
    static All => 2
}
