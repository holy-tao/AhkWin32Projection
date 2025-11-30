#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the types of logic that is used to determine whether a particular update will be automatically selected when the user views available updates in the Windows Update user interface.
 * @remarks
 * 
 * In versions of the Windows Update Agent (WUA) in which <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate5">IUpdate5</a> is not available, all updates are processed by using the standard logic.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/ne-wuapi-autoselectionmode
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class AutoSelectionMode extends Win32Enum{

    /**
     * Use the standard logic. The update will be automatically selected if it is important, or if it is recommended and Windows Update has been configured to treat recommended updates as important. Otherwise, the update will not be automatically selected.
     * @type {Integer (Int32)}
     */
    static asLetWindowsUpdateDecide => 0

    /**
     * The update will be automatically selected only if it has been completely downloaded.
     * @type {Integer (Int32)}
     */
    static asAutoSelectIfDownloaded => 1

    /**
     * The update will never be automatically selected.
     * @type {Integer (Int32)}
     */
    static asNeverAutoSelect => 2

    /**
     * The update will always be automatically selected.
     * @type {Integer (Int32)}
     */
    static asAlwaysAutoSelect => 3
}
