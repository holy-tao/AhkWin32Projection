#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class POLICY_REPLICA_SOURCE_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {LSA_UNICODE_STRING}
     */
    ReplicaSource{
        get {
            if(!this.HasProp("__ReplicaSource"))
                this.__ReplicaSource := LSA_UNICODE_STRING(this.ptr + 0)
            return this.__ReplicaSource
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    ReplicaAccountName{
        get {
            if(!this.HasProp("__ReplicaAccountName"))
                this.__ReplicaAccountName := LSA_UNICODE_STRING(this.ptr + 16)
            return this.__ReplicaAccountName
        }
    }
}
