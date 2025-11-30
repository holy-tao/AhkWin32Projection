#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies values that identify the ownership conditions under which an image is created by the Windows Ribbon framework.
 * @see https://docs.microsoft.com/windows/win32/api//uiribbon/ne-uiribbon-ui_ownership
 * @namespace Windows.Win32.UI.Ribbon
 * @version v4.0.30319
 */
class UI_OWNERSHIP extends Win32Enum{

    /**
     * The handle to the bitmap (HBITMAP) is owned by the Ribbon framework 
     * 			through the <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nn-uiribbon-iuiimage">IUIImage</a> object.
     * @type {Integer (Int32)}
     */
    static UI_OWNERSHIP_TRANSFER => 0

    /**
     * A copy of the HBITMAP is created by the Ribbon framework through 
     * 			the <a href="https://docs.microsoft.com/windows/desktop/api/uiribbon/nn-uiribbon-iuiimage">IUIImage</a> object. The host application still owns the HBITMAP.
     * @type {Integer (Int32)}
     */
    static UI_OWNERSHIP_COPY => 1
}
