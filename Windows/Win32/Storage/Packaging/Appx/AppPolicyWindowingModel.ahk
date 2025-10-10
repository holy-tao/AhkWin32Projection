#Requires AutoHotkey v2.0.0 64-bit

/**
 * The AppPolicyWindowingModel enumeration indicates whether a process uses a CoreWindow-based, or a HWND-based, windowing model.
 * @see https://docs.microsoft.com/windows/win32/api//appmodel/ne-appmodel-apppolicywindowingmodel
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class AppPolicyWindowingModel{

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
