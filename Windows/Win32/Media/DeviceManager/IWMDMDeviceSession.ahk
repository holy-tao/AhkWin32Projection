#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDMDeviceSession interface improves the efficiency of device operations by bundling multiple operations into one session.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-iwmdmdevicesession
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
     * @remarks
     * Bundling several operations into a session does not cause all actions to be postponed and performed in a group; all actions (such as a call to <b>Insert</b>) will still be performed synchronously as called. Rather, using a session allows Windows Media Device Manager components (such as the secure content provider and service provider) to perform some of the operations only once per session, which provides performance improvements. For example, during file transfer to a device, the secure content provider can acquire the device certificate once at the beginning of the session instead of once for every file transfer.
     * 
     * Applications can call <b>BeginSession</b> on a Windows Media Device Manager device object before doing a set of operations and <b>EndSession</b> when they are done.
     * 
     * The application typically calls <b>BeginSession</b> during multiple file transfers or deletions. In response to that, Windows Media Device Manager calls <b>BeginSession</b> or <b>EndSession</b> on the secure content provider and the service provider. In response, the secure content provider and the service provider can perform once-per-session operations. If opening the session fails on any of these components, Windows Media Device Manager returns a failure returned by the component.
     * 
     * Sessions are implemented on a per-device basis. Sessions on different devices do not interfere with each other.
     * 
     * The following restrictions apply to sessions:
     * 
     * <ol>
     * <li>Only one session can be active at a time for a particular device. Attempting to open more than one session on a device will result in an error.</li>
     * <li>
     * Session types can be combined. The same set of flags must be specified during <b>BeginSession</b> and <b>EndSession</b>. Therefore, it is not possible to end only part of the session.
     * 
     * For example, if <b>BeginSession</b> is called with
     * 
     * WMDM_SESSION_TRANSFER_TO_DEVICE | WMDM_SESSION_DELETE
     * 
     * Then <b>EndSession</b> should also be called with
     * 
     * WMDM_SESSION_TRANSFER_TO_DEVICE | WMDM_SESSION_DELETE
     * 
     * Otherwise, Windows Media Device Manager will return E_INVALIDARG.
     * 
     * </li>
     * <li>Windows Media Device Manager sessions are simply a bracketing mechanism for optimizations and do not have any implications regarding locking or ownership of the device. Service provider or the lower level device driver will still need to synchronize device access that may result from different Windows Media Device Manager applications.</li>
     * </ol>
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
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevicesession-beginsession
     */
    BeginSession(type, pCtx, dwSizeCtx) {
        pCtxMarshal := pCtx is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "int", type, pCtxMarshal, pCtx, "uint", dwSizeCtx, "HRESULT")
        return result
    }

    /**
     * The EndSession method ends a device session.
     * @remarks
     * A session brackets a group of operations to a device, allowing Windows Media Device Manager components to optimize performance by performing common setup and shutdown functions only once, rather than with each individual transfer. For details see <b>BeginSession</b>.
     * 
     * In response to an <b>EndSession</b> call, Windows Media Device Manager calls <b>EndSession</b> on the secure content provider and the service provider. If either of them fails the call, Windows Media Device Manager returns an error. In that case, it is possible that <b>EndSession</b> succeeded for one of the components.
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
     * For an extensive list of possible error codes, see <a href="https://docs.microsoft.com/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevicesession-endsession
     */
    EndSession(type, pCtx, dwSizeCtx) {
        pCtxMarshal := pCtx is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "int", type, pCtxMarshal, pCtx, "uint", dwSizeCtx, "HRESULT")
        return result
    }
}
