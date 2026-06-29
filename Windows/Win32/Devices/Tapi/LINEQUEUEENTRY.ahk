#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LINEQUEUEENTRY structure provides the information for a single queue entry. The LINEQUEUELIST structure can contain an array of LINEQUEUEENTRY structures. This structure requires TAPI 3.0 version negotiation.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-linequeueentry
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINEQUEUEENTRY {
    #StructPack 4

    /**
     * Unique identifier for a queue. It is the responsibility of the agent handler to generate and maintain uniqueness of this identifier.
     */
    dwQueueID : UInt32

    /**
     * Size of the queue name string including the <b>null</b> terminator, in bytes.
     */
    dwNameSize : UInt32

    /**
     * Offset from the beginning of the structure to a <b>null</b>-terminated string that specifies the name of the queue. The size of the string is specified by <b>dwNameSize</b>.
     */
    dwNameOffset : UInt32

}
