#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Provides information to the IQueryAssociations interface methods.
 * @see https://learn.microsoft.com/windows/win32/shell/ASSOCF_str
 * @namespace Windows.Win32.UI.Shell
 */
class ASSOCF extends Win32BitflagEnum {

    /**
     * Native name: ASSOCF_NONE
     * @type {Integer (UInt32)}
     */
    static NONE => 0

    /**
     * Native name: ASSOCF_INIT_NOREMAPCLSID
     * @type {Integer (UInt32)}
     */
    static INIT_NOREMAPCLSID => 1

    /**
     * Native name: ASSOCF_INIT_BYEXENAME
     * @type {Integer (UInt32)}
     */
    static INIT_BYEXENAME => 2

    /**
     * Native name: ASSOCF_OPEN_BYEXENAME
     * @type {Integer (UInt32)}
     */
    static OPEN_BYEXENAME => 2

    /**
     * Native name: ASSOCF_INIT_DEFAULTTOSTAR
     * @type {Integer (UInt32)}
     */
    static INIT_DEFAULTTOSTAR => 4

    /**
     * Native name: ASSOCF_INIT_DEFAULTTOFOLDER
     * @type {Integer (UInt32)}
     */
    static INIT_DEFAULTTOFOLDER => 8

    /**
     * Native name: ASSOCF_NOUSERSETTINGS
     * @type {Integer (UInt32)}
     */
    static NOUSERSETTINGS => 16

    /**
     * Native name: ASSOCF_NOTRUNCATE
     * @type {Integer (UInt32)}
     */
    static NOTRUNCATE => 32

    /**
     * Native name: ASSOCF_VERIFY
     * @type {Integer (UInt32)}
     */
    static VERIFY => 64

    /**
     * Native name: ASSOCF_REMAPRUNDLL
     * @type {Integer (UInt32)}
     */
    static REMAPRUNDLL => 128

    /**
     * Native name: ASSOCF_NOFIXUPS
     * @type {Integer (UInt32)}
     */
    static NOFIXUPS => 256

    /**
     * Native name: ASSOCF_IGNOREBASECLASS
     * @type {Integer (UInt32)}
     */
    static IGNOREBASECLASS => 512

    /**
     * Native name: ASSOCF_INIT_IGNOREUNKNOWN
     * @type {Integer (UInt32)}
     */
    static INIT_IGNOREUNKNOWN => 1024

    /**
     * Native name: ASSOCF_INIT_FIXED_PROGID
     * @type {Integer (UInt32)}
     */
    static INIT_FIXED_PROGID => 2048

    /**
     * Native name: ASSOCF_IS_PROTOCOL
     * @type {Integer (UInt32)}
     */
    static IS_PROTOCOL => 4096

    /**
     * Native name: ASSOCF_INIT_FOR_FILE
     * @type {Integer (UInt32)}
     */
    static INIT_FOR_FILE => 8192

    /**
     * Native name: ASSOCF_IS_FULL_URI
     * @type {Integer (UInt32)}
     */
    static IS_FULL_URI => 16384

    /**
     * Native name: ASSOCF_PER_MACHINE_ONLY
     * @type {Integer (UInt32)}
     */
    static PER_MACHINE_ONLY => 32768

    /**
     * Native name: ASSOCF_APP_TO_APP
     * @type {Integer (UInt32)}
     */
    static APP_TO_APP => 65536
}
