#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_REQUEST_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_REQUEST_ADD_CREDENTIAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_REQUEST_REPLACE_CREDENTIAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_REQUEST_REMOVE_CREDENTIAL => 4
}
