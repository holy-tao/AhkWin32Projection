#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class INTERNET_DOWNLOAD_MODE_HANDLE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pcwszFileName{
        get {
            if(!this.HasProp("__pcwszFileName"))
                this.__pcwszFileName := PWSTR(this.ptr + 0)
            return this.__pcwszFileName
        }
    }

    /**
     * @type {Pointer<HANDLE>}
     */
    phFile {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
