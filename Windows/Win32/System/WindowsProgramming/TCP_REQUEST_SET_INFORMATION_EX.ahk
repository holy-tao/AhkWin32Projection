#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TDIEntityID.ahk" { TDIEntityID }
#Import ".\TDIObjectID.ahk" { TDIObjectID }
#Import ".\TDIENTITY_ENTITY_TYPE.ahk" { TDIENTITY_ENTITY_TYPE }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct TCP_REQUEST_SET_INFORMATION_EX {
    #StructPack 4

    ID : TDIObjectID

    BufferSize : UInt32

    Buffer : Int8[1]

}
