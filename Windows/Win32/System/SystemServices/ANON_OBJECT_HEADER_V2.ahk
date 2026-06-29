#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct ANON_OBJECT_HEADER_V2 {
    #StructPack 4

    Sig1 : UInt16

    Sig2 : UInt16

    Version : UInt16

    Machine : UInt16

    TimeDateStamp : UInt32

    ClassID : Guid

    SizeOfData : UInt32

    Flags : UInt32

    MetaDataSize : UInt32

    MetaDataOffset : UInt32

}
