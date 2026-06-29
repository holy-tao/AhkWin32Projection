#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct VS_FIXEDFILEINFO_FILE_TYPE {
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
    static VFT_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static VFT_APP => 1

    /**
     * @type {Integer (Int32)}
     */
    static VFT_DLL => 2

    /**
     * @type {Integer (Int32)}
     */
    static VFT_DRV => 3

    /**
     * @type {Integer (Int32)}
     */
    static VFT_FONT => 4

    /**
     * @type {Integer (Int32)}
     */
    static VFT_VXD => 5

    /**
     * @type {Integer (Int32)}
     */
    static VFT_STATIC_LIB => 7
}
