#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AUDIT_OBJECT_TYPES.ahk" { AUDIT_OBJECT_TYPES }
#Import "..\SID.ahk" { SID }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\AUDIT_IP_ADDRESS.ahk" { AUDIT_IP_ADDRESS }
#Import ".\AUDIT_PARAM_TYPE.ahk" { AUDIT_PARAM_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct AUDIT_PARAM {
    #StructPack 8

    Type : AUDIT_PARAM_TYPE

    Length : UInt32

    Flags : UInt32

    Data0 : IntPtr

    Data1 : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'String', { type: PWSTR, offset: 16 })
        DefineProp(this.Prototype, 'u', { type: IntPtr, offset: 16 })
        DefineProp(this.Prototype, 'psid', { type: SID.Ptr, offset: 16 })
        DefineProp(this.Prototype, 'pguid', { type: Guid.Ptr, offset: 16 })
        DefineProp(this.Prototype, 'LogonId_LowPart', { type: UInt32, offset: 16 })
        DefineProp(this.Prototype, 'pObjectTypes', { type: AUDIT_OBJECT_TYPES.Ptr, offset: 16 })
        DefineProp(this.Prototype, 'pIpAddress', { type: AUDIT_IP_ADDRESS.Ptr, offset: 16 })
        DefineProp(this.Prototype, 'LogonId_HighPart', { type: Int32, offset: 24 })
        this.DeleteProp("__New")
    }
}
