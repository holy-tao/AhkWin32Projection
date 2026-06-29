#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The REINSTALLMODE property is a string that contains letters specifying the type of reinstall to perform.
 * @see https://learn.microsoft.com/windows/win32/Msi/reinstallmode
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct REINSTALLMODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
