#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the administrator options that the caller wants control over when registering with [RegisterForAdministration](./windowsupdateadministrator_registerforadministration_731932711.md).
 * @remarks
 * These options can be combined using bitwise OR to set a combination of flags when registering a Windows Update administrator.
 * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateadministratoroptions
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsUpdateAdministratorOptions extends Win32BitflagEnum{

    /**
     * No additional controls are requested for preventing update activity.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Background scan activity will be blocked without explicit approval via [StartAdministratorScan](./windowsupdateadministrator_startadministratorscan_459526238.md).
     * @type {Integer (UInt32)}
     */
    static RequireAdministratorApprovalForScans => 1

    /**
     * Updates will not be permitted to proceed without explicit approval via [ApproveWindowsUpdate](./windowsupdateadministrator_approvewindowsupdate_1582950728.md).
     * @type {Integer (UInt32)}
     */
    static RequireAdministratorApprovalForUpdates => 2

    /**
     * Update actions will not be permitted to proceed without explicit approval via [ApproveWindowsUpdateAction](./windowsupdateadministrator_approvewindowsupdateaction_630494726.md).
     * @type {Integer (UInt32)}
     */
    static RequireAdministratorApprovalForActions => 4
}
