#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct NEGOTIATE_CALLER_NAME_RESPONSE {
    #StructPack 8

    MessageType : UInt32

    CallerName : PWSTR

}
