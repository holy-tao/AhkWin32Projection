#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a parameter that provides host software with the capability to initiate an NVM Subsystem Reset.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_nvm_subsystem_reset
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_NVM_SUBSYSTEM_RESET extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * A read/write value that initiates an NVM Subsystem Reset.
     * 
     * Writing the value `4E564D65h` ("NVMe") to this field initiates an NVM Subsystem Reset. Writing any other value has no functional effect on the operation of the NVM subsystem.
     * 
     * This field returns the value `0h` when read.
     * @type {Integer}
     */
    NSSRC {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
