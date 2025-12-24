#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that improves the efficiency of autocompletion when the candidate strings are organized in a hierarchy.
 * @remarks
 * 
 * Autocompletion typically requires the following three components:
 * 		
 *         		
 * 
 * <ul>
 * <li>The autocompletion client. This client is a window, such as a dialog box, that hosts the edit control.</li>
 * <li>The autocompletion object (CLSID_AutoComplete). This object is provided by the system, and handles the user interface, parsing, and background thread management.</li>
 * <li>The autocompletion list object. This object is responsible for providing lists of candidate strings to the autocompletion object.</li>
 * </ul>
 * A simple autocompletion list object needs only to export <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstring">IEnumString</a> in addition to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>. When the user enters characters in the edit box, the autocompletion object calls the list object's <b>IEnumString</b> interface to enumerate the list of strings that can be used to complete the partial string. The list object maintains a namespace and decides which of those strings are relevant.
 * 
 * The simplest approach a list object takes is to return every string in its namespace every time the autocompletion object makes a request. For a discussion of how to implement this type of list object, see <a href="https://docs.microsoft.com/windows/desktop/api/shldisp/nn-shldisp-iautocomplete">IAutoComplete</a>. However, this approach is practical only if the namespace is relatively small. When large numbers of strings are involved, the list object must restrict itself to a small subset of the namespace.
 * 
 * The <b>IACList</b> interface is exported by autocompletion list objects to help them choose a sensible subset of strings from a hierarchically organized namespace. With a large namespace, this procedure substantially increases the efficiency of autocompletion. The basic procedure is as follows:
 * 
 * 				
 * 
 * <ol>
 * <li>The autocomplete object calls the list object's <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstring">IEnumString</a> interface. The list object returns the names of the top-level items in the hierarchy. For example, if the namespace consists of every file and folder on the C: drive, the list object returns the fully qualified paths of the folders and files contained in the C:\ directory.</li>
 * <li>The user continues to type until he or she enters a delimiter. The '\' and '/' characters are recognized as delimiters by the autocompletion object.</li>
 * <li>The autocompletion object calls the list object's <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-iaclist-expand">IACList::Expand</a> method and passes it the current partial string.</li>
 * <li>The autocomplete object calls the list object's <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstring">IEnumString</a> interface again to request a new list of strings. If the partial string matches one of the top-level items in the namespace, the list object returns the names of the items that fall immediately under the selected item. For instance, if the user has entered "C:\Program Files\", the list object returns the names of the files and folders contained in that directory. If the name passed to <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-iaclist-expand">IACList::Expand</a> does not match any top-level item, the list object can simply stop returning strings until the autocomplete object calls <b>IACList::Expand</b> with a string that is in the list object's namespace.</li>
 * <li>The process continues until the user selects a string, typically by pressing the <b>ENTER</b> key.</li>
 * </ol>
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nn-shlobj_core-iaclist
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IACList extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IACList
     * @type {Guid}
     */
    static IID => Guid("{77a130b0-94fd-11d0-a544-00c04fd7d062}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Expand"]

    /**
     * Requests that the autocompletion client generate candidate strings associated with a specified item in its namespace.
     * @param {PWSTR} pszExpand Type: <b>PCWSTR</b>
     * 
     * A pointer to a null-terminated, Unicode string to be expanded by the autocomplete object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nf-shlobj_core-iaclist-expand
     */
    Expand(pszExpand) {
        pszExpand := pszExpand is String ? StrPtr(pszExpand) : pszExpand

        result := ComCall(3, this, "ptr", pszExpand, "HRESULT")
        return result
    }
}
