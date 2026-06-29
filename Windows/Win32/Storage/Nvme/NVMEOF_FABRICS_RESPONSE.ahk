#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVMEOF_FABRICS_RESPONSE {
    #StructPack 2

    Specific : Int8[8]

    SQHD : UInt16

    Reserved : UInt16

    CID : UInt16

    STS : UInt16

}
