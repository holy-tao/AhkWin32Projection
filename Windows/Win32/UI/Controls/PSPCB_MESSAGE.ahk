#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct PSPCB_MESSAGE {
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
    static PSPCB_ADDREF => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PSPCB_CREATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PSPCB_RELEASE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PSPCB_SI_INITDIALOG => 1025
}
