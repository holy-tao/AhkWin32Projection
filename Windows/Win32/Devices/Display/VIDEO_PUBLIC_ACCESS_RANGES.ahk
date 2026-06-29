#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct VIDEO_PUBLIC_ACCESS_RANGES {
    #StructPack 8

    InIoSpace : UInt32

    MappedInIoSpace : UInt32

    VirtualAddress : IntPtr

}
