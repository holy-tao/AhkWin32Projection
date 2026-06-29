#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the action to take on a file that exists or doesn't exist.
 * @see https://learn.microsoft.com/windows/win32/api/windowsstoragecom/ne-windowsstoragecom-handle_creation_options
 * @namespace Windows.Win32.System.WinRT.Storage
 */
export default struct HANDLE_CREATION_OPTIONS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Create a new file, only if it doesn't already exist.
     * @type {Integer (Int32)}
     */
    static HCO_CREATE_NEW => 1

    /**
     * Create a new file, always.
     * @type {Integer (Int32)}
     */
    static HCO_CREATE_ALWAYS => 2

    /**
     * Open a file only if it exists.
     * @type {Integer (Int32)}
     */
    static HCO_OPEN_EXISTING => 3

    /**
     * Open a file, always.
     * @type {Integer (Int32)}
     */
    static HCO_OPEN_ALWAYS => 4

    /**
     * Open a file and truncates it so that its size is zero bytes, only if it exists.
     * @type {Integer (Int32)}
     */
    static HCO_TRUNCATE_EXISTING => 5
}
