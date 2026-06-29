#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_PROTOCOL_TYPE.ahk" { STORAGE_PROTOCOL_TYPE }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_PROTOCOL_SPECIFIC_DATA_EXT {
    #StructPack 4

    ProtocolType : STORAGE_PROTOCOL_TYPE

    DataType : UInt32

    ProtocolDataValue : UInt32

    ProtocolDataSubValue : UInt32

    ProtocolDataOffset : UInt32

    ProtocolDataLength : UInt32

    FixedProtocolReturnData : UInt32

    ProtocolDataSubValue2 : UInt32

    ProtocolDataSubValue3 : UInt32

    ProtocolDataSubValue4 : UInt32

    ProtocolDataSubValue5 : UInt32

    ProtocolDataSubValue6 : UInt32

    Reserved : UInt32[4]

}
