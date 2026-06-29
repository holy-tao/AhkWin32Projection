#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains parameters that are used in the Security Receive command.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_cdw11_security_receive
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_CDW11_SECURITY_RECEIVE {
    #StructPack 4

    /**
     * The value of the Allocation Length (AL) field is specific to the Security Protocol as defined in [SECURITY PROTOCOL IN (SPC-4)](https://nvmexpress.org/wp-content/uploads/NVM_Express_-_SCSI_Translation_Reference-1_5_20150624_Gold.pdf).
     * 
     * This field is supported and specifies the number of bytes to transfer if the INC_512 field is set to `0` in the SPC-4 Security Protocol.
     */
    AL : UInt32

}
