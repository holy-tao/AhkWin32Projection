#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IRDPSRAPIAttendee.ahk" { IRDPSRAPIAttendee }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Manages attendee objects.
 * @remarks
 * The lifetime of the objects in this collection is controlled by the network layer.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nn-rdpencomapi-irdpsrapiattendeemanager
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct IRDPSRAPIAttendeeManager extends IDispatch {
    /**
     * The interface identifier for IRDPSRAPIAttendeeManager
     * @type {Guid}
     */
    static IID := Guid("{ba3a37e8-33da-4749-8da0-07fa34da7944}")

    /**
     * The class identifier for RDPSRAPIAttendeeManager
     * @type {Guid}
     */
    static CLSID := Guid("{d7b13a01-f7d4-42a6-8595-12fc8c24e851}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRDPSRAPIAttendeeManager interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get__NewEnum : IntPtr
        get_Item     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRDPSRAPIAttendeeManager.Vtbl()
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
     * An enumerator interface for the attendee collection.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiattendeemanager-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }

    /**
     * An item in the attendee collection.
     * @remarks
     * If the identifier matches the object identifier of one of the attendee objects, the object is returned.
     * @param {Integer} id 
     * @returns {IRDPSRAPIAttendee} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiattendeemanager-get_item
     */
    get_Item(id) {
        result := ComCall(8, this, "int", id, "ptr*", &ppItem := 0, "HRESULT")
        return IRDPSRAPIAttendee(ppItem)
    }

    Query(iid) {
        if (IRDPSRAPIAttendeeManager.IID.Equals(iid)) {
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
