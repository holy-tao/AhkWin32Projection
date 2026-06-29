#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SMB_SHARE_FLUSH_AND_PURGE_OUTPUT {
    #StructPack 4

    cEntriesPurged : UInt32

}
