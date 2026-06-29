#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct HOMEGROUPSHARINGCHOICES {
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
    static HGSC_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static HGSC_MUSICLIBRARY => 1

    /**
     * @type {Integer (Int32)}
     */
    static HGSC_PICTURESLIBRARY => 2

    /**
     * @type {Integer (Int32)}
     */
    static HGSC_VIDEOSLIBRARY => 4

    /**
     * @type {Integer (Int32)}
     */
    static HGSC_DOCUMENTSLIBRARY => 8

    /**
     * @type {Integer (Int32)}
     */
    static HGSC_PRINTERS => 16
}
