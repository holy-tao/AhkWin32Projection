#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Holds textual data for use with various Windows Remote Management functions.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_data_text
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_DATA_TEXT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the number of UNICODE characters stored in the buffer.
     * @type {Integer}
     */
    bufferLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the storage location for the textual data.
     * @type {PWSTR}
     */
    buffer{
        get {
            if(!this.HasProp("__buffer"))
                this.__buffer := PWSTR(this.ptr + 8)
            return this.__buffer
        }
    }
}
