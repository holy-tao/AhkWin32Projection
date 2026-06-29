#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the level of access that a handle has on files.
 * @see https://learn.microsoft.com/windows/win32/api/windowsstoragecom/ne-windowsstoragecom-handle_access_options
 * @namespace Windows.Win32.System.WinRT.Storage
 */
export default struct HANDLE_ACCESS_OPTIONS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * None.
     * @type {Integer (Int32)}
     */
    static HAO_NONE => 0

    /**
     * The handle can be used to read file attributes.
     * @type {Integer (Int32)}
     */
    static HAO_READ_ATTRIBUTES => 128

    /**
     * The handle can be used to read the file.
     * @type {Integer (Int32)}
     */
    static HAO_READ => 1179785

    /**
     * The handle can be used to write to the file.
     * @type {Integer (Int32)}
     */
    static HAO_WRITE => 1179926

    /**
     * The handle can be used to delete the file.
     * @type {Integer (Int32)}
     */
    static HAO_DELETE => 65536
}
