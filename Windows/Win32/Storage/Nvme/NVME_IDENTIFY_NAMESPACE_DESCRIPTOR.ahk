#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_IDENTIFY_NAMESPACE_DESCRIPTOR {
    #StructPack 1

    NIDT : Int8

    NIDL : Int8

    Reserved : Int8[2]

    NID : Int8[1]

}
