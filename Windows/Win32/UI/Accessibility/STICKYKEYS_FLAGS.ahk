#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class STICKYKEYS_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static SKF_STICKYKEYSON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SKF_AVAILABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SKF_HOTKEYACTIVE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SKF_CONFIRMHOTKEY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SKF_HOTKEYSOUND => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SKF_INDICATOR => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SKF_AUDIBLEFEEDBACK => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SKF_TRISTATE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SKF_TWOKEYSOFF => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SKF_LALTLATCHED => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static SKF_LCTLLATCHED => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static SKF_LSHIFTLATCHED => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static SKF_RALTLATCHED => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static SKF_RCTLLATCHED => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static SKF_RSHIFTLATCHED => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static SKF_LWINLATCHED => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static SKF_RWINLATCHED => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static SKF_LALTLOCKED => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static SKF_LCTLLOCKED => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static SKF_LSHIFTLOCKED => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SKF_RALTLOCKED => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static SKF_RCTLLOCKED => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static SKF_RSHIFTLOCKED => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SKF_LWINLOCKED => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static SKF_RWINLOCKED => 8388608
}
