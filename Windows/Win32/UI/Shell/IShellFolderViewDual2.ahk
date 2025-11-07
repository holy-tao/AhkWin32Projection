#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IShellFolderViewDual.ahk

/**
 * Exposes methods that modify the view and select items in the current folder.
 * @remarks
 * 
  * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shldisp/nn-shldisp-ishellfolderviewdual">IShellFolderViewDual</a> interface, from which it inherits.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shldisp/nn-shldisp-ishellfolderviewdual2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellFolderViewDual2 extends IShellFolderViewDual{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellFolderViewDual2
     * @type {Guid}
     */
    static IID => Guid("{31c147b6-0ade-4a3c-b514-ddf932ef6d17}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentViewMode", "put_CurrentViewMode", "SelectItemRelative"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual2-get_currentviewmode
     */
    get_CurrentViewMode() {
        result := ComCall(16, this, "uint*", &pViewMode := 0, "HRESULT")
        return pViewMode
    }

    /**
     * 
     * @param {Integer} ViewMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual2-put_currentviewmode
     */
    put_CurrentViewMode(ViewMode) {
        result := ComCall(17, this, "uint", ViewMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iRelative 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-ishellfolderviewdual2-selectitemrelative
     */
    SelectItemRelative(iRelative) {
        result := ComCall(18, this, "int", iRelative, "HRESULT")
        return result
    }
}
