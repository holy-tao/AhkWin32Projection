#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_VPCI_DEVICE_REGISTER_SPACE.ahk" { WHV_VPCI_DEVICE_REGISTER_SPACE }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_VPCI_DEVICE_REGISTER {
    #StructPack 8

    Location : WHV_VPCI_DEVICE_REGISTER_SPACE

    SizeInBytes : UInt32

    OffsetInBytes : Int64

}
