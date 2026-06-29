#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICE_DSM_TIERING_QUERY_INPUT {
    #StructPack 8

    Version : UInt32

    Size : UInt32

    Flags : UInt32

    NumberOfTierIds : UInt32

    TierIds : IntPtr[1]

}
