#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_VPCI_INTERRUPT_TARGET_FLAGS.ahk" { WHV_VPCI_INTERRUPT_TARGET_FLAGS }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_VPCI_INTERRUPT_TARGET {
    #StructPack 4

    Vector : UInt32

    Flags : WHV_VPCI_INTERRUPT_TARGET_FLAGS

    ProcessorCount : UInt32

    Processors : UInt32[1]

}
