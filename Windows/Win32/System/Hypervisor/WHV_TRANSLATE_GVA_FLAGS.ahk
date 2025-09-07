#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_TRANSLATE_GVA_FLAGS{

    /**
     * @type {Integer (Int32)}
     */
    static WHvTranslateGvaFlagNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static WHvTranslateGvaFlagValidateRead => 1

    /**
     * @type {Integer (Int32)}
     */
    static WHvTranslateGvaFlagValidateWrite => 2

    /**
     * @type {Integer (Int32)}
     */
    static WHvTranslateGvaFlagValidateExecute => 4

    /**
     * @type {Integer (Int32)}
     */
    static WHvTranslateGvaFlagPrivilegeExempt => 8

    /**
     * @type {Integer (Int32)}
     */
    static WHvTranslateGvaFlagSetPageTableBits => 16

    /**
     * @type {Integer (Int32)}
     */
    static WHvTranslateGvaFlagEnforceSmap => 256

    /**
     * @type {Integer (Int32)}
     */
    static WHvTranslateGvaFlagOverrideSmap => 512
}
