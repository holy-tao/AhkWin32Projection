#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Retrieves transaction, activity, and context information on the current context object.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iobjectcontextinfo
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IObjectContextInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectContextInfo
     * @type {Guid}
     */
    static IID => Guid("{75b52ddb-e8ed-11d1-93ad-00aa00ba3258}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsInTransaction", "GetTransaction", "GetTransactionId", "GetActivityId", "GetContextId"]

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectcontextinfo-isintransaction
     */
    IsInTransaction() {
        result := ComCall(3, this, "int")
        return result
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectcontextinfo-gettransaction
     */
    GetTransaction() {
        result := ComCall(4, this, "ptr*", &pptrans := 0, "HRESULT")
        return IUnknown(pptrans)
    }

    /**
     * Obtains the identifier (ID) for the specified transaction.
     * @param {Pointer<Guid>} pGuid 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is 0 (zero). To get extended error information, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     * 
     * The following list identifies the possible error codes:
     * @see https://docs.microsoft.com/windows/win32/api//ktmw32/nf-ktmw32-gettransactionid
     */
    GetTransactionId(pGuid) {
        result := ComCall(5, this, "ptr", pGuid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pGUID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectcontextinfo-getactivityid
     */
    GetActivityId(pGUID) {
        result := ComCall(6, this, "ptr", pGUID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pGuid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectcontextinfo-getcontextid
     */
    GetContextId(pGuid) {
        result := ComCall(7, this, "ptr", pGuid, "HRESULT")
        return result
    }
}
