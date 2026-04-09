#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\APP_CACHE_GROUP_INFO.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class APP_CACHE_GROUP_LIST extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwAppCacheGroupCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<APP_CACHE_GROUP_INFO>}
     */
    pAppCacheGroups {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
