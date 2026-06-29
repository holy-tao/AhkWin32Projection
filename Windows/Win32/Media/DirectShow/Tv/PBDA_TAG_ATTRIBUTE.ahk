#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct PBDA_TAG_ATTRIBUTE {
    #StructPack 4

    TableUUId : Guid

    TableId : Int8

    VersionNo : UInt16

    TableDataSize : UInt32

    TableData : Int8[1]

}
