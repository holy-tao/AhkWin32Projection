#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains parameters that are used in the Security Send command.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw11_security_send
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CDW11_SECURITY_SEND extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The value of Transfer Length (TL) field is specific to the Security Protocol as defined in [SECURITY PROTOCOL IN (SPC-4)](https://nvmexpress.org/wp-content/uploads/NVM_Express_-_SCSI_Translation_Reference-1_5_20150624_Gold.pdf).
     * 
     * This field is supported and specifies the number of bytes to transfer if the INC_512 field is set to `0` in the SPC-4 Security Protocol.
     * @type {Integer}
     */
    TL {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
