#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDMDeviceSession interface improves the efficiency of device operations by bundling multiple operations into one session.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmdevicesession
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMDeviceSession extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMDeviceSession
     * @type {Guid}
     */
    static IID => Guid("{82af0a65-9d96-412c-83e5-3c43e4b06cc7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginSession", "EndSession"]

    /**
     * The BeginSession method begins a device session.
     * @param {Integer} type A <a href="https://docs.microsoft.com/windows/desktop/WMDM/wmdm-session-type">WMDM_SESSION_TYPE</a> describing the type of session to begin. This is a bitwise <b>OR</b> of any values except WMDM_SESSION_NONE. The same type (or combination of types) must be specified during <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmdevicesession-endsession">EndSession</a>.
     * @param {Pointer<Integer>} pCtx Optional pointer to a caller-allocated session context buffer for private communication between the application and the service provider. Applications having knowledge of the underlying service provider can use this buffer to pass context-specific data to it. Windows Media Device Manager does not do anything with this context. The caller is responsible for freeing this buffer.
     * @param {Integer} dwSizeCtx Size of the context buffer, in bytes. If the size is 0, <i>pCtx</i> is ignored. If the size is non-zero, <i>pCtx</i> must be a valid pointer.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmdevicesession-beginsession
     */
    BeginSession(type, pCtx, dwSizeCtx) {
        pCtxMarshal := pCtx is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "int", type, pCtxMarshal, pCtx, "uint", dwSizeCtx, "HRESULT")
        return result
    }

    /**
     * The EndSession method ends a device session.
     * @param {Integer} type A <a href="https://docs.microsoft.com/windows/desktop/WMDM/wmdm-session-type">WMDM_SESSION_TYPE</a> describing the type of session to end. This must be the same bitwise <b>OR</b> of the values specified in <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmdevicesession-beginsession">BeginSession</a>.
     * @param {Pointer<Integer>} pCtx Optional pointer to a caller-allocated session context buffer for private communication between the application and the service provider. Applications having knowledge of the underlying service provider can use this buffer to pass context-specific data to it. Windows Media Device Manager does not do anything with this context. The caller is responsible for freeing this buffer.
     * @param {Integer} dwSizeCtx Size of the context buffer, in bytes. If the size is 0, <i>pCtx</i> is ignored. If the size is non-zero, <i>pCtx</i> must be a valid pointer
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmdevicesession-endsession
     */
    EndSession(type, pCtx, dwSizeCtx) {
        pCtxMarshal := pCtx is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "int", type, pCtxMarshal, pCtx, "uint", dwSizeCtx, "HRESULT")
        return result
    }
}
