#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FILE_PROVIDER_EXTERNAL_INFO_V1 {
    #StructPack 4

    Version : UInt32

    Algorithm : UInt32

    Flags : UInt32

}
