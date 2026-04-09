#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class msidbPatchAttributes extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static msidbPatchAttributesNonVital => 1
}
