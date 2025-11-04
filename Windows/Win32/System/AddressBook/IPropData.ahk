#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMAPIProp.ahk

/**
 * 
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ipropdataimapiprop
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IPropData extends IMAPIProp{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["HrSetObjAccess", "HrSetPropAccess", "HrGetPropAccess", "HrAddObjProps"]

    /**
     * 
     * @param {Integer} ulAccess 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ipropdata-hrsetobjaccess
     */
    HrSetObjAccess(ulAccess) {
        result := ComCall(14, this, "uint", ulAccess, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPropTagArray>} lpPropTagArray 
     * @param {Pointer<Integer>} rgulAccess 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ipropdata-hrsetpropaccess
     */
    HrSetPropAccess(lpPropTagArray, rgulAccess) {
        rgulAccessMarshal := rgulAccess is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "ptr", lpPropTagArray, rgulAccessMarshal, rgulAccess, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SPropTagArray>>} lppPropTagArray 
     * @param {Pointer<Pointer<Integer>>} lprgulAccess 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ipropdata-hrgetpropaccess
     */
    HrGetPropAccess(lppPropTagArray, lprgulAccess) {
        lppPropTagArrayMarshal := lppPropTagArray is VarRef ? "ptr*" : "ptr"
        lprgulAccessMarshal := lprgulAccess is VarRef ? "ptr*" : "ptr"

        result := ComCall(16, this, lppPropTagArrayMarshal, lppPropTagArray, lprgulAccessMarshal, lprgulAccess, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPropTagArray>} lppPropTagArray 
     * @param {Pointer<Pointer<SPropProblemArray>>} lprgulAccess 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ipropdata-hraddobjprops
     */
    HrAddObjProps(lppPropTagArray, lprgulAccess) {
        lprgulAccessMarshal := lprgulAccess is VarRef ? "ptr*" : "ptr"

        result := ComCall(17, this, "ptr", lppPropTagArray, lprgulAccessMarshal, lprgulAccess, "HRESULT")
        return result
    }
}
