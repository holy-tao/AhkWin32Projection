#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NVME_COMMAND_EFFECTS_DATA.ahk" { NVME_COMMAND_EFFECTS_DATA }

/**
 * Contains information that describes the commands that the controller supports and the effects of those commands on the state of the NVM subsystem.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_command_effects_log
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_COMMAND_EFFECTS_LOG {
    #StructPack 4

    /**
     * A [NVME_COMMAND_EFFECTS_DATA](ns-nvme-nvme_command_effects_data.md) structure that describes the Admin commands that the controller supports and the effects of those commands.
     */
    ACS : NVME_COMMAND_EFFECTS_DATA[256]

    /**
     * A [NVME_COMMAND_EFFECTS_DATA](ns-nvme-nvme_command_effects_data.md) structure that describes the I/O commands that the controller supports and the effects of those commands.
     */
    IOCS : NVME_COMMAND_EFFECTS_DATA[256]

    Reserved : Int8[2048]

}
