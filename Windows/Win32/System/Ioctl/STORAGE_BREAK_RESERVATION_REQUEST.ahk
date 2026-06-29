#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_BREAK_RESERVATION_REQUEST {
    #StructPack 4

    Length : UInt32

    _unused : Int8

    PathId : Int8

    TargetId : Int8

    Lun : Int8

}
