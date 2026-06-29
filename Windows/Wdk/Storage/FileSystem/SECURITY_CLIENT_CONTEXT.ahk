#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct SECURITY_CLIENT_CONTEXT {
    #StructPack 8

    SecurityQos : IntPtr

    ClientToken : IntPtr

    DirectlyAccessClientToken : BOOLEAN

    DirectAccessEffectiveOnly : BOOLEAN

    ServerIsRemote : BOOLEAN

    ClientTokenControl : IntPtr

}
