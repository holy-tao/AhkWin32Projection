#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NVME_SGL_DESC.ahk" { NVME_SGL_DESC }

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVMEOF_AUTH_SEND_COMMAND {
    #StructPack 4

    OPC : Int8

    Reserved0 : Int8

    CID : UInt16

    FCTYPE : Int8

    Reserved1 : Int8[19]

    SGL1 : NVME_SGL_DESC

    Reserved2 : Int8

    SPSP0 : Int8

    SPSP1 : Int8

    SECP : Int8

    TL : UInt32

    Reserved3 : Int8[16]

}
