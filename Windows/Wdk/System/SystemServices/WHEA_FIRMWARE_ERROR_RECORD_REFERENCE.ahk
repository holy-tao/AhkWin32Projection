#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_FIRMWARE_ERROR_RECORD_REFERENCE {
    #StructPack 8

    Type : Int8

    Reserved : Int8[7]

    FirmwareRecordId : Int64

}
