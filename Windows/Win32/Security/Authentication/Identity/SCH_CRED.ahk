#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\_HMAPPER.ahk" { _HMAPPER }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SCH_CRED {
    #StructPack 8

    dwVersion : UInt32

    cCreds : UInt32

    paSecret : IntPtr

    paPublic : IntPtr

    cMappers : UInt32

    aphMappers : IntPtr

}
