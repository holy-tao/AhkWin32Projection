#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Gaming
 * @version v4.0.30319
 */
class IXblIdpAuthTokenResult2 extends IUnknown{
    /**
     * The interface identifier for IXblIdpAuthTokenResult2
     * @type {Guid}
     */
    static IID => Guid("{75d760b0-60b9-412d-994f-26b2cd5f7812}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PWSTR>} value 
     * @returns {HRESULT} 
     */
    GetModernGamertag(value) {
        result := ComCall(3, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} value 
     * @returns {HRESULT} 
     */
    GetModernGamertagSuffix(value) {
        result := ComCall(4, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} value 
     * @returns {HRESULT} 
     */
    GetUniqueModernGamertag(value) {
        result := ComCall(5, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
