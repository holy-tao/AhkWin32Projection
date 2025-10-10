#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies how the system handles positive leap seconds.
 * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/ns-processthreadsapi-process_leap_second_info
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class PROCESS_LEAP_SECOND_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Currently, the only valid flag is <b>PROCESS_LEAP_SECOND_INFO_FLAG_ENABLE_SIXTY_SECOND</b>. That flag is described below.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PROCESS_LEAP_SECOND_INFO_FLAG_ENABLE_SIXTY_SECOND"></a><a id="process_leap_second_info_flag_enable_sixty_second"></a><dl>
     * <dt><b>PROCESS_LEAP_SECOND_INFO_FLAG_ENABLE_SIXTY_SECOND</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value changes the way positive leap seconds are handled by system. Specifically, it changes how the seconds field during a positive leap second is handled by the system. If this value is used, then the positive leap second will be shown (For example: 23:59:59 -&gt; 23:59:60 -&gt; 00:00:00. If this value is not used, then "sixty seconds" is disabled, and the 59th second preceding a positive leap second will be shown for 2 seconds with the milliseconds value ticking twice as slow. So 23:59:59 -&gt; 23:59:59.500 -&gt; 00:00:00, which takes 2 seconds in wall clock time. Disabling "sixty second" can help with legacy apps that do not support seeing the seconds value as 60 during the positive leap second. Such apps may crash or misbehave. Therefore, in these cases, we display the 59th second for twice as long during the positive leap second. Note that this setting is per-process, and does not persist if the process is restarted. Developers should test their app for compatibility with seeing the system return "60", and add a call to their app startup routines to either enable or disable "sixty seconds". "Sixty seconds" is disabled by default for each process. Obviously, this setting has no effect if leap seconds are disabled system-wide, because then the system will never even encounter a leap second.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved for future use
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
