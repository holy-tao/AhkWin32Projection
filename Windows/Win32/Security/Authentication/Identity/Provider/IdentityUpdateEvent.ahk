#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 * @version v4.0.30319
 */
class IdentityUpdateEvent extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static IDENTITY_ASSOCIATED => 1

    /**
     * @type {Integer (Int32)}
     */
    static IDENTITY_DISASSOCIATED => 2

    /**
     * @type {Integer (Int32)}
     */
    static IDENTITY_CREATED => 4

    /**
     * @type {Integer (Int32)}
     */
    static IDENTITY_IMPORTED => 8

    /**
     * @type {Integer (Int32)}
     */
    static IDENTITY_DELETED => 16

    /**
     * @type {Integer (Int32)}
     */
    static IDENTITY_PROPCHANGED => 32

    /**
     * @type {Integer (Int32)}
     */
    static IDENTITY_CONNECTED => 64

    /**
     * @type {Integer (Int32)}
     */
    static IDENTITY_DISCONNECTED => 128
}
