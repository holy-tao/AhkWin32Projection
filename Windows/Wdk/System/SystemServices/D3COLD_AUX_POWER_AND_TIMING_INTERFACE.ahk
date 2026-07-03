#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PD3COLD_REQUEST_AUX_POWER.ahk" { PD3COLD_REQUEST_AUX_POWER }
#Import ".\PD3COLD_REQUEST_CORE_POWER_RAIL.ahk" { PD3COLD_REQUEST_CORE_POWER_RAIL }
#Import ".\PD3COLD_REQUEST_PERST_DELAY.ahk" { PD3COLD_REQUEST_PERST_DELAY }
#Import ".\PINTERFACE_DEREFERENCE.ahk" { PINTERFACE_DEREFERENCE }
#Import ".\PINTERFACE_REFERENCE.ahk" { PINTERFACE_REFERENCE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct D3COLD_AUX_POWER_AND_TIMING_INTERFACE {
    #StructPack 8

    Size : UInt16

    Version : UInt16

    Context : IntPtr

    InterfaceReference : PINTERFACE_REFERENCE

    InterfaceDereference : PINTERFACE_DEREFERENCE

    RequestCorePowerRail : PD3COLD_REQUEST_CORE_POWER_RAIL

    RequestAuxPower : PD3COLD_REQUEST_AUX_POWER

    RequestPerstDelay : PD3COLD_REQUEST_PERST_DELAY

}
