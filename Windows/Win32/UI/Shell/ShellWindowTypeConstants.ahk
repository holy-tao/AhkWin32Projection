#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies types of Shell windows.
 * @see https://docs.microsoft.com/windows/win32/api//exdisp/ne-exdisp-shellwindowtypeconstants
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ShellWindowTypeConstants extends Win32Enum{

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
