#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PNDIS_TIMER_FUNCTION.ahk" { PNDIS_TIMER_FUNCTION }
#Import ".\NDIS_MINIPORT_BLOCK.ahk" { NDIS_MINIPORT_BLOCK }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_MINIPORT_TIMER {
    #StructPack 8

    Timer : IntPtr

    Dpc : IntPtr

    MiniportTimerFunction : PNDIS_TIMER_FUNCTION

    MiniportTimerContext : IntPtr

    Miniport : NDIS_MINIPORT_BLOCK.Ptr

    NextTimer : NDIS_MINIPORT_TIMER.Ptr

}
