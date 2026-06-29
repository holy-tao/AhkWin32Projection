#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The AppPolicyShowDeveloperDiagnostic enumeration indicates the method used for a process to surface developer information, such as asserts, to the user.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ne-appmodel-apppolicyshowdeveloperdiagnostic
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct AppPolicyShowDeveloperDiagnostic {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that the process does not show developer diagnostics. This value is expected for a UWP app.
     * @type {Integer (Int32)}
     */
    static AppPolicyShowDeveloperDiagnostic_None => 0

    /**
     * Indicates that the process shows developer diagnostics UI. This value is expected for a desktop application, or for a Desktop Bridge application.
     * @type {Integer (Int32)}
     */
    static AppPolicyShowDeveloperDiagnostic_ShowUI => 1
}
