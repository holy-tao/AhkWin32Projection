#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVMEOF_AUTH_DHCHAP_DESCRIPTOR {
    #StructPack 1

    AuthId : Int8

    Reserved0 : Int8

    HALEN : Int8

    DHLEN : Int8

    IdList : Int8[60]

}
