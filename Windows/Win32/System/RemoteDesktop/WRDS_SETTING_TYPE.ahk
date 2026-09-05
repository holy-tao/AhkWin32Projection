#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the category of settings being stored in a WRDS_SETTINGS structure.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ne-wtsdefs-wrds_setting_type
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class WRDS_SETTING_TYPE extends Win32Enum {

    /**
     * The setting type is not defined.
     * Native name: WRDS_SETTING_TYPE_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 0

    /**
     * The settings apply to group policy for the computer.
     * Native name: WRDS_SETTING_TYPE_MACHINE
     * @type {Integer (Int32)}
     */
    static MACHINE => 1

    /**
     * The settings apply to group policy for the user.
     * Native name: WRDS_SETTING_TYPE_USER
     * @type {Integer (Int32)}
     */
    static USER => 2

    /**
     * The settings apply to the user security accounts manager (SAM).
     * Native name: WRDS_SETTING_TYPE_SAM
     * @type {Integer (Int32)}
     */
    static SAM => 3
}
