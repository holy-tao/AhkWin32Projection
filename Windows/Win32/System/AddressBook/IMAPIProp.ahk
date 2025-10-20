#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IMAPIProp extends IUnknown{

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * Retrieves the calling thread's last-error code value.
     * @param {HRESULT} hResult 
     * @param {Integer} ulFlags 
     * @param {Pointer<MAPIERROR>} lppMAPIError 
     * @returns {HRESULT} The return value is the calling thread's last-error code.
     * 
     * The Return Value section of the documentation for each function that sets the last-error code notes the conditions under which the function sets the last-error code. Most functions that set the thread's last-error code set it when they fail. However, some functions also set the last-error code when they succeed. If the function is not documented to set the last-error code, the value returned by this function is simply the most recent last-error code to have been set; some functions set the last-error code to 0 on success and others do not.
     * @see https://docs.microsoft.com/windows/win32/api//errhandlingapi/nf-errhandlingapi-getlasterror
     */
    GetLastError(hResult, ulFlags, lppMAPIError) {
        result := ComCall(3, this, "int", hResult, "uint", ulFlags, "ptr", lppMAPIError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     */
    SaveChanges(ulFlags) {
        result := ComCall(4, this, "uint", ulFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SPropTagArray>} lpPropTagArray 
     * @param {Integer} ulFlags 
     * @param {Pointer<UInt32>} lpcValues 
     * @param {Pointer<SPropValue>} lppPropArray 
     * @returns {HRESULT} 
     */
    GetProps(lpPropTagArray, ulFlags, lpcValues, lppPropArray) {
        result := ComCall(5, this, "ptr", lpPropTagArray, "uint", ulFlags, "uint*", lpcValues, "ptr", lppPropArray, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<SPropTagArray>} lppPropTagArray 
     * @returns {HRESULT} 
     */
    GetPropList(ulFlags, lppPropTagArray) {
        result := ComCall(6, this, "uint", ulFlags, "ptr", lppPropTagArray, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    OpenProperty(ulPropTag, lpiid, ulInterfaceOptions, ulFlags, lppUnk) {
        result := ComCall(7, this, "uint", ulPropTag, "ptr", lpiid, "uint", ulInterfaceOptions, "uint", ulFlags, "ptr", lppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cValues 
     * @param {Pointer<SPropValue>} lpPropArray 
     * @param {Pointer<SPropProblemArray>} lppProblems 
     * @returns {HRESULT} 
     */
    SetProps(cValues, lpPropArray, lppProblems) {
        result := ComCall(8, this, "uint", cValues, "ptr", lpPropArray, "ptr", lppProblems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SPropTagArray>} lpPropTagArray 
     * @param {Pointer<SPropProblemArray>} lppProblems 
     * @returns {HRESULT} 
     */
    DeleteProps(lpPropTagArray, lppProblems) {
        result := ComCall(9, this, "ptr", lpPropTagArray, "ptr", lppProblems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ciidExclude 
     * @param {Pointer<Guid>} rgiidExclude 
     * @param {Pointer<SPropTagArray>} lpExcludeProps 
     * @param {Pointer} ulUIParam 
     * @param {Pointer<IMAPIProgress>} lpProgress 
     * @param {Pointer<Guid>} lpInterface 
     * @param {Pointer<Void>} lpDestObj 
     * @param {Integer} ulFlags 
     * @param {Pointer<SPropProblemArray>} lppProblems 
     * @returns {HRESULT} 
     */
    CopyTo(ciidExclude, rgiidExclude, lpExcludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems) {
        result := ComCall(10, this, "uint", ciidExclude, "ptr", rgiidExclude, "ptr", lpExcludeProps, "ptr", ulUIParam, "ptr", lpProgress, "ptr", lpInterface, "ptr", lpDestObj, "uint", ulFlags, "ptr", lppProblems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SPropTagArray>} lpIncludeProps 
     * @param {Pointer} ulUIParam 
     * @param {Pointer<IMAPIProgress>} lpProgress 
     * @param {Pointer<Guid>} lpInterface 
     * @param {Pointer<Void>} lpDestObj 
     * @param {Integer} ulFlags 
     * @param {Pointer<SPropProblemArray>} lppProblems 
     * @returns {HRESULT} 
     */
    CopyProps(lpIncludeProps, ulUIParam, lpProgress, lpInterface, lpDestObj, ulFlags, lppProblems) {
        result := ComCall(11, this, "ptr", lpIncludeProps, "ptr", ulUIParam, "ptr", lpProgress, "ptr", lpInterface, "ptr", lpDestObj, "uint", ulFlags, "ptr", lppProblems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SPropTagArray>} lppPropTags 
     * @param {Pointer<Guid>} lpPropSetGuid 
     * @param {Integer} ulFlags 
     * @param {Pointer<UInt32>} lpcPropNames 
     * @param {Pointer<MAPINAMEID>} lpppPropNames 
     * @returns {HRESULT} 
     */
    GetNamesFromIDs(lppPropTags, lpPropSetGuid, ulFlags, lpcPropNames, lpppPropNames) {
        result := ComCall(12, this, "ptr", lppPropTags, "ptr", lpPropSetGuid, "uint", ulFlags, "uint*", lpcPropNames, "ptr", lpppPropNames, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cPropNames 
     * @param {Pointer<MAPINAMEID>} lppPropNames 
     * @param {Integer} ulFlags 
     * @param {Pointer<SPropTagArray>} lppPropTags 
     * @returns {HRESULT} 
     */
    GetIDsFromNames(cPropNames, lppPropNames, ulFlags, lppPropTags) {
        result := ComCall(13, this, "uint", cPropNames, "ptr", lppPropNames, "uint", ulFlags, "ptr", lppPropTags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
