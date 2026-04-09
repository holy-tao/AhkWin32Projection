#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUS_CREATE_INFRASTRUCTURE_FILESERVER_INPUT extends Win32Struct {
    static sizeof => 32

    static packingSize => 2

    /**
     * @type {String}
     */
    FileServerName {
        get => StrGet(this.ptr + 0, 15, "UTF-16")
        set => StrPut(value, this.ptr + 0, 15, "UTF-16")
    }
}
