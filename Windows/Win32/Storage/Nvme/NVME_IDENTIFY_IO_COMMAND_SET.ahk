#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IO_COMMAND_SET_VECTOR.ahk" { IO_COMMAND_SET_VECTOR }

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_IDENTIFY_IO_COMMAND_SET {
    #StructPack 8

    IOCommandSetVector : IO_COMMAND_SET_VECTOR[512]

}
