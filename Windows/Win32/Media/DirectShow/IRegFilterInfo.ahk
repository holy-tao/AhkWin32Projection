#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IRegFilterInfo extends IDispatch {
    /**
     * The interface identifier for IRegFilterInfo
     * @type {Guid}
     */
    static IID := Guid("{56a868bb-0ad4-11ce-b03a-0020af0ba770}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRegFilterInfo interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name : IntPtr
        Filter   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRegFilterInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        strName := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, strName, "HRESULT")
        return strName
    }

    /**
     * Identifiers for the filter contexts that are built in to the Windows Filtering Platform.
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/windows/win32/FWP/filter-context-identifiers
     */
    Filter() {
        result := ComCall(8, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IDispatch(ppUnk)
    }

    Query(iid) {
        if (IRegFilterInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.Filter := CallbackCreate(GetMethod(implObj, "Filter"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.Filter)
    }
}
