#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FILE_REFERENCE_RANGE {
    #StructPack 8

    StartingFileReferenceNumber : Int64

    EndingFileReferenceNumber : Int64

}
