#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISCPSecureQuery.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ISCPSession interface provides efficient common state management for multiple operations.A secure content provider (SCP) session is useful when transferring multiple files.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iscpsession
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class ISCPSession extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISCPSession
     * @type {Guid}
     */
    static IID => Guid("{88a3e6ed-eee4-4619-bbb3-fd4fb62715d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginSession", "EndSession", "GetSecureQuery"]

    /**
     * The BeginSession method indicates beginning of a transfer session. It can be used to optimize operations that need to occur only once per transfer session.
     * @param {IMDSPDevice} pIDevice Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-imdspdevice">IMDSPDevice</a> object.
     * @param {Pointer<Integer>} pCtx Pointer to the context.
     * @param {Integer} dwSizeCtx <b>DWORD</b> containing the size of context.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iscpsession-beginsession
     */
    BeginSession(pIDevice, pCtx, dwSizeCtx) {
        pCtxMarshal := pCtx is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", pIDevice, pCtxMarshal, pCtx, "uint", dwSizeCtx, "HRESULT")
        return result
    }

    /**
     * The EndSession method indicates the ending of a transfer session.
     * @param {Pointer<Integer>} pCtx Pointer to the context.
     * @param {Integer} dwSizeCtx <b>DWORD</b> containing the size of context.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iscpsession-endsession
     */
    EndSession(pCtx, dwSizeCtx) {
        pCtxMarshal := pCtx is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pCtxMarshal, pCtx, "uint", dwSizeCtx, "HRESULT")
        return result
    }

    /**
     * The GetSecureQuery method is used to obtain a secure query object for the session.
     * @returns {ISCPSecureQuery} Pointer to a secure query object.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iscpsession-getsecurequery
     */
    GetSecureQuery() {
        result := ComCall(5, this, "ptr*", &ppSecureQuery := 0, "HRESULT")
        return ISCPSecureQuery(ppSecureQuery)
    }
}
