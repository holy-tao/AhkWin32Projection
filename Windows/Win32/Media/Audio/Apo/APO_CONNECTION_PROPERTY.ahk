#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the dynamically changing connection properties.
 * @remarks
 * 
  * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client applications.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//audioapotypes/ns-audioapotypes-apo_connection_property
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class APO_CONNECTION_PROPERTY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A pointer to the connection buffer. Endpoints use this buffer to read and write
     *     audio data.
     * @type {Pointer}
     */
    pBuffer {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The number of valid frames in the connection buffer. An APO  uses the valid frame count to determine the amount of data to read and process in the input buffer. An APO sets the valid frame count
     *     after writing data into its output connection.
     * @type {Integer}
     */
    u32ValidFrameCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The connection flags for this buffer. This indicates the validity status of the APOs. For more information about these flags, see <a href="https://docs.microsoft.com/windows/desktop/api/audioapotypes/ne-audioapotypes-apo_buffer_flags">APO_BUFFER_FLAGS</a>.
     * @type {Integer}
     */
    u32BufferFlags {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * A tag that identifies a valid <b>APO_CONNECTION_PROPERTY</b> structure. A valid structure is marked as <b>APO_CONNECTION_PROPERTY_SIGNATURE</b>. If the value of this field is equal to **APO_CONNECTION_PROPERTY_V2_SIGNATURE**, the structure can be safely typecast to a [APO_CONNECTION_PROPERTY_V2](ns-audioapotypes-apo_connection_property_v2.md).
     * @type {Integer}
     */
    u32Signature {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
