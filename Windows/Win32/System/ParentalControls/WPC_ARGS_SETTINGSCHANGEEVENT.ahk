#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates information about the changes to settings being made by a user.
 * @see https://docs.microsoft.com/windows/win32/api//wpcevent/ne-wpcevent-wpc_args_settingschangeevent
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class WPC_ARGS_SETTINGSCHANGEEVENT extends Win32Enum{

    /**
     * The class of change made to the setting.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_SETTINGSCHANGEEVENT_CLASS => 0

    /**
     * The setting that was changed.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_SETTINGSCHANGEEVENT_SETTING => 1

    /**
     * The user who made the change.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_SETTINGSCHANGEEVENT_OWNER => 2

    /**
     * The previous value of the setting that was changed.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_SETTINGSCHANGEEVENT_OLDVAL => 3

    /**
     * The new value of the setting that was changed.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_SETTINGSCHANGEEVENT_NEWVAL => 4

    /**
     * The reason for the changed setting.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_SETTINGSCHANGEEVENT_REASON => 5

    /**
     * Optional information about the changed setting.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_SETTINGSCHANGEEVENT_OPTIONAL => 6

    /**
     * The arguments of the changed setting.
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_SETTINGSCHANGEEVENT_CARGS => 7
}
