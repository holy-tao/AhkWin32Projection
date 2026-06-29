#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_IDENTIFY_ZNS_SPECIFIC_CONTROLLER_IO_COMMAND_SET {
    #StructPack 1

    ZASL : Int8

    Reserved : Int8[4095]

}
