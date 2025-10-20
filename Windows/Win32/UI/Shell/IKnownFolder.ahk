#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Guid>} pkfid 
     * @returns {HRESULT} 
     */
    GetId(pkfid) {
        result := ComCall(3, this, "ptr", pkfid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pCategory 
     * @returns {HRESULT} 
     */
    GetCategory(pCategory) {
        result := ComCall(4, this, "int*", pCategory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetShellItem(dwFlags, riid, ppv) {
        result := ComCall(5, this, "uint", dwFlags, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The GetPath function retrieves the coordinates defining the endpoints of lines and the control points of curves found in the path that is selected into the specified device context.
     * @param {Integer} dwFlags 
     * @param {Pointer<PWSTR>} ppszPath 
     * @returns {HRESULT} If the <i>nSize</i> parameter is nonzero, the return value is the number of points enumerated. If <i>nSize</i> is 0, the return value is the total number of points in the path (and <b>GetPath</b> writes nothing to the buffers). If <i>nSize</i> is nonzero and is less than the number of points in the path, the return value is 1.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpath
     */
    GetPath(dwFlags, ppszPath) {
        result := ComCall(6, this, "uint", dwFlags, "ptr", ppszPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     */
    SetPath(dwFlags, pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(7, this, "uint", dwFlags, "ptr", pszPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<ITEMIDLIST>} ppidl 
     * @returns {HRESULT} 
     */
    GetIDList(dwFlags, ppidl) {
        result := ComCall(8, this, "uint", dwFlags, "ptr", ppidl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pftid 
     * @returns {HRESULT} 
     */
    GetFolderType(pftid) {
        result := ComCall(9, this, "ptr", pftid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pCapabilities 
     * @returns {HRESULT} 
     */
    GetRedirectionCapabilities(pCapabilities) {
        result := ComCall(10, this, "uint*", pCapabilities, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<KNOWNFOLDER_DEFINITION>} pKFD 
     * @returns {HRESULT} 
     */
    GetFolderDefinition(pKFD) {
        result := ComCall(11, this, "ptr", pKFD, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
