#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct STORAGE_PROVIDER_FILE_FLAGS {
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
    static SPFF_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPFF_DOWNLOAD_BY_DEFAULT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPFF_CREATED_ON_THIS_DEVICE => 2
}
