#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SLR_FLAGS {
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
    static SLR_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SLR_NO_UI => 1

    /**
     * @type {Integer (Int32)}
     */
    static SLR_ANY_MATCH => 2

    /**
     * @type {Integer (Int32)}
     */
    static SLR_UPDATE => 4

    /**
     * @type {Integer (Int32)}
     */
    static SLR_NOUPDATE => 8

    /**
     * @type {Integer (Int32)}
     */
    static SLR_NOSEARCH => 16

    /**
     * @type {Integer (Int32)}
     */
    static SLR_NOTRACK => 32

    /**
     * @type {Integer (Int32)}
     */
    static SLR_NOLINKINFO => 64

    /**
     * @type {Integer (Int32)}
     */
    static SLR_INVOKE_MSI => 128

    /**
     * @type {Integer (Int32)}
     */
    static SLR_NO_UI_WITH_MSG_PUMP => 257

    /**
     * @type {Integer (Int32)}
     */
    static SLR_OFFER_DELETE_WITHOUT_FILE => 512

    /**
     * @type {Integer (Int32)}
     */
    static SLR_KNOWNFOLDER => 1024

    /**
     * @type {Integer (Int32)}
     */
    static SLR_MACHINE_IN_LOCAL_TARGET => 2048

    /**
     * @type {Integer (Int32)}
     */
    static SLR_UPDATE_MACHINE_AND_SID => 4096

    /**
     * @type {Integer (Int32)}
     */
    static SLR_NO_OBJECT_ID => 8192
}
