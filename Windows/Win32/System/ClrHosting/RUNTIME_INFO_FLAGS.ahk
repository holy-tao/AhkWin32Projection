#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct RUNTIME_INFO_FLAGS {
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
    static RUNTIME_INFO_UPGRADE_VERSION => 1

    /**
     * @type {Integer (Int32)}
     */
    static RUNTIME_INFO_REQUEST_IA64 => 2

    /**
     * @type {Integer (Int32)}
     */
    static RUNTIME_INFO_REQUEST_AMD64 => 4

    /**
     * @type {Integer (Int32)}
     */
    static RUNTIME_INFO_REQUEST_X86 => 8

    /**
     * @type {Integer (Int32)}
     */
    static RUNTIME_INFO_DONT_RETURN_DIRECTORY => 16

    /**
     * @type {Integer (Int32)}
     */
    static RUNTIME_INFO_DONT_RETURN_VERSION => 32

    /**
     * @type {Integer (Int32)}
     */
    static RUNTIME_INFO_DONT_SHOW_ERROR_DIALOG => 64

    /**
     * @type {Integer (Int32)}
     */
    static RUNTIME_INFO_IGNORE_ERROR_MODE => 4096

    /**
     * @type {Integer (Int32)}
     */
    static RUNTIME_INFO_REQUEST_ARM64 => 8192
}
