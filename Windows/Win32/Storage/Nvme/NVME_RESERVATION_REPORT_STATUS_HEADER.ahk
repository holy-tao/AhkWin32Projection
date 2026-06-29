#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_RESERVATION_REPORT_STATUS_HEADER {
    #StructPack 4

    GEN : UInt32

    RTYPE : Int8

    REGCTL : UInt16

    Reserved : Int8[2]

    PTPLS : Int8

    Reserved1 : Int8[14]

}
