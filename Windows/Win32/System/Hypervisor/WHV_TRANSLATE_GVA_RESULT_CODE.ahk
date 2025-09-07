#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_TRANSLATE_GVA_RESULT_CODE{

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
