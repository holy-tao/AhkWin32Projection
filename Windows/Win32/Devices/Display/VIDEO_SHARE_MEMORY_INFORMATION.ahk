#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct VIDEO_SHARE_MEMORY_INFORMATION {
    #StructPack 8

    SharedViewOffset : UInt32

    SharedViewSize : UInt32

    VirtualAddress : IntPtr

}
