#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct POWER_ADAPTER_CHARGE_REQUIREMENT {
    #StructPack 4

    AcAdapterType : UInt32

    MinimumPower : UInt32

    NominalPower : UInt32

    MaximumPower : UInt32

}
