#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.UI
 * @version v4.0.30319
 */
class CERT_VIEWPROPERTIES_STRUCT_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static CM_ENABLEHOOK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CM_SHOW_HELP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CM_SHOW_HELPICON => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CM_ENABLETEMPLATE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CM_HIDE_ADVANCEPAGE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CM_HIDE_TRUSTPAGE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CM_NO_NAMECHANGE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CM_NO_EDITTRUST => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CM_HIDE_DETAILPAGE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CM_ADD_CERT_STORES => 512
}
