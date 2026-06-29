#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IMMPID_CPV_ENUM {
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
    static IMMPID_CPV_BEFORE__ => 32767

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_CP_START => 32768

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_CPV_AFTER__ => 32769
}
