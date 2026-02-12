#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITextRangeProvider.ahk

/**
 * Extends the ITextRangeProvider interface to enable Microsoft UI Automation providers to invoke context menus.
 * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nn-uiautomationcore-itextrangeprovider2
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ITextRangeProvider2 extends ITextRangeProvider{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextRangeProvider2
     * @type {Guid}
     */
    static IID => Guid("{9bbce42c-1921-4f18-89ca-dba1910a0386}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 21

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowContextMenu"]

    /**
     * Programmatically invokes a context menu on the target element. (ITextRangeProvider2.ShowContextMenu)
     * @remarks
     * This method should return an error code if the context menu could not be invoked.
     * 
     * <b>ShowContextMenu</b> should always show the context menu at the beginning end point of the range.  This should be equivalent to what would happen if the user pressed the context menu key or SHIFT + F10 with the insertion point at the beginning of the range.
     * 
     * If showing the context menu would typically result in the insertion point moving to a given location, then it should do so for programmatically invoking <b>ShowContextMenu</b> for Microsoft UI Automation support also.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itextrangeprovider2-showcontextmenu
     */
    ShowContextMenu() {
        result := ComCall(21, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
