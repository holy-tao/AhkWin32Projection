#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The AppPolicyWindowingModel enumeration indicates whether a process uses a CoreWindow-based, or a HWND-based, windowing model.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ne-appmodel-apppolicywindowingmodel
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct AppPolicyWindowingModel {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that the process doesn't have a windowing model.
     * @type {Integer (Int32)}
     */
    static AppPolicyWindowingModel_None => 0

    /**
     * Indicates that the process's windowing model is CoreWindow-based.
     * @type {Integer (Int32)}
     */
    static AppPolicyWindowingModel_Universal => 1

    /**
     * Indicates that the process's windowing model is HWND-based.
     * @type {Integer (Int32)}
     */
    static AppPolicyWindowingModel_ClassicDesktop => 2

    /**
     * Indicates that the process's windowing model is Silverlight-based, and does not provide notifications for window state changes.
     * @type {Integer (Int32)}
     */
    static AppPolicyWindowingModel_ClassicPhone => 3
}
