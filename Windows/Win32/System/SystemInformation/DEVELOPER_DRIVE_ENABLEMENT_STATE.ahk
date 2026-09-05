#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemInformation
 */
class DEVELOPER_DRIVE_ENABLEMENT_STATE extends Win32Enum {

    /**
     * Native name: DeveloperDriveEnablementStateError
     * @type {Integer (Int32)}
     */
    static Error => 0

    /**
     * Native name: DeveloperDriveEnabled
     * @type {Integer (Int32)}
     */
    static Enabled => 1

    /**
     * Native name: DeveloperDriveDisabledBySystemPolicy
     * @type {Integer (Int32)}
     */
    static DisabledBySystemPolicy => 2

    /**
     * Native name: DeveloperDriveDisabledByGroupPolicy
     * @type {Integer (Int32)}
     */
    static DisabledByGroupPolicy => 3
}
