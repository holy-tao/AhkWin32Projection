#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMAPIProp.ahk

/**
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IPropData extends IMAPIProp{

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * 
     * @param {Integer} ulAccess 
     * @returns {HRESULT} 
     */
    HrSetObjAccess(ulAccess) {
        result := ComCall(14, this, "uint", ulAccess, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SPropTagArray>} lpPropTagArray 
     * @param {Pointer<UInt32>} rgulAccess 
     * @returns {HRESULT} 
     */
    HrSetPropAccess(lpPropTagArray, rgulAccess) {
        result := ComCall(15, this, "ptr", lpPropTagArray, "uint*", rgulAccess, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SPropTagArray>} lppPropTagArray 
     * @param {Pointer<UInt32>} lprgulAccess 
     * @returns {HRESULT} 
     */
    HrGetPropAccess(lppPropTagArray, lprgulAccess) {
        result := ComCall(16, this, "ptr", lppPropTagArray, "uint*", lprgulAccess, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SPropTagArray>} lppPropTagArray 
     * @param {Pointer<SPropProblemArray>} lprgulAccess 
     * @returns {HRESULT} 
     */
    HrAddObjProps(lppPropTagArray, lprgulAccess) {
        result := ComCall(17, this, "ptr", lppPropTagArray, "ptr", lprgulAccess, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
