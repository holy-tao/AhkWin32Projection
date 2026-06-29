#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls.Dialogs
 */
export default struct CHOOSECOLOR_FLAGS {
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
    static CC_RGBINIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CC_FULLOPEN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CC_PREVENTFULLOPEN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CC_SHOWHELP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CC_ENABLEHOOK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CC_ENABLETEMPLATE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CC_ENABLETEMPLATEHANDLE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CC_SOLIDCOLOR => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CC_ANYCOLOR => 256
}
