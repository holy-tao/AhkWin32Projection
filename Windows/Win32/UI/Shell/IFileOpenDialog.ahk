#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFileDialog.ahk

/**
 * Extends the IFileDialog interface by adding methods specific to the open dialog.
 * @remarks
 * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * <b>IFileOpenDialog</b> is implemented by the common file open dialog (CLSID_FileOpenDialog).
  * 
  * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifiledialog">IFileDialog</a> interface, from which it inherits.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ifileopendialog
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFileOpenDialog extends IFileDialog{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileOpenDialog
     * @type {Guid}
     */
    static IID => Guid("{d57c7288-d4ad-4768-be02-9d969532d960}")

    /**
     * The class identifier for FileOpenDialog
     * @type {Guid}
     */
    static CLSID => Guid("{dc1c5a9c-e88a-4dde-a5a1-60f82a20aef7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 27

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetResults", "GetSelectedItems"]

    /**
     * 
     * @param {Pointer<IShellItemArray>} ppenum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileopendialog-getresults
     */
    GetResults(ppenum) {
        result := ComCall(27, this, "ptr*", ppenum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IShellItemArray>} ppsai 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifileopendialog-getselecteditems
     */
    GetSelectedItems(ppsai) {
        result := ComCall(28, this, "ptr*", ppsai, "HRESULT")
        return result
    }
}
