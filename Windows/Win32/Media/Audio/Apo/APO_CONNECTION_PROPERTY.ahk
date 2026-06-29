#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\APO_BUFFER_FLAGS.ahk" { APO_BUFFER_FLAGS }

/**
 * Contains the dynamically changing connection properties.
 * @remarks
 * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client applications.
 * @see https://learn.microsoft.com/windows/win32/api/audioapotypes/ns-audioapotypes-apo_connection_property
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct APO_CONNECTION_PROPERTY {
    #StructPack 8

    /**
     * A pointer to the connection buffer. Endpoints use this buffer to read and write
     *     audio data.
     */
    pBuffer : IntPtr

    /**
     * The number of valid frames in the connection buffer. An APO  uses the valid frame count to determine the amount of data to read and process in the input buffer. An APO sets the valid frame count
     *     after writing data into its output connection.
     */
    u32ValidFrameCount : UInt32

    /**
     * The connection flags for this buffer. This indicates the validity status of the APOs. For more information about these flags, see <a href="https://docs.microsoft.com/windows/desktop/api/audioapotypes/ne-audioapotypes-apo_buffer_flags">APO_BUFFER_FLAGS</a>.
     */
    u32BufferFlags : APO_BUFFER_FLAGS

    /**
     * A tag that identifies a valid <b>APO_CONNECTION_PROPERTY</b> structure. A valid structure is marked as <b>APO_CONNECTION_PROPERTY_SIGNATURE</b>. If the value of this field is equal to **APO_CONNECTION_PROPERTY_V2_SIGNATURE**, the structure can be safely typecast to a [APO_CONNECTION_PROPERTY_V2](ns-audioapotypes-apo_connection_property_v2.md).
     */
    u32Signature : UInt32

}
