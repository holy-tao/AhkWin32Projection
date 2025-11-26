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
     * @type {Integer} 
     */
    CurrentViewMode {
        get => this.get_CurrentViewMode()
        set => this.put_CurrentViewMode(value)
    }

    /**
     * Gets the current view mode of the current folder.
     * @returns {Integer} Type: <b>uint*</b>
     * 
     * When this method returns, contains a pointer to an unsigned integer that represents the current view mode. For a list of possible values see <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderviewmode">FOLDERVIEWMODE</a>.
     * @see https://docs.microsoft.com/windows/win32/api//shldisp/nf-shldisp-ishellfolderviewdual2-get_currentviewmode
     */
    get_CurrentViewMode() {
        result := ComCall(16, this, "uint*", &pViewMode := 0, "HRESULT")
        return pViewMode
    }

    /**
     * Sets the current view mode of the current folder.
     * @param {Integer} ViewMode Type: <b>uint</b>
     * 
     * Sets the current view mode. For a list of possible values see <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderviewmode">FOLDERVIEWMODE</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shldisp/nf-shldisp-ishellfolderviewdual2-put_currentviewmode
     */
    put_CurrentViewMode(ViewMode) {
        result := ComCall(17, this, "uint", ViewMode, "HRESULT")
        return result
    }

    /**
     * Selects an item relative to the current item.
     * @param {Integer} iRelative Type: <b>int</b>
     * 
     * The offset of the item to be selected in relation to the current item.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shldisp/nf-shldisp-ishellfolderviewdual2-selectitemrelative
     */
    SelectItemRelative(iRelative) {
        result := ComCall(18, this, "int", iRelative, "HRESULT")
        return result
    }
}
