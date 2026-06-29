#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct PHYSICAL_ELEMENT_STATUS_DESCRIPTOR {
    #StructPack 8

    Version : UInt32

    Size : UInt32

    ElementIdentifier : UInt32

    PhysicalElementType : Int8

    PhysicalElementHealth : Int8

    Reserved1 : Int8[2]

    AssociatedCapacity : Int64

    Reserved2 : UInt32[4]

}
