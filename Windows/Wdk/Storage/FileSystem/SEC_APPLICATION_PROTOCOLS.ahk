#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Stores an array of application protocol lists.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_application_protocols
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct SEC_APPLICATION_PROTOCOLS {
    #StructPack 8

    /**
     * The size (in bytes) of the protocol ID lists array.
     */
    ProtocolListsSize : UInt32

    /**
     * The array of protocol ID lists.
     */
    ProtocolLists : IntPtr[1]

}
