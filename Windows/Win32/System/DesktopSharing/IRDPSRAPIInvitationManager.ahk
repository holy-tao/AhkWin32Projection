#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk
#Include .\IRDPSRAPIInvitation.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Manages invitation objects.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-irdpsrapiinvitationmanager
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPSRAPIInvitationManager extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRDPSRAPIInvitationManager
     * @type {Guid}
     */
    static IID => Guid("{4722b049-92c3-4c2d-8a65-f7348f644dcf}")

    /**
     * The class identifier for RDPSRAPIInvitationManager
     * @type {Guid}
     */
    static CLSID => Guid("{53d9c9db-75ab-4271-948a-4c4eb36a8f2b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Item", "get_Count", "CreateInvitation"]

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiinvitationmanager-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }

    /**
     * 
     * @param {VARIANT} item 
     * @returns {IRDPSRAPIInvitation} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiinvitationmanager-get_item
     */
    get_Item(item) {
        result := ComCall(8, this, "ptr", item, "ptr*", &ppInvitation := 0, "HRESULT")
        return IRDPSRAPIInvitation(ppInvitation)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiinvitationmanager-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @param {BSTR} bstrAuthString 
     * @param {BSTR} bstrGroupName 
     * @param {BSTR} bstrPassword 
     * @param {Integer} AttendeeLimit 
     * @returns {IRDPSRAPIInvitation} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiinvitationmanager-createinvitation
     */
    CreateInvitation(bstrAuthString, bstrGroupName, bstrPassword, AttendeeLimit) {
        bstrAuthString := bstrAuthString is String ? BSTR.Alloc(bstrAuthString).Value : bstrAuthString
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword

        result := ComCall(10, this, "ptr", bstrAuthString, "ptr", bstrGroupName, "ptr", bstrPassword, "int", AttendeeLimit, "ptr*", &ppInvitation := 0, "HRESULT")
        return IRDPSRAPIInvitation(ppInvitation)
    }
}
