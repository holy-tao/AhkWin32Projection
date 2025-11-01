#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/winsock/ns-winsock-timeval
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class TIMEVAL extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    tv_sec {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    tv_usec {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
