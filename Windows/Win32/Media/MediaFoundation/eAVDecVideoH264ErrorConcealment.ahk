#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVDecVideoH264ErrorConcealment {
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
    static eErrorConcealmentTypeDrop => 0

    /**
     * @type {Integer (Int32)}
     */
    static eErrorConcealmentTypeBasic => 1

    /**
     * @type {Integer (Int32)}
     */
    static eErrorConcealmentTypeAdvanced => 2

    /**
     * @type {Integer (Int32)}
     */
    static eErrorConcealmentTypeDXVASetBlack => 3
}
