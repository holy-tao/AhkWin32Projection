#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ISecurityIdentityColl.ahk" { ISecurityIdentityColl }

/**
 * Provides access to information about individual callers in a collection of callers.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-isecuritycallerscoll
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ISecurityCallersColl extends IDispatch {
    /**
     * The interface identifier for ISecurityCallersColl
     * @type {Guid}
     */
    static IID := Guid("{cafc823d-b441-11d1-b82b-0000f8757e2a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISecurityCallersColl interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Count    : IntPtr
        get_Item     : IntPtr
        get__NewEnum : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISecurityCallersColl.Vtbl()
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
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * Retrieves the number of callers in the security callers collection.
     * @returns {Integer} The number of callers in the security callers collection.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecuritycallerscoll-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * Retrieves a specified caller in the security callers collection.
     * @remarks
     * The security callers collection represents a chain of callers that cross security boundaries. These callers are also known as upstream callers.
     * 
     * Each item in this collection is a <a href="https://docs.microsoft.com/windows/desktop/cossdk/securityidentity">SecurityIdentity</a> object. To obtain an item in this collection, use the Item property of the <a href="https://docs.microsoft.com/windows/desktop/cossdk/securitycallers">SecurityCallers</a> collection object, specifying an integer index value between 0 and the number of callers, minus 1, in the collection. To retrieve the direct caller, this index value should be 0, and to retrieve the original caller, the index can be either -1 or the number of callers minus 1.
     * @param {Integer} lIndex The name of the caller to retrieve. See Remarks for information about the available callers.
     * @returns {ISecurityIdentityColl} A reference to the retrieved caller.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecuritycallerscoll-get_item
     */
    get_Item(lIndex) {
        result := ComCall(8, this, "int", lIndex, "ptr*", &pObj := 0, "HRESULT")
        return ISecurityIdentityColl(pObj)
    }

    /**
     * Retrieves an enumerator for the security callers collection.
     * @returns {IUnknown} A reference to the returned <a href="https://docs.microsoft.com/windows/win32/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecuritycallerscoll-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IUnknown(ppEnum)
    }

    Query(iid) {
        if (ISecurityCallersColl.IID.Equals(iid)) {
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
