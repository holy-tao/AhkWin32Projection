#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SAM_REGISTER_MAPPING_ELEMENT {
    #StructPack 8

    Original : PSTR

    Mapped : PSTR

    Continuable : BOOLEAN

}
