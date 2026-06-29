#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 */
export default struct DFS_SITENAME_INFO {
    #StructPack 8

    SiteFlags : UInt32

    SiteName : PWSTR

}
