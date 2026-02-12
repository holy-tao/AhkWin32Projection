#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the direction of focus navigation relative to the input pane.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputviewxyfocustransferdirection
 * @namespace Windows.UI.ViewManagement.Core
 * @version WindowsRuntime 1.4
 */
class CoreInputViewXYFocusTransferDirection extends Win32Enum{

    /**
     * Focus movement is up.
     * @type {Integer (Int32)}
     */
    static Up => 0

    /**
     * Focus movement is to the right.
     * @type {Integer (Int32)}
     */
    static Right => 1

    /**
     * Focus movement is do
     * wn.
     * @type {Integer (Int32)}
     */
    static Down => 2

    /**
     * Focus movement is to the left.
     * @type {Integer (Int32)}
     */
    static Left => 3
}
