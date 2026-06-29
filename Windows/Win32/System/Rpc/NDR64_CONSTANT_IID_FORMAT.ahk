#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_CONSTANT_IID_FORMAT {
    #StructPack 4

    FormatCode : Int8

    Flags : Int8

    Reserved : UInt16

    Guid : Guid

}
