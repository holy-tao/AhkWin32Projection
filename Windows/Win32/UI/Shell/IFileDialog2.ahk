#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFileDialog.ahk

/**
 * Extends the IFileDialog interface by providing methods that allow the caller to name a specific, restricted location that can be browsed in the common file dialog as well as to specify alternate text to display as a label on the Cancel button.
 * @remarks
 * 
  * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ifiledialog">IFileDialog</a> interface, from which it inherits.
  * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * An implementation of this interface is provided with Windows. Third parties do not provide custom implementations.
  * 
  * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
  * Use the methods of this interface in two instances:
  *             
  *                 
  * 
  * <ul>
  * <li>When you want to restrict the dialog's navigation to a specific namespace.</li>
  * <li>When you need the dialog's <b>Cancel</b> button to be labeled differently in keeping with your functionality.</li>
  * </ul>
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-ifiledialog2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFileDialog2 extends IFileDialog{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileDialog2
     * @type {Guid}
     */
    static IID => Guid("{61744fc7-85b5-4791-a9b0-272276309b13}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 27

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetCancelButtonLabel", "SetNavigationRoot"]

    /**
     * 
     * @param {PWSTR} pszLabel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ifiledialog2-setcancelbuttonlabel
     */
    SetCancelButtonLabel(pszLabel) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(27, this, "ptr", pszLabel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ifiledialog2-setnavigationroot
     */
    SetNavigationRoot(psi) {
        result := ComCall(28, this, "ptr", psi, "HRESULT")
        return result
    }
}
