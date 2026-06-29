#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\POWER_COOLING_MODE.ahk" { POWER_COOLING_MODE }

/**
 * Contains information about the idleness of the system.
 * @remarks
 * Note that this structure definition was accidentally omitted from WinNT.h. This error will be corrected in the future. In the meantime, to compile your application, include the structure definition contained in this topic in your source code.
 * @see https://learn.microsoft.com/windows/win32/Power/system-power-information-str
 * @namespace Windows.Win32.System.Power
 */
export default struct SYSTEM_POWER_INFORMATION {
    #StructPack 4

    /**
     * The idleness at which the system is considered idle and the idle time-out begins counting, expressed as a percentage. Dropping below this number causes the timer to be canceled.
     */
    MaxIdlenessAllowed : UInt32

    /**
     * The current idle level, expressed as a percentage.
     */
    Idleness : UInt32

    /**
     * The time remaining in the idle timer, in seconds.
     */
    TimeRemaining : UInt32

    /**
     * The current system cooling mode. This member must one of the following values.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                                                 | Meaning                                                                                                   |
     * |---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------|
     * | <span id="PO_TZ_ACTIVE"></span><span id="po_tz_active"></span><dl> <dt>**PO\_TZ\_ACTIVE**</dt> <dt>0</dt> </dl>                    | The system is currently in Active cooling mode.<br/>                                                |
     * | <span id="PO_TZ_INVALID_MODE"></span><span id="po_tz_invalid_mode"></span><dl> <dt>**PO\_TZ\_INVALID\_MODE**</dt> <dt>2</dt> </dl> | The system does not support CPU throttling, or there is no thermal zone defined in the system.<br/> |
     * | <span id="PO_TZ_PASSIVE"></span><span id="po_tz_passive"></span><dl> <dt>**PO\_TZ\_PASSIVE**</dt> <dt>1</dt> </dl>                 | The system is currently in Passive cooling mode.<br/>                                               |
     */
    CoolingMode : POWER_COOLING_MODE

}
