#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values that describe the progress of asynchronous loading of content.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/ne-uiautomationcoreapi-asynccontentloadedstate
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct AsyncContentLoadedState {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
