#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NTMS_MOUNT_INFORMATION {
    #StructPack 8

    dwSize : UInt32

    lpReserved : IntPtr

}
