#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprogressiunknown
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IMAPIProgress extends IUnknown{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Progress", "GetFlags", "GetMax", "GetMin", "SetLimits"]

    /**
     * 
     * @param {Integer} ulValue 
     * @param {Integer} ulCount 
     * @param {Integer} ulTotal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprogress-progress
     */
    Progress(ulValue, ulCount, ulTotal) {
        result := ComCall(3, this, "uint", ulValue, "uint", ulCount, "uint", ulTotal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprogress-getflags
     */
    GetFlags(lpulFlags) {
        result := ComCall(4, this, "uint*", lpulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpulMax 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprogress-getmax
     */
    GetMax(lpulMax) {
        result := ComCall(5, this, "uint*", lpulMax, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpulMin 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprogress-getmin
     */
    GetMin(lpulMin) {
        result := ComCall(6, this, "uint*", lpulMin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpulMin 
     * @param {Pointer<Integer>} lpulMax 
     * @param {Pointer<Integer>} lpulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprogress-setlimits
     */
    SetLimits(lpulMin, lpulMax, lpulFlags) {
        result := ComCall(7, this, "uint*", lpulMin, "uint*", lpulMax, "uint*", lpulFlags, "HRESULT")
        return result
    }
}
