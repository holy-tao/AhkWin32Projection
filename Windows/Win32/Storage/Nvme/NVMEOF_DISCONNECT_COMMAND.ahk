#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NVME_SGL_DATABLOCK_DESC.ahk" { NVME_SGL_DATABLOCK_DESC }

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVMEOF_DISCONNECT_COMMAND {
    #StructPack 8

    OPC : Int8

    Reserved0 : Int8

    CID : UInt16

    FCTYPE : Int8

    Reserved1 : Int8[19]

    SGL1 : NVME_SGL_DATABLOCK_DESC

    RECFMT : UInt16

    Reserved2 : Int8[22]

}
