#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class HIGHCONTRASTW_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static HCF_HIGHCONTRASTON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HCF_AVAILABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HCF_HOTKEYACTIVE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HCF_CONFIRMHOTKEY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static HCF_HOTKEYSOUND => 16

    /**
     * @type {Integer (UInt32)}
     */
    static HCF_INDICATOR => 32

    /**
     * @type {Integer (UInt32)}
     */
    static HCF_HOTKEYAVAILABLE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static HCF_OPTION_NOTHEMECHANGE => 4096
}
