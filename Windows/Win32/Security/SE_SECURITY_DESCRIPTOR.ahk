#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PSECURITY_DESCRIPTOR.ahk" { PSECURITY_DESCRIPTOR }

/**
 * @namespace Windows.Win32.Security
 */
export default struct SE_SECURITY_DESCRIPTOR {
    #StructPack 8

    Size : UInt32

    Flags : UInt32

    SecurityDescriptor : PSECURITY_DESCRIPTOR

}
