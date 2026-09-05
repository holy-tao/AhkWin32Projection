#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * The AppPolicyLifecycleManagement enumeration indicates whether a process is lifecycle-managed or not.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ne-appmodel-apppolicylifecyclemanagement
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
class AppPolicyLifecycleManagement extends Win32Enum {

    /**
     * Indicates that the process's lifecycle is not managed.
     * Native name: AppPolicyLifecycleManagement_Unmanaged
     * @type {Integer (Int32)}
     */
    static Unmanaged => 0

    /**
     * Indicates that the process's  lifecycle is managed by Process Lifecycle Manager (PLM).
     * Native name: AppPolicyLifecycleManagement_Managed
     * @type {Integer (Int32)}
     */
    static Managed => 1
}
