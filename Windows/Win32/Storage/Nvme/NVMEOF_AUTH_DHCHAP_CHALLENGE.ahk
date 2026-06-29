#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVMEOF_AUTH_DHCHAP_CHALLENGE {
    #StructPack 4

    AUTH_TYPE : Int8

    AUTH_ID : Int8

    Reserved0 : UInt16

    T_ID : UInt16

    HL : Int8

    Reserved1 : Int8

    HashID : Int8

    DHgID : Int8

    DHVLEN : UInt16

    SEQNUM : UInt32

}
