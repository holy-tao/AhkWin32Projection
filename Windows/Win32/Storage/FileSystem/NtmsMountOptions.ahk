#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NtmsMountOptions {
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
    static NTMS_MOUNT_READ => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MOUNT_WRITE => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MOUNT_ERROR_NOT_AVAILABLE => 4

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MOUNT_ERROR_IF_UNAVAILABLE => 4

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MOUNT_ERROR_OFFLINE => 8

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MOUNT_ERROR_IF_OFFLINE => 8

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MOUNT_SPECIFIC_DRIVE => 16

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MOUNT_NOWAIT => 32
}
