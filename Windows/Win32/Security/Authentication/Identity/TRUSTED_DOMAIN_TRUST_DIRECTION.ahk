#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class TRUSTED_DOMAIN_TRUST_DIRECTION extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_DIRECTION_DISABLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_DIRECTION_INBOUND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_DIRECTION_OUTBOUND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_DIRECTION_BIDIRECTIONAL => 3
}
