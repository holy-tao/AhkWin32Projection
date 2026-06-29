#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\APP_CACHE_DOWNLOAD_ENTRY.ahk" { APP_CACHE_DOWNLOAD_ENTRY }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct APP_CACHE_DOWNLOAD_LIST {
    #StructPack 8

    dwEntryCount : UInt32

    pEntries : APP_CACHE_DOWNLOAD_ENTRY.Ptr

}
