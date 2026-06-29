#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct D3COLD_AUX_POWER_AND_TIMING_INTERFACE {
    #StructPack 8

    Size : UInt16

    Version : UInt16

    Context : IntPtr

    InterfaceReference : IntPtr

    InterfaceDereference : IntPtr

    RequestCorePowerRail : IntPtr

    RequestAuxPower : IntPtr

    RequestPerstDelay : IntPtr

}
