#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_X64_PENDING_INTERRUPTION_TYPE.ahk" { WHV_X64_PENDING_INTERRUPTION_TYPE }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_X64_INTERRUPTION_DELIVERABLE_CONTEXT {
    #StructPack 4

    DeliverableType : WHV_X64_PENDING_INTERRUPTION_TYPE

}
