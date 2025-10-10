#Requires AutoHotkey v2.0.0 64-bit

/**
 * The AppPolicyShowDeveloperDiagnostic enumeration indicates the method used for a process to surface developer information, such as asserts, to the user.
 * @see https://docs.microsoft.com/windows/win32/api//appmodel/ne-appmodel-apppolicyshowdeveloperdiagnostic
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class AppPolicyShowDeveloperDiagnostic{

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
