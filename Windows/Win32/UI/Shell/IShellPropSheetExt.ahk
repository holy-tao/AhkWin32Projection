#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that allow a property sheet handler to add or replace pages in the property sheet displayed for a file object.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ishellpropsheetext
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellPropSheetExt extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellPropSheetExt
     * @type {Guid}
     */
    static IID => Guid("{000214e9-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddPages", "ReplacePage"]

    /**
     * Adds one or more pages to a property sheet that the Shell displays for a file object. The Shell calls this method for each property sheet handler registered to the file type.
     * @param {Pointer<LPFNSVADDPROPSHEETPAGE>} pfnAddPage Type: <b>LPFNADDPROPSHEETPAGE</b>
     * 
     * A pointer to a function that the property sheet handler calls to add a page to the property sheet. The function takes a property sheet handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/prsht/nf-prsht-createpropertysheetpagea">CreatePropertySheetPage</a> function and the <i>lParam</i> parameter passed to this method.
     * @param {LPARAM} lParam Type: <b>LPARAM</b>
     * 
     * Handler-specific data to pass to the function pointed to by <i>pfnAddPage</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If successful, returns a one-based index to specify the page that should be initially displayed. See Remarks for more information.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellpropsheetext-addpages
     */
    AddPages(pfnAddPage, lParam) {
        result := ComCall(3, this, "ptr", pfnAddPage, "ptr", lParam, "HRESULT")
        return result
    }

    /**
     * Replaces a page in a property sheet for a Control Panel object.
     * @param {Integer} uPageID Type: <b>UINT</b>
     * 
     * Not used.
     * 
     * <b>Microsoft Windows XP and earlier:</b> A type EXPPS identifier of the page to replace. The values for this parameter for Control Panels can be found in the Cplext.h header file.
     * @param {Pointer<LPFNSVADDPROPSHEETPAGE>} pfnReplaceWith Type: <b>LPFNADDPROPSHEETPAGE</b>
     * 
     * A pointer to a function that the property sheet handler calls to replace a page to the property sheet. The function takes a property sheet handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/prsht/nf-prsht-createpropertysheetpagea">CreatePropertySheetPage</a> function and the <i>lParam</i> parameter passed to the <b>ReplacePage</b> method.
     * @param {LPARAM} lParam Type: <b>LPARAM</b>
     * 
     * The parameter to pass to the function specified by the <i>pfnReplacePage</i> parameter.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellpropsheetext-replacepage
     */
    ReplacePage(uPageID, pfnReplaceWith, lParam) {
        result := ComCall(4, this, "uint", uPageID, "ptr", pfnReplaceWith, "ptr", lParam, "HRESULT")
        return result
    }
}
