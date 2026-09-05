#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The REINSTALLMODE property is a string that contains letters specifying the type of reinstall to perform.
 * @see https://learn.microsoft.com/windows/win32/Msi/reinstallmode
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class REINSTALLMODE extends Win32Enum {

    /**
     * Native name: REINSTALLMODE_REPAIR
     * @type {Integer (Int32)}
     */
    static REPAIR => 1

    /**
     * Native name: REINSTALLMODE_FILEMISSING
     * @type {Integer (Int32)}
     */
    static FILEMISSING => 2

    /**
     * Native name: REINSTALLMODE_FILEOLDERVERSION
     * @type {Integer (Int32)}
     */
    static FILEOLDERVERSION => 4

    /**
     * Native name: REINSTALLMODE_FILEEQUALVERSION
     * @type {Integer (Int32)}
     */
    static FILEEQUALVERSION => 8

    /**
     * Native name: REINSTALLMODE_FILEEXACT
     * @type {Integer (Int32)}
     */
    static FILEEXACT => 16

    /**
     * Native name: REINSTALLMODE_FILEVERIFY
     * @type {Integer (Int32)}
     */
    static FILEVERIFY => 32

    /**
     * Native name: REINSTALLMODE_FILEREPLACE
     * @type {Integer (Int32)}
     */
    static FILEREPLACE => 64

    /**
     * Native name: REINSTALLMODE_MACHINEDATA
     * @type {Integer (Int32)}
     */
    static MACHINEDATA => 128

    /**
     * Native name: REINSTALLMODE_USERDATA
     * @type {Integer (Int32)}
     */
    static USERDATA => 256

    /**
     * Native name: REINSTALLMODE_SHORTCUT
     * @type {Integer (Int32)}
     */
    static SHORTCUT => 512

    /**
     * Native name: REINSTALLMODE_PACKAGE
     * @type {Integer (Int32)}
     */
    static PACKAGE => 1024
}
