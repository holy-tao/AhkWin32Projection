#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IErrorRecords extends IUnknown{
    /**
     * The interface identifier for IErrorRecords
     * @type {Guid}
     */
    static IID => Guid("{0c733a67-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ERRORINFO>} pErrorInfo 
     * @param {Integer} dwLookupID 
     * @param {Pointer<DISPPARAMS>} pdispparams 
     * @param {Pointer<IUnknown>} punkCustomError 
     * @param {Integer} dwDynamicErrorID 
     * @returns {HRESULT} 
     */
    AddErrorRecord(pErrorInfo, dwLookupID, pdispparams, punkCustomError, dwDynamicErrorID) {
        result := ComCall(3, this, "ptr", pErrorInfo, "uint", dwLookupID, "ptr", pdispparams, "ptr", punkCustomError, "uint", dwDynamicErrorID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulRecordNum 
     * @param {Pointer<ERRORINFO>} pErrorInfo 
     * @returns {HRESULT} 
     */
    GetBasicErrorInfo(ulRecordNum, pErrorInfo) {
        result := ComCall(4, this, "uint", ulRecordNum, "ptr", pErrorInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulRecordNum 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppObject 
     * @returns {HRESULT} 
     */
    GetCustomErrorObject(ulRecordNum, riid, ppObject) {
        result := ComCall(5, this, "uint", ulRecordNum, "ptr", riid, "ptr", ppObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Obtains the error information pointer set by the previous call to SetErrorInfo in the current logical thread.
     * @param {Integer} ulRecordNum 
     * @param {Integer} lcid 
     * @param {Pointer<IErrorInfo>} ppErrorInfo 
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was no error object to return.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-geterrorinfo
     */
    GetErrorInfo(ulRecordNum, lcid, ppErrorInfo) {
        result := ComCall(6, this, "uint", ulRecordNum, "uint", lcid, "ptr", ppErrorInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulRecordNum 
     * @param {Pointer<DISPPARAMS>} pdispparams 
     * @returns {HRESULT} 
     */
    GetErrorParameters(ulRecordNum, pdispparams) {
        result := ComCall(7, this, "uint", ulRecordNum, "ptr", pdispparams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcRecords 
     * @returns {HRESULT} 
     */
    GetRecordCount(pcRecords) {
        result := ComCall(8, this, "uint*", pcRecords, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
