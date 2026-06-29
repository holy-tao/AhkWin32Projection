#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DFS_SITENAME_INFO.ahk" { DFS_SITENAME_INFO }

/**
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 */
export default struct DFS_SITELIST_INFO {
    #StructPack 8

    cSites : UInt32

    Site : DFS_SITENAME_INFO[1]

}
