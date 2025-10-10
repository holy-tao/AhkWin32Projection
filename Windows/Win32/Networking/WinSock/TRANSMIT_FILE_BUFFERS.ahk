#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The TRANSMIT_FILE_BUFFERS structure specifies data to be transmitted before and after file data during a TransmitFile function file transfer operation.
 * @see https://docs.microsoft.com/windows/win32/api//winsock/ns-winsock-transmit_file_buffers
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class TRANSMIT_FILE_BUFFERS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Pointer to a buffer that contains data to be transmitted before the file data is transmitted.
     * @type {Pointer<Void>}
     */
    Head {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Size of the buffer pointed to by <b>Head</b>, in bytes, to be transmitted.
     * @type {Integer}
     */
    HeadLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Pointer to a buffer that contains data to be transmitted after the file data is transmitted.
     * @type {Pointer<Void>}
     */
    Tail {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Size of the buffer pointed to <b>Tail</b>, in bytes, to be transmitted.
     * @type {Integer}
     */
    TailLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
