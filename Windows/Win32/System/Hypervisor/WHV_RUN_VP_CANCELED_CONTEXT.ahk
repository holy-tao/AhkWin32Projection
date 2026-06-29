#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_RUN_VP_CANCEL_REASON.ahk" { WHV_RUN_VP_CANCEL_REASON }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_RUN_VP_CANCELED_CONTEXT {
    #StructPack 4

    CancelReason : WHV_RUN_VP_CANCEL_REASON

}
