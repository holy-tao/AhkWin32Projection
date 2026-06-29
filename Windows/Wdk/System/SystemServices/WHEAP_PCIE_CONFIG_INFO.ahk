#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_PCIE_CONFIG_INFO {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    Segment : UInt32

    Bus : UInt32

    Device : UInt32

    Function : UInt32

    Offset : UInt32

    Length : UInt32

    Value : Int64

    Succeeded : Int8

    Reserved : Int8[3]

}
