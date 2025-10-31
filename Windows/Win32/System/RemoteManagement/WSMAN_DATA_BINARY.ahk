#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Holds binary data for use with various Windows Remote Management functions.
 * @see https://docs.microsoft.com/windows/win32/api//wsman/ns-wsman-wsman_data_binary
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_DATA_BINARY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Represents the number of BYTEs stored in the data field.
     * @type {Integer}
     */
    dataLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the storage location for the binary data.
     * @type {Pointer<Integer>}
     */
    data {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
