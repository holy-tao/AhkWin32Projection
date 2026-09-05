#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authorization
 */
class AUTHZ_RESOURCE_MANAGER_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: AUTHZ_RM_FLAG_NO_AUDIT
     * @type {Integer (UInt32)}
     */
    static RM_FLAG_NO_AUDIT => 1

    /**
     * Native name: AUTHZ_RM_FLAG_INITIALIZE_UNDER_IMPERSONATION
     * @type {Integer (UInt32)}
     */
    static RM_FLAG_INITIALIZE_UNDER_IMPERSONATION => 2

    /**
     * Native name: AUTHZ_RM_FLAG_NO_CENTRAL_ACCESS_POLICIES
     * @type {Integer (UInt32)}
     */
    static RM_FLAG_NO_CENTRAL_ACCESS_POLICIES => 4
}
