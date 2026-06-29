#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * SID_IDENTIFIER_AUTHORITY IDL Definition
 * @see https://learn.microsoft.com/windows/win32/NetMgmt/odj-sid_identifier_authority
 * @namespace Windows.Win32.Security
 */
export default struct SID_IDENTIFIER_AUTHORITY {
    #StructPack 1

    Value : Int8[6]

}
