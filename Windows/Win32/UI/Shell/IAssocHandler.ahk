#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAssocHandlerInvoker.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for operations with a file association dialog box or menu.
 * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nn-shobjidl_core-iassochandler
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
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-iassochandler-getname
     */
    GetName() {
        result := ComCall(3, this, "ptr*", &ppsz := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppsz
    }

    /**
     * Retrieves the display name of an application.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains the address of a pointer to a null-terminated, Unicode string that contains the display name of the application.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-iassochandler-getuiname
     */
    GetUIName() {
        result := ComCall(4, this, "ptr*", &ppsz := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppsz
    }

    /**
     * Retrieves the location of the icon associated with the application.
     * @remarks
     * If the icon cannot be found, the function will return the path to the executable, and an icon index of zero.
     * 
     * For performance reasons, an application may use the Shell image cache to retrieve the icon, rather than loading the icon directly from the path returned.  The path and icon index can be passed directly to <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shell_getcachedimageindexa">Shell_GetCachedImageIndex</a>. One benefit of this is that the Shell cache can provide a default icon in the event that no icon was available for the application.
     * @param {Pointer<PWSTR>} ppszPath Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains the address of a pointer to a null-terminated, Unicode string that contains the path to the application's icon.
     * @param {Pointer<Integer>} pIndex Type: <b>int*</b>
     * 
     * When this method returns, contains a pointer to the index of the icon within the resource named in <i>ppszPath</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-iassochandler-geticonlocation
     */
    GetIconLocation(ppszPath, pIndex) {
        ppszPathMarshal := ppszPath is VarRef ? "ptr*" : "ptr"
        pIndexMarshal := pIndex is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, ppszPathMarshal, ppszPath, pIndexMarshal, pIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Indicates whether the application is registered as a recommended handler for the queried file type.
     * @remarks
     * Applications that register themselves as handlers for particular file types can specify whether they are recommended handlers. This has no effect on the actual behavior of the applications when launched. It is simply provided as a hint to the user and a value that the UI can utilize programmatically, if desired. For example, the Shell's <b>Open With</b> dialog separates entries into <b>Recommended Programs</b> and <b>Other Programs</b>.
     * 
     * Note that program recommendations may change over time. One example is provided when the user chooses an application from the <b>Other Programs</b> of the <b>Open With</b> dialog to open a particular file type. That may cause the Shell to "promote" that application to recommended status for that file type. Because the recommended status may change over time, applications should not cache this value, but query it each time it is needed.
     * 
     * If <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shassocenumhandlers">SHAssocEnumHandlers</a> was called with the ASSOC_FILTER_RECOMMENDED flag, then only recommended handlers are returned. If the ASSOC_FILTER_NONE flag was used, then you must call <b>IAssocHandler::IsRecommended</b> on each <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iassochandler">IAssocHandler</a> object to determine whether it is recommended or not.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if the program is recommended; otherwise, S_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-iassochandler-isrecommended
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-iassochandler-makedefault
     */
    MakeDefault(pszDescription) {
        pszDescription := pszDescription is String ? StrPtr(pszDescription) : pszDescription

        result := ComCall(7, this, "ptr", pszDescription, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Directly invokes the associated handler.
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iassochandler">IAssocHandler</a> objects are typically used to populate an <b>Open With</b> menu. When one of those menu items is selected, this method is called to launch the chosen application.
     * 
     * <h3><a id="Invoke_and_CreateInvoker"></a><a id="invoke_and_createinvoker"></a><a id="INVOKE_AND_CREATEINVOKER"></a>Invoke and CreateInvoker</h3>
     * The <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> used by these methods can represent either a single file or a selection of multiple files. Not all applications support the multiple file option. The applications that do support that scenario might impose other restrictions, such as the number of files that can be opened simultaneously, or the acceptable combination of file types.
     *               
     * 
     * Therefore, an application often must determine whether the handler supports the selection before trying to invoke the handler. For example, an application might enable a menu item only if it has verified that the selection in question was supported by that handler.
     * 
     * It is generally safe to assume that an application will support invocation on a single item, and in those cases the application typically calls <b>IAssocHandler::Invoke</b> based on that assumption.
     * 
     * For multiple selection scenarios, however, the application should call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iassochandler-createinvoker">IAssocHandler::CreateInvoker</a>. That method retrieves an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iassochandlerinvoker">IAssocHandlerInvoker</a> object that allows the calling application to first check whether the selection is supported (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iassochandlerinvoker-supportsselection">SupportsSelection</a>), then to invoke the handler (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iassochandlerinvoker-invoke">Invoke</a>).
     * 
     * <b>IAssocHandler::Invoke</b> can be called on a selection of multiple files, but it is not recommended because of the large processing load involved and no guarantee that it will succeed.
     * @param {IDataObject} pdo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> that represents the selected item on which to invoke the handler. Note that you should not call <b>IAssocHandler::Invoke</b> with a selection of multiple items. If you have multiple items, call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iassochandler-createinvoker">IAssocHandler::CreateInvoker</a> instead. See Remarks for more details.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-iassochandler-invoke
     */
    Invoke(pdo) {
        result := ComCall(8, this, "ptr", pdo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves an object that enables the invocation of the associated handler on the current selection. The invoker includes the ability to verify whether the current selection is supported.
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iassochandler">IAssocHandler</a> objects are typically used to populate an <b>Open With</b> menu. When one of those menu items is selected, this method is called to launch the chosen application.
     * 
     * <h3><a id="Invoke_and_CreateInvoker"></a><a id="invoke_and_createinvoker"></a><a id="INVOKE_AND_CREATEINVOKER"></a>Invoke and CreateInvoker</h3>
     * The <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> used by these methods can represent either a single file or it may represent a selection of multiple files. Not all applications support the multiple files option. Those applications that do support that scenario might impose other restrictions such as the number of files that can be opened at once, or acceptable combinations of file types.
     *               
     * 
     * Therefore, an application often must determine whether the handler supports the selection before trying to invoke the handler. For example, an application might enable a menu item only if it knew that the selection in question was supported by that handler.
     * 
     * It is generally safe to assume that an application will support invocation on a single item; in those cases the application typically calls <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iassochandler-invoke">IAssocHandler::Invoke</a>.
     * 
     * For multiple selection scenarios, the application should call <b>IAssocHandler::CreateInvoker</b>. That method retrieves an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iassochandlerinvoker">IAssocHandlerInvoker</a> object that allows the calling application to first check whether the selection is supported (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iassochandlerinvoker-supportsselection">SupportsSelection</a>), then to invoke the handler (<a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iassochandlerinvoker-invoke">Invoke</a>).
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iassochandler-invoke">IAssocHandler::Invoke</a> can be called on a selection of multiple files, but it is not recommended due to the large processing load involved and no guarantee of success.
     * @param {IDataObject} pdo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> that represents the selected item or items on which to invoke the handler. Note that if you have only a single item, <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iassochandler-invoke">IAssocHandler::Invoke</a> could be the better choice. See Remarks for more details.
     * @returns {IAssocHandlerInvoker} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iassochandlerinvoker">IAssocHandlerInvoker</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iassochandlerinvoker">IAssocHandlerInvoker</a> object. This object is used to invoke the menu item after ensuring that the selected items are supported by the associated handler.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-iassochandler-createinvoker
     */
    CreateInvoker(pdo) {
        result := ComCall(9, this, "ptr", pdo, "ptr*", &ppInvoker := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAssocHandlerInvoker(ppInvoker)
    }
}
