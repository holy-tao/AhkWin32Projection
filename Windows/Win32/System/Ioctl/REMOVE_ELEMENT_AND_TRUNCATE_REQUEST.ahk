#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct REMOVE_ELEMENT_AND_TRUNCATE_REQUEST {
    #StructPack 8

    Version : UInt32

    Size : UInt32

    RequestCapacity : Int64

    ElementIdentifier : UInt32

    Reserved : UInt32

}
