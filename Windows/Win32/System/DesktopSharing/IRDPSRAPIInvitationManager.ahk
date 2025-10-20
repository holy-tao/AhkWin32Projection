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
     * 
     * @param {Pointer<IUnknown>} retval 
     * @returns {HRESULT} 
     */
    get__NewEnum(retval) {
        result := ComCall(7, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} item 
     * @param {Pointer<IRDPSRAPIInvitation>} ppInvitation 
     * @returns {HRESULT} 
     */
    get_Item(item, ppInvitation) {
        result := ComCall(8, this, "ptr", item, "ptr", ppInvitation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pRetVal 
     * @returns {HRESULT} 
     */
    get_Count(pRetVal) {
        result := ComCall(9, this, "int*", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    CreateInvitation(bstrAuthString, bstrGroupName, bstrPassword, AttendeeLimit, ppInvitation) {
        bstrAuthString := bstrAuthString is String ? BSTR.Alloc(bstrAuthString).Value : bstrAuthString
        bstrGroupName := bstrGroupName is String ? BSTR.Alloc(bstrGroupName).Value : bstrGroupName
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword

        result := ComCall(10, this, "ptr", bstrAuthString, "ptr", bstrGroupName, "ptr", bstrPassword, "int", AttendeeLimit, "ptr", ppInvitation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
