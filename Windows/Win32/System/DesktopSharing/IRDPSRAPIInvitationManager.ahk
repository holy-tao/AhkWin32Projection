#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<IUnknown>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiinvitationmanager-get__newenum
     */
    get__NewEnum(retval) {
        result := ComCall(7, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} item 
     * @param {Pointer<IRDPSRAPIInvitation>} ppInvitation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiinvitationmanager-get_item
     */
    get_Item(item, ppInvitation) {
        result := ComCall(8, this, "ptr", item, "ptr*", ppInvitation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiinvitationmanager-get_count
     */
    get_Count(pRetVal) {
        result := ComCall(9, this, "int*", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrAuthString 
     * @param {BSTR} bstrGroupName 
     * @param {BSTR} bstrPassword 
     * @param {Integer} AttendeeLimit 
     * @param {Pointer<IRDPSRAPIInvitation>} ppInvitation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiinvitationmanager-createinvitation
     */
    CreateInvitation(bstrAuthString, bstrGroupName, bstrPassword, AttendeeLimit, ppInvitation) {
        bstrAuthString := bstrAuthString is String ? BSTR.Alloc(bstrAuthString).Value : bstrAuthString
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword

        result := ComCall(10, this, "ptr", bstrAuthString, "ptr", bstrGroupName, "ptr", bstrPassword, "int", AttendeeLimit, "ptr*", ppInvitation, "HRESULT")
        return result
    }
}
