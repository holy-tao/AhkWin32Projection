#Requires AutoHotkey v2.0.0 64-bit

/**
 * Values that indicate the type of trustee identified by a TRUSTEE structure.
 * @see https://learn.microsoft.com/windows/win32/api/accctrl/ne-accctrl-trustee_type
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class TRUSTEE_TYPE{

    /**
     * The trustee type is unknown, but it may be valid.
     * @type {Integer (Int32)}
     */
    static TRUSTEE_IS_UNKNOWN => 0

    /**
     * Indicates a user.
     * @type {Integer (Int32)}
     */
    static TRUSTEE_IS_USER => 1

    /**
     * Indicates a group.
     * @type {Integer (Int32)}
     */
    static TRUSTEE_IS_GROUP => 2

    /**
     * Indicates a domain.
     * @type {Integer (Int32)}
     */
    static TRUSTEE_IS_DOMAIN => 3

    /**
     * Indicates an alias.
     * @type {Integer (Int32)}
     */
    static TRUSTEE_IS_ALIAS => 4

    /**
     * Indicates a 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/well-known-sids">well-known group</a>.
     * @type {Integer (Int32)}
     */
    static TRUSTEE_IS_WELL_KNOWN_GROUP => 5

    /**
     * Indicates a deleted account.
     * @type {Integer (Int32)}
     */
    static TRUSTEE_IS_DELETED => 6

    /**
     * Indicates a trustee type that is not valid.
     * @type {Integer (Int32)}
     */
    static TRUSTEE_IS_INVALID => 7

    /**
     * Indicates a computer.
     * @type {Integer (Int32)}
     */
    static TRUSTEE_IS_COMPUTER => 8
}
