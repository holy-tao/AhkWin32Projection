#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLS_LSN.ahk" { CLS_LSN }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct CLFS_PHYSICAL_LSN_INFORMATION {
    #StructPack 8

    StreamIdentifier : Int8

    VirtualLsn : CLS_LSN

    PhysicalLsn : CLS_LSN

}
