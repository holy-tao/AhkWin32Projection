#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IModalWindow.ahk

/**
 * Exposes methods that initialize, show, and get results from the common file dialog.
 * @remarks
 * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * <b>IFileDialog</b> is implemented by the common file open dialog (CLSID_FileOpenDialog) and
  * file save dialog (CLSID_FileSaveDialog).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ifiledialog
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFileDialog extends IModalWindow{
    /**
     * The interface identifier for IFileDialog
     * @type {Guid}
     */
    static IID => Guid("{42f85136-db7e-439c-85f1-e4075d135fc8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * 
     * @param {Integer} cFileTypes 
     * @param {Pointer<COMDLG_FILTERSPEC>} rgFilterSpec 
     * @returns {HRESULT} 
     */
    SetFileTypes(cFileTypes, rgFilterSpec) {
        result := ComCall(4, this, "uint", cFileTypes, "ptr", rgFilterSpec, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iFileType 
     * @returns {HRESULT} 
     */
    SetFileTypeIndex(iFileType) {
        result := ComCall(5, this, "uint", iFileType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} piFileType 
     * @returns {HRESULT} 
     */
    GetFileTypeIndex(piFileType) {
        result := ComCall(6, this, "uint*", piFileType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFileDialogEvents>} pfde 
     * @param {Pointer<UInt32>} pdwCookie 
     * @returns {HRESULT} 
     */
    Advise(pfde, pdwCookie) {
        result := ComCall(7, this, "ptr", pfde, "uint*", pdwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    Unadvise(dwCookie) {
        result := ComCall(8, this, "uint", dwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fos 
     * @returns {HRESULT} 
     */
    SetOptions(fos) {
        result := ComCall(9, this, "uint", fos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pfos 
     * @returns {HRESULT} 
     */
    GetOptions(pfos) {
        result := ComCall(10, this, "uint*", pfos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psi 
     * @returns {HRESULT} 
     */
    SetDefaultFolder(psi) {
        result := ComCall(11, this, "ptr", psi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psi 
     * @returns {HRESULT} 
     */
    SetFolder(psi) {
        result := ComCall(12, this, "ptr", psi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} ppsi 
     * @returns {HRESULT} 
     */
    GetFolder(ppsi) {
        result := ComCall(13, this, "ptr", ppsi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} ppsi 
     * @returns {HRESULT} 
     */
    GetCurrentSelection(ppsi) {
        result := ComCall(14, this, "ptr", ppsi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @returns {HRESULT} 
     */
    SetFileName(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(15, this, "ptr", pszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pszName 
     * @returns {HRESULT} 
     */
    GetFileName(pszName) {
        result := ComCall(16, this, "ptr", pszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszTitle 
     * @returns {HRESULT} 
     */
    SetTitle(pszTitle) {
        pszTitle := pszTitle is String ? StrPtr(pszTitle) : pszTitle

        result := ComCall(17, this, "ptr", pszTitle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszText 
     * @returns {HRESULT} 
     */
    SetOkButtonLabel(pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(18, this, "ptr", pszText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszLabel 
     * @returns {HRESULT} 
     */
    SetFileNameLabel(pszLabel) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(19, this, "ptr", pszLabel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} ppsi 
     * @returns {HRESULT} 
     */
    GetResult(ppsi) {
        result := ComCall(20, this, "ptr", ppsi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItem>} psi 
     * @param {Integer} fdap 
     * @returns {HRESULT} 
     */
    AddPlace(psi, fdap) {
        result := ComCall(21, this, "ptr", psi, "int", fdap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszDefaultExtension 
     * @returns {HRESULT} 
     */
    SetDefaultExtension(pszDefaultExtension) {
        pszDefaultExtension := pszDefaultExtension is String ? StrPtr(pszDefaultExtension) : pszDefaultExtension

        result := ComCall(22, this, "ptr", pszDefaultExtension, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     */
    Close(hr) {
        result := ComCall(23, this, "int", hr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @returns {HRESULT} 
     */
    SetClientGuid(guid) {
        result := ComCall(24, this, "ptr", guid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearClientData() {
        result := ComCall(25, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItemFilter>} pFilter 
     * @returns {HRESULT} 
     */
    SetFilter(pFilter) {
        result := ComCall(26, this, "ptr", pFilter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
