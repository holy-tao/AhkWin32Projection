#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KNOWNFOLDER_DEFINITION.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that allow an application to retrieve information about a known folder's category, type, GUID, pointer to an item identifier list (PIDL) value, redirection capabilities, and definition.
 * @remarks
 * 
  * <b>IKnownFolder</b> objects can be obtained through several methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iknownfoldermanager">IKnownFolderManager</a> interface, such as <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iknownfoldermanager-getfolder">IKnownFolderManager::GetFolder</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iknownfoldermanager-findfolderfromidlist">IKnownFolderManager::FindFolderFromIDList</a>.
  * 
  * Third parties do not implement <b>IKnownFolder</b>. Use the provided implementation.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iknownfolder
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IKnownFolder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKnownFolder
     * @type {Guid}
     */
    static IID => Guid("{3aa7af7e-9b36-420c-a8e3-f77d4674a488}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetId", "GetCategory", "GetShellItem", "GetPath", "SetPath", "GetIDList", "GetFolderType", "GetRedirectionCapabilities", "GetFolderDefinition"]

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfolder-getid
     */
    GetId() {
        pkfid := Guid()
        result := ComCall(3, this, "ptr", pkfid, "HRESULT")
        return pkfid
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfolder-getcategory
     */
    GetCategory() {
        result := ComCall(4, this, "int*", &pCategory := 0, "HRESULT")
        return pCategory
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfolder-getshellitem
     */
    GetShellItem(dwFlags, riid) {
        result := ComCall(5, this, "uint", dwFlags, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * The GetPath function retrieves the coordinates defining the endpoints of lines and the control points of curves found in the path that is selected into the specified device context.
     * @param {Integer} dwFlags 
     * @returns {PWSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpath
     */
    GetPath(dwFlags) {
        result := ComCall(6, this, "uint", dwFlags, "ptr*", &ppszPath := 0, "HRESULT")
        return ppszPath
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfolder-setpath
     */
    SetPath(dwFlags, pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(7, this, "uint", dwFlags, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {Pointer<ITEMIDLIST>} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfolder-getidlist
     */
    GetIDList(dwFlags) {
        result := ComCall(8, this, "uint", dwFlags, "ptr*", &ppidl := 0, "HRESULT")
        return ppidl
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfolder-getfoldertype
     */
    GetFolderType() {
        pftid := Guid()
        result := ComCall(9, this, "ptr", pftid, "HRESULT")
        return pftid
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfolder-getredirectioncapabilities
     */
    GetRedirectionCapabilities() {
        result := ComCall(10, this, "uint*", &pCapabilities := 0, "HRESULT")
        return pCapabilities
    }

    /**
     * 
     * @returns {KNOWNFOLDER_DEFINITION} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iknownfolder-getfolderdefinition
     */
    GetFolderDefinition() {
        pKFD := KNOWNFOLDER_DEFINITION()
        result := ComCall(11, this, "ptr", pKFD, "HRESULT")
        return pKFD
    }
}
