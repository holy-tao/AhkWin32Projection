#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct CTAPCBOR_HYBRID_STORAGE_LINKED_DATA {
    #StructPack 8

    dwVersion : UInt32

    cbContactId : UInt32

    pbContactId : IntPtr

    cbLinkId : UInt32

    pbLinkId : IntPtr

    cbLinkSecret : UInt32

    pbLinkSecret : IntPtr

    cbPublicKey : UInt32

    pbPublicKey : IntPtr

    pwszAuthenticatorName : PWSTR

    wEncodedTunnelServerDomain : UInt16

}
