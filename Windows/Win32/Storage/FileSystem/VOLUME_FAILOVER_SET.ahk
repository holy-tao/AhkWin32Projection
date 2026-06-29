#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct VOLUME_FAILOVER_SET {
    #StructPack 4

    NumberOfDisks : UInt32

    DiskNumbers : UInt32[1]

}
