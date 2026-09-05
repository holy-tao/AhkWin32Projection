#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * The AppPolicyWindowingModel enumeration indicates whether a process uses a CoreWindow-based, or a HWND-based, windowing model.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ne-appmodel-apppolicywindowingmodel
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
class AppPolicyWindowingModel extends Win32Enum {

    /**
     * Indicates that the process doesn't have a windowing model.
     * Native name: AppPolicyWindowingModel_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Indicates that the process's windowing model is CoreWindow-based.
     * Native name: AppPolicyWindowingModel_Universal
     * @type {Integer (Int32)}
     */
    static Universal => 1

    /**
     * Indicates that the process's windowing model is HWND-based.
     * Native name: AppPolicyWindowingModel_ClassicDesktop
     * @type {Integer (Int32)}
     */
    static ClassicDesktop => 2

    /**
     * Indicates that the process's windowing model is Silverlight-based, and does not provide notifications for window state changes.
     * Native name: AppPolicyWindowingModel_ClassicPhone
     * @type {Integer (Int32)}
     */
    static ClassicPhone => 3
}
