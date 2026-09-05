#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class TRUSTED_DOMAIN_TRUST_TYPE extends Win32Enum {

    /**
     * Native name: TRUST_TYPE_DOWNLEVEL
     * @type {Integer (UInt32)}
     */
    static DOWNLEVEL => 1

    /**
     * Native name: TRUST_TYPE_UPLEVEL
     * @type {Integer (UInt32)}
     */
    static UPLEVEL => 2

    /**
     * Native name: TRUST_TYPE_MIT
     * @type {Integer (UInt32)}
     */
    static MIT => 3

    /**
     * Native name: TRUST_TYPE_DCE
     * @type {Integer (UInt32)}
     */
    static DCE => 4
}
