#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICE_DATA_SET_LBP_STATE_PARAMETERS {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    Flags : UInt32

    OutputVersion : UInt32

}
