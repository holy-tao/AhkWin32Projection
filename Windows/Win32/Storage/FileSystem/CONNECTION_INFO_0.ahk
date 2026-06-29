#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the identification number of a connection.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-connection_info_0
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct CONNECTION_INFO_0 {
    #StructPack 4

    /**
     * Specifies a connection identification number.
     */
    coni0_id : UInt32

}
