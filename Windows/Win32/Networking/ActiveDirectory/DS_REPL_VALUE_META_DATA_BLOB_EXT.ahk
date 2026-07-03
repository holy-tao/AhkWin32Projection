#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DS_REPL_VALUE_META_DATA_BLOB_EXT {
    #StructPack 8

    oszAttributeName : UInt32

    oszObjectDn : UInt32

    cbData : UInt32

    obData : UInt32

    ftimeDeleted : FILETIME

    ftimeCreated : FILETIME

    dwVersion : UInt32

    ftimeLastOriginatingChange : FILETIME

    uuidLastOriginatingDsaInvocationID : Guid

    usnOriginatingChange : Int64

    usnLocalChange : Int64

    oszLastOriginatingDsaDN : UInt32

    dwUserIdentifier : UInt32

    dwPriorLinkState : UInt32

    dwCurrentLinkState : UInt32

}
