#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KERB_NET_ADDRESS.ahk" { KERB_NET_ADDRESS }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_NET_ADDRESSES {
    #StructPack 8

    Number : UInt32

    Addresses : KERB_NET_ADDRESS[1]

}
