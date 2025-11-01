#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods supporting status collection and failure information.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-itransferadvisesink
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ITransferAdviseSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransferAdviseSink
     * @type {Guid}
     */
    static IID => Guid("{d594d0d8-8da7-457b-b3b4-ce5dbaac0b88}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UpdateProgress", "UpdateTransferState", "ConfirmOverwrite", "ConfirmEncryptionLoss", "FileFailure", "SubStreamFailure", "PropertyFailure"]

    /**
     * 
     * @param {Integer} ullSizeCurrent 
     * @param {Integer} ullSizeTotal 
     * @param {Integer} nFilesCurrent 
     * @param {Integer} nFilesTotal 
     * @param {Integer} nFoldersCurrent 
     * @param {Integer} nFoldersTotal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itransferadvisesink-updateprogress
     */
    UpdateProgress(ullSizeCurrent, ullSizeTotal, nFilesCurrent, nFilesTotal, nFoldersCurrent, nFoldersTotal) {
        result := ComCall(3, this, "uint", ullSizeCurrent, "uint", ullSizeTotal, "int", nFilesCurrent, "int", nFilesTotal, "int", nFoldersCurrent, "int", nFoldersTotal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ts 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itransferadvisesink-updatetransferstate
     */
    UpdateTransferState(ts) {
        result := ComCall(4, this, "uint", ts, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psiSource 
     * @param {IShellItem} psiDestParent 
     * @param {PWSTR} pszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itransferadvisesink-confirmoverwrite
     */
    ConfirmOverwrite(psiSource, psiDestParent, pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(5, this, "ptr", psiSource, "ptr", psiDestParent, "ptr", pszName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psiSource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itransferadvisesink-confirmencryptionloss
     */
    ConfirmEncryptionLoss(psiSource) {
        result := ComCall(6, this, "ptr", psiSource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @param {PWSTR} pszItem 
     * @param {HRESULT} hrError 
     * @param {PWSTR} pszRename 
     * @param {Integer} cchRename 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itransferadvisesink-filefailure
     */
    FileFailure(psi, pszItem, hrError, pszRename, cchRename) {
        pszItem := pszItem is String ? StrPtr(pszItem) : pszItem
        pszRename := pszRename is String ? StrPtr(pszRename) : pszRename

        result := ComCall(7, this, "ptr", psi, "ptr", pszItem, "int", hrError, "ptr", pszRename, "uint", cchRename, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @param {PWSTR} pszStreamName 
     * @param {HRESULT} hrError 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itransferadvisesink-substreamfailure
     */
    SubStreamFailure(psi, pszStreamName, hrError) {
        pszStreamName := pszStreamName is String ? StrPtr(pszStreamName) : pszStreamName

        result := ComCall(8, this, "ptr", psi, "ptr", pszStreamName, "int", hrError, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellItem} psi 
     * @param {Pointer<PROPERTYKEY>} pkey 
     * @param {HRESULT} hrError 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itransferadvisesink-propertyfailure
     */
    PropertyFailure(psi, pkey, hrError) {
        result := ComCall(9, this, "ptr", psi, "ptr", pkey, "int", hrError, "HRESULT")
        return result
    }
}
