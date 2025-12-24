#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used to report progress back to callers of lengthy Offline Files operations.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefilesprogress
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesProgress extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOfflineFilesProgress
     * @type {Guid}
     */
    static IID => Guid("{fad63237-c55b-4911-9850-bcf96d4c979e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Begin", "QueryAbort", "End"]

    /**
     * Reports that an operation has begun.
     * @returns {BOOL} Set this value to <b>TRUE</b> to cancel the operation.   Set to <b>FALSE</b> to continue.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesprogress-begin
     */
    Begin() {
        result := ComCall(3, this, "int*", &pbAbort := 0, "HRESULT")
        return pbAbort
    }

    /**
     * May be called during lengthy operations to determine if the operation should be canceled.
     * @returns {BOOL} Set this value to <b>TRUE</b> to cancel the operation.   Set to <b>FALSE</b> to continue.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesprogress-queryabort
     */
    QueryAbort() {
        result := ComCall(4, this, "int*", &pbAbort := 0, "HRESULT")
        return pbAbort
    }

    /**
     * Reports that an operation has ended.
     * @param {HRESULT} hrResult Indicates the result of the operation as a whole.  Contains S_OK if the operation completed successfully,  HRESULT_FROM_WIN32(ERROR_CANCELLED) if the operation was canceled or an error value otherwise.
     * @returns {HRESULT} The return value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//cscobj/nf-cscobj-iofflinefilesprogress-end
     */
    End(hrResult) {
        result := ComCall(5, this, "int", hrResult, "HRESULT")
        return result
    }
}
