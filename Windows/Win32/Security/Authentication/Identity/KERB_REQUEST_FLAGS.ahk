#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class KERB_REQUEST_FLAGS extends Win32Enum {

    /**
     * Native name: KERB_REQUEST_ADD_CREDENTIAL
     * @type {Integer (UInt32)}
     */
    static ADD_CREDENTIAL => 1

    /**
     * Native name: KERB_REQUEST_REPLACE_CREDENTIAL
     * @type {Integer (UInt32)}
     */
    static REPLACE_CREDENTIAL => 2

    /**
     * Native name: KERB_REQUEST_REMOVE_CREDENTIAL
     * @type {Integer (UInt32)}
     */
    static REMOVE_CREDENTIAL => 4
}
