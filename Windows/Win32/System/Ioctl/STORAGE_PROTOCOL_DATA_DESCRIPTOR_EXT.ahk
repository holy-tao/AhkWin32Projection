#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_PROTOCOL_SPECIFIC_DATA_EXT.ahk" { STORAGE_PROTOCOL_SPECIFIC_DATA_EXT }
#Import ".\STORAGE_PROTOCOL_TYPE.ahk" { STORAGE_PROTOCOL_TYPE }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_PROTOCOL_DATA_DESCRIPTOR_EXT {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    ProtocolSpecificData : STORAGE_PROTOCOL_SPECIFIC_DATA_EXT

}
