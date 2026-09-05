#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class msirbRebootType extends Win32Enum {

    /**
     * Native name: msirbRebootImmediate
     * @type {Integer (Int32)}
     */
    static Immediate => 1

    /**
     * Native name: msirbRebootDeferred
     * @type {Integer (Int32)}
     */
    static Deferred => 2
}
