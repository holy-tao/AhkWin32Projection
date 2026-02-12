#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\Collections\IPropertySet.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection
 * @version WindowsRuntime 1.4
 */
class IMediaProtectionManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaProtectionManager
     * @type {Guid}
     */
    static IID => Guid("{45694947-c741-434b-a79e-474c12d93d2f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_ServiceRequested", "remove_ServiceRequested", "add_RebootNeeded", "remove_RebootNeeded", "add_ComponentLoadFailed", "remove_ComponentLoadFailed", "get_Properties"]

    /**
     * @type {IPropertySet} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * 
     * @param {ServiceRequestedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ServiceRequested(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_ServiceRequested(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(7, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {RebootNeededEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RebootNeeded(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_RebootNeeded(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(9, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ComponentLoadFailedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ComponentLoadFailed(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_ComponentLoadFailed(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(11, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_Properties() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPropertySet(value)
    }
}
