#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRDPSRAPIInvitation.ahk" { IRDPSRAPIInvitation }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Manages invitation objects.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nn-rdpencomapi-irdpsrapiinvitationmanager
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct IRDPSRAPIInvitationManager extends IDispatch {
    /**
     * The interface identifier for IRDPSRAPIInvitationManager
     * @type {Guid}
     */
    static IID := Guid("{4722b049-92c3-4c2d-8a65-f7348f644dcf}")

    /**
     * The class identifier for RDPSRAPIInvitationManager
     * @type {Guid}
     */
    static CLSID := Guid("{53d9c9db-75ab-4271-948a-4c4eb36a8f2b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRDPSRAPIInvitationManager interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get__NewEnum     : IntPtr
        get_Item         : IntPtr
        get_Count        : IntPtr
        CreateInvitation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRDPSRAPIInvitationManager.Vtbl()
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
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * An enumerator interface for the invitation collection.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiinvitationmanager-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }

    /**
     * An item in the invitation collection.
     * @param {VARIANT} item 
     * @returns {IRDPSRAPIInvitation} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiinvitationmanager-get_item
     */
    get_Item(item) {
        result := ComCall(8, this, VARIANT, item, "ptr*", &ppInvitation := 0, "HRESULT")
        return IRDPSRAPIInvitation(ppInvitation)
    }

    /**
     * The number of invitations in the collection.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiinvitationmanager-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Creates an invitation.
     * @param {BSTR} bstrAuthString Type: <b>BSTR</b>
     * 
     * String to use for the authorization. The string is limited to 255 characters and must be unique for the session. If <b>NULL</b>, the method generates the string for you.
     * @param {BSTR} bstrGroupName Type: <b>BSTR</b>
     * 
     * The name of the group. The string must be unique for the session. Applications typically use the group name to separate attendees into groups that can be granted different authorization levels.
     * @param {BSTR} bstrPassword Type: <b>BSTR</b>
     * 
     * Password to use for authentication. The password is limited to 255 characters. You must provide the password to the viewer out-of-band from the ticket.
     * @param {Integer} AttendeeLimit Type: <b>long</b>
     * 
     * The maximum number of attendees.
     * @returns {IRDPSRAPIInvitation} Type: <b>IRDPSRAPIInvitation**</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nn-rdpencomapi-irdpsrapiinvitation">IRDPSRAPIInvitation</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiinvitationmanager-createinvitation
     */
    CreateInvitation(bstrAuthString, bstrGroupName, bstrPassword, AttendeeLimit) {
        bstrAuthString := bstrAuthString is String ? BSTR.Alloc(bstrAuthString).Value : bstrAuthString
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword

        result := ComCall(10, this, BSTR, bstrAuthString, BSTR, bstrGroupName, BSTR, bstrPassword, "int", AttendeeLimit, "ptr*", &ppInvitation := 0, "HRESULT")
        return IRDPSRAPIInvitation(ppInvitation)
    }

    Query(iid) {
        if (IRDPSRAPIInvitationManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.CreateInvitation := CallbackCreate(GetMethod(implObj, "CreateInvitation"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.CreateInvitation)
    }
}
