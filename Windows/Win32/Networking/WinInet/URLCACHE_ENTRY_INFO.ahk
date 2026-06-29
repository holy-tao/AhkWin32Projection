#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct URLCACHE_ENTRY_INFO {
    #StructPack 8

    pwszSourceUrlName : PWSTR

    pwszLocalFileName : PWSTR

    dwCacheEntryType : UInt32

    dwUseCount : UInt32

    dwHitRate : UInt32

    dwSizeLow : UInt32

    dwSizeHigh : UInt32

    ftLastModifiedTime : FILETIME

    ftExpireTime : FILETIME

    ftLastAccessTime : FILETIME

    ftLastSyncTime : FILETIME

    pbHeaderInfo : IntPtr

    cbHeaderInfoSize : UInt32

    pbExtraData : IntPtr

    cbExtraDataSize : UInt32

}
