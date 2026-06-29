#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SecPkgCred_SessionTicketKey.ahk" { SecPkgCred_SessionTicketKey }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgCred_SessionTicketKeys {
    #StructPack 8

    cSessionTicketKeys : UInt32

    pSessionTicketKeys : SecPkgCred_SessionTicketKey.Ptr

}
