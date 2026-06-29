#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PO_FX_COMPONENT_IDLE_STATE {
    #StructPack 8

    TransitionLatency : Int64

    ResidencyRequirement : Int64

    NominalPower : UInt32

}
