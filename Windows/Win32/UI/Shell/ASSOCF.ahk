#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/shell/ASSOCF_str
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ASSOCF{

    /**
     * @type {Integer (UInt32)}
     */
    static ASSOCF_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ASSOCF_INIT_NOREMAPCLSID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ASSOCF_INIT_BYEXENAME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ASSOCF_OPEN_BYEXENAME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ASSOCF_INIT_DEFAULTTOSTAR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ASSOCF_INIT_DEFAULTTOFOLDER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ASSOCF_NOUSERSETTINGS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ASSOCF_NOTRUNCATE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ASSOCF_VERIFY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ASSOCF_REMAPRUNDLL => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ASSOCF_NOFIXUPS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ASSOCF_IGNOREBASECLASS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static ASSOCF_INIT_IGNOREUNKNOWN => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static ASSOCF_INIT_FIXED_PROGID => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static ASSOCF_IS_PROTOCOL => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static ASSOCF_INIT_FOR_FILE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static ASSOCF_IS_FULL_URI => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static ASSOCF_PER_MACHINE_ONLY => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static ASSOCF_APP_TO_APP => 65536
}
