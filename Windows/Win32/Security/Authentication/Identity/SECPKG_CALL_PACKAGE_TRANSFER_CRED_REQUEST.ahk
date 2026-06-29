#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\LUID.ahk" { LUID }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_CALL_PACKAGE_TRANSFER_CRED_REQUEST {
    #StructPack 4

    MessageType : UInt32

    OriginLogonId : LUID

    DestinationLogonId : LUID

    Flags : UInt32

}
