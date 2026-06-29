#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TDIEntityID.ahk" { TDIEntityID }
#Import ".\TDIObjectID.ahk" { TDIObjectID }
#Import ".\TDIENTITY_ENTITY_TYPE.ahk" { TDIENTITY_ENTITY_TYPE }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @architecture X64, Arm64
 */
export default struct TCP_REQUEST_QUERY_INFORMATION_EX32_XP {
    #StructPack 4

    ID : TDIObjectID

    Context : UInt32[4]

}
