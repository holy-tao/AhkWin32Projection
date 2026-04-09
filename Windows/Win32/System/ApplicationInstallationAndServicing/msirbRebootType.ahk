#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class msirbRebootType extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static msirbRebootImmediate => 1

    /**
     * @type {Integer (Int32)}
     */
    static msirbRebootDeferred => 2
}
