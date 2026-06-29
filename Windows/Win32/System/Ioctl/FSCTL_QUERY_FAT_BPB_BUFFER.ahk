#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FSCTL_QUERY_FAT_BPB_BUFFER {
    #StructPack 1

    First0x24BytesOfBootSector : Int8[36]

}
