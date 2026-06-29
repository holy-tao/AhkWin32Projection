#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The AppPolicyProcessTerminationMethod enumeration indicates the method used to end a process.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ne-appmodel-apppolicyprocessterminationmethod
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct AppPolicyProcessTerminationMethod {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
