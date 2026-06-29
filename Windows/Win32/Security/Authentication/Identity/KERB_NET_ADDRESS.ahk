#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_NET_ADDRESS {
    #StructPack 8

    Family : UInt32

    Length : UInt32

    Address : PSTR

}
