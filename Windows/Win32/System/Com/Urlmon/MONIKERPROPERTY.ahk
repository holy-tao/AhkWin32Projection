#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct MONIKERPROPERTY {
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
    static MIMETYPEPROP => 0

    /**
     * @type {Integer (Int32)}
     */
    static USE_SRC_URL => 1

    /**
     * @type {Integer (Int32)}
     */
    static CLASSIDPROP => 2

    /**
     * @type {Integer (Int32)}
     */
    static TRUSTEDDOWNLOADPROP => 3

    /**
     * @type {Integer (Int32)}
     */
    static POPUPLEVELPROP => 4
}
