#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class msidbAssemblyAttributes extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static msidbAssemblyAttributesURT => 0

    /**
     * @type {Integer (Int32)}
     */
    static msidbAssemblyAttributesWin32 => 1
}
