#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import ".\SE_AUDIT_OPERATION.ahk" { SE_AUDIT_OPERATION }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\LUID.ahk" { LUID }
#Import "..\..\..\Win32\Security\AUDIT_EVENT_TYPE.ahk" { AUDIT_EVENT_TYPE }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct SE_AUDIT_INFO {
    #StructPack 8

    Size : UInt32

    AuditType : AUDIT_EVENT_TYPE

    AuditOperation : SE_AUDIT_OPERATION

    AuditFlags : UInt32

    SubsystemName : IntPtr

    ObjectTypeName : IntPtr

    ObjectName : IntPtr

    HandleId : IntPtr

    TransactionId : Guid.Ptr

    OperationId : LUID.Ptr

    ObjectCreation : BOOLEAN

    GenerateOnClose : BOOLEAN

}
