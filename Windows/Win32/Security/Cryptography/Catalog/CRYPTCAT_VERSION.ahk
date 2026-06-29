#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Catalog
 */
export default struct CRYPTCAT_VERSION {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_VERSION_1 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_VERSION_2 => 512
}
