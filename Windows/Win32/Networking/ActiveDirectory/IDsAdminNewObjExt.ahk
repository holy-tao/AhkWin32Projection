#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDsAdminNewObjExt interface is implemented by an object creation wizard extension.
 * @see https://docs.microsoft.com/windows/win32/api//dsadmin/nn-dsadmin-idsadminnewobjext
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IDsAdminNewObjExt extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDsAdminNewObjExt
     * @type {Guid}
     */
    static IID => Guid("{6088eae2-e7bf-11d2-82af-00c04f68928b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "AddPages", "SetObject", "WriteData", "OnError", "GetSummaryInfo"]

    /**
     * The IDsAdminNewObjExt::Initialize method initializes an object creation wizard extension.
     * @param {IADsContainer} pADsContainerObj Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscontainer">IADsContainer</a> interface of an existing container where the object are created. This parameter must not be <b>NULL</b>. If this object is to be kept beyond the scope of this method, the reference count must be incremented by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a> or <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a>.
     * @param {IADs} pADsCopySource Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iads">IADs</a> interface of the object from which a copy is made. If the new object is not copied from another object, this parameter is <b>NULL</b>. For more information about copy operations, see the Remarks section. If this object is to be kept beyond the scope of this method, the reference count must be incremented by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a> or <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a>.
     * @param {PWSTR} lpszClassName Pointer to a <b>WCHAR</b> string containing the LDAP name of the object class to be created. This parameter must not be <b>NULL</b>. Supported values are: "user", "computer", "printQueue", "group", and "contact".
     * @param {IDsAdminNewObj} pDsAdminNewObj Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/dsadmin/nn-dsadmin-idsadminnewobj">IDsAdminNewObj</a> interface that contains additional data about the wizard. You can also obtain the <a href="https://docs.microsoft.com/windows/desktop/api/dsadmin/nn-dsadmin-idsadminnewobjprimarysite">IDsAdminNewObjPrimarySite</a> interface of the primary extension by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> with <b>IID_IDsAdminNewObjPrimarySite</b> on this interface. If this object is to be kept beyond the scope of this method, the reference count must be incremented by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a> or <b>IUnknown::QueryInterface</b>.
     * @param {Pointer<DSA_NEWOBJ_DISPINFO>} pDispInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dsadmin/ns-dsadmin-dsa_newobj_dispinfo">DSA_NEWOBJ_DISPINFO</a> structure that contains additional data about the object creation wizard.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful or an OLE-defined error code otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//dsadmin/nf-dsadmin-idsadminnewobjext-initialize
     */
    Initialize(pADsContainerObj, pADsCopySource, lpszClassName, pDsAdminNewObj, pDispInfo) {
        lpszClassName := lpszClassName is String ? StrPtr(lpszClassName) : lpszClassName

        result := ComCall(3, this, "ptr", pADsContainerObj, "ptr", pADsCopySource, "ptr", lpszClassName, "ptr", pDsAdminNewObj, "ptr", pDispInfo, "HRESULT")
        return result
    }

    /**
     * The IDsAdminNewObjExt::AddPages method is called to enable the object creation wizard extension to add the desired pages to the wizard.
     * @param {Pointer<LPFNSVADDPROPSHEETPAGE>} lpfnAddPage Pointer to a function that the object creation wizard extension calls to add a page to the wizard. This function takes the following format.
     * 
     * 
     * ```cpp
     * BOOL fnAddPage(HPROPSHEETPAGE hPage, LPARAM lParam);
     * ```
     * 
     * 
     * <i>hPage</i> contains the handle of the wizard page created by calling <a href="https://docs.microsoft.com/windows/desktop/api/prsht/nf-prsht-createpropertysheetpagea">CreatePropertySheetPage</a>.
     * 
     * <i>lParam</i> is the <i>lParam</i> value passed to <b>AddPages</b>.
     * @param {LPARAM} lParam Contains data that is private to the administrative snap-in. This value is passed as the second parameter to <i>lpfnAddPage</i>.
     * @returns {HRESULT} If the method is successful,
     *       <b>S_OK</b> is returned. If the method fails, an OLE-defined error code is returned.
     * @see https://docs.microsoft.com/windows/win32/api//dsadmin/nf-dsadmin-idsadminnewobjext-addpages
     */
    AddPages(lpfnAddPage, lParam) {
        result := ComCall(4, this, "ptr", lpfnAddPage, "ptr", lParam, "HRESULT")
        return result
    }

    /**
     * The IDsAdminNewObjExt::SetObject method provides the object creation extension with a pointer to the directory object created.
     * @param {IADs} pADsObj Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iads">IADs</a> interface for the object. This parameter may be <b>NULL</b>. If this object is to be kept beyond the scope of this method, the reference count must be incremented by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a> or <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a>.
     * @returns {HRESULT} The method should always return <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//dsadmin/nf-dsadmin-idsadminnewobjext-setobject
     */
    SetObject(pADsObj) {
        result := ComCall(5, this, "ptr", pADsObj, "HRESULT")
        return result
    }

    /**
     * Enables the object creation wizard extension to write its data into an object in Active Directory Domain Services.
     * @param {HWND} hWnd The window handle used as the parent window for possible error messages.
     * @param {Integer} uContext 
     * @returns {HRESULT} Returns <b>S_OK</b> if successful or an OLE-defined error code otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//dsadmin/nf-dsadmin-idsadminnewobjext-writedata
     */
    WriteData(hWnd, uContext) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(6, this, "ptr", hWnd, "uint", uContext, "HRESULT")
        return result
    }

    /**
     * Called when an error has occurred in the wizard pages.
     * @param {HWND} hWnd The window handle used as the parent window for possible error messages.
     * @param {HRESULT} hr <b>HRESULT</b> of the error that occurred.
     * @param {Integer} uContext 
     * @returns {HRESULT} A primary creation extension returns <b>S_OK</b> to indicate that the error was handled by the extension or an OLE-defined error code to cause the system to display an error message.
     * 
     * The return value is ignored for a secondary creation extension.
     * @see https://docs.microsoft.com/windows/win32/api//dsadmin/nf-dsadmin-idsadminnewobjext-onerror
     */
    OnError(hWnd, hr, uContext) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(7, this, "ptr", hWnd, "int", hr, "uint", uContext, "HRESULT")
        return result
    }

    /**
     * The IDsAdminNewObjExt::GetSummaryInfo method obtains a string that contains a summary of the data gathered by the new object wizard extension page. This string is displayed in the wizard Finish page.
     * @param {Pointer<BSTR>} pBstrText A pointer to a <b>BSTR</b> value that receives the summary text. To allocate this value, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a>. The caller must free this memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @returns {HRESULT} If the method is successful, <b>S_OK</b> is returned. If the method fails, an OLE-defined error code is returned. If the extension does not provide a summary string, this method should return <b>E_NOTIMPL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//dsadmin/nf-dsadmin-idsadminnewobjext-getsummaryinfo
     */
    GetSummaryInfo(pBstrText) {
        result := ComCall(8, this, "ptr", pBstrText, "HRESULT")
        return result
    }
}
