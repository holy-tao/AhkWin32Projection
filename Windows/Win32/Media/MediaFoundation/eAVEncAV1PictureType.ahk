#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct eAVEncAV1PictureType {
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
    static eAVEncAV1PictureType_Key => 0

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1PictureType_Intra_Only => 1

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1PictureType_Inter => 2

    /**
     * @type {Integer (Int32)}
     */
    static eAVEncAV1PictureType_Switch => 3
}
