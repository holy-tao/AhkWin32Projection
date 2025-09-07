#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINEQUEUEENTRY structure provides the information for a single queue entry. The LINEQUEUELIST structure can contain an array of LINEQUEUEENTRY structures. This structure requires TAPI 3.0 version negotiation.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-linequeueentry
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINEQUEUEENTRY extends Win32Struct
{
    static sizeof => 12

    static packingSize => 1

    /**
     * Unique identifier for a queue. It is the responsibility of the agent handler to generate and maintain uniqueness of this identifier.
     * @type {Integer}
     */
    dwQueueID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size of the queue name string including the <b>null</b> terminator, in bytes.
     * @type {Integer}
     */
    dwNameSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Offset from the beginning of the structure to a <b>null</b>-terminated string that specifies the name of the queue. The size of the string is specified by <b>dwNameSize</b>.
     * @type {Integer}
     */
    dwNameOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
