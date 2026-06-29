#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NVME_UUID_LIST_ENTRY.ahk" { NVME_UUID_LIST_ENTRY }

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_UUID_LIST {
    #StructPack 1

    UUID : NVME_UUID_LIST_ENTRY[128]

}
