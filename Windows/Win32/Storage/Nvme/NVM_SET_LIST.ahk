#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NVME_SET_ATTRIBUTES_ENTRY.ahk" { NVME_SET_ATTRIBUTES_ENTRY }

/**
 * Contains an array of entries for the NVME Set Attributes command.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvm_set_list
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVM_SET_LIST {
    #StructPack 4

    /**
     * The number of identifiers in the entry.
     */
    IdentifierCount : Int8

    Reserved : Int8[127]

    /**
     * An array of [NVME_SET_ATTRIBUTES_ENTRY](ns-nvme-nvme_set_attributes_entry.md) structures that specify attribute values to be set by the set list.
     */
    Entry : NVME_SET_ATTRIBUTES_ENTRY[1]

}
