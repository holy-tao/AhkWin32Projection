#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct WINTRUST_DATA_UICHOICE {
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
    static WTD_UI_ALL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_UI_NONE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_UI_NOBAD => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WTD_UI_NOGOOD => 4
}
