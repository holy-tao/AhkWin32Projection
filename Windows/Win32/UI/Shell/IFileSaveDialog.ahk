#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFileDialog.ahk

/**
 * Extends the IFileDialog interface by adding methods specific to the save dialog, which include those that provide support for the collection of metadata to be persisted with the file.
 * @remarks
 * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * <b>IFileSaveDialog</b> is implemented by the common file save dialog (CLSID_FileSaveDialog).
  * 
  * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifiledialog">IFileDialog</a> interface, from which it inherits.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ifilesavedialog
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFileSaveDialog extends IFileDialog{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileSaveDialog
     * @type {Guid}
     */
    static IID => Guid("{84bccd23-5fde-4cdb-aea4-af64b83d78ab}")

    /**
     * The class identifier for FileSaveDialog
     * @type {Guid}
     */
    static CLSID => Guid("{c0b4e2f3-ba21-4773-8dba-335ec946eb8b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 27

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSaveAsItem", "SetProperties", "SetCollectedProperties", "GetProperties", "ApplyProperties"]

    /**
     * 
     * @param {IShellItem} psi 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifilesavedialog-setsaveasitem
     */
    SetSaveAsItem(psi) {
        result := ComCall(27, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPropertyStore} pStore 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifilesavedialog-setproperties
     */
    SetProperties(pStore) {
        result := ComCall(28, this, "ptr", pStore, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPropertyDescriptionList} pList 
     * @param {BOOL} fAppendDefault 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifilesavedialog-setcollectedproperties
     */
    SetCollectedProperties(pList, fAppendDefault) {
        result := ComCall(29, this, "ptr", pList, "int", fAppendDefault, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPropertyStore>} ppStore 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifilesavedialog-getproperties
     */
    GetProperties(ppStore) {
        result := ComCall(30, this, "ptr*", ppStore, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @param {IPropertyStore} pStore 
     * @param {HWND} hwnd 
     * @param {IFileOperationProgressSink} pSink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifilesavedialog-applyproperties
     */
    ApplyProperties(psi, pStore, hwnd, pSink) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(31, this, "ptr", psi, "ptr", pStore, "ptr", hwnd, "ptr", pSink, "HRESULT")
        return result
    }
}
