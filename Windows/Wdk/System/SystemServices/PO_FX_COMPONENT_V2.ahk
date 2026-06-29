#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\PO_FX_COMPONENT_IDLE_STATE.ahk" { PO_FX_COMPONENT_IDLE_STATE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PO_FX_COMPONENT_V2 {
    #StructPack 8

    Id : Guid

    Flags : Int64

    DeepestWakeableIdleState : UInt32

    IdleStateCount : UInt32

    IdleStates : PO_FX_COMPONENT_IDLE_STATE.Ptr

    ProviderCount : UInt32

    Providers : IntPtr

}
