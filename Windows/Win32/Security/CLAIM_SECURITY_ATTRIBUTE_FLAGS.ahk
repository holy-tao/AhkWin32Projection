#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class CLAIM_SECURITY_ATTRIBUTE_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static CLAIM_SECURITY_ATTRIBUTE_NON_INHERITABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLAIM_SECURITY_ATTRIBUTE_VALUE_CASE_SENSITIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CLAIM_SECURITY_ATTRIBUTE_USE_FOR_DENY_ONLY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CLAIM_SECURITY_ATTRIBUTE_DISABLED_BY_DEFAULT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CLAIM_SECURITY_ATTRIBUTE_DISABLED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CLAIM_SECURITY_ATTRIBUTE_MANDATORY => 32
}
