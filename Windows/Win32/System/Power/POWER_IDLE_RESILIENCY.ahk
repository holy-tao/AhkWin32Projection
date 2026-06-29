#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct POWER_IDLE_RESILIENCY {
    #StructPack 4

    CoalescingTimeout : UInt32

    IdleResiliencyPeriod : UInt32

}
