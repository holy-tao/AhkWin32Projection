#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RTR_TOC_ENTRY.ahk" { RTR_TOC_ENTRY }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct RTR_INFO_BLOCK_HEADER {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    TocEntriesCount : UInt32

    TocEntry : RTR_TOC_ENTRY[1]

}
