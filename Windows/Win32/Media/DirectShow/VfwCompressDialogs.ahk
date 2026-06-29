#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a dialog box that might exist in a Video for Windows compression (codec) driver.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-vfwcompressdialogs
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct VfwCompressDialogs {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Configure dialog box.
     * @type {Integer (Int32)}
     */
    static VfwCompressDialog_Config => 1

    /**
     * About dialog box.
     * @type {Integer (Int32)}
     */
    static VfwCompressDialog_About => 2

    /**
     * Specifies whether the Configure dialog box is available.
     * @type {Integer (Int32)}
     */
    static VfwCompressDialog_QueryConfig => 4

    /**
     * Specifies whether the About dialog box is available.
     * @type {Integer (Int32)}
     */
    static VfwCompressDialog_QueryAbout => 8
}
