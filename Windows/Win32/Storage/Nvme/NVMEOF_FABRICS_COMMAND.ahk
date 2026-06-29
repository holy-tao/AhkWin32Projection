#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVMEOF_FABRICS_COMMAND {
    #StructPack 2

    OPC : Int8

    PSDT : Int8

    CID : UInt16

    FCTYPE : Int8

    Reserved : Int8[35]

    Specific : Int8[24]

}
