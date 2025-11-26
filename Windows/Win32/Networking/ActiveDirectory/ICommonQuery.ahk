#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDataObject.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used to programmatically display the system-supplied directory service query dialog box.
 * @see https://docs.microsoft.com/windows/win32/api//cmnquery/nn-cmnquery-icommonquery
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ICommonQuery extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommonQuery
     * @type {Guid}
     */
    static IID => Guid("{ab50dec0-6f1d-11d0-a1c4-00aa00c16e65}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenQueryWindow"]

    /**
     * The ICommonQuery::OpenQueryWindow method displays the directory service query dialog. This method does not return until the dialog box has been closed by the user.
     * @param {HWND} hwndParent Contains the handle of the window to use as the parent to the query dialog box. This parameter can be <b>NULL</b> if no parent is specified.
     * @param {Pointer<OPENQUERYWINDOW>} pQueryWnd Address of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/cmnquery/ns-cmnquery-openquerywindow">OPENQUERYWINDOW</a> structure that defines the query to perform and the characteristics of the query dialog.
     * @returns {IDataObject} Address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> interface pointer that receives the results of the query. This parameter only receives valid data if this method returns <b>S_OK</b>. This <b>IDataObject</b> supports the following clipboard formats.
     * @see https://docs.microsoft.com/windows/win32/api//cmnquery/nf-cmnquery-icommonquery-openquerywindow
     */
    OpenQueryWindow(hwndParent, pQueryWnd) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(3, this, "ptr", hwndParent, "ptr", pQueryWnd, "ptr*", &ppDataObject := 0, "HRESULT")
        return IDataObject(ppDataObject)
    }
}
