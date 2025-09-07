#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include ..\..\PSECURITY_DESCRIPTOR.ahk

/**
 * Represents a central access policy entry containing a list of security descriptors and staged security descriptors.
 * @see https://learn.microsoft.com/windows/win32/api/ntlsa/ns-ntlsa-central_access_policy_entry
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class CENTRAL_ACCESS_POLICY_ENTRY extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * The name of the central access policy entry.
     * @type {LSA_UNICODE_STRING}
     */
    Name{
        get {
            if(!this.HasProp("__Name"))
                this.__Name := LSA_UNICODE_STRING(this.ptr + 0)
            return this.__Name
        }
    }

    /**
     * The description of the central access policy entry.
     * @type {LSA_UNICODE_STRING}
     */
    Description{
        get {
            if(!this.HasProp("__Description"))
                this.__Description := LSA_UNICODE_STRING(this.ptr + 16)
            return this.__Description
        }
    }

    /**
     * An identifier that can be used to version the central access policy entry.
     * @type {LSA_UNICODE_STRING}
     */
    ChangeId{
        get {
            if(!this.HasProp("__ChangeId"))
                this.__ChangeId := LSA_UNICODE_STRING(this.ptr + 32)
            return this.__ChangeId
        }
    }

    /**
     * The length of the buffer pointed to by the <i>AppliesTo</i> field.
     * @type {Integer}
     */
    LengthAppliesTo {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * A resource condition in binary form.
     * @type {Pointer<Byte>}
     */
    AppliesTo {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * The length of the buffer pointed to by the <i>SD</i> field.
     * @type {Integer}
     */
    LengthSD {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * A buffer of security descriptors associated with the entry.
     * @type {PSECURITY_DESCRIPTOR}
     */
    SD{
        get {
            if(!this.HasProp("__SD"))
                this.__SD := PSECURITY_DESCRIPTOR(this.ptr + 72)
            return this.__SD
        }
    }

    /**
     * The length of the buffer pointed to by the <i>StagedSD</i> field.
     * @type {Integer}
     */
    LengthStagedSD {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * A buffer of staged security descriptors associated with the entry.
     * @type {PSECURITY_DESCRIPTOR}
     */
    StagedSD{
        get {
            if(!this.HasProp("__StagedSD"))
                this.__StagedSD := PSECURITY_DESCRIPTOR(this.ptr + 88)
            return this.__StagedSD
        }
    }

    /**
     * This field is reserved.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }
}
