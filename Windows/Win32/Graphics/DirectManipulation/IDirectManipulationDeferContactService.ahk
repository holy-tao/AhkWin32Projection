#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a service for managing associations between a contact and a viewport.
 * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nn-directmanipulation-idirectmanipulationdefercontactservice
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class IDirectManipulationDeferContactService extends IUnknown{
    /**
     * The interface identifier for IDirectManipulationDeferContactService
     * @type {Guid}
     */
    static IID => Guid("{652d5c71-fe60-4a98-be70-e5f21291e7f1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} pointerId 
     * @param {Integer} timeout 
     * @returns {HRESULT} 
     */
    DeferContact(pointerId, timeout) {
        result := ComCall(3, this, "uint", pointerId, "uint", timeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} pointerId 
     * @returns {HRESULT} 
     */
    CancelContact(pointerId) {
        result := ComCall(4, this, "uint", pointerId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} pointerId 
     * @returns {HRESULT} 
     */
    CancelDeferral(pointerId) {
        result := ComCall(5, this, "uint", pointerId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
