#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct GENERIC_XML_TOKEN {
    #StructPack 8

    createDate : FILETIME

    expiryDate : FILETIME

    xmlToken : PWSTR

    internalTokenReference : PWSTR

    externalTokenReference : PWSTR

}
