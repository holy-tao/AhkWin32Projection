#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authorization.UI
 * @version v4.0.30319
 */
class SECURITY_INFO_PAGE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static SI_ADVANCED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SI_EDIT_AUDITS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SI_EDIT_PROPERTIES => 128
}
