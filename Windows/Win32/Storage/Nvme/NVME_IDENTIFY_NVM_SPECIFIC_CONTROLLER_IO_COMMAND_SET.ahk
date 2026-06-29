#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_IDENTIFY_NVM_SPECIFIC_CONTROLLER_IO_COMMAND_SET {
    #StructPack 8

    VSL : Int8

    WZSL : Int8

    WUSL : Int8

    DMRL : Int8

    DMRSL : UInt32

    DMSL : Int64

    Reserved : Int8[4080]

}
