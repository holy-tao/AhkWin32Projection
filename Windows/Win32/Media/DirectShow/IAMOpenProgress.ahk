#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMOpenProgress interface reports the progress of a file-open operation and enables the application to cancel the operation.Filters that open files over a network can expose this interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamopenprogress
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMOpenProgress extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMOpenProgress
     * @type {Guid}
     */
    static IID => Guid("{8e1c39a1-de53-11cf-aa63-0080c744528d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryProgress", "AbortOperation"]

    /**
     * 
     * @param {Pointer<Integer>} pllTotal 
     * @param {Pointer<Integer>} pllCurrent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamopenprogress-queryprogress
     */
    QueryProgress(pllTotal, pllCurrent) {
        result := ComCall(3, this, "int64*", pllTotal, "int64*", pllCurrent, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamopenprogress-abortoperation
     */
    AbortOperation() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
