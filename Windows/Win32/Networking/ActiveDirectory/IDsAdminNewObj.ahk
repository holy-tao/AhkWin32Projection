#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IDsAdminNewObj interface is used by a primary or secondary object creation wizard extension to obtain page count data and to control the command buttons in the wizard.
 * @see https://learn.microsoft.com/windows/win32/api/dsadmin/nn-dsadmin-idsadminnewobj
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IDsAdminNewObj extends IUnknown {
    /**
     * The interface identifier for IDsAdminNewObj
     * @type {Guid}
     */
    static IID := Guid("{f2573587-e6fc-11d2-82af-00c04f68928b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDsAdminNewObj interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetButtons    : IntPtr
        GetPageCounts : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDsAdminNewObj.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IDsAdminNewObj::SetButtons method enables or disables the &quot;Next&quot; command button in the wizard for a specific page.
     * @remarks
     * No assumption should be made regarding the state of the "Next" command button when the page is first displayed. The object creation extension should set the state of the "Next" command button when the page is first displayed and when the data in the page changes. If the data in the page is not mandatory, then the "Next" button should be enabled when the page is first displayed and the state should not be changed by the extension.
     * 
     * If the extension calling the function is a primary extension with a single page and there are no secondary extensions loaded, for example: the wizard has a single page, the command buttons are; "OK" and "Cancel", instead of "Back", "Next", and "Cancel". In this case, a call to this function will enable or disable the "OK" button.
     * @param {Integer} nCurrIndex Contains the zero-based index of the wizard page for which the "Next" button will be enabled or disabled. This index is relative to the page count of the wizard extension that calls the method.
     * @param {BOOL} bValid Specifies if the "Next" command button is enabled or disabled. If this value is zero, the "Next" command button is disabled. If this value is nonzero, the "Next" command button is enabled.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * Returns one of the following values.
     * @see https://learn.microsoft.com/windows/win32/api/dsadmin/nf-dsadmin-idsadminnewobj-setbuttons
     */
    SetButtons(nCurrIndex, bValid) {
        result := ComCall(3, this, "uint", nCurrIndex, BOOL, bValid, "HRESULT")
        return result
    }

    /**
     * The IDsAdminNewObj::GetPageCounts method obtains the total number of pages in the wizard as well as the index of the first page of the extension.
     * @remarks
     * This function will provide results based on the count of pages added using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dsadmin/nf-dsadmin-idsadminnewobjext-addpages">IDsAdminNewObjExt::AddPages</a>. If there are changes to the number of pages because of page manipulations by Win32 APIs, the supplied values may not be accurate. If this method is called in response to the <a href="https://docs.microsoft.com/windows/desktop/api/dsadmin/nf-dsadmin-idsadminnewobjext-setobject">IDsAdminNewObjExt::SetObject</a> method, the supplied page counts are most likely to be accurate.
     * @param {Pointer<Integer>} pnTotal Pointer to a <b>LONG</b> value that receives the total number of pages contained in the wizard.
     * @param {Pointer<Integer>} pnStartIndex Pointer to a <b>LONG</b> value that receives the zero-based index of the first page of the extension.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * Returns one of the following values.
     * @see https://learn.microsoft.com/windows/win32/api/dsadmin/nf-dsadmin-idsadminnewobj-getpagecounts
     */
    GetPageCounts(pnTotal, pnStartIndex) {
        pnTotalMarshal := pnTotal is VarRef ? "int*" : "ptr"
        pnStartIndexMarshal := pnStartIndex is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pnTotalMarshal, pnTotal, pnStartIndexMarshal, pnStartIndex, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDsAdminNewObj.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetButtons := CallbackCreate(GetMethod(implObj, "SetButtons"), flags, 3)
        this.vtbl.GetPageCounts := CallbackCreate(GetMethod(implObj, "GetPageCounts"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetButtons)
        CallbackFree(this.vtbl.GetPageCounts)
    }
}
