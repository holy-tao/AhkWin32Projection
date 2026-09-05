#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class ACCESS_REASON_TYPE extends Win32Enum {

    /**
     * Native name: AccessReasonNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: AccessReasonAllowedAce
     * @type {Integer (Int32)}
     */
    static AllowedAce => 65536

    /**
     * Native name: AccessReasonDeniedAce
     * @type {Integer (Int32)}
     */
    static DeniedAce => 131072

    /**
     * Native name: AccessReasonAllowedParentAce
     * @type {Integer (Int32)}
     */
    static AllowedParentAce => 196608

    /**
     * Native name: AccessReasonDeniedParentAce
     * @type {Integer (Int32)}
     */
    static DeniedParentAce => 262144

    /**
     * Native name: AccessReasonNotGrantedByCape
     * @type {Integer (Int32)}
     */
    static NotGrantedByCape => 327680

    /**
     * Native name: AccessReasonNotGrantedByParentCape
     * @type {Integer (Int32)}
     */
    static NotGrantedByParentCape => 393216

    /**
     * Native name: AccessReasonNotGrantedToAppContainer
     * @type {Integer (Int32)}
     */
    static NotGrantedToAppContainer => 458752

    /**
     * Native name: AccessReasonMissingPrivilege
     * @type {Integer (Int32)}
     */
    static MissingPrivilege => 1048576

    /**
     * Native name: AccessReasonFromPrivilege
     * @type {Integer (Int32)}
     */
    static FromPrivilege => 2097152

    /**
     * Native name: AccessReasonIntegrityLevel
     * @type {Integer (Int32)}
     */
    static IntegrityLevel => 3145728

    /**
     * Native name: AccessReasonOwnership
     * @type {Integer (Int32)}
     */
    static Ownership => 4194304

    /**
     * Native name: AccessReasonNullDacl
     * @type {Integer (Int32)}
     */
    static NullDacl => 5242880

    /**
     * Native name: AccessReasonEmptyDacl
     * @type {Integer (Int32)}
     */
    static EmptyDacl => 6291456

    /**
     * Native name: AccessReasonNoSD
     * @type {Integer (Int32)}
     */
    static NoSD => 7340032

    /**
     * Native name: AccessReasonNoGrant
     * @type {Integer (Int32)}
     */
    static NoGrant => 8388608

    /**
     * Native name: AccessReasonTrustLabel
     * @type {Integer (Int32)}
     */
    static TrustLabel => 9437184

    /**
     * Native name: AccessReasonFilterAce
     * @type {Integer (Int32)}
     */
    static FilterAce => 10485760
}
