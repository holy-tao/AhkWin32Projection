#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class ACCESS_REASON_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static AccessReasonNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static AccessReasonAllowedAce => 65536

    /**
     * @type {Integer (Int32)}
     */
    static AccessReasonDeniedAce => 131072

    /**
     * @type {Integer (Int32)}
     */
    static AccessReasonAllowedParentAce => 196608

    /**
     * @type {Integer (Int32)}
     */
    static AccessReasonDeniedParentAce => 262144

    /**
     * @type {Integer (Int32)}
     */
    static AccessReasonNotGrantedByCape => 327680

    /**
     * @type {Integer (Int32)}
     */
    static AccessReasonNotGrantedByParentCape => 393216

    /**
     * @type {Integer (Int32)}
     */
    static AccessReasonNotGrantedToAppContainer => 458752

    /**
     * @type {Integer (Int32)}
     */
    static AccessReasonMissingPrivilege => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static AccessReasonFromPrivilege => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static AccessReasonIntegrityLevel => 3145728

    /**
     * @type {Integer (Int32)}
     */
    static AccessReasonOwnership => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static AccessReasonNullDacl => 5242880

    /**
     * @type {Integer (Int32)}
     */
    static AccessReasonEmptyDacl => 6291456

    /**
     * @type {Integer (Int32)}
     */
    static AccessReasonNoSD => 7340032

    /**
     * @type {Integer (Int32)}
     */
    static AccessReasonNoGrant => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static AccessReasonTrustLabel => 9437184

    /**
     * @type {Integer (Int32)}
     */
    static AccessReasonFilterAce => 10485760
}
