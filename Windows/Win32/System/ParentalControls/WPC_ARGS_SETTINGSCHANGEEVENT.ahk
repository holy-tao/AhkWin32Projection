#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates information about the changes to settings being made by a user.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpc_args_settingschangeevent
 * @namespace Windows.Win32.System.ParentalControls
 */
class WPC_ARGS_SETTINGSCHANGEEVENT extends Win32Enum {

    /**
     * The class of change made to the setting.
     * Native name: WPC_ARGS_SETTINGSCHANGEEVENT_CLASS
     * @type {Integer (Int32)}
     */
    static CLASS => 0

    /**
     * The setting that was changed.
     * Native name: WPC_ARGS_SETTINGSCHANGEEVENT_SETTING
     * @type {Integer (Int32)}
     */
    static SETTING => 1

    /**
     * The user who made the change.
     * Native name: WPC_ARGS_SETTINGSCHANGEEVENT_OWNER
     * @type {Integer (Int32)}
     */
    static OWNER => 2

    /**
     * The previous value of the setting that was changed.
     * Native name: WPC_ARGS_SETTINGSCHANGEEVENT_OLDVAL
     * @type {Integer (Int32)}
     */
    static OLDVAL => 3

    /**
     * The new value of the setting that was changed.
     * Native name: WPC_ARGS_SETTINGSCHANGEEVENT_NEWVAL
     * @type {Integer (Int32)}
     */
    static NEWVAL => 4

    /**
     * The reason for the changed setting.
     * Native name: WPC_ARGS_SETTINGSCHANGEEVENT_REASON
     * @type {Integer (Int32)}
     */
    static REASON => 5

    /**
     * Optional information about the changed setting.
     * Native name: WPC_ARGS_SETTINGSCHANGEEVENT_OPTIONAL
     * @type {Integer (Int32)}
     */
    static OPTIONAL => 6

    /**
     * The arguments of the changed setting.
     * Native name: WPC_ARGS_SETTINGSCHANGEEVENT_CARGS
     * @type {Integer (Int32)}
     */
    static CARGS => 7
}
