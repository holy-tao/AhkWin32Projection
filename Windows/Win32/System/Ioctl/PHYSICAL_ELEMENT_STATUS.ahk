#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PHYSICAL_ELEMENT_STATUS_DESCRIPTOR.ahk" { PHYSICAL_ELEMENT_STATUS_DESCRIPTOR }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct PHYSICAL_ELEMENT_STATUS {
    #StructPack 8

    Version : UInt32

    Size : UInt32

    DescriptorCount : UInt32

    ReturnedDescriptorCount : UInt32

    ElementIdentifierBeingDepoped : UInt32

    Reserved : UInt32

    Descriptors : PHYSICAL_ELEMENT_STATUS_DESCRIPTOR[1]

}
