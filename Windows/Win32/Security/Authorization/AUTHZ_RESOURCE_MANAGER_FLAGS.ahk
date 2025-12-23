#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class AUTHZ_RESOURCE_MANAGER_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_RM_FLAG_NO_AUDIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_RM_FLAG_INITIALIZE_UNDER_IMPERSONATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_RM_FLAG_NO_CENTRAL_ACCESS_POLICIES => 4
}
