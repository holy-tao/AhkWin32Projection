#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the effective power mode the system is running.
 * @see https://learn.microsoft.com/windows/win32/api/powersetting/ne-powersetting-effective_power_mode
 * @namespace Windows.Win32.System.Power
 */
class EFFECTIVE_POWER_MODE extends Win32Enum {

    /**
     * The system is in battery saver mode.
     * Native name: EffectivePowerModeBatterySaver
     * @type {Integer (Int32)}
     */
    static BatterySaver => 0

    /**
     * Native name: EffectivePowerModeEnergySaverHighSavings
     * @type {Integer (Int32)}
     */
    static EnergySaverHighSavings => 0

    /**
     * The system is in the better battery effective power mode. 
     * 
     * <div class="alert"><b>Note</b>  For systems using the legacy high performance overlay, this effective power mode will never be used.</div>
     * <div> </div>
     * Native name: EffectivePowerModeBetterBattery
     * @type {Integer (Int32)}
     */
    static BetterBattery => 1

    /**
     * Native name: EffectivePowerModeEnergySaverStandard
     * @type {Integer (Int32)}
     */
    static EnergySaverStandard => 1

    /**
     * The system is in the balanced effective power mode.
     * Native name: EffectivePowerModeBalanced
     * @type {Integer (Int32)}
     */
    static Balanced => 2

    /**
     * The system is in the high performance effective power mode. 
     * 
     * <div class="alert"><b>Note</b>  This effective power mode is only used for systems using the legacy high performance overlay.</div>
     * <div> </div>
     * Native name: EffectivePowerModeHighPerformance
     * @type {Integer (Int32)}
     */
    static HighPerformance => 3

    /**
     * The system is in the maximum performance effective power mode.
     * Native name: EffectivePowerModeMaxPerformance
     * @type {Integer (Int32)}
     */
    static MaxPerformance => 4

    /**
     * The system is in game mode power mode. 
     * 
     * <div class="alert"><b>Note</b> This mode is only available with the EFFECTIVE_POWER_MODE_V2 version of the API </div>
     * <div> </div>
     * Native name: EffectivePowerModeGameMode
     * @type {Integer (Int32)}
     */
    static GameMode => 5

    /**
     * The system is in the windows mixed reality power mode. 
     * 
     * <div class="alert"><b>Note</b> This mode is only available with the EFFECTIVE_POWER_MODE_V2 version of the API </div>
     * <div> </div>
     * Native name: EffectivePowerModeMixedReality
     * @type {Integer (Int32)}
     */
    static MixedReality => 6
}
