#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_AUVRHP_ROOMMODEL {
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
    static VRHP_SMALLROOM => 0

    /**
     * @type {Integer (Int32)}
     */
    static VRHP_MEDIUMROOM => 1

    /**
     * @type {Integer (Int32)}
     */
    static VRHP_BIGROOM => 2

    /**
     * @type {Integer (Int32)}
     */
    static VRHP_CUSTUMIZEDROOM => 3
}
