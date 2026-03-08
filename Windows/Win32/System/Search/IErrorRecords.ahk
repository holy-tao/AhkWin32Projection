#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ERRORINFO.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\Com\IErrorInfo.ahk
#Include ..\Com\DISPPARAMS.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IErrorRecords extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddErrorRecord", "GetBasicErrorInfo", "GetCustomErrorObject", "GetErrorInfo", "GetErrorParameters", "GetRecordCount"]

    /**
     * 
     * @param {Pointer<ERRORINFO>} pErrorInfo 
     * @param {Integer} dwLookupID 
     * @param {Pointer<DISPPARAMS>} pdispparams 
     * @param {IUnknown} punkCustomError 
     * @param {Integer} dwDynamicErrorID 
     * @returns {HRESULT} 
     */
    AddErrorRecord(pErrorInfo, dwLookupID, pdispparams, punkCustomError, dwDynamicErrorID) {
        result := ComCall(3, this, "ptr", pErrorInfo, "uint", dwLookupID, "ptr", pdispparams, "ptr", punkCustomError, "uint", dwDynamicErrorID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulRecordNum 
     * @returns {ERRORINFO} 
     */
    GetBasicErrorInfo(ulRecordNum) {
        pErrorInfo := ERRORINFO()
        result := ComCall(4, this, "uint", ulRecordNum, "ptr", pErrorInfo, "HRESULT")
        return pErrorInfo
    }

    /**
     * 
     * @param {Integer} ulRecordNum 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    GetCustomErrorObject(ulRecordNum, riid) {
        result := ComCall(5, this, "uint", ulRecordNum, "ptr", riid, "ptr*", &ppObject := 0, "HRESULT")
        return IUnknown(ppObject)
    }

    /**
     * Obtains the error information pointer set by the previous call to SetErrorInfo in the current logical thread.
     * @remarks
     * This function returns a pointer to the most recently set <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ierrorinfo">IErrorInfo</a> pointer in the current logical thread. It transfers ownership of the error object to the caller, and clears the error state for the thread.
     * 
     * Making a COM call that goes through a proxy-stub will clear any existing error object for the calling thread. A called object should not make any such calls after calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-seterrorinfo">SetErrorInfo</a> and before returning. The caller should not make any such calls after the call returns and before calling <b>GetErrorInfo</b>. As a rule of thumb, an interface method should return as soon as possible after calling <b>SetErrorInfo</b>, and the caller should call <b>GetErrorInfo</b> as soon as possible after the call returns.
     * @param {Integer} ulRecordNum 
     * @param {Integer} lcid 
     * @returns {IErrorInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/oleauto/nf-oleauto-geterrorinfo
     */
    GetErrorInfo(ulRecordNum, lcid) {
        result := ComCall(6, this, "uint", ulRecordNum, "uint", lcid, "ptr*", &ppErrorInfo := 0, "HRESULT")
        return IErrorInfo(ppErrorInfo)
    }

    /**
     * 
     * @param {Integer} ulRecordNum 
     * @returns {DISPPARAMS} 
     */
    GetErrorParameters(ulRecordNum) {
        pdispparams := DISPPARAMS()
        result := ComCall(7, this, "uint", ulRecordNum, "ptr", pdispparams, "HRESULT")
        return pdispparams
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetRecordCount() {
        result := ComCall(8, this, "uint*", &pcRecords := 0, "HRESULT")
        return pcRecords
    }
}
