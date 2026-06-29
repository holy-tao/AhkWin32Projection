#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Win32\Security\PSECURITY_DESCRIPTOR.ahk" { PSECURITY_DESCRIPTOR }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct ACCESS_STATE {
    #StructPack 8


    struct _Privileges {
        InitialPrivilegeSet : IntPtr

        static __New() {
            DefineProp(this.Prototype, 'PrivilegeSet', { type: IntPtr, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    OperationID : IntPtr

    SecurityEvaluated : BOOLEAN

    GenerateAudit : BOOLEAN

    GenerateOnClose : BOOLEAN

    PrivilegesAllocated : BOOLEAN

    Flags : UInt32

    RemainingDesiredAccess : UInt32

    PreviouslyGrantedAccess : UInt32

    OriginalDesiredAccess : UInt32

    SubjectSecurityContext : IntPtr

    SecurityDescriptor : PSECURITY_DESCRIPTOR

    AuxData : IntPtr

    Privileges : ACCESS_STATE._Privileges

    AuditPrivileges : BOOLEAN

    ObjectName : IntPtr

    ObjectTypeName : IntPtr

}
