#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 */
class IdentityUpdateEvent extends Win32BitflagEnum {

    /**
     * Native name: IDENTITY_ASSOCIATED
     * @type {Integer (Int32)}
     */
    static ASSOCIATED => 1

    /**
     * Native name: IDENTITY_DISASSOCIATED
     * @type {Integer (Int32)}
     */
    static DISASSOCIATED => 2

    /**
     * Native name: IDENTITY_CREATED
     * @type {Integer (Int32)}
     */
    static CREATED => 4

    /**
     * Native name: IDENTITY_IMPORTED
     * @type {Integer (Int32)}
     */
    static IMPORTED => 8

    /**
     * Native name: IDENTITY_DELETED
     * @type {Integer (Int32)}
     */
    static DELETED => 16

    /**
     * Native name: IDENTITY_PROPCHANGED
     * @type {Integer (Int32)}
     */
    static PROPCHANGED => 32

    /**
     * Native name: IDENTITY_CONNECTED
     * @type {Integer (Int32)}
     */
    static CONNECTED => 64

    /**
     * Native name: IDENTITY_DISCONNECTED
     * @type {Integer (Int32)}
     */
    static DISCONNECTED => 128
}
