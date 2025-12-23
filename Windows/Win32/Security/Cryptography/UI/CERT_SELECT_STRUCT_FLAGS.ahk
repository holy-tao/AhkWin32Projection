#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.UI
 * @version v4.0.30319
 */
class CERT_SELECT_STRUCT_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static CSS_HIDE_PROPERTIES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CSS_ENABLEHOOK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CSS_ALLOWMULTISELECT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CSS_SHOW_HELP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CSS_ENABLETEMPLATE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CSS_ENABLETEMPLATEHANDLE => 64
}
