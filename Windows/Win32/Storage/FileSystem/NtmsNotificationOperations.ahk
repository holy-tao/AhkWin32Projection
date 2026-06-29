#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NtmsNotificationOperations {
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
    static NTMS_OBJ_UPDATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_OBJ_INSERT => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_OBJ_DELETE => 3

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_EVENT_SIGNAL => 4

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_EVENT_COMPLETE => 5
}
