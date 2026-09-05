#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class TRUSTED_DOMAIN_TRUST_DIRECTION extends Win32Enum {

    /**
     * Native name: TRUST_DIRECTION_DISABLED
     * @type {Integer (UInt32)}
     */
    static DISABLED => 0

    /**
     * Native name: TRUST_DIRECTION_INBOUND
     * @type {Integer (UInt32)}
     */
    static INBOUND => 1

    /**
     * Native name: TRUST_DIRECTION_OUTBOUND
     * @type {Integer (UInt32)}
     */
    static OUTBOUND => 2

    /**
     * Native name: TRUST_DIRECTION_BIDIRECTIONAL
     * @type {Integer (UInt32)}
     */
    static BIDIRECTIONAL => 3
}
