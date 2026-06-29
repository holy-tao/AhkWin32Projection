#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SID_IDENTIFIER_AUTHORITY.ahk" { SID_IDENTIFIER_AUTHORITY }

/**
 * Used to uniquely identify users or groups.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-sid
 * @namespace Windows.Win32.Security
 */
export default struct SID {
    #StructPack 4

    Revision : Int8

    SubAuthorityCount : Int8

    IdentifierAuthority : SID_IDENTIFIER_AUTHORITY

    SubAuthority : UInt32[1]

}
