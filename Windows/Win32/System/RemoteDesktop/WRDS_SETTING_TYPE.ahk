#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the category of settings being stored in a WRDS_SETTINGS structure.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ne-wtsdefs-wrds_setting_type
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WRDS_SETTING_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The setting type is not defined.
     * @type {Integer (Int32)}
     */
    static WRDS_SETTING_TYPE_INVALID => 0

    /**
     * The settings apply to group policy for the computer.
     * @type {Integer (Int32)}
     */
    static WRDS_SETTING_TYPE_MACHINE => 1

    /**
     * The settings apply to group policy for the user.
     * @type {Integer (Int32)}
     */
    static WRDS_SETTING_TYPE_USER => 2

    /**
     * The settings apply to the user security accounts manager (SAM).
     * @type {Integer (Int32)}
     */
    static WRDS_SETTING_TYPE_SAM => 3
}
