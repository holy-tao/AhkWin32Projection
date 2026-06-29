#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_QUERY_DEPENDENT_VOLUME_REQUEST {
    #StructPack 4

    RequestLevel : UInt32

    RequestFlags : UInt32

}
