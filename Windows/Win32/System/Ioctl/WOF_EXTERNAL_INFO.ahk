#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct WOF_EXTERNAL_INFO {
    #StructPack 4

    Version : UInt32

    Provider : UInt32

}
