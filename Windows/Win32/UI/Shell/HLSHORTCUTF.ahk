#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct HLSHORTCUTF {
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
    static HLSHORTCUTF_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static HLSHORTCUTF_DONTACTUALLYCREATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static HLSHORTCUTF_USEFILENAMEFROMFRIENDLYNAME => 2

    /**
     * @type {Integer (Int32)}
     */
    static HLSHORTCUTF_USEUNIQUEFILENAME => 4

    /**
     * @type {Integer (Int32)}
     */
    static HLSHORTCUTF_MAYUSEEXISTINGSHORTCUT => 8
}
