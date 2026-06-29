#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct VIDEO_POINTER_CAPABILITIES {
    #StructPack 4

    Flags : UInt32

    MaxWidth : UInt32

    MaxHeight : UInt32

    HWPtrBitmapStart : UInt32

    HWPtrBitmapEnd : UInt32

}
