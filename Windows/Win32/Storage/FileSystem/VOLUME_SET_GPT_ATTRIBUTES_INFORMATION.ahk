#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct VOLUME_SET_GPT_ATTRIBUTES_INFORMATION {
    #StructPack 8

    GptAttributes : Int64

    RevertOnClose : BOOLEAN

    ApplyToAllConnectedVolumes : BOOLEAN

    Reserved1 : UInt16

    Reserved2 : UInt32

}
