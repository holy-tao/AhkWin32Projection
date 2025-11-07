#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IShellItem.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFileTypes", "SetFileTypeIndex", "GetFileTypeIndex", "Advise", "Unadvise", "SetOptions", "GetOptions", "SetDefaultFolder", "SetFolder", "GetFolder", "GetCurrentSelection", "SetFileName", "GetFileName", "SetTitle", "SetOkButtonLabel", "SetFileNameLabel", "GetResult", "AddPlace", "SetDefaultExtension", "Close", "SetClientGuid", "ClearClientData", "SetFilter"]

    /**
     * 
     * @param {Integer} cFileTypes 
     * @param {Pointer<COMDLG_FILTERSPEC>} rgFilterSpec 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setfiletypes
     */
    SetFileTypes(cFileTypes, rgFilterSpec) {
        result := ComCall(4, this, "uint", cFileTypes, "ptr", rgFilterSpec, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iFileType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setfiletypeindex
     */
    SetFileTypeIndex(iFileType) {
        result := ComCall(5, this, "uint", iFileType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-getfiletypeindex
     */
    GetFileTypeIndex() {
        result := ComCall(6, this, "uint*", &piFileType := 0, "HRESULT")
        return piFileType
    }

    /**
     * 
     * @param {IFileDialogEvents} pfde 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-advise
     */
    Advise(pfde) {
        result := ComCall(7, this, "ptr", pfde, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-unadvise
     */
    Unadvise(dwCookie) {
        result := ComCall(8, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fos 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setoptions
     */
    SetOptions(fos) {
        result := ComCall(9, this, "uint", fos, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-getoptions
     */
    GetOptions() {
        result := ComCall(10, this, "uint*", &pfos := 0, "HRESULT")
        return pfos
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setdefaultfolder
     */
    SetDefaultFolder(psi) {
        result := ComCall(11, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setfolder
     */
    SetFolder(psi) {
        result := ComCall(12, this, "ptr", psi, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IShellItem} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-getfolder
     */
    GetFolder() {
        result := ComCall(13, this, "ptr*", &ppsi := 0, "HRESULT")
        return IShellItem(ppsi)
    }

    /**
     * 
     * @returns {IShellItem} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-getcurrentselection
     */
    GetCurrentSelection() {
        result := ComCall(14, this, "ptr*", &ppsi := 0, "HRESULT")
        return IShellItem(ppsi)
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setfilename
     */
    SetFileName(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(15, this, "ptr", pszName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-getfilename
     */
    GetFileName() {
        result := ComCall(16, this, "ptr*", &pszName := 0, "HRESULT")
        return pszName
    }

    /**
     * 
     * @param {PWSTR} pszTitle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-settitle
     */
    SetTitle(pszTitle) {
        pszTitle := pszTitle is String ? StrPtr(pszTitle) : pszTitle

        result := ComCall(17, this, "ptr", pszTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setokbuttonlabel
     */
    SetOkButtonLabel(pszText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(18, this, "ptr", pszText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszLabel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setfilenamelabel
     */
    SetFileNameLabel(pszLabel) {
        pszLabel := pszLabel is String ? StrPtr(pszLabel) : pszLabel

        result := ComCall(19, this, "ptr", pszLabel, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IShellItem} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-getresult
     */
    GetResult() {
        result := ComCall(20, this, "ptr*", &ppsi := 0, "HRESULT")
        return IShellItem(ppsi)
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @param {Integer} fdap 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-addplace
     */
    AddPlace(psi, fdap) {
        result := ComCall(21, this, "ptr", psi, "int", fdap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszDefaultExtension 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setdefaultextension
     */
    SetDefaultExtension(pszDefaultExtension) {
        pszDefaultExtension := pszDefaultExtension is String ? StrPtr(pszDefaultExtension) : pszDefaultExtension

        result := ComCall(22, this, "ptr", pszDefaultExtension, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-close
     */
    Close(hr) {
        result := ComCall(23, this, "int", hr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setclientguid
     */
    SetClientGuid(guid) {
        result := ComCall(24, this, "ptr", guid, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-clearclientdata
     */
    ClearClientData() {
        result := ComCall(25, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItemFilter} pFilter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ifiledialog-setfilter
     */
    SetFilter(pFilter) {
        result := ComCall(26, this, "ptr", pFilter, "HRESULT")
        return result
    }
}
