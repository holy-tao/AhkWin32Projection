#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a communications device.
 * @see https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-comstat
 * @namespace Windows.Win32.Devices.Communication
 * @version v4.0.30319
 */
class COMSTAT extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of bytes received by the serial provider but not yet read by a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfile">ReadFile</a> operation.
     * @type {Integer}
     */
    cbInQue {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of bytes of user data remaining to be transmitted for all write operations. This value will be zero for a nonoverlapped write.
     * @type {Integer}
     */
    cbOutQue {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
