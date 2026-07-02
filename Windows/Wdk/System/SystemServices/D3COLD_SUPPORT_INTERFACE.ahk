#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PGET_IDLE_WAKE_INFO.ahk" { PGET_IDLE_WAKE_INFO }
#Import ".\PGET_D3COLD_CAPABILITY.ahk" { PGET_D3COLD_CAPABILITY }
#Import ".\PSET_D3COLD_SUPPORT.ahk" { PSET_D3COLD_SUPPORT }
#Import ".\PGET_D3COLD_LAST_TRANSITION_STATUS.ahk" { PGET_D3COLD_LAST_TRANSITION_STATUS }
#Import ".\PINTERFACE_DEREFERENCE.ahk" { PINTERFACE_DEREFERENCE }
#Import ".\PINTERFACE_REFERENCE.ahk" { PINTERFACE_REFERENCE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct D3COLD_SUPPORT_INTERFACE {
    #StructPack 8

    Size : UInt16

    Version : UInt16

    Context : IntPtr

    InterfaceReference : PINTERFACE_REFERENCE

    InterfaceDereference : PINTERFACE_DEREFERENCE

    SetD3ColdSupport : PSET_D3COLD_SUPPORT

    GetIdleWakeInfo : PGET_IDLE_WAKE_INFO

    GetD3ColdCapability : PGET_D3COLD_CAPABILITY

    GetBusDriverD3ColdSupport : PGET_D3COLD_CAPABILITY

    GetLastTransitionStatus : PGET_D3COLD_LAST_TRANSITION_STATUS

}
