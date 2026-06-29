#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVMEOF_AUTH_SEND_RESPONSE {
    #StructPack 8

    Reserved0 : Int64

    SQHD : UInt16

    Reserved1 : UInt16

    CID : UInt16

    STS : UInt16

}
