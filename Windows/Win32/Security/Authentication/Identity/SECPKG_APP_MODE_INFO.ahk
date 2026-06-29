#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\SecBuffer.ahk" { SecBuffer }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_APP_MODE_INFO {
    #StructPack 8

    UserFunction : UInt32

    Argument1 : IntPtr

    Argument2 : IntPtr

    UserData : SecBuffer

    ReturnToLsa : BOOLEAN

}
