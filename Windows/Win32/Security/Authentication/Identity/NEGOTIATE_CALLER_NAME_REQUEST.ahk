#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\LUID.ahk" { LUID }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct NEGOTIATE_CALLER_NAME_REQUEST {
    #StructPack 4

    MessageType : UInt32

    LogonId : LUID

}
