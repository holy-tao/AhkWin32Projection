#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\..\Win32\Foundation\LUID.ahk
#Include ..\..\Win32\Security\PSECURITY_DESCRIPTOR.ahk
#Include ..\..\Win32\Security\LUID_AND_ATTRIBUTES.ahk
#Include ..\..\Win32\Security\PRIVILEGE_SET.ahk
#Include ..\..\Win32\Foundation\UNICODE_STRING.ahk

/**
 * @namespace Windows.Wdk.Foundation
 * @version v4.0.30319
 */
class ACCESS_STATE extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    class _Privileges_e__Union extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Pointer<INITIAL_PRIVILEGE_SET>}
         */
        InitialPrivilegeSet {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {PRIVILEGE_SET}
         */
        PrivilegeSet{
            get {
                if(!this.HasProp("__PrivilegeSet"))
                    this.__PrivilegeSet := PRIVILEGE_SET(0, this)
                return this.__PrivilegeSet
            }
        }
    
    }

    /**
     * @type {LUID}
     */
    OperationID{
        get {
            if(!this.HasProp("__OperationID"))
                this.__OperationID := LUID(0, this)
            return this.__OperationID
        }
    }

    /**
     * @type {BOOLEAN}
     */
    SecurityEvaluated {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {BOOLEAN}
     */
    GenerateAudit {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * @type {BOOLEAN}
     */
    GenerateOnClose {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * @type {BOOLEAN}
     */
    PrivilegesAllocated {
        get => NumGet(this, 11, "char")
        set => NumPut("char", value, this, 11)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    RemainingDesiredAccess {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    PreviouslyGrantedAccess {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    OriginalDesiredAccess {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Pointer<SECURITY_SUBJECT_CONTEXT>}
     */
    SubjectSecurityContext {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {PSECURITY_DESCRIPTOR}
     */
    SecurityDescriptor{
        get {
            if(!this.HasProp("__SecurityDescriptor"))
                this.__SecurityDescriptor := PSECURITY_DESCRIPTOR(40, this)
            return this.__SecurityDescriptor
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    AuxData {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {_Privileges_e__Union}
     */
    Privileges{
        get {
            if(!this.HasProp("__Privileges"))
                this.__Privileges := %this.__Class%._Privileges_e__Union(56, this)
            return this.__Privileges
        }
    }

    /**
     * @type {BOOLEAN}
     */
    AuditPrivileges {
        get => NumGet(this, 72, "char")
        set => NumPut("char", value, this, 72)
    }

    /**
     * @type {UNICODE_STRING}
     */
    ObjectName{
        get {
            if(!this.HasProp("__ObjectName"))
                this.__ObjectName := UNICODE_STRING(80, this)
            return this.__ObjectName
        }
    }

    /**
     * @type {UNICODE_STRING}
     */
    ObjectTypeName{
        get {
            if(!this.HasProp("__ObjectTypeName"))
                this.__ObjectTypeName := UNICODE_STRING(96, this)
            return this.__ObjectTypeName
        }
    }
}
