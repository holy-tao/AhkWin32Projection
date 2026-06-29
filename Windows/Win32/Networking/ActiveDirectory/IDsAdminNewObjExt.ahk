#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IADs.ahk" { IADs }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\IADsContainer.ahk" { IADsContainer }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IDsAdminNewObj.ahk" { IDsAdminNewObj }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DSA_NEWOBJ_DISPINFO.ahk" { DSA_NEWOBJ_DISPINFO }

/**
 * The IDsAdminNewObjExt interface is implemented by an object creation wizard extension.
 * @see https://learn.microsoft.com/windows/win32/api/dsadmin/nn-dsadmin-idsadminnewobjext
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IDsAdminNewObjExt extends IUnknown {
    /**
     * The interface identifier for IDsAdminNewObjExt
     * @type {Guid}
     */
    static IID := Guid("{6088eae2-e7bf-11d2-82af-00c04f68928b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDsAdminNewObjExt interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize     : IntPtr
        AddPages       : IntPtr
        SetObject      : IntPtr
        WriteData      : IntPtr
        OnError        : IntPtr
        GetSummaryInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDsAdminNewObjExt.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IDsAdminNewObjExt::Initialize method initializes an object creation wizard extension.
     * @remarks
     * An object in Active Directory Domain Services can either be created from nothing or copied from an existing object. If the new object is created from an existing object, <i>pADsCopySource</i> will contain a pointer to the object from which the copy is made. If the new object is not being copied from another object, <i>pADsCopySource</i> will be <b>NULL</b>. The copy operation is only supported for user objects.
     * @param {IADsContainer} pADsContainerObj Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscontainer">IADsContainer</a> interface of an existing container where the object are created. This parameter must not be <b>NULL</b>. If this object is to be kept beyond the scope of this method, the reference count must be incremented by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a> or <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a>.
     * @param {IADs} pADsCopySource Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iads">IADs</a> interface of the object from which a copy is made. If the new object is not copied from another object, this parameter is <b>NULL</b>. For more information about copy operations, see the Remarks section. If this object is to be kept beyond the scope of this method, the reference count must be incremented by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a> or <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a>.
     * @param {PWSTR} lpszClassName Pointer to a <b>WCHAR</b> string containing the LDAP name of the object class to be created. This parameter must not be <b>NULL</b>. Supported values are: "user", "computer", "printQueue", "group", and "contact".
     * @param {IDsAdminNewObj} pDsAdminNewObj Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/dsadmin/nn-dsadmin-idsadminnewobj">IDsAdminNewObj</a> interface that contains additional data about the wizard. You can also obtain the <a href="https://docs.microsoft.com/windows/desktop/api/dsadmin/nn-dsadmin-idsadminnewobjprimarysite">IDsAdminNewObjPrimarySite</a> interface of the primary extension by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> with <b>IID_IDsAdminNewObjPrimarySite</b> on this interface. If this object is to be kept beyond the scope of this method, the reference count must be incremented by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a> or <b>IUnknown::QueryInterface</b>.
     * @param {Pointer<DSA_NEWOBJ_DISPINFO>} pDispInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dsadmin/ns-dsadmin-dsa_newobj_dispinfo">DSA_NEWOBJ_DISPINFO</a> structure that contains additional data about the object creation wizard.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful or an OLE-defined error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/dsadmin/nf-dsadmin-idsadminnewobjext-initialize
     */
    Initialize(pADsContainerObj, pADsCopySource, lpszClassName, pDsAdminNewObj, pDispInfo) {
        lpszClassName := lpszClassName is String ? StrPtr(lpszClassName) : lpszClassName

        result := ComCall(3, this, "ptr", pADsContainerObj, "ptr", pADsCopySource, "ptr", lpszClassName, "ptr", pDsAdminNewObj, DSA_NEWOBJ_DISPINFO.Ptr, pDispInfo, "HRESULT")
        return result
    }

    /**
     * The IDsAdminNewObjExt::AddPages method is called to enable the object creation wizard extension to add the desired pages to the wizard.
     * @remarks
     * For each page, the wizard extension adds to the wizard, the extension fills in a <a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetpagea_v2">PROPSHEETPAGE</a> structure, calls the <a href="https://docs.microsoft.com/windows/desktop/api/prsht/nf-prsht-createpropertysheetpagea">CreatePropertySheetPage</a> function to create the page handle and then calls the <i>lpfnAddPage</i> function with the page handle and <i>lParam</i>.
     * 
     * This method is identical in format and operation to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellpropsheetext-addpages">IShellPropSheetExt::AddPages</a> method.
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
     * @param {LPARAM} _lParam Contains data that is private to the administrative snap-in. This value is passed as the second parameter to <i>lpfnAddPage</i>.
     * @returns {HRESULT} If the method is successful,
     *       <b>S_OK</b> is returned. If the method fails, an OLE-defined error code is returned.
     * @see https://learn.microsoft.com/windows/win32/api/dsadmin/nf-dsadmin-idsadminnewobjext-addpages
     */
    AddPages(lpfnAddPage, _lParam) {
        result := ComCall(4, this, "ptr", lpfnAddPage, LPARAM, _lParam, "HRESULT")
        return result
    }

    /**
     * The IDsAdminNewObjExt::SetObject method provides the object creation extension with a pointer to the directory object created.
     * @param {IADs} pADsObj Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iads">IADs</a> interface for the object. This parameter may be <b>NULL</b>. If this object is to be kept beyond the scope of this method, the reference count must be incremented by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a> or <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a>.
     * @returns {HRESULT} The method should always return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/dsadmin/nf-dsadmin-idsadminnewobjext-setobject
     */
    SetObject(pADsObj) {
        result := ComCall(5, this, "ptr", pADsObj, "HRESULT")
        return result
    }

    /**
     * Enables the object creation wizard extension to write its data into an object in Active Directory Domain Services.
     * @remarks
     * A pointer to the temporary directory object is supplied to the extension when the <a href="https://docs.microsoft.com/windows/desktop/api/dsadmin/nf-dsadmin-idsadminnewobjext-setobject">IDsAdminNewObjExt::SetObject</a> method is called.
     * 
     * A secondary object creation extension should not commit the data set during the <b>WriteData</b> method by calling <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-setinfo">IADs::SetInfo</a>. The primary object creation extension will commit all of the data for the object when all of the extensions have added their data.
     * @param {HWND} _hWnd The window handle used as the parent window for possible error messages.
     * @param {Integer} uContext 
     * @returns {HRESULT} Returns <b>S_OK</b> if successful or an OLE-defined error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/dsadmin/nf-dsadmin-idsadminnewobjext-writedata
     */
    WriteData(_hWnd, uContext) {
        result := ComCall(6, this, HWND, _hWnd, "uint", uContext, "HRESULT")
        return result
    }

    /**
     * Called when an error has occurred in the wizard pages.
     * @param {HWND} _hWnd The window handle used as the parent window for possible error messages.
     * @param {HRESULT} hr <b>HRESULT</b> of the error that occurred.
     * @param {Integer} uContext 
     * @returns {HRESULT} A primary creation extension returns <b>S_OK</b> to indicate that the error was handled by the extension or an OLE-defined error code to cause the system to display an error message.
     * 
     * The return value is ignored for a secondary creation extension.
     * @see https://learn.microsoft.com/windows/win32/api/dsadmin/nf-dsadmin-idsadminnewobjext-onerror
     */
    OnError(_hWnd, hr, uContext) {
        result := ComCall(7, this, HWND, _hWnd, "int", hr, "uint", uContext, "HRESULT")
        return result
    }

    /**
     * The IDsAdminNewObjExt::GetSummaryInfo method obtains a string that contains a summary of the data gathered by the new object wizard extension page. This string is displayed in the wizard Finish page.
     * @remarks
     * Support of this method is optional. If the extension does not supply summary information, it should return <b>E_NOTIMPL</b> from this method.
     * @param {Pointer<BSTR>} pBstrText A pointer to a <b>BSTR</b> value that receives the summary text. To allocate this value, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a>. The caller must free this memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @returns {HRESULT} If the method is successful, <b>S_OK</b> is returned. If the method fails, an OLE-defined error code is returned. If the extension does not provide a summary string, this method should return <b>E_NOTIMPL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/dsadmin/nf-dsadmin-idsadminnewobjext-getsummaryinfo
     */
    GetSummaryInfo(pBstrText) {
        result := ComCall(8, this, BSTR.Ptr, pBstrText, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDsAdminNewObjExt.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 6)
        this.vtbl.AddPages := CallbackCreate(GetMethod(implObj, "AddPages"), flags, 3)
        this.vtbl.SetObject := CallbackCreate(GetMethod(implObj, "SetObject"), flags, 2)
        this.vtbl.WriteData := CallbackCreate(GetMethod(implObj, "WriteData"), flags, 3)
        this.vtbl.OnError := CallbackCreate(GetMethod(implObj, "OnError"), flags, 4)
        this.vtbl.GetSummaryInfo := CallbackCreate(GetMethod(implObj, "GetSummaryInfo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.AddPages)
        CallbackFree(this.vtbl.SetObject)
        CallbackFree(this.vtbl.WriteData)
        CallbackFree(this.vtbl.OnError)
        CallbackFree(this.vtbl.GetSummaryInfo)
    }
}
