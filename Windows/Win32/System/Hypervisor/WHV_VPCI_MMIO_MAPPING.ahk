#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_VPCI_DEVICE_REGISTER_SPACE.ahk" { WHV_VPCI_DEVICE_REGISTER_SPACE }
#Import ".\WHV_VPCI_MMIO_RANGE_FLAGS.ahk" { WHV_VPCI_MMIO_RANGE_FLAGS }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_VPCI_MMIO_MAPPING {
    #StructPack 8

    Location : WHV_VPCI_DEVICE_REGISTER_SPACE

    Flags : WHV_VPCI_MMIO_RANGE_FLAGS

    SizeInBytes : Int64

    OffsetInBytes : Int64

    VirtualAddress : IntPtr

}
