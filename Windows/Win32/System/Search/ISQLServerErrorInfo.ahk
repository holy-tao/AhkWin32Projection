#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISQLServerErrorInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISQLServerErrorInfo
     * @type {Guid}
     */
    static IID => Guid("{5cf4ca12-ef21-11d0-97e7-00c04fc2ad98}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetErrorInfo"]

    /**
     * Obtains the error information pointer set by the previous call to SetErrorInfo in the current logical thread.
     * @remarks
     * This function returns a pointer to the most recently set <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ierrorinfo">IErrorInfo</a> pointer in the current logical thread. It transfers ownership of the error object to the caller, and clears the error state for the thread.
     * 
     * Making a COM call that goes through a proxy-stub will clear any existing error object for the calling thread. A called object should not make any such calls after calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-seterrorinfo">SetErrorInfo</a> and before returning. The caller should not make any such calls after the call returns and before calling <b>GetErrorInfo</b>. As a rule of thumb, an interface method should return as soon as possible after calling <b>SetErrorInfo</b>, and the caller should call <b>GetErrorInfo</b> as soon as possible after the call returns.
     * @param {Pointer<Pointer<SSERRORINFO>>} ppErrorInfo 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/oleauto/nf-oleauto-geterrorinfo
     */
    GetErrorInfo(ppErrorInfo) {
        ppErrorInfoMarshal := ppErrorInfo is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, ppErrorInfoMarshal, ppErrorInfo, "ptr*", &ppStringsBuffer := 0, "HRESULT")
        return ppStringsBuffer
    }
}
