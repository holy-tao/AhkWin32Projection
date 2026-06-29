#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the IORING API version.
 * @see https://learn.microsoft.com/windows/win32/api/ntioring_x/ne-ntioring_x-ioring_version
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct IORING_VERSION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Invalid version.
     * @type {Integer (Int32)}
     */
    static IORING_VERSION_INVALID => 0

    /**
     * Version 1.
     * @type {Integer (Int32)}
     */
    static IORING_VERSION_1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static IORING_VERSION_2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static IORING_VERSION_3 => 300

    /**
     * @type {Integer (Int32)}
     */
    static IORING_VERSION_4 => 400
}
