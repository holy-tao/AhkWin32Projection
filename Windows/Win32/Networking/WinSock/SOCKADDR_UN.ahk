#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ADDRESS_FAMILY.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class SOCKADDR_UN extends Win32Struct {
    static sizeof => 110

    static packingSize => 2

    /**
     * @type {ADDRESS_FAMILY}
     */
    sun_family {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {String}
     */
    sun_path {
        get => StrGet(this.ptr + 2, 107, "UTF-8")
        set => StrPut(value, this.ptr + 2, 107, "UTF-8")
    }
}
