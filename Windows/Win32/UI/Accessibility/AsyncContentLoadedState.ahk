#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that describe the progress of asynchronous loading of content.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/ne-uiautomationcoreapi-asynccontentloadedstate
 * @namespace Windows.Win32.UI.Accessibility
 */
class AsyncContentLoadedState extends Win32Enum {

    /**
     * Loading of the content into the UI Automation element is beginning.
     * Native name: AsyncContentLoadedState_Beginning
     * @type {Integer (Int32)}
     */
    static Beginning => 0

    /**
     * Loading of the content into the UI Automation element is in progress.
     * Native name: AsyncContentLoadedState_Progress
     * @type {Integer (Int32)}
     */
    static Progress => 1

    /**
     * Loading of the content into the UI Automation element is complete.
     * Native name: AsyncContentLoadedState_Completed
     * @type {Integer (Int32)}
     */
    static Completed => 2
}
