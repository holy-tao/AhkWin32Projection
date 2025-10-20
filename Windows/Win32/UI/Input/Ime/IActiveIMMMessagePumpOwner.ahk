#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IActiveIMMMessagePumpOwner extends IUnknown{
    /**
     * The interface identifier for IActiveIMMMessagePumpOwner
     * @type {Guid}
     */
    static IID => Guid("{b5cf2cfa-8aeb-11d1-9364-0060b067b86e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    Start() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    End() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MSG>} pMsg 
     * @returns {HRESULT} 
     */
    OnTranslateMessage(pMsg) {
        result := ComCall(5, this, "ptr", pMsg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwCookie 
     * @returns {HRESULT} 
     */
    Pause(pdwCookie) {
        result := ComCall(6, this, "uint*", pdwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    Resume(dwCookie) {
        result := ComCall(7, this, "uint", dwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
