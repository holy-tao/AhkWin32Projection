#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_EXTENDED_ATTR {
    #StructPack 2

    EXATTYPE : UInt16

    EXATLEN : UInt16

    EXATVAL : Int8[1]

}
