#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class REINSTALLMODE{

    /**
     * @type {Integer (Int32)}
     */
    static REINSTALLMODE_REPAIR => 1

    /**
     * @type {Integer (Int32)}
     */
    static REINSTALLMODE_FILEMISSING => 2

    /**
     * @type {Integer (Int32)}
     */
    static REINSTALLMODE_FILEOLDERVERSION => 4

    /**
     * @type {Integer (Int32)}
     */
    static REINSTALLMODE_FILEEQUALVERSION => 8

    /**
     * @type {Integer (Int32)}
     */
    static REINSTALLMODE_FILEEXACT => 16

    /**
     * @type {Integer (Int32)}
     */
    static REINSTALLMODE_FILEVERIFY => 32

    /**
     * @type {Integer (Int32)}
     */
    static REINSTALLMODE_FILEREPLACE => 64

    /**
     * @type {Integer (Int32)}
     */
    static REINSTALLMODE_MACHINEDATA => 128

    /**
     * @type {Integer (Int32)}
     */
    static REINSTALLMODE_USERDATA => 256

    /**
     * @type {Integer (Int32)}
     */
    static REINSTALLMODE_SHORTCUT => 512

    /**
     * @type {Integer (Int32)}
     */
    static REINSTALLMODE_PACKAGE => 1024
}
