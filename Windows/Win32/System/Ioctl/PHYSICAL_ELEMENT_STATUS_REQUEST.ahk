#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct PHYSICAL_ELEMENT_STATUS_REQUEST {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    StartingElement : UInt32

    Filter : Int8

    ReportType : Int8

    Reserved : Int8[2]

}
