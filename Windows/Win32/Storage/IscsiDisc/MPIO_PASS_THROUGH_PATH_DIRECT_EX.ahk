#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct MPIO_PASS_THROUGH_PATH_DIRECT_EX {
    #StructPack 8

    PassThroughOffset : UInt32

    Version : UInt32

    Length : UInt16

    Flags : Int8

    PortNumber : Int8

    MpioPathId : Int64

}
