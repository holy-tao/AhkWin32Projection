#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct NOTIFY_IME_ACTION {
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
    static NI_CHANGECANDIDATELIST => 19

    /**
     * @type {Integer (UInt32)}
     */
    static NI_CLOSECANDIDATE => 17

    /**
     * @type {Integer (UInt32)}
     */
    static NI_COMPOSITIONSTR => 21

    /**
     * @type {Integer (UInt32)}
     */
    static NI_IMEMENUSELECTED => 24

    /**
     * @type {Integer (UInt32)}
     */
    static NI_OPENCANDIDATE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NI_SELECTCANDIDATESTR => 18

    /**
     * @type {Integer (UInt32)}
     */
    static NI_SETCANDIDATE_PAGESIZE => 23

    /**
     * @type {Integer (UInt32)}
     */
    static NI_SETCANDIDATE_PAGESTART => 22
}
