#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Values that indicate the type of trustee identified by a TRUSTEE structure.
 * @see https://learn.microsoft.com/windows/win32/api/accctrl/ne-accctrl-trustee_type
 * @namespace Windows.Win32.Security.Authorization
 */
class TRUSTEE_TYPE extends Win32Enum {

    /**
     * The trustee type is unknown, but it may be valid.
     * Native name: TRUSTEE_IS_UNKNOWN
     * @type {Integer (Int32)}
     */
    static IS_UNKNOWN => 0

    /**
     * Indicates a user.
     * Native name: TRUSTEE_IS_USER
     * @type {Integer (Int32)}
     */
    static IS_USER => 1

    /**
     * Indicates a group.
     * Native name: TRUSTEE_IS_GROUP
     * @type {Integer (Int32)}
     */
    static IS_GROUP => 2

    /**
     * Indicates a domain.
     * Native name: TRUSTEE_IS_DOMAIN
     * @type {Integer (Int32)}
     */
    static IS_DOMAIN => 3

    /**
     * Indicates an alias.
     * Native name: TRUSTEE_IS_ALIAS
     * @type {Integer (Int32)}
     */
    static IS_ALIAS => 4

    /**
     * Indicates a 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/well-known-sids">well-known group</a>.
     * Native name: TRUSTEE_IS_WELL_KNOWN_GROUP
     * @type {Integer (Int32)}
     */
    static IS_WELL_KNOWN_GROUP => 5

    /**
     * Indicates a deleted account.
     * Native name: TRUSTEE_IS_DELETED
     * @type {Integer (Int32)}
     */
    static IS_DELETED => 6

    /**
     * Indicates a trustee type that is not valid.
     * Native name: TRUSTEE_IS_INVALID
     * @type {Integer (Int32)}
     */
    static IS_INVALID => 7

    /**
     * Indicates a computer.
     * Native name: TRUSTEE_IS_COMPUTER
     * @type {Integer (Int32)}
     */
    static IS_COMPUTER => 8
}
