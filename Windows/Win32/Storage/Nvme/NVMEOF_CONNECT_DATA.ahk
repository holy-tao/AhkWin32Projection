#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVMEOF_CONNECT_DATA {
    #StructPack 2

    HOSTID : Int8[16]

    CNTLID : UInt16

    Reserved0 : Int8[238]

    SUBNQN : Int8[256]

    HOSTNQN : Int8[256]

    Reserved1 : Int8[256]

}
