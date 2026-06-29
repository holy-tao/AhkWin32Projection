#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NVME_NVME_MI_COMMANDS_SUPPORTED_AND_EFFECTS.ahk" { NVME_NVME_MI_COMMANDS_SUPPORTED_AND_EFFECTS }

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_NVME_MI_COMMANDS_SUPPORTED_AND_EFFECTS_LOG {
    #StructPack 4

    ManagementInterfaceCommandSupported : NVME_NVME_MI_COMMANDS_SUPPORTED_AND_EFFECTS[256]

    Reserved : Int8[3072]

}
