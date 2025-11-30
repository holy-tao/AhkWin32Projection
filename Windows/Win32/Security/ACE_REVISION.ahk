#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class ACE_REVISION extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static ACL_REVISION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ACL_REVISION_DS => 4
}
