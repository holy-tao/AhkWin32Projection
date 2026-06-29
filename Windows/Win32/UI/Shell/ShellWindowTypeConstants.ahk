#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies types of Shell windows.
 * @see https://learn.microsoft.com/windows/win32/api/exdisp/ne-exdisp-shellwindowtypeconstants
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ShellWindowTypeConstants {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * An Windows Explorer (Explorer.exe) window.
     * @type {Integer (Int32)}
     */
    static SWC_EXPLORER => 0

    /**
     * An Internet Explorer (Iexplore.exe) browser window.
     * @type {Integer (Int32)}
     */
    static SWC_BROWSER => 1

    /**
     * A non-Microsoft browser window.
     * @type {Integer (Int32)}
     */
    static SWC_3RDPARTY => 2

    /**
     * A creation callback window.
     * @type {Integer (Int32)}
     */
    static SWC_CALLBACK => 4

    /**
     * <b>Windows Vista and later</b>. The Windows desktop.
     * @type {Integer (Int32)}
     */
    static SWC_DESKTOP => 8
}
