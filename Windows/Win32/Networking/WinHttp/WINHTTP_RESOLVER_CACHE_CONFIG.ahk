#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINHTTP_SECURE_DNS_SETTING.ahk" { WINHTTP_SECURE_DNS_SETTING }

/**
 * @namespace Windows.Win32.Networking.WinHttp
 * @architecture X64, Arm64
 */
export default struct WINHTTP_RESOLVER_CACHE_CONFIG {
    #StructPack 8

    ulMaxResolverCacheEntries : UInt32

    ulMaxCacheEntryAge : UInt32

    ulMinCacheEntryTtl : UInt32

    SecureDnsSetting : WINHTTP_SECURE_DNS_SETTING

    ullConnResolutionWaitTime : Int64

    ullFlags : Int64

}
