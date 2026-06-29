#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_RANGE_FORMAT {
    #StructPack 8

    FormatCode : Int8

    RangeType : Int8

    Reserved : UInt16

    MinValue : Int64

    MaxValue : Int64

}
