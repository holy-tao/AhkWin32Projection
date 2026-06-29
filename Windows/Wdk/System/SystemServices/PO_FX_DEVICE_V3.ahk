#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PO_FX_DEVICE_V3 {
    #StructPack 8

    Version : UInt32

    Flags : Int64

    ComponentActiveConditionCallback : IntPtr

    ComponentIdleConditionCallback : IntPtr

    ComponentIdleStateCallback : IntPtr

    DevicePowerRequiredCallback : IntPtr

    DevicePowerNotRequiredCallback : IntPtr

    PowerControlCallback : IntPtr

    DirectedPowerUpCallback : IntPtr

    DirectedPowerDownCallback : IntPtr

    DirectedFxTimeoutInSeconds : UInt32

    DeviceContext : IntPtr

    ComponentCount : UInt32

    Components : IntPtr[1]

}
