#Requires AutoHotkey v2.0.0 64-bit

/**
 * The AppPolicyProcessTerminationMethod enumeration indicates the method used to end a process.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ne-appmodel-apppolicyprocessterminationmethod
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class AppPolicyProcessTerminationMethod{

    /**
     * Allows DLLs to execute code at shutdown. This value is expected for a desktop application, or for a Desktop Bridge application.
     * @type {Integer (Int32)}
     */
    static AppPolicyProcessTerminationMethod_ExitProcess => 0

    /**
     * Immediately ends the process. This value is expected for a UWP app.
     * @type {Integer (Int32)}
     */
    static AppPolicyProcessTerminationMethod_TerminateProcess => 1
}
