#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_SYNIC_SINT_DELIVERABLE_CONTEXT {
    #StructPack 4

    DeliverableSints : UInt16

    Reserved1 : UInt16

    Reserved2 : UInt32

}
