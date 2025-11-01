#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapipropiunknown
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IMAPIProp extends IUnknown{

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
    static VTableNames => ["GetLastError", "SaveChanges", "GetProps", "GetPropList", "OpenProperty", "SetProps", "DeleteProps", "CopyTo", "CopyProps", "GetNamesFromIDs", "GetIDsFromNames"]

    /**
     * Retrieves the calling thread's last-error code value.
     * @param {HRESULT} hResult 
     * @param {Integer} ulFlags 
     * @param {Pointer<Pointer<MAPIERROR>>} lppMAPIError 
     * @returns {HRESULT} The return value is the calling thread's last-error code.
     * 
     * The Return Value section of the documentation for each function that sets the last-error code notes the conditions under which the function sets the last-error code. Most functions that set the thread's last-error code set it when they fail. However, some functions also set the last-error code when they succeed. If the function is not documented to set the last-error code, the value returned by this function is simply the most recent last-error code to have been set; some functions set the last-error code to 0 on success and others do not.
     * @see https://docs.microsoft.com/windows/win32/api//errhandlingapi/nf-errhandlingapi-getlasterror
     */
    GetLastError(hResult, ulFlags, lppMAPIError) {
        result := ComCall(3, this, "int", hResult, "uint", ulFlags, "ptr*", lppMAPIError, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprop-savechanges
     */
    SaveChanges(ulFlags) {
        result := ComCall(4, this, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPropTagArray>} lpPropTagArray 
     * @param {Integer} ulFlags 
     * @param {Pointer<Integer>} lpcValues 
     * @param {Pointer<Pointer<SPropValue>>} lppPropArray 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprop-getprops
     */
    GetProps(lpPropTagArray, ulFlags, lpcValues, lppPropArray) {
        lpcValuesMarshal := lpcValues is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", lpPropTagArray, "uint", ulFlags, lpcValuesMarshal, lpcValues, "ptr*", lppPropArray, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<Pointer<SPropTagArray>>} lppPropTagArray 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprop-getproplist
     */
    GetPropList(ulFlags, lppPropTagArray) {
        result := ComCall(6, this, "uint", ulFlags, "ptr*", lppPropTagArray, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulPropTag 
     * @param {Pointer<Guid>} lpiid 
     * @param {Integer} ulInterfaceOptions 
     * @param {Integer} ulFlags 
     * @param {Pointer<IUnknown>} lppUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprop-openproperty
     */
    OpenProperty(ulPropTag, lpiid, ulInterfaceOptions, ulFlags, lppUnk) {
        result := ComCall(7, this, "uint", ulPropTag, "ptr", lpiid, "uint", ulInterfaceOptions, "uint", ulFlags, "ptr*", lppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cValues 
     * @param {Pointer<SPropValue>} lpPropArray 
     * @param {Pointer<Pointer<SPropProblemArray>>} lppProblems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprop-setprops
     */
    SetProps(cValues, lpPropArray, lppProblems) {
        result := ComCall(8, this, "uint", cValues, "ptr", lpPropArray, "ptr*", lppProblems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPropTagArray>} lpPropTagArray 
     * @param {Pointer<Pointer<SPropProblemArray>>} lppProblems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprop-deleteprops
     */
    DeleteProps(lpPropTagArray, lppProblems) {
        result := ComCall(9, this, "ptr", lpPropTagArray, "ptr*", lppProblems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ciidExclude 
     * @param {Pointer<Guid>} rgiidExclude 
     * @param {Pointer<SPropTagArray>} lpExcludeProps 
     * @param {Pointer} ulUIParam 
     * @param {IMAPIProgress} lpProgress 
     * @param {Pointer<Guid>} lpInterface 
     * @param {Pointer<Void>} lpDestObj 
     * @param {Integer} ulFlags 
     * @param {Pointer<Pointer<SPropProblemArray>>} lppProblems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprop-copyto
     */
    CopyTo(ciidExclude, rgiidExclude, lpExcludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems) {
        lpDestObjMarshal := lpDestObj is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, "uint", ciidExclude, "ptr", rgiidExclude, "ptr", lpExcludeProps, "ptr", ulUIParam, "ptr", lpProgress, "ptr", lpInterface, lpDestObjMarshal, lpDestObj, "uint", ulFlags, "ptr*", lppProblems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPropTagArray>} lpIncludeProps 
     * @param {Pointer} ulUIParam 
     * @param {IMAPIProgress} lpProgress 
     * @param {Pointer<Guid>} lpInterface 
     * @param {Pointer<Void>} lpDestObj 
     * @param {Integer} ulFlags 
     * @param {Pointer<Pointer<SPropProblemArray>>} lppProblems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprop-copyprops
     */
    CopyProps(lpIncludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems) {
        lpDestObjMarshal := lpDestObj is VarRef ? "ptr" : "ptr"

        result := ComCall(11, this, "ptr", lpIncludeProps, "ptr", ulUIParam, "ptr", lpProgress, "ptr", lpInterface, lpDestObjMarshal, lpDestObj, "uint", ulFlags, "ptr*", lppProblems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SPropTagArray>>} lppPropTags 
     * @param {Pointer<Guid>} lpPropSetGuid 
     * @param {Integer} ulFlags 
     * @param {Pointer<Integer>} lpcPropNames 
     * @param {Pointer<Pointer<Pointer<MAPINAMEID>>>} lpppPropNames 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprop-getnamesfromids
     */
    GetNamesFromIDs(lppPropTags, lpPropSetGuid, ulFlags, lpcPropNames, lpppPropNames) {
        lpcPropNamesMarshal := lpcPropNames is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "ptr*", lppPropTags, "ptr", lpPropSetGuid, "uint", ulFlags, lpcPropNamesMarshal, lpcPropNames, "ptr*", lpppPropNames, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cPropNames 
     * @param {Pointer<Pointer<MAPINAMEID>>} lppPropNames 
     * @param {Integer} ulFlags 
     * @param {Pointer<Pointer<SPropTagArray>>} lppPropTags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapiprop-getidsfromnames
     */
    GetIDsFromNames(cPropNames, lppPropNames, ulFlags, lppPropTags) {
        result := ComCall(13, this, "uint", cPropNames, "ptr*", lppPropNames, "uint", ulFlags, "ptr*", lppPropTags, "HRESULT")
        return result
    }
}
