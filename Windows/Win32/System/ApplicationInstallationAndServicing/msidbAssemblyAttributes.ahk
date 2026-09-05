#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class msidbAssemblyAttributes extends Win32Enum {

    /**
     * Native name: msidbAssemblyAttributesURT
     * @type {Integer (Int32)}
     */
    static AttributesURT => 0

    /**
     * Native name: msidbAssemblyAttributesWin32
     * @type {Integer (Int32)}
     */
    static Win32 => 1
}
