#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct D3COLD_SUPPORT_INTERFACE {
    #StructPack 8

    Size : UInt16

    Version : UInt16

    Context : IntPtr

    InterfaceReference : IntPtr

    InterfaceDereference : IntPtr

    SetD3ColdSupport : IntPtr

    GetIdleWakeInfo : IntPtr

    GetD3ColdCapability : IntPtr

    GetBusDriverD3ColdSupport : IntPtr

    GetLastTransitionStatus : IntPtr

}
