#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICE_DSM_REPORT_ZONES_PARAMETERS {
    #StructPack 4

    Size : UInt32

    ReportOption : Int8

    Partial : Int8

    Reserved : Int8[2]

}
