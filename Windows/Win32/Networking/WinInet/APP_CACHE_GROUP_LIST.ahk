#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\APP_CACHE_GROUP_INFO.ahk" { APP_CACHE_GROUP_INFO }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct APP_CACHE_GROUP_LIST {
    #StructPack 8

    dwAppCacheGroupCount : UInt32

    pAppCacheGroups : APP_CACHE_GROUP_INFO.Ptr

}
