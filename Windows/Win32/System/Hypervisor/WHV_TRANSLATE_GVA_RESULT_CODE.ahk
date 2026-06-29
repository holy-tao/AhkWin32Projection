#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_TRANSLATE_GVA_RESULT_CODE {
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
    static WHvTranslateGvaResultSuccess => 0

    /**
     * @type {Integer (Int32)}
     */
    static WHvTranslateGvaResultPageNotPresent => 1

    /**
     * @type {Integer (Int32)}
     */
    static WHvTranslateGvaResultPrivilegeViolation => 2

    /**
     * @type {Integer (Int32)}
     */
    static WHvTranslateGvaResultInvalidPageTableFlags => 3

    /**
     * @type {Integer (Int32)}
     */
    static WHvTranslateGvaResultGpaUnmapped => 4

    /**
     * @type {Integer (Int32)}
     */
    static WHvTranslateGvaResultGpaNoReadAccess => 5

    /**
     * @type {Integer (Int32)}
     */
    static WHvTranslateGvaResultGpaNoWriteAccess => 6

    /**
     * @type {Integer (Int32)}
     */
    static WHvTranslateGvaResultGpaIllegalOverlayAccess => 7

    /**
     * @type {Integer (Int32)}
     */
    static WHvTranslateGvaResultIntercept => 8
}
