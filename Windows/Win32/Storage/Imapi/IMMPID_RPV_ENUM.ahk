#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IMMPID_RPV_ENUM {
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
    static IMMPID_RPV_BEFORE__ => 16383

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_RPV_DONT_DELIVER => 16384

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_RPV_NO_NAME_COLLISIONS => 16385

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_RPV_AFTER__ => 16386
}
