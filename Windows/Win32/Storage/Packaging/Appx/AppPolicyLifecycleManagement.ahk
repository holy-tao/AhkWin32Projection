#Requires AutoHotkey v2.0.0 64-bit

/**
 * The AppPolicyLifecycleManagement enumeration indicates whether a process is lifecycle-managed or not.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ne-appmodel-apppolicylifecyclemanagement
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class AppPolicyLifecycleManagement{

    /**
     * Indicates that the process's lifecycle is not managed.
     * @type {Integer (Int32)}
     */
    static AppPolicyLifecycleManagement_Unmanaged => 0

    /**
     * Indicates that the process's  lifecycle is managed by Process Lifecycle Manager (PLM).
     * @type {Integer (Int32)}
     */
    static AppPolicyLifecycleManagement_Managed => 1
}
