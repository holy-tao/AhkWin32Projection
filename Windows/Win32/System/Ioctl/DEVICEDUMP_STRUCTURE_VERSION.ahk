#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICEDUMP_STRUCTURE_VERSION {
    #StructPack 4

    dwSignature : UInt32

    dwVersion : UInt32

    dwSize : UInt32

}
