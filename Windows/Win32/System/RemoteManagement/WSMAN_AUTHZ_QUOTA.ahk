#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Reports quota information on a per-user basis for authorization plug-ins.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_authz_quota
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_AUTHZ_QUOTA {
    #StructPack 4

    /**
     * Specifies the maximum number of concurrent shells that a user is allowed to create.
     */
    maxAllowedConcurrentShells : UInt32

    /**
     * Specifies the maximum number of concurrent operations that a user is allowed to perform. Only top-level operations are counted.  Simple operations such as  get, put, and delete are counted as one operation each. More complex operations are also counted as one. For example,  the enumeration operation and any associated operations that are related to enumeration are counted as one operation.
     */
    maxAllowedConcurrentOperations : UInt32

    /**
     * Time-slot length for determining the maximum number of operations per time slot.  This value is specified in units of seconds.
     */
    timeslotSize : UInt32

    /**
     * Specifies the maximum number of operations allowed per time slot.  This value is used to throttle both top-level and follow-on operations.
     */
    maxAllowedOperationsPerTimeslot : UInt32

}
