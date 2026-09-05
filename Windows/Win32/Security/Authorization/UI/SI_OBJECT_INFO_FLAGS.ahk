#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authorization.UI
 */
class SI_OBJECT_INFO_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: SI_AUDITS_ELEVATION_REQUIRED
     * @type {Integer (UInt32)}
     */
    static AUDITS_ELEVATION_REQUIRED => 33554432

    /**
     * Native name: SI_DISABLE_DENY_ACE
     * @type {Integer (UInt32)}
     */
    static DISABLE_DENY_ACE => 2147483648

    /**
     * Native name: SI_EDIT_EFFECTIVE
     * @type {Integer (UInt32)}
     */
    static EDIT_EFFECTIVE => 131072

    /**
     * Native name: SI_ENABLE_CENTRAL_POLICY
     * @type {Integer (UInt32)}
     */
    static ENABLE_CENTRAL_POLICY => 1073741824

    /**
     * Native name: SI_ENABLE_EDIT_ATTRIBUTE_CONDITION
     * @type {Integer (UInt32)}
     */
    static ENABLE_EDIT_ATTRIBUTE_CONDITION => 536870912

    /**
     * Native name: SI_MAY_WRITE
     * @type {Integer (UInt32)}
     */
    static MAY_WRITE => 268435456

    /**
     * Native name: SI_NO_ADDITIONAL_PERMISSION
     * @type {Integer (UInt32)}
     */
    static NO_ADDITIONAL_PERMISSION => 2097152

    /**
     * Native name: SI_OWNER_ELEVATION_REQUIRED
     * @type {Integer (UInt32)}
     */
    static OWNER_ELEVATION_REQUIRED => 67108864

    /**
     * Native name: SI_PERMS_ELEVATION_REQUIRED
     * @type {Integer (UInt32)}
     */
    static PERMS_ELEVATION_REQUIRED => 16777216

    /**
     * Native name: SI_RESET_DACL
     * @type {Integer (UInt32)}
     */
    static RESET_DACL => 262144

    /**
     * Native name: SI_RESET_OWNER
     * @type {Integer (UInt32)}
     */
    static RESET_OWNER => 1048576

    /**
     * Native name: SI_RESET_SACL
     * @type {Integer (UInt32)}
     */
    static RESET_SACL => 524288

    /**
     * Native name: SI_SCOPE_ELEVATION_REQUIRED
     * @type {Integer (UInt32)}
     */
    static SCOPE_ELEVATION_REQUIRED => 134217728

    /**
     * Native name: SI_VIEW_ONLY
     * @type {Integer (UInt32)}
     */
    static VIEW_ONLY => 4194304
}
