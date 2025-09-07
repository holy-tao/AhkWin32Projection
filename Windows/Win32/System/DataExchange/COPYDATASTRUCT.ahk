#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains data to be passed to another application by the WM_COPYDATA message.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-copydatastruct
 * @namespace Windows.Win32.System.DataExchange
 * @version v4.0.30319
 */
class COPYDATASTRUCT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>ULONG_PTR</b>
     * 
     * The type of the data to be passed to the receiving application. The receiving application defines the valid types.
     * @type {Pointer}
     */
    dwData {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of the data pointed to by the <b>lpData</b> member.
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>PVOID</b>
     * 
     * The data to be passed to the receiving application. This member can be <b>NULL</b>.
     * @type {Pointer<Void>}
     */
    lpData {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
