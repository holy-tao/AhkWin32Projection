#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DS_REPL_VALUE_META_DATA_EXT {
    #StructPack 8

    pszAttributeName : PWSTR

    pszObjectDn : PWSTR

    cbData : UInt32

    pbData : IntPtr

    ftimeDeleted : FILETIME

    ftimeCreated : FILETIME

    dwVersion : UInt32

    ftimeLastOriginatingChange : FILETIME

    uuidLastOriginatingDsaInvocationID : Guid

    usnOriginatingChange : Int64

    usnLocalChange : Int64

    pszLastOriginatingDsaDN : PWSTR

    dwUserIdentifier : UInt32

    dwPriorLinkState : UInt32

    dwCurrentLinkState : UInt32

}
