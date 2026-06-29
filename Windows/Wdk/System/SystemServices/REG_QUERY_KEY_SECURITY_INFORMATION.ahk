#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Security\PSECURITY_DESCRIPTOR.ahk" { PSECURITY_DESCRIPTOR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct REG_QUERY_KEY_SECURITY_INFORMATION {
    #StructPack 8

    Object : IntPtr

    SecurityInformation : IntPtr

    SecurityDescriptor : PSECURITY_DESCRIPTOR

    Length : IntPtr

    CallContext : IntPtr

    ObjectContext : IntPtr

    Reserved : IntPtr

}
