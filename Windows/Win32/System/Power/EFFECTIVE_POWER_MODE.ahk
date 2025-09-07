#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the effective power mode the system is running.
 * @see https://learn.microsoft.com/windows/win32/api/powersetting/ne-powersetting-effective_power_mode
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class EFFECTIVE_POWER_MODE{

    /**
     * The system is in battery saver mode.
     * @type {Integer (Int32)}
     */
    static EffectivePowerModeBatterySaver => 0

    /**
     * The system is in the better battery effective power mode. 
 * 
 * <div class="alert"><b>Note</b>  For systems using the legacy high performance overlay, this effective power mode will never be used.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static EffectivePowerModeBetterBattery => 1

    /**
     * The system is in the balanced effective power mode.
     * @type {Integer (Int32)}
     */
    static EffectivePowerModeBalanced => 2

    /**
     * The system is in the high performance effective power mode. 
 * 
 * <div class="alert"><b>Note</b>  This effective power mode is only used for systems using the legacy high performance overlay.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static EffectivePowerModeHighPerformance => 3

    /**
     * The system is in the maximum performance effective power mode.
     * @type {Integer (Int32)}
     */
    static EffectivePowerModeMaxPerformance => 4

    /**
     * The system is in game mode power mode. 
 * 
 * <div class="alert"><b>Note</b> This mode is only available with the EFFECTIVE_POWER_MODE_V2 version of the API </div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static EffectivePowerModeGameMode => 5

    /**
     * The system is in the windows mixed reality power mode. 
 * 
 * <div class="alert"><b>Note</b> This mode is only available with the EFFECTIVE_POWER_MODE_V2 version of the API </div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static EffectivePowerModeMixedReality => 6
}
