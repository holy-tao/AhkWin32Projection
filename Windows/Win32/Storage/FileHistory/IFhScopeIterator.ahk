#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IFhScopeIterator interface allows client applications to enumerate individual items in an inclusion or exclusion list. To retrieve inclusion and exclusion lists, call the IFhConfigMgr::GetIncludeExcludeRules method.
 * @see https://learn.microsoft.com/windows/win32/api/fhcfg/nn-fhcfg-ifhscopeiterator
 * @namespace Windows.Win32.Storage.FileHistory
 */
export default struct IFhScopeIterator extends IUnknown {
    /**
     * The interface identifier for IFhScopeIterator
     * @type {Guid}
     */
    static IID := Guid("{3197abce-532a-44c6-8615-f3666566a720}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFhScopeIterator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        MoveToNextItem : IntPtr
        GetItem        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFhScopeIterator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Moves to the next item in the inclusion or exclusion list.
     * @remarks
     * If the current item is the last item in the list, or if the list is empty, this method returns <c>HRESULT_FROM_WIN32(ERROR_NOT_FOUND)</c>.
     * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * @see https://learn.microsoft.com/windows/win32/api/fhcfg/nf-fhcfg-ifhscopeiterator-movetonextitem
     */
    MoveToNextItem() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the current item in an inclusion or exclusion list.
     * @remarks
     * To move to the next item in the inclusion or exclusion list, call the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nf-fhcfg-ifhscopeiterator-movetonextitem">IFhScopeIterator::MoveToNextItem</a> method.
     * @returns {BSTR} This parameter must be <b>NULL</b> on input. On output, it receives a pointer to a string that contains the current element of the list. This element is a library name or a folder name, depending on the parameters that were passed to the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nf-fhcfg-ifhconfigmgr-getincludeexcluderules">IFhConfigMgr::GetIncludeExcludeRules</a> method. The string is allocated by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a>. You must call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the string when it is no longer needed.
     * @see https://learn.microsoft.com/windows/win32/api/fhcfg/nf-fhcfg-ifhscopeiterator-getitem
     */
    GetItem() {
        Item := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, Item, "HRESULT")
        return Item
    }

    Query(iid) {
        if (IFhScopeIterator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.MoveToNextItem := CallbackCreate(GetMethod(implObj, "MoveToNextItem"), flags, 1)
        this.vtbl.GetItem := CallbackCreate(GetMethod(implObj, "GetItem"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.MoveToNextItem)
        CallbackFree(this.vtbl.GetItem)
    }
}
