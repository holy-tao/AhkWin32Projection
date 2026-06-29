#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a parameter that provides host software with the capability to initiate an NVM Subsystem Reset.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_nvm_subsystem_reset
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_NVM_SUBSYSTEM_RESET {
    #StructPack 4

    /**
     * A read/write value that initiates an NVM Subsystem Reset.
     * 
     * Writing the value `4E564D65h` ("NVMe") to this field initiates an NVM Subsystem Reset. Writing any other value has no functional effect on the operation of the NVM subsystem.
     * 
     * This field returns the value `0h` when read.
     */
    NSSRC : UInt32

}
