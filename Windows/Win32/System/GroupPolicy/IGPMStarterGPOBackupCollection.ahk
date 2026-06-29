#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\Ole\IEnumVARIANT.ahk" { IEnumVARIANT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IGPMStarterGPOBackupCollection interface contains methods that enable applications to access a collection of GPMStarterGPOBackup objects when using the Group Policy Management Console (GPMC) interfaces.
 * @remarks
 * For more information, see 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpmbackupdirex-searchbackups">SearchBackups</a>.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmstartergpobackupcollection
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct IGPMStarterGPOBackupCollection extends IDispatch {
    /**
     * The interface identifier for IGPMStarterGPOBackupCollection
     * @type {Guid}
     */
    static IID := Guid("{c998031d-add0-4bb5-8dea-298505d8423b}")

    /**
     * The class identifier for GPMStarterGPOBackupCollection
     * @type {Guid}
     */
    static CLSID := Guid("{e75ea59d-1aeb-4cb5-a78a-281daa582406}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGPMStarterGPOBackupCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count    : IntPtr
        get_Item     : IntPtr
        get__NewEnum : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGPMStarterGPOBackupCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IEnumVARIANT} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * Returns the number of GPMStarterGPOBackup objects in the collection.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstartergpobackupcollection-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Given an index, returns a GPMStarterGPOBackup object from the collection.
     * @param {Integer} lIndex 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstartergpobackupcollection-get_item
     */
    get_Item(lIndex) {
        pVal := VARIANT()
        result := ComCall(8, this, "int", lIndex, VARIANT.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Retrieves an enumerator for the collection. (IGPMstarterGPOBackupCollection.get__NewEnum)
     * @returns {IEnumVARIANT} Pointer to an IEnumVARIANT interface of an enumerator object for the collection.  IEnumVARIANT provides a number of methods that you can use to iterate through the collection. For more information about IEnumVARIANT, see the COM documentation in the Platform SDK.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmstartergpobackupcollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppIGPMTmplBackup := 0, "HRESULT")
        return IEnumVARIANT(ppIGPMTmplBackup)
    }

    Query(iid) {
        if (IGPMStarterGPOBackupCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.get__NewEnum)
    }
}
