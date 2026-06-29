#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NtmsOpreqState {
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
    static NTMS_OPSTATE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_OPSTATE_SUBMITTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_OPSTATE_ACTIVE => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_OPSTATE_INPROGRESS => 3

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_OPSTATE_REFUSED => 4

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_OPSTATE_COMPLETE => 5
}
