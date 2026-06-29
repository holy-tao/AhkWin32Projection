#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct DRVM_IOCTL_DATA {
    #StructPack 4

    dwSize : UInt32

    dwCmd : UInt32

}
