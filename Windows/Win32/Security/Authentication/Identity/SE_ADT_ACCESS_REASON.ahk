#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\PSECURITY_DESCRIPTOR.ahk" { PSECURITY_DESCRIPTOR }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SE_ADT_ACCESS_REASON {
    #StructPack 8

    AccessMask : UInt32

    AccessReasons : UInt32[32]

    ObjectTypeIndex : UInt32

    AccessGranted : UInt32

    SecurityDescriptor : PSECURITY_DESCRIPTOR

}
