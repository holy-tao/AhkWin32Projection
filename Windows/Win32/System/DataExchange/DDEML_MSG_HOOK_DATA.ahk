#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a Dynamic Data Exchange (DDE) message, and provides read access to the data referenced by the message. This structure is intended to be used by a Dynamic Data Exchange Management Library (DDEML) monitoring application.
 * @see https://learn.microsoft.com/windows/win32/api/ddeml/ns-ddeml-ddeml_msg_hook_data
 * @namespace Windows.Win32.System.DataExchange
 * @version v4.0.30319
 */
class DDEML_MSG_HOOK_DATA extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Type: <b>UINT_PTR</b>
     * 
     * The unpacked low-order word of the <i>lParam</i> parameter associated with the DDE message.
     * @type {Pointer}
     */
    uiLo {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>UINT_PTR</b>
     * 
     * The unpacked high-order word of the <i>lParam</i> parameter associated with the DDE message.
     * @type {Pointer}
     */
    uiHi {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The amount of data being passed with the message, in bytes. This value can be greater than 32.
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>DWORD[8]</b>
     * 
     * The first 32 bytes of data being passed with the message (<c>8 * sizeof(DWORD)</c>).
     * @type {Array<UInt32>}
     */
    Data{
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 20, 4, Primitive, "uint")
            return this.__DataProxyArray
        }
    }
}
