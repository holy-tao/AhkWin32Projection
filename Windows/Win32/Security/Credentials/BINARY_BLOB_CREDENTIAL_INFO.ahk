#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Credentials
 */
export default struct BINARY_BLOB_CREDENTIAL_INFO {
    #StructPack 8

    cbBlob : UInt32

    pbBlob : IntPtr

}
