#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Reports quota information on a per-user basis for authorization plug-ins.
 * @see https://docs.microsoft.com/windows/win32/api//wsman/ns-wsman-wsman_authz_quota
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_AUTHZ_QUOTA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Specifies the maximum number of concurrent shells that a user is allowed to create.
     * @type {Integer}
     */
    maxAllowedConcurrentShells {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the maximum number of concurrent operations that a user is allowed to perform. Only top-level operations are counted.  Simple operations such as  get, put, and delete are counted as one operation each. More complex operations are also counted as one. For example,  the enumeration operation and any associated operations that are related to enumeration are counted as one operation.
     * @type {Integer}
     */
    maxAllowedConcurrentOperations {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Time-slot length for determining the maximum number of operations per time slot.  This value is specified in units of seconds.
     * @type {Integer}
     */
    timeslotSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the maximum number of operations allowed per time slot.  This value is used to throttle both top-level and follow-on operations.
     * @type {Integer}
     */
    maxAllowedOperationsPerTimeslot {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
