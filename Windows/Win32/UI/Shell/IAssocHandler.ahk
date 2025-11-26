#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAssocHandlerInvoker.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for operations with a file association dialog box or menu.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iassochandler
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IAssocHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAssocHandler
     * @type {Guid}
     */
    static IID => Guid("{f04061ac-1659-4a3f-a954-775aa57fc083}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetUIName", "GetIconLocation", "IsRecommended", "MakeDefault", "Invoke", "CreateInvoker"]

    /**
     * Retrieves the full path and file name of the executable file associated with the file type.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains the address of a pointer to a null-terminated, Unicode string that contains the full path of the file, including the file name.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iassochandler-getname
     */
    GetName() {
        result := ComCall(3, this, "ptr*", &ppsz := 0, "HRESULT")
        return ppsz
    }

    /**
     * Retrieves the display name of an application.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains the address of a pointer to a null-terminated, Unicode string that contains the display name of the application.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iassochandler-getuiname
     */
    GetUIName() {
        result := ComCall(4, this, "ptr*", &ppsz := 0, "HRESULT")
        return ppsz
    }

    /**
     * Retrieves the location of the icon associated with the application.
     * @param {Pointer<PWSTR>} ppszPath Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains the address of a pointer to a null-terminated, Unicode string that contains the path to the application's icon.
     * @param {Pointer<Integer>} pIndex Type: <b>int*</b>
     * 
     * When this method returns, contains a pointer to the index of the icon within the resource named in <i>ppszPath</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iassochandler-geticonlocation
     */
    GetIconLocation(ppszPath, pIndex) {
        ppszPathMarshal := ppszPath is VarRef ? "ptr*" : "ptr"
        pIndexMarshal := pIndex is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, ppszPathMarshal, ppszPath, pIndexMarshal, pIndex, "HRESULT")
        return result
    }

    /**
     * Indicates whether the application is registered as a recommended handler for the queried file type.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if the program is recommended; otherwise, S_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iassochandler-isrecommended
     */
    IsRecommended() {
        result := ComCall(6, this, "int")
        return result
    }

    /**
     * Sets an application as the default application for this file type.
     * @param {PWSTR} pszDescription Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated, Unicode string that contains the display name of the application.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iassochandler-makedefault
     */
    MakeDefault(pszDescription) {
        pszDescription := pszDescription is String ? StrPtr(pszDescription) : pszDescription

        result := ComCall(7, this, "ptr", pszDescription, "HRESULT")
        return result
    }

    /**
     * Directly invokes the associated handler.
     * @param {IDataObject} pdo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> that represents the selected item on which to invoke the handler. Note that you should not call <b>IAssocHandler::Invoke</b> with a selection of multiple items. If you have multiple items, call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iassochandler-createinvoker">IAssocHandler::CreateInvoker</a> instead. See Remarks for more details.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iassochandler-invoke
     */
    Invoke(pdo) {
        result := ComCall(8, this, "ptr", pdo, "HRESULT")
        return result
    }

    /**
     * Retrieves an object that enables the invocation of the associated handler on the current selection. The invoker includes the ability to verify whether the current selection is supported.
     * @param {IDataObject} pdo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> that represents the selected item or items on which to invoke the handler. Note that if you have only a single item, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iassochandler-invoke">IAssocHandler::Invoke</a> could be the better choice. See Remarks for more details.
     * @returns {IAssocHandlerInvoker} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iassochandlerinvoker">IAssocHandlerInvoker</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iassochandlerinvoker">IAssocHandlerInvoker</a> object. This object is used to invoke the menu item after ensuring that the selected items are supported by the associated handler.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iassochandler-createinvoker
     */
    CreateInvoker(pdo) {
        result := ComCall(9, this, "ptr", pdo, "ptr*", &ppInvoker := 0, "HRESULT")
        return IAssocHandlerInvoker(ppInvoker)
    }
}
