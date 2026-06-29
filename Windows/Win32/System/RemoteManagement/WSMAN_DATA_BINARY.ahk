#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Holds binary data for use with various Windows Remote Management functions.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_data_binary
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSMAN_DATA_BINARY {
    #StructPack 8

    /**
     * Represents the number of BYTEs stored in the data field.
     */
    dataLength : UInt32

    /**
     * Specifies the storage location for the binary data.
     */
    data : IntPtr

}
