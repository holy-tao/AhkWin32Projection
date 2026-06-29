#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The AppPolicyLifecycleManagement enumeration indicates whether a process is lifecycle-managed or not.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ne-appmodel-apppolicylifecyclemanagement
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct AppPolicyLifecycleManagement {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
