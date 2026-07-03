#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GENERIC_MAPPING.ahk" { GENERIC_MAPPING }
#Import ".\OBJECT_TYPE_LIST.ahk" { OBJECT_TYPE_LIST }
#Import ".\PSID.ahk" { PSID }
#Import ".\SE_SECURITY_DESCRIPTOR.ahk" { SE_SECURITY_DESCRIPTOR }

/**
 * @namespace Windows.Win32.Security
 */
export default struct SE_ACCESS_REQUEST {
    #StructPack 8

    Size : UInt32

    SeSecurityDescriptor : SE_SECURITY_DESCRIPTOR.Ptr

    DesiredAccess : UInt32

    PreviouslyGrantedAccess : UInt32

    PrincipalSelfSid : PSID

    GenericMapping : GENERIC_MAPPING.Ptr

    ObjectTypeListCount : UInt32

    ObjectTypeList : OBJECT_TYPE_LIST.Ptr

}
