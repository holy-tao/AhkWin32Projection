#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct QUERY_BAD_RANGES_INPUT_RANGE {
    #StructPack 8

    StartOffset : Int64

    LengthInBytes : Int64

}
