#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ADDRESS_FAMILY.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class SOCKADDR_STORAGE extends Win32Struct {
    static sizeof => 128

    static packingSize => 8

    /**
     * @type {ADDRESS_FAMILY}
     */
    ss_family {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {String}
     */
    __ss_pad1 {
        get => StrGet(this.ptr + 2, 5, "UTF-8")
        set => StrPut(value, this.ptr + 2, 5, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    __ss_align {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {String}
     */
    __ss_pad2 {
        get => StrGet(this.ptr + 16, 111, "UTF-8")
        set => StrPut(value, this.ptr + 16, 111, "UTF-8")
    }
}
