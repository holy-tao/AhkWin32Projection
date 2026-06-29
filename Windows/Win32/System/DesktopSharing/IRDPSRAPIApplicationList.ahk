#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRDPSRAPIApplication.ahk" { IRDPSRAPIApplication }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Manages the application list.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nn-rdpencomapi-irdpsrapiapplicationlist
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct IRDPSRAPIApplicationList extends IDispatch {
    /**
     * The interface identifier for IRDPSRAPIApplicationList
     * @type {Guid}
     */
    static IID := Guid("{d4b4aeb3-22dc-4837-b3b6-42ea2517849a}")

    /**
     * The class identifier for RDPSRAPIApplicationList
     * @type {Guid}
     */
    static CLSID := Guid("{9e31c815-7433-4876-97fb-ed59fe2baa22}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRDPSRAPIApplicationList interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get__NewEnum : IntPtr
        get_Item     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRDPSRAPIApplicationList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * An enumerator interface for the application collection.
     * @remarks
     * The enumerator provides a snapshot of the collection. If an application is destroyed during enumeration, the API still has access to all the elements that were present when the snapshot was taken.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiapplicationlist-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }

    /**
     * An item in the application collection.
     * @param {Integer} item 
     * @returns {IRDPSRAPIApplication} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiapplicationlist-get_item
     */
    get_Item(item) {
        result := ComCall(8, this, "int", item, "ptr*", &pApplication := 0, "HRESULT")
        return IRDPSRAPIApplication(pApplication)
    }

    Query(iid) {
        if (IRDPSRAPIApplicationList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.get_Item)
    }
}
