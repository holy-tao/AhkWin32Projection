#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * Represents a central access policy that contains a set of central access policy entries.
 * @see https://docs.microsoft.com/windows/win32/api//ntlsa/ns-ntlsa-central_access_policy
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class CENTRAL_ACCESS_POLICY extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * The identifier of the central access policy.
     * @type {Pointer<Void>}
     */
    CAPID {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The name of the central access policy.
     * @type {LSA_UNICODE_STRING}
     */
    Name{
        get {
            if(!this.HasProp("__Name"))
                this.__Name := LSA_UNICODE_STRING(this.ptr + 8)
            return this.__Name
        }
    }

    /**
     * The description of the central access policy.
     * @type {LSA_UNICODE_STRING}
     */
    Description{
        get {
            if(!this.HasProp("__Description"))
                this.__Description := LSA_UNICODE_STRING(this.ptr + 24)
            return this.__Description
        }
    }

    /**
     * An identifier that can be used to version the central access policy.
     * @type {LSA_UNICODE_STRING}
     */
    ChangeId{
        get {
            if(!this.HasProp("__ChangeId"))
                this.__ChangeId := LSA_UNICODE_STRING(this.ptr + 40)
            return this.__ChangeId
        }
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The length of the buffer pointed to by the <i>CAPEs</i> field.
     * @type {Integer}
     */
    CAPECount {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Pointer to a buffer of <a href="https://docs.microsoft.com/windows/desktop/api/ntlsa/ns-ntlsa-central_access_policy_entry">CENTRAL_ACCESS_POLICY_ENTRY</a> pointers.
     * @type {Pointer<CENTRAL_ACCESS_POLICY_ENTRY>}
     */
    CAPEs {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
