#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values that describe the progress of asynchronous loading of content.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcoreapi/ne-uiautomationcoreapi-asynccontentloadedstate
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class AsyncContentLoadedState{

    /**
     * Loading of the content into the UI Automation element is beginning.
     * @type {Integer (Int32)}
     */
    static AsyncContentLoadedState_Beginning => 0

    /**
     * Loading of the content into the UI Automation element is in progress.
     * @type {Integer (Int32)}
     */
    static AsyncContentLoadedState_Progress => 1

    /**
     * Loading of the content into the UI Automation element is complete.
     * @type {Integer (Int32)}
     */
    static AsyncContentLoadedState_Completed => 2
}
