#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITextRangeProvider.ahk

/**
 * Extends the ITextRangeProvider interface to enable Microsoft UI Automation providers to invoke context menus.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-itextrangeprovider2
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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextrangeprovider2-showcontextmenu
     */
    ShowContextMenu() {
        result := ComCall(21, this, "HRESULT")
        return result
    }
}
