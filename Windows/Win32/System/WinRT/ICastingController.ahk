#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class ICastingController extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICastingController
     * @type {Guid}
     */
    static IID => Guid("{f0a56423-a664-4fbd-8b43-409a45e8d9a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Connect", "Disconnect", "Advise", "UnAdvise"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @remarks
     * <b>Windows::Foundation::Initialize</b> is changed to create 
     *     ASTAs instead of classic STAs for the <a href="https://docs.microsoft.com/windows/desktop/api/roapi/ne-roapi-ro_init_type">RO_INIT_TYPE</a> 
     *     value <b>RO_INIT_SINGLETHREADED</b>. 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_SINGLETHREADED</b>) 
     *     is not supported for desktop applications and will return <b>CO_E_NOTSUPPORTED</b> if called 
     *     from a process other than a Windows Store app.
     * 
     * For Microsoft DirectX applications, you must initialize the initial thread by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * 
     * For an out-of-process EXE server,  you must initialize the initial thread of the server by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * @param {IUnknown} castingEngine 
     * @param {IUnknown} castingSource 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-initialize
     */
    Initialize(castingEngine, castingSource) {
        result := ComCall(3, this, "ptr", castingEngine, "ptr", castingSource, "HRESULT")
        return result
    }

    /**
     * Defines each configuration setting and associates it with a name. The Connection element is optional.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/eaphost/eapconnectionpropertiesv1schema-connection-connections-element
     */
    Connect() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * The Disconnect event is reserved for future use.
     * @remarks
     * This event is reserved for future use.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WMP/axwmplib-axwindowsmediaplayer-disconnect
     */
    Disconnect() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Stops the recognizer from processing ink because a stroke has been added or deleted.
     * @remarks
     * The <b>AdviseInkChange</b> function signals that there will be additional calls to the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-addstroke">AddStroke</a> function. This enables any recognition already in progress to stop at any convenient point. Recognition completion is one such point, so <b>AdviseInkChange</b> can safely do nothing.
     * 
     * For example, if you have two threads, one thread may be using <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-addstroke">AddStroke</a> and <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-process">Process</a> with other functions to obtain results. The other thread may be collecting ink, echoing it, and queuing tasks for the first thread. The second thread calls <b>AdviseInkChange</b> to notify the recognizer a change is coming. This enables the first thread to return to the caller sooner than without the call to <b>AdviseInkChange</b>. The first thread can then call the recognizer again with more ink.
     * 
     * If you set the bNewStroke parameter to <b>FALSE</b> because a stroke was modified or deleted, you must also call the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-resetcontext">ResetContext</a> function, and then call the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-addstroke">AddStroke</a> function to add the strokes from the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object to the recognizer context. This is done automatically if you attach the recognizer context to the <b>InkDisp</b> object.
     * @param {ICastingEventHandler} eventHandler 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-adviseinkchange
     */
    Advise(eventHandler) {
        result := ComCall(6, this, "ptr", eventHandler, "uint*", &cookie := 0, "HRESULT")
        return cookie
    }

    /**
     * 
     * @param {Integer} cookie 
     * @returns {HRESULT} 
     */
    UnAdvise(cookie) {
        result := ComCall(7, this, "uint", cookie, "HRESULT")
        return result
    }
}
