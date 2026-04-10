#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\UNICODE_STRING.ahk
#Include ..\..\..\Win32\Networking\WinSock\SOCKADDR_STORAGE.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class NFS_OPEN_ECP_CONTEXT extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<UNICODE_STRING>}
     */
    ExportAlias {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<SOCKADDR_STORAGE>}
     */
    ClientSocketAddress {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
