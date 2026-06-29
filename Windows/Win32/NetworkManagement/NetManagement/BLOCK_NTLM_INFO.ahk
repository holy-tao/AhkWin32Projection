#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct BLOCK_NTLM_INFO {
    #StructPack 4

    BlockNTLM : BOOLEAN

    Reserved1 : Int8

    Reserved2 : UInt16

    Reserved3 : UInt32

}
