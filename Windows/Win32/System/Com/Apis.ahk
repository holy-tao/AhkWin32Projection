#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class Com {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static COLE_DEFAULT_PRINCIPAL => -1

    /**
     * @type {Integer (Int32)}
     */
    static COLE_DEFAULT_AUTHINFO => -1

    /**
     * @type {String}
     */
    static CLSID_GlobalOptions => "{0000034b-0000-0000-c000-000000000046}"

    /**
     * @type {Integer (UInt32)}
     */
    static MARSHALINTERFACE_MIN => 500

    /**
     * @type {Integer (Int32)}
     */
    static ASYNC_MODE_COMPATIBILITY => 1

    /**
     * @type {Integer (Int32)}
     */
    static ASYNC_MODE_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static STGTY_REPEAT => 256

    /**
     * @type {Integer (Int32)}
     */
    static STG_TOEND => -1

    /**
     * @type {Integer (Int32)}
     */
    static STG_LAYOUT_SEQUENTIAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static STG_LAYOUT_INTERLEAVED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static COM_RIGHTS_EXECUTE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static COM_RIGHTS_EXECUTE_LOCAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static COM_RIGHTS_EXECUTE_REMOTE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static COM_RIGHTS_ACTIVATE_LOCAL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static COM_RIGHTS_ACTIVATE_REMOTE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static COM_RIGHTS_RESERVED1 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static COM_RIGHTS_RESERVED2 => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CWMO_MAX_HANDLES => 56

    /**
     * @type {Integer (UInt32)}
     */
    static ROTREGFLAGS_ALLOWANYCLIENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static APPIDREGFLAGS_ACTIVATE_IUSERVER_INDESKTOP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static APPIDREGFLAGS_SECURE_SERVER_PROCESS_SD_AND_BIND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static APPIDREGFLAGS_ISSUE_ACTIVATION_RPC_AT_IDENTIFY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static APPIDREGFLAGS_IUSERVER_UNMODIFIED_LOGON_TOKEN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static APPIDREGFLAGS_IUSERVER_SELF_SID_IN_LAUNCH_PERMISSION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static APPIDREGFLAGS_IUSERVER_ACTIVATE_IN_CLIENT_SESSION_ONLY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static APPIDREGFLAGS_RESERVED1 => 64

    /**
     * @type {Integer (UInt32)}
     */
    static APPIDREGFLAGS_RESERVED2 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static APPIDREGFLAGS_RESERVED3 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static APPIDREGFLAGS_RESERVED4 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static APPIDREGFLAGS_RESERVED5 => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static APPIDREGFLAGS_AAA_NO_IMPLICIT_ACTIVATE_AS_IU => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static APPIDREGFLAGS_RESERVED7 => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static APPIDREGFLAGS_RESERVED8 => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static APPIDREGFLAGS_RESERVED9 => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DCOMSCM_ACTIVATION_USE_ALL_AUTHNSERVICES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DCOMSCM_ACTIVATION_DISALLOW_UNSECURE_CALL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DCOMSCM_RESOLVE_USE_ALL_AUTHNSERVICES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DCOMSCM_RESOLVE_DISALLOW_UNSECURE_CALL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DCOMSCM_PING_USE_MID_AUTHNSERVICE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DCOMSCM_PING_DISALLOW_UNSECURE_CALL => 32

    /**
     * @type {Integer (UInt64)}
     */
    static MAXLSN => 9223372036854775807

    /**
     * @type {Integer (UInt32)}
     */
    static DMUS_ERRBASE => 4096
;@endregion Constants

;@region Methods
    /**
     * 
     * @returns {Integer} 
     */
    static CoBuildVersion() {
        result := DllCall("ole32.dll\CoBuildVersion", "uint")
        return result
    }

    /**
     * Initializes the COM library on the current thread and identifies the concurrency model as single-thread apartment (STA).
     * @remarks
     * You need to initialize the COM library on a thread before you call any of the library functions except <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetmalloc">CoGetMalloc</a>, to get a pointer to the standard allocator, and the memory allocation functions.
     * 
     * 
     * 
     * After the concurrency model for a thread is set, it cannot be changed. A call to <b>CoInitialize</b> on an apartment that was previously initialized as multithreaded will fail and return RPC_E_CHANGED_MODE. 
     * 
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> provides the same functionality as <b>CoInitialize</b> and also provides a parameter to explicitly specify the thread's concurrency model. <b>CoInitialize</b> calls <b>CoInitializeEx</b> and specifies the concurrency model as single-thread apartment. Applications developed today should call <b>CoInitializeEx</b> rather than <b>CoInitialize</b>. 
     * 
     * 
     * 
     * Typically, the COM library is initialized on a thread only once. Subsequent calls to <b>CoInitialize</b> or <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> on the same thread will succeed, as long as they do not attempt to change the concurrency model, but will return S_FALSE. To close the COM library gracefully, each successful call to <b>CoInitialize</b> or <b>CoInitializeEx</b>, including those that return S_FALSE, must be balanced by a corresponding call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-couninitialize">CoUninitialize</a>. However, the first thread in the application that calls <b>CoInitialize</b> with 0 (or <b>CoInitializeEx</b> with COINIT_APARTMENTTHREADED) must be the last thread to call <b>CoUninitialize</b>. Otherwise, subsequent calls to <b>CoInitialize</b> on the STA will fail and the application will not work.
     * 
     * Because there is no way to control the order in which in-process servers are loaded or unloaded, do not call <b>CoInitialize</b>, <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-couninitialize">CoUninitialize</a> from the <a href="https://docs.microsoft.com/windows/desktop/Dlls/dllmain">DllMain</a> function.
     * @returns {Integer} This function can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
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
     * The COM library was initialized successfully on this thread.
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
     * The COM library is already initialized on this thread.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_E_CHANGED_MODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A previous call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> specified the concurrency model for this thread as multithread apartment (MTA). This could also indicate that a change from neutral-threaded apartment to single-threaded apartment has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-coinitialize
     * @since windows5.0
     */
    static CoInitialize() {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("OLE32.dll\CoInitialize", "ptr", pvReserved, "int")
        return result
    }

    /**
     * Registers an implementation of the IMallocSpy interface, thereafter requiring OLE to call its wrapper methods around every call to the corresponding IMalloc method.
     * @remarks
     * The <b>CoRegisterMallocSpy</b> function registers the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imallocspy">IMallocSpy</a> object, which is used to debug calls to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> methods. The function calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the pointer <i>pMallocSpy</i> for the interface IID_IMallocSpy. This is to ensure that <i>pMallocSpy</i> really points to an implementation of <b>IMallocSpy</b>. By the rules of OLE, it is expected that a successful call to <b>QueryInterface</b> has added a reference (through the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method) to the <b>IMallocSpy</b> object. That is, <b>CoRegisterMallocSpy</b> does not directly call <b>AddRef</b> on <i>pMallocSpy</i>, but fully expects that the <b>QueryInterface</b> call will.
     * 
     * 
     * 
     * When the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imallocspy">IMallocSpy</a> object is registered, whenever there is a call to one of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> methods, OLE first calls the corresponding <b>IMallocSpy</b> pre-method. Then, after executing the <b>IMalloc</b> method, OLE calls the corresponding <b>IMallocSpy</b> post-method. For example, whenever there is a call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-alloc">IMalloc::Alloc</a>, from whatever source, OLE calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imallocspy-prealloc">IMallocSpy::PreAlloc</a>, calls <b>Alloc</b>, and after that allocation is completed, calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imallocspy-postalloc">IMallocSpy::PostAlloc</a>.
     * @param {Pointer<IMallocSpy>} pMallocSpy A pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imallocspy">IMallocSpy</a> implementation.
     * @returns {Integer} This function can return the standard return value E_INVALIDARG, as well as the following values.
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
     * The object was successfully registered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_OBJISREG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is already registered.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-coregistermallocspy
     * @since windows5.0
     */
    static CoRegisterMallocSpy(pMallocSpy) {
        result := DllCall("OLE32.dll\CoRegisterMallocSpy", "ptr", pMallocSpy, "int")
        return result
    }

    /**
     * Revokes a registered IMallocSpy object.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imallocspy">IMallocSpy</a> object is released when it is revoked. This release corresponds to the call to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a> in the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> function by the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coregistermallocspy">CoRegisterMallocSpy</a> function. The implementation of the <b>IMallocSpy</b> interface should then do any appropriate cleanup.
     * 
     * 
     * 
     * If the return code is E_ACCESSDENIED, there are still outstanding allocations that were made while the spy was active. In this case, the registered spy cannot be revoked at this time because it may have attached arbitrary headers and/or trailers to these allocations that only the spy knows about. Only the spy's <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imallocspy-prefree">PreFree</a> (or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imallocspy-prerealloc">PreRealloc</a>) method knows how to account for these headers and trailers. Before returning E_ACCESSDENIED, <b>CoRevokeMallocSpy</b> notes internally that a revoke is pending. When the outstanding allocations have been freed, the revoke proceeds automatically, releasing the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imallocspy">IMallocSpy</a> object. Thus, it is necessary to call <b>CoRevokeMallocSpy</b> only once for each call to <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coregistermallocspy">CoRegisterMallocSpy</a>, even if E_ACCESSDENIED is returned.
     * @returns {Integer} This function can return the following values.
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
     * The object was revoked successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_OBJNOTREG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No spy is currently registered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A spy is registered but there are outstanding allocations (not yet freed) made while this spy was active.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-corevokemallocspy
     * @since windows5.0
     */
    static CoRevokeMallocSpy() {
        result := DllCall("OLE32.dll\CoRevokeMallocSpy", "int")
        return result
    }

    /**
     * Registers an implementation of the IInitializeSpy interface. The IInitializeSpy interface is defied to allow developers to perform initialization and cleanup on COM apartments.
     * @remarks
     * The <b>CoRegisterInitializeSpy</b> function registers an implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iinitializespy">IInitializeSpy</a> interface, which defines methods to be called when <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> (or <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a>) or <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-couninitialize">CoUninitialize</a> is invoked.
     * 
     * 
     * 
     * <b>CoRegisterInitializeSpy</b> calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> for IID_InitializeSpy on <i>pSpy</i>. It stores the address of the returned interface pointer in thread-specific storage that is independent of the COM initialization state for this thread. On success, it stores in <i>puliCookie</i> a <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-ularge_integer~r1">ULARGE_INTEGER</a> cookie that represents this registration. Pass this cookie to <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-corevokeinitializespy">CoRevokeInitializeSpy</a> to revoke the registration.
     * 
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iinitializespy">IInitializeSpy</a> implementations must deal with nesting issues caused by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> or <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-couninitialize">CoUninitialize</a> from within a notification method. Notifications occur only after the registration happens on this thread. For example, if <b>CoInitializeEx</b> is called before <b>CoRegisterInitializeSpy</b>, then the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iinitializespy-preinitialize">PreInitialize</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iinitializespy-postinitialize">PostInitialize</a> notification methods will not be called.
     * 
     * 
     * 
     * Notification methods must not cause the failure of <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> or <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-couninitialize">CoUninitialize</a> by throwing exceptions. Implementations of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iinitializespy">IInitializeSpy</a> must not propagate exceptions to code that calls <b>CoInitializeEx</b> or <b>CoUninitialize</b>. 
     * 
     * 
     * 
     * It is unpredictable whether a call to <b>CoRegisterInitializeSpy</b> from within an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iinitializespy">IInitializeSpy</a> method call will be effective during the current top-level (non-nested) call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> or <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-couninitialize">CoUninitialize</a>. A registered implementation of <b>IInitializeSpy</b> will always be effective for future top-level calls to <b>CoInitializeEx</b> or <b>CoUninitialize</b>.
     * @param {Pointer<IInitializeSpy>} pSpy A pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iinitializespy">IInitializeSpy</a> implementation.
     * @param {Pointer<UInt64>} puliCookie The address at which to store a cookie that identifies this registration.
     * @returns {Integer} This function can return the standard return value E_INVALIDARG, as well as the following values.
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
     * The object was successfully registered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object does not support <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iinitializespy">IInitializeSpy</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-coregisterinitializespy
     * @since windows5.1.2600
     */
    static CoRegisterInitializeSpy(pSpy, puliCookie) {
        result := DllCall("OLE32.dll\CoRegisterInitializeSpy", "ptr", pSpy, "ptr", puliCookie, "int")
        return result
    }

    /**
     * Revokes a registered implementation of the IInitializeSpy interface.
     * @remarks
     * <b>CoRevokeInitializeSpy</b> can only revoke cookies issued by previous calls to <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coregisterinitializespy">CoRegisterInitializeSpy</a> that were executed on the current thread. Using a cookie from another thread, or one that corresponds to an already revoked registration, will return E_INVALIDARG.
     * 
     * 
     * 
     * It is unpredictable whether a call to <b>CoRevokeInitializeSpy</b> from within an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iinitializespy">IInitializeSpy</a> method call will have an effect during the current top-level (non-nested) call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> or <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-couninitialize">CoUninitialize</a>. The revocation will always have an effect after the current top-level call to <b>CoInitializeEx</b> or <b>CoUninitialize</b> returns.
     * @param {Integer} uliCookie A <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-ularge_integer~r1">ULARGE_INTEGER</a> cookie identifying the registration.
     * @returns {Integer} This function can return the standard return value E_INVALIDARG, as well as S_OK to indicate success.
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-corevokeinitializespy
     * @since windows5.0
     */
    static CoRevokeInitializeSpy(uliCookie) {
        result := DllCall("OLE32.dll\CoRevokeInitializeSpy", "uint", uliCookie, "int")
        return result
    }

    /**
     * Returns the default values of the Security Descriptors of the machine-wide launch and access permissions, as well as launch and access limits.
     * @param {Integer} comSDType A value from the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/ne-objbase-comsd">COMSD</a> enumeration. Specifies the type of the requested system security permissions, such as launch permissions, access permissions, launch restrictions, and access restrictions.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} ppSD Pointer to a caller-supplied variable that this routine sets to the address of a buffer containing the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> for the system security permissions. Memory will be allocated by <b>CoGetSystemSecurityPermissions</b> and should be freed by caller with <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a>.
     * @returns {Integer} This function can return one of these values.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid parameter <i>comSDType</i> or <i>ppSD</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No connection to the resolver process.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory for the security descriptor's allocation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-cogetsystemsecuritypermissions
     * @since windows5.0
     */
    static CoGetSystemSecurityPermissions(comSDType, ppSD) {
        result := DllCall("OLE32.dll\CoGetSystemSecurityPermissions", "int", comSDType, "ptr", ppSD, "int")
        return result
    }

    /**
     * Loads a specific DLL into the caller's process.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetclassobject">CoGetClassObject</a> function does not call <b>CoLoadLibrary</b>. <b>CoLoadLibrary</b> loads a DLL specified by the <i>lpszLibName</i> parameter into the process that called <b>CoGetClassObject</b>. Containers should not call <b>CoLoadLibrary</b> directly.
     * 
     * Internally, a reference count is kept on the loaded DLL by using <b>CoLoadLibrary</b> to increment the count and the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-cofreelibrary">CoFreeLibrary</a> function to decrement it.
     * @param {Pointer<PWSTR>} lpszLibName The name of the library to be loaded.
     * @param {Integer} bAutoFree This parameter is maintained for compatibility with 16-bit applications, but is ignored.
     * @returns {Pointer<HINSTANCE>} If the function succeeds, the return value is a handle to the loaded library; otherwise, it is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-coloadlibrary
     * @since windows5.0
     */
    static CoLoadLibrary(lpszLibName, bAutoFree) {
        lpszLibName := lpszLibName is String? StrPtr(lpszLibName) : lpszLibName

        result := DllCall("OLE32.dll\CoLoadLibrary", "ptr", lpszLibName, "int", bAutoFree, "ptr")
        return result
    }

    /**
     * Frees a library that, when loaded, was specified to be freed explicitly.
     * @remarks
     * The <b>CoFreeLibrary</b> function should be called to free a library that is to be freed explicitly. This is established when the library is loaded with the <i>bAutoFree</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coloadlibrary">CoLoadLibrary</a> set to <b>FALSE</b>. It is illegal to free a library explicitly when the corresponding <b>CoLoadLibrary</b> call specifies that it be freed automatically (the <i>bAutoFree</i> parameter is set to <b>TRUE</b>).
     * @param {Pointer<HINSTANCE>} hInst A handle to the library module to be freed, as returned by the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coloadlibrary">CoLoadLibrary</a> function.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-cofreelibrary
     * @since windows5.0
     */
    static CoFreeLibrary(hInst) {
        DllCall("OLE32.dll\CoFreeLibrary", "ptr", hInst)
    }

    /**
     * Frees all the DLLs that have been loaded with the CoLoadLibrary function (called internally by CoGetClassObject), regardless of whether they are currently in use.
     * @remarks
     * To unload libraries, <b>CoFreeAllLibraries</b> uses a list of loaded DLLs for each process that the COM library maintains. The <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-couninitialize">CoUninitialize</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleuninitialize">OleUninitialize</a> functions call <b>CoFreeAllLibraries</b> internally, so applications usually have no need to call this function directly.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-cofreealllibraries
     * @since windows5.0
     */
    static CoFreeAllLibraries() {
        DllCall("OLE32.dll\CoFreeAllLibraries")
    }

    /**
     * This function passes the foreground privilege (the privilege to set the foreground window) from one process to another. The process that has the foreground privilege can call this function to pass that privilege on to a local COM server process.
     * @remarks
     * The system restricts which processes can call the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setforegroundwindow">SetForegroundWindow</a> and 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-allowsetforegroundwindow">AllowSetForegroundWindow</a> functions to 
     *     set the foreground window. As a result, an application is blocked from stealing the focus from another application 
     *     even when the user is interacting with it. Use <b>CoAllowSetForegroundWindow</b> to pass on the foreground privilege from a process that has it to a process that does not yet have it. This can be done transitively: passing the privilege from one process to another, and then to another, and so on.
     * 
     * <b>CoAllowSetForegroundWindow</b> enables a user 
     *     that has a custom interface to get the same behavior that happens for OLE interfaces where a change of window is 
     *     expected (primarily associated with linking and embedding).
     * 
     * Behind the scenes, the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iforegroundtransfer">IForegroundTransfer</a> interface is used to yield the foreground window between processes. A standard COM-provided proxy already implements <b>IForegroundTransfer</b>, so you don't have to do any extra work if you're using a standard proxy. Just call <b>CoAllowSetForegroundWindow</b> to transfer the foreground privilege to any out-of-process COM object.
     * @param {Pointer<IUnknown>} pUnk A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the proxy of the 
     *       target COM server.
     * @returns {Integer} This function can return the following values.
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
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpvReserved</i> parameter is not <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pUnk</i> parameter does not support foreground window control.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calling process does not currently possess the foreground privilege.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-coallowsetforegroundwindow
     * @since windows5.0
     */
    static CoAllowSetForegroundWindow(pUnk) {
        static lpvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("OLE32.dll\CoAllowSetForegroundWindow", "ptr", pUnk, "ptr", lpvReserved, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvReserved 
     * @param {Pointer<UInt32>} pulReserved 
     * @param {Integer} appsHR 
     * @returns {Integer} 
     */
    static DcomChannelSetHResult(pvReserved, pulReserved, appsHR) {
        result := DllCall("ole32.dll\DcomChannelSetHResult", "ptr", pvReserved, "ptr", pulReserved, "int", appsHR, "int")
        return result
    }

    /**
     * Determines whether the specified CLSID represents an OLE 1 object.
     * @remarks
     * The <b>CoIsOle1Class</b> function determines whether an object class is from OLE 1. You can use it to prevent linking to embedded OLE 1 objects within a container, which OLE 1 objects do not support. After a container has determined that copied data represents an embedded object, the container code can call <b>CoIsOle1Class</b> to determine whether the embedded object is an OLE 1 object. If <b>CoIsOle1Class</b> returns <b>TRUE</b>, the container does not offer CF_LINKSOURCE as one of its clipboard formats. This is one of several OLE compatibility functions. The following compatibility functions, listed below, can be used to convert the storage formats of objects between OLE 1 and OLE.
     * 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleconvertistoragetoolestream">OleConvertIStorageToOLESTREAM</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleconvertistoragetoolestreamex">OleConvertIStorageToOLESTREAMEx</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleconvertolestreamtoistorage">OleConvertOLESTREAMToIStorage</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleconvertolestreamtoistorageex">OleConvertOLESTREAMToIStorageEx</a>
     * </li>
     * </ul>
     * @param {Pointer<Guid>} rclsid The CLSID to be checked.
     * @returns {Integer} If the CLSID refers to an OLE 1 object, the return value is <b>TRUE</b>; otherwise, it is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-coisole1class
     * @since windows5.0
     */
    static CoIsOle1Class(rclsid) {
        result := DllCall("ole32.dll\CoIsOle1Class", "ptr", rclsid, "int")
        return result
    }

    /**
     * The CLSIDFromProgIDEx function (combaseapi.h) triggers automatic installation if the COMClassStore policy is enabled.
     * @remarks
     * CLSCTX_ENABLE_CODE_DOWNLOAD enables automatic installation of missing classes through IntelliMirror/Application Management from the Active Directory. If this flag is not specified, the COMClassStore Policy ("Download missing COM components") determines the behavior (default: no download).
     * 
     * 
     * 
     * If the COMClassStore Policy enables automatic installation, CLSCTX_NO_CODE_DOWNLOAD can be used to explicitly disallow download for an activation.
     * 
     * 
     * 
     * If either of the following registry values are enabled (meaning set to 1), automatic download of missing classes is enabled:
     * 
     * <ul>
     * <li><b>HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\App Management</b>&#92;<b>COMClassStore</b></li>
     * <li><b>HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\App Management
     * </b>&#92;<b>COMClassStore</b></li>
     * </ul>
     * @param {Pointer<PWSTR>} lpszProgID A pointer to the ProgID whose CLSID is requested.
     * @param {Pointer<Guid>} lpclsid Receives a pointer to the retrieved CLSID on return.
     * @returns {Integer} This function can return the following values.
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
     * The CLSID was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_CLASSSTRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The registered CLSID for the ProgID is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>REGDB_E_WRITEREGDB</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred writing the CLSID to the registry. See Remarks below.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-clsidfromprogidex
     * @since windows5.0
     */
    static CLSIDFromProgIDEx(lpszProgID, lpclsid) {
        lpszProgID := lpszProgID is String? StrPtr(lpszProgID) : lpszProgID

        result := DllCall("OLE32.dll\CLSIDFromProgIDEx", "ptr", lpszProgID, "ptr", lpclsid, "int")
        return result
    }

    /**
     * Converts a FILETIME into MS-DOS date and time values.
     * @param {Pointer<FILETIME>} lpFileTime A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     * @param {Pointer<UInt16>} lpDosDate Receives the MS-DOS date.
     * @param {Pointer<UInt16>} lpDosTime Receives the MS-DOS time.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>; otherwise, it is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-cofiletimetodosdatetime
     * @since windows5.0
     */
    static CoFileTimeToDosDateTime(lpFileTime, lpDosDate, lpDosTime) {
        result := DllCall("OLE32.dll\CoFileTimeToDosDateTime", "ptr", lpFileTime, "ptr", lpDosDate, "ptr", lpDosTime, "int")
        return result
    }

    /**
     * Converts the MS-DOS representation of the time and date to a FILETIME structure used by Windows.
     * @remarks
     * An MS-DOS date has the following format.
     * 
     * <table>
     * <tr>
     * <th>Bits</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>0-4</td>
     * <td>Days of the month (1-31).
     * </td>
     * </tr>
     * <tr>
     * <td>5-8</td>
     * <td>Months (1 = January, 2 = February, and so forth). 
     * </td>
     * </tr>
     * <tr>
     * <td>9-15</td>
     * <td>Year offset from 1980 (add 1980 to get actual year). 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * An MS-DOS time has the following format.
     * 
     * <table>
     * <tr>
     * <th>Bits</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>0-4</td>
     * <td>Seconds divided by 2.</td>
     * </tr>
     * <tr>
     * <td>5-10</td>
     * <td>Minutes (0-59).
     * </td>
     * </tr>
     * <tr>
     * <td>11-15</td>
     * <td>Hours (0-23 on a 24-hour clock). 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} nDosDate The MS-DOS date.
     * @param {Integer} nDosTime The MS-DOS time.
     * @param {Pointer<FILETIME>} lpFileTime A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>; otherwise, it is <b>FALSE</b>, probably because of invalid arguments.
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-codosdatetimetofiletime
     * @since windows5.0
     */
    static CoDosDateTimeToFileTime(nDosDate, nDosTime, lpFileTime) {
        result := DllCall("OLE32.dll\CoDosDateTimeToFileTime", "ushort", nDosDate, "ushort", nDosTime, "ptr", lpFileTime, "int")
        return result
    }

    /**
     * The CoFileTimeNow function (combaseapi.h) returns the current time as a FILETIME structure.
     * @param {Pointer<FILETIME>} lpFileTime A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that receives the current time.
     * @returns {Integer} This function returns S_OK to indicate success.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cofiletimenow
     * @since windows5.0
     */
    static CoFileTimeNow(lpFileTime) {
        result := DllCall("OLE32.dll\CoFileTimeNow", "ptr", lpFileTime, "int")
        return result
    }

    /**
     * Registers a channel hook.
     * @param {Pointer<Guid>} ExtensionUuid The extension to register.
     * @param {Pointer<IChannelHook>} pChannelHook The channel hook to register.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-coregisterchannelhook
     */
    static CoRegisterChannelHook(ExtensionUuid, pChannelHook) {
        result := DllCall("ole32.dll\CoRegisterChannelHook", "ptr", ExtensionUuid, "ptr", pChannelHook, "int")
        return result
    }

    /**
     * Establishes or removes an emulation, in which objects of one class are treated as objects of a different class.
     * @remarks
     * This function sets the <b>TreatAs</b> entry in the registry for the specified object, allowing the object to be emulated by another application. Emulation allows an application to open and edit an object of a different format, while retaining the original format of the object. After this entry is set, whenever any function such as <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetclassobject">CoGetClassObject</a> specifies the object's original CLSID (<i>clsidOld</i>), it is transparently forwarded to the new CLSID (<i>clsidNew</i>), thus launching the application associated with the <b>TreatAs</b> CLSID. When the object is saved, it can be saved in its native format, which may result in loss of edits not supported by the original format.
     * 
     * If your application supports emulation, call <b>CoTreatAsClass</b> in the following situations:
     * 
     * <ul>
     * <li>
     * In response to an end-user request (through a conversion dialog box) that a specified object be treated as an object of a different class (an object created under one application be run under another application, while retaining the original format information).
     * 
     * </li>
     * <li>
     * In a setup program, to register that one class of objects be treated as objects of a different class.
     * 
     * </li>
     * </ul>
     * An example of the first case is that an end user might wish to edit a spreadsheet created by one application using a different application that can read and write the spreadsheet format of the original application. For an application that supports emulation, <b>CoTreatAsClass</b> can be called to implement a <b>Treat As</b> option in a conversion dialog box.
     * 
     * 
     * 
     * An example of the use of <b>CoTreatAsClass</b> in a setup program would be in an updated version of an application. When the application is updated, the objects created with the earlier version can be activated and treated as objects of the new version, while retaining the previous format information. This would allow you to give the user the option to convert when they save, or to save it in the previous format, possibly losing format information not available in the older version.
     * 
     * One result of setting an emulation is that when you enumerate verbs, as in the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-enumverbs">IOleObject::EnumVerbs</a> method implementation in the default handler, this would enumerate the verbs from <i>clsidNew</i> instead of <i>clsidOld</i>.
     * 
     * 
     * 
     * To ensure that existing emulation information is removed when you install an application, your setup programs should call <b>CoTreatAsClass</b>, setting the <i>clsidNew</i> parameter to CLSID_NULL to remove any existing emulation for the classes they install.
     * 
     * If there is no CLSID assigned to the <b>AutoTreatAs</b> key in the registry, setting <i>clsidNew</i> and <i>clsidOld</i> to the same value removes the <b>TreatAs</b> entry, so there is no emulation. If there is a CLSID assigned to the <b>AutoTreatAs</b> key, that CLSID is assigned to the <b>TreatAs</b> key.
     * 
     * 
     * 
     * <b>CoTreatAsClass</b> does not validate whether an appropriate registry entry for clsidNew currently exists.
     * @param {Pointer<Guid>} clsidOld The CLSID of the object to be emulated.
     * @param {Pointer<Guid>} clsidNew The CLSID of the object that should emulate the original object. This replaces any existing emulation for <i>clsidOld</i>. This parameter can be CLSID_NULL, in which case any existing emulation for <i>clsidOld</i> is removed.
     * @returns {Integer} This function can return the standard return values E_INVALIDARG, as well as the following values.
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
     * The emulation was successfully established or removed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>REGDB_E_CLASSNOTREG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>clsidOld</i> parameter is not properly registered in the registration database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>REGDB_E_READREGDB</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Error reading from registration database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>REGDB_E_WRITEREGDB</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Error writing to registration database.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-cotreatasclass
     * @since windows5.0
     */
    static CoTreatAsClass(clsidOld, clsidNew) {
        result := DllCall("OLE32.dll\CoTreatAsClass", "ptr", clsidOld, "ptr", clsidNew, "int")
        return result
    }

    /**
     * The CreateDataAdviseHolder function (ole2.h) retrieves a pointer to the OLE implementation of IDataAdviseHolder on the data advise holder object.
     * @remarks
     * Call <b>CreateDataAdviseHolder</b> in your implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-dadvise">IDataObject::DAdvise</a> to get a pointer to the OLE implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataadviseholder">IDataAdviseHolder</a> interface. With this pointer, you can then complete the implementation of <b>IDataObject::DAdvise</b> by calling the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataadviseholder-advise">IDataAdviseHolder::Advise</a> method, which creates an advisory connection between the calling object and the data object.
     * @param {Pointer<IDataAdviseHolder>} ppDAHolder Address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataadviseholder">IDataAdviseHolder</a> pointer variable that receives the interface pointer to the new advise holder object.
     * @returns {Integer} This function returns S_OK on success. Other possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory for the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ole2/nf-ole2-createdataadviseholder
     * @since windows5.0
     */
    static CreateDataAdviseHolder(ppDAHolder) {
        result := DllCall("OLE32.dll\CreateDataAdviseHolder", "ptr", ppDAHolder, "int")
        return result
    }

    /**
     * Retrieves a pointer to a new instance of an OLE-provided implementation of a data cache.
     * @remarks
     * The cache object created by <b>CreateDataCache</b> supports the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iolecache">IOleCache</a>, <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iolecache2">IOleCache2</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iolecachecontrol">IOleCacheControl</a> interfaces for controlling the cache. It also supports the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersiststorage">IPersistStorage</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> (without advise sinks), <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iviewobject">IViewObject</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iviewobject2">IViewObject2</a> interfaces.
     * @param {Pointer<IUnknown>} pUnkOuter If the cache is to be created as part of an aggregate, pointer to the controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> of the aggregate. If not, the parameter should be <b>NULL</b>.
     * @param {Pointer<Guid>} rclsid CLSID used to generate icon labels. This value is typically CLSID_NULL.
     * @param {Pointer<Guid>} iid Reference to the identifier of the interface the caller wants to use to communicate with the cache. This value is typically IID_IOleCache (defined in the OLE headers to equal the interface identifier for <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iolecache">IOleCache</a>).
     * @param {Pointer<Void>} ppv Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *<i>ppvObj</i> contains the requested interface pointer to the supplied cache object.
     * @returns {Integer} This function returns S_OK on success. Other possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface represented by riid is not supported by the object. The parameter <i>ppvObj</i> is set to <b>NULL</b>.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory for the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-createdatacache
     * @since windows5.0
     */
    static CreateDataCache(pUnkOuter, rclsid, iid, ppv) {
        result := DllCall("OLE32.dll\CreateDataCache", "ptr", pUnkOuter, "ptr", rclsid, "ptr", iid, "ptr", ppv, "int")
        return result
    }

    /**
     * Installs the requested COM server application.
     * @param {Pointer<IBindCtx>} pbc Reserved for future use; this value must be <b>NULL</b>.
     * @param {Integer} dwFlags Reserved for future use; this value must be 0.
     * @param {Pointer<uCLSSPEC>} pClassSpec A pointer to a <b>uCLSSPEC</b> union. The <b>tyspec</b> member must be set to TYSPEC_CLSID and the <b>clsid</b> member must be set to the CLSID to be installed. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DevNotes/tyspec">TYSPEC</a>.
     * @param {Pointer<QUERYCONTEXT>} pQuery A pointer to a <a href="https://docs.microsoft.com/previous-versions/bb432414(v=vs.85)">QUERYCONTEXT</a> structure. The <b>dwContext</b> field must be set to the desired <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-clsctx">CLSCTX</a> value. For more information, see <b>QUERYCONTEXT</b>.
     * @param {Pointer<PWSTR>} pszCodeBase Reserved for future use; this value must be <b>NULL</b>.
     * @returns {Integer} This function supports the standard return value E_INVALIDARG, as well as the following.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Term</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="S_OK"></a><a id="s_ok"></a>S_OK
     * 
     * </td>
     * <td width="60%">
     * Indicates success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="CS_E_PACKAGE_NOTFOUND"></a><a id="cs_e_package_notfound"></a>CS_E_PACKAGE_NOTFOUND
     * 
     * </td>
     * <td width="60%">
     * The <b>tyspec</b> field of <i>pClassSpec</i> was not set to TYSPEC_CLSID.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-coinstall
     */
    static CoInstall(pbc, dwFlags, pClassSpec, pQuery, pszCodeBase) {
        pszCodeBase := pszCodeBase is String? StrPtr(pszCodeBase) : pszCodeBase

        result := DllCall("ole32.dll\CoInstall", "ptr", pbc, "uint", dwFlags, "ptr", pClassSpec, "ptr", pQuery, "ptr", pszCodeBase, "int")
        return result
    }

    /**
     * Locates an object by means of its moniker, activates the object if it is inactive, and retrieves a pointer to the specified interface on that object.
     * @remarks
     * <b>BindMoniker</b> is a helper function supplied as a convenient way for a client that has the moniker of an object to obtain a pointer to one of that object's interfaces. <b>BindMoniker</b> packages the following calls:
     * 
     * 
     * ``` syntax
     * CreateBindCtx(0, &amp;pbc); 
     * pmk-&gt;BindToObject(pbc, NULL, riid, ppvObj);
     * ```
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-createbindctx">CreateBindCtx</a> creates a bind context object that supports the system implementation of IBindContext. The pmk parameter is actually a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> implementation on a moniker object. This implementation's <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-bindtoobject">BindToObject</a> method supplies the pointer to the requested interface pointer.
     * 
     * If you have several monikers to bind in quick succession and if you know that those monikers will activate the same object, it may be more efficient to call the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-bindtoobject">IMoniker::BindToObject</a> method directly, which enables you to use the same bind context object for all the monikers. See the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> interface for more information.
     * 
     * Container applications that allow their documents to contain linked objects are a special client that generally does not make direct calls to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> methods. Instead, the client manipulates the linked objects through the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iolelink">IOleLink</a> interface. The default handler implements this interface and calls the appropriate <b>IMoniker</b> methods as needed.
     * @param {Pointer<IMoniker>} pmk A pointer to the object's moniker. See <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a>.
     * @param {Integer} grfOpt This parameter is reserved for future use and must be 0.
     * @param {Pointer<Guid>} iidResult The interface identifier to be used to communicate with the object.
     * @param {Pointer<Void>} ppvResult The address of pointer variable that receives the interface pointer requested in <i>iidResult</i>. Upon successful return, *<i>ppvResult</i> contains the requested interface pointer. If an error occurs, *<i>ppvResult</i> is <b>NULL</b>. If the call is successful, the caller is responsible for releasing the pointer with a call to the object's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @returns {Integer} This function can return the following error codes, or any of the error values returned by the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-bindtoobject">IMoniker::BindToObject</a> method.
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
     * The object was located and activated, if necessary, and a pointer to the requested interface was returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MK_E_NOOBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object that the moniker object identified could not be found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-bindmoniker
     * @since windows5.0
     */
    static BindMoniker(pmk, grfOpt, iidResult, ppvResult) {
        result := DllCall("OLE32.dll\BindMoniker", "ptr", pmk, "uint", grfOpt, "ptr", iidResult, "ptr", ppvResult, "int")
        return result
    }

    /**
     * Converts a display name into a moniker that identifies the object named, and then binds to the object identified by the moniker.
     * @remarks
     * <b>CoGetObject</b> encapsulates calls to the COM library functions <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-createbindctx">CreateBindCtx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-mkparsedisplayname">MkParseDisplayName</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-bindtoobject">IMoniker::BindToObject</a>.
     * @param {Pointer<PWSTR>} pszName The display name of the object to be created.
     * @param {Pointer<BIND_OPTS>} pBindOptions The binding options used to create a moniker that creates the actual object. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-bind_opts">BIND_OPTS</a>. This parameter can be <b>NULL</b>.
     * @param {Pointer<Guid>} riid A reference to the identifier of an interface that is implemented on the object to be created.
     * @param {Pointer<Void>} ppv The address of a pointer to the interface specified by <i>riid</i> on the object that is created.
     * @returns {Integer} This function can return the standard return values E_FAIL, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
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
     * The object was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MK_E_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pszName</i> parameter is not a properly formed display name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MK_E_NOOBJECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object identified by this moniker, or some object identified by the composite moniker of which this moniker is a part, could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MK_E_EXCEEDEDDEADLINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding operation could not be completed within the time limit specified by the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-bind_opts">BIND_OPTS</a> structure passed in <i>pBindOptions</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MK_E_CONNECTMANUALLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding operation requires assistance from the end user. The most common reasons for returning this value are that a password is needed or that a floppy needs to be mounted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MK_E_INTERMEDIATEINTERFACENOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An intermediate object was found but it did not support an interface required to complete the binding operation. For example, an item moniker returns this value if its container does not support the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleitemcontainer">IOleItemContainer</a> interface.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-cogetobject
     * @since windows5.0
     */
    static CoGetObject(pszName, pBindOptions, riid, ppv) {
        pszName := pszName is String? StrPtr(pszName) : pszName

        result := DllCall("OLE32.dll\CoGetObject", "ptr", pszName, "ptr", pBindOptions, "ptr", riid, "ptr", ppv, "int")
        return result
    }

    /**
     * Converts a string into a moniker that identifies the object named by the string.
     * @remarks
     * The <b>MkParseDisplayName</b> function parses a human-readable name into a moniker that can be used to identify a link source. The resulting moniker can be a simple moniker (such as a file moniker), or it can be a generic composite made up of the component moniker pieces. For example, the display name "c:\mydir\somefile!item 1" 
     * 
     * could be parsed into the following generic composite moniker: FileMoniker based on "c:\mydir\somefile") + (ItemMoniker based on "item 1").
     * 
     * The most common use of <b>MkParseDisplayName</b> is in the implementation of the standard <b>Links</b> dialog box, which allows an end user to specify the source of a linked object by typing in a string. You may also need to call <b>MkParseDisplayName</b> if your application supports a macro language that permits remote references (reference to elements outside of the document). 
     * 
     * 
     * 
     * Parsing a display name often requires activating the same objects that would be activated during a binding operation, so it can be just as expensive (in terms of performance) as binding. Objects that are bound during the parsing operation are cached in the bind context passed to the function. If you plan to bind the moniker returned by <b>MkParseDisplayName</b>, it is best to do so immediately after the function returns, using the same bind context, which removes the need to activate objects a second time.
     * 
     * <b>MkParseDisplayName</b> parses as much of the display name as it understands into a moniker. The function then calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-parsedisplayname">IMoniker::ParseDisplayName</a> on the newly created moniker, passing the remainder of the display name. The moniker returned by <b>ParseDisplayName</b> is composed onto the end of the existing moniker and, if any of the display name remains unparsed, <b>ParseDisplayName</b> is called on the result of the composition. This process is repeated until the entire display name has been parsed.
     * 
     * <b>MkParseDisplayName</b> attempts the following strategies to parse the beginning of the display name, using the first one that succeeds:
     * 
     * <ol>
     * <li>
     * The function looks in the Running Object Table for file monikers corresponding to all prefixes of the display name that consist solely of valid file name characters. This strategy can identify documents that are as yet unsaved.
     * 
     * </li>
     * <li>
     * The function checks the maximal prefix of the display name, which consists solely of valid file name characters, to see if an OLE 1 document is registered by that name. In this case, the returned moniker is an internal moniker provided by the OLE 1 compatibility layer of OLE 2.
     * 
     * </li>
     * <li>
     * The function consults the file system to check whether a prefix of the display name matches an existing file. The file name can be drive-absolute, drive-relative, working-directory relative, or begin with an explicit network share name. This is the common case.
     * 
     * </li>
     * <li>
     * If the initial character of the display name is '@', the function finds the longest string immediately following it  that conforms to the legal ProgID syntax. The function converts this string to a CLSID using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-clsidfromprogid">CLSIDFromProgID</a> function. If the CLSID represents an OLE 2 class, the function loads the corresponding class object and asks for an <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iparsedisplayname">IParseDisplayName</a> interface pointer. The resulting <b>IParseDisplayName</b> interface is then given the whole string to parse, starting with the '@'. If the CLSID represents an OLE 1 class, then the function treats the string following the ProgID as an OLE1/DDE link designator having <i>filename</i>|<i>item</i> syntax.
     * 
     * </li>
     * </ol>
     * @param {Pointer<IBindCtx>} pbc A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> interface on the bind context object to be used in this binding operation.
     * @param {Pointer<PWSTR>} szUserName A pointer to the display name to be parsed.
     * @param {Pointer<UInt32>} pchEaten A pointer to the number of characters of <i>szUserName</i> that were consumed. If the function is successful, *<i>pchEaten</i> is the length of <i>szUserName</i>; otherwise, it is the number of characters successfully parsed.
     * @param {Pointer<IMoniker>} ppmk The address of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a>* pointer variable that receives the interface pointer to the moniker that was built from <i>szUserName</i>. When successful, the function has called <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the moniker and the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs, the specified interface pointer will contain as much of the moniker that the method was able to create before the error occurred.
     * @returns {Integer} This function can return the standard return value E_OUTOFMEMORY, as well as the following values.
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
     * The parse operation was successful and the moniker was created.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MK_E_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Error in the syntax of a file name or an error in the syntax of the resulting composite moniker.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * This function can also return any of the error values returned by <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-bindtoobject">IMoniker::BindToObject</a>, <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleitemcontainer-getobject">IOleItemContainer::GetObject</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iparsedisplayname-parsedisplayname">IParseDisplayName::ParseDisplayName</a>.
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-mkparsedisplayname
     * @since windows5.0
     */
    static MkParseDisplayName(pbc, szUserName, pchEaten, ppmk) {
        szUserName := szUserName is String? StrPtr(szUserName) : szUserName

        result := DllCall("OLE32.dll\MkParseDisplayName", "ptr", pbc, "ptr", szUserName, "ptr", pchEaten, "ptr", ppmk, "int")
        return result
    }

    /**
     * Provides a moniker that, when composed onto the end of the first specified moniker (or one with a similar structure), yields the second specified moniker.
     * @remarks
     * Your implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-relativepathto">IMoniker::RelativePathTo</a> should first check whether the other moniker is of a type you recognize and handle in a special way. If not, you should call <b>MonikerRelativePathTo</b>, passing itself as <i>pmkThis</i> and the other moniker as <i>pmkOther</i>. <b>MonikerRelativePathTo</b> correctly handles the cases where either moniker is a generic composite.
     * 
     * 
     * 
     * You should call this function only if <i>pmkSrc</i> and <i>pmkDest</i> are both absolute monikers, where an absolute moniker is either a file moniker or a generic composite whose leftmost component is a file moniker, and where the file moniker represents an absolute path. Do not call this function on relative monikers.
     * @param {Pointer<IMoniker>} pmkSrc A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on the moniker that, when composed with the relative moniker to be created, produces <i>pmkDest</i>. This moniker identifies the "source" of the relative moniker to be created.
     * @param {Pointer<IMoniker>} pmkDest A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on the moniker to be expressed relative to <i>pmkSrc</i>. This moniker identifies the destination of the relative moniker to be created.
     * @param {Pointer<IMoniker>} ppmkRelPath The address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a>* pointer variable that receives the interface pointer to the new relative moniker. When successful, the function has called <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the moniker and the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs, the interface pointer value is <b>NULL</b>.
     * @param {Integer} dwReserved This parameter is reserved and must be nonzero.
     * @returns {Integer} This function can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
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
     * A meaningful relative path has been returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MK_S_HIM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The only form of the relative path is the other moniker.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MK_E_NOTBINDABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pmkSrc</i> parameter is a relative moniker, such as an item moniker, and must be composed with the moniker of its container before a relative path can be determined.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-monikerrelativepathto
     * @since windows5.0
     */
    static MonikerRelativePathTo(pmkSrc, pmkDest, ppmkRelPath, dwReserved) {
        result := DllCall("ole32.dll\MonikerRelativePathTo", "ptr", pmkSrc, "ptr", pmkDest, "ptr", ppmkRelPath, "int", dwReserved, "int")
        return result
    }

    /**
     * Creates a new moniker based on the common prefix that this moniker (the one comprising the data of this moniker object) shares with another moniker.
     * @remarks
     * Your implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-commonprefixwith">IMoniker::CommonPrefixWith</a> should first check whether the other moniker is of a type that you recognize and handle in a special way. If not, you should call <b>MonikerCommonPrefixWith</b>, passing itself as <i>pmkThis</i> and the other moniker as <i>pmkOther</i>. <b>MonikerCommonPrefixWith</b> correctly handles the cases where either moniker is a generic composite. 
     * 
     * 
     * 
     * You should call this function only if <i>pmkThis</i> and <i>pmkOther</i> are both absolute monikers (where an absolute moniker is either a file moniker or a generic composite whose leftmost component is a file moniker, and where the file moniker represents an absolute path). Do not call this function on relative monikers.
     * @param {Pointer<IMoniker>} pmkThis A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on one of the monikers for which a common prefix is sought; usually the moniker in which this call is used to implement <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-commonprefixwith">IMoniker::CommonPrefixWith</a>.
     * @param {Pointer<IMoniker>} pmkOther A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on the moniker to be compared with the first moniker.
     * @param {Pointer<IMoniker>} ppmkCommon The address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a>* pointer variable that receives the interface pointer to the moniker based on the common prefix of <i>pmkThis</i> and <i>pmkOther</i>. When successful, the function has called <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the moniker and the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs, the supplied interface pointer value is <b>NULL</b>.
     * @returns {Integer} This function can return the standard return values E_OUTOFMEMORY and E_UNEXPECTED, as well as the following values.
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
     * A common prefix exists that is neither <i>pmkThis</i> nor <i>pmkOther</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MK_S_HIM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The entire <i>pmkOther</i> moniker is a prefix of the <i>pmkThis</i> moniker.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MK_S_ME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The entire <i>pmkThis</i> moniker is a prefix of the <i>pmkOther</i> moniker.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MK_S_US</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pmkThis</i> and <i>pmkOther</i> monikers are equal.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MK_E_NOPREFIX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The monikers have no common prefix.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MK_E_NOTBINDABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function was called on a relative moniker. It is not meaningful to take the common prefix of relative monikers.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-monikercommonprefixwith
     * @since windows5.0
     */
    static MonikerCommonPrefixWith(pmkThis, pmkOther, ppmkCommon) {
        result := DllCall("ole32.dll\MonikerCommonPrefixWith", "ptr", pmkThis, "ptr", pmkOther, "ptr", ppmkCommon, "int")
        return result
    }

    /**
     * Returns a pointer to an implementation of IBindCtx (a bind context object). This object stores information about a particular moniker-binding operation.
     * @remarks
     * <b>CreateBindCtx</b> is most commonly used in the process of binding a moniker (locating and getting a pointer to an interface by identifying it through a moniker), as in the following steps:
     * 
     * <ol>
     * <li>Get a pointer to a bind context by calling the <b>CreateBindCtx</b> function.
     * </li>
     * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-bindtoobject">IMoniker::BindToObject</a> method on the moniker, retrieving an interface pointer to the object to which the moniker refers. 
     * </li>
     * <li>Release the bind context.</li>
     * <li>Use the interface pointer.</li>
     * <li>Release the interface pointer.</li>
     * </ol>
     * The following code fragment illustrates these steps.
     * 
     * 
     * ``` syntax
     * // pMnk is an IMoniker * that points to a previously acquired moniker 
     * IInterface *pInterface; 
     * IBindCtx *pbc; 
     *  
     * CreateBindCtx( 0, &amp;pbc ); 
     * pMnk-&gt;BindToObject( pbc, NULL, IID_IInterface, &amp;pInterface ); 
     * pbc-&gt;Release(); 
     * 
     * // pInterface now points to the object; safe to use pInterface 
     * pInterface-&gt;Release(); 
     * 
     * ```
     * 
     * Bind contexts are also used in other methods of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface besides <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-bindtoobject">IMoniker::BindToObject</a> and in the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-mkparsedisplayname">MkParseDisplayName</a> function. 
     * 
     * A bind context retains references to the objects that are bound during the binding operation, causing the bound objects to remain active (keeping the object's server running) until the bind context is released. Reusing a bind context when subsequent operations bind to the same object can improve performance. You should, however, release the bind context as soon as possible, because you could be keeping the objects activated unnecessarily.
     * 
     * A bind context contains a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-bind_opts">BIND_OPTS</a> structure, which contains parameters that apply to all steps in a binding operation. When you create a bind context using <b>CreateBindCtx</b>, the fields of the <b>BIND_OPTS</b> structure are initialized as follows.
     * 
     * 
     * ``` syntax
     * cbStruct = sizeof(BIND_OPTS) 
     * grfFlags = 0 
     * grfMode = STGM_READWRITE 
     * dwTickCountDeadline = 0
     * ```
     * 
     * You can call the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ibindctx-setbindoptions">IBindCtx::SetBindOptions</a> method to modify these default values.
     * @param {Integer} reserved This parameter is reserved and must be 0.
     * @param {Pointer<IBindCtx>} ppbc Address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a>* pointer variable that receives the interface pointer to the new bind context object. When the function is successful, the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the bind context. A <b>NULL</b> value for the bind context indicates that an error occurred.
     * @returns {Integer} This function can return the standard return values E_OUTOFMEMORY and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-createbindctx
     * @since windows5.0
     */
    static CreateBindCtx(reserved, ppbc) {
        result := DllCall("OLE32.dll\CreateBindCtx", "uint", reserved, "ptr", ppbc, "int")
        return result
    }

    /**
     * Performs a generic composition of two monikers and supplies a pointer to the resulting composite moniker.
     * @remarks
     * <b>CreateGenericComposite</b> joins two monikers into one. The moniker classes being joined can be different, subject only to the rules of composition. Call this function only if you are writing a new moniker class by implementing the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface, within an implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-composewith">IMoniker::ComposeWith</a> that includes generic composition capability.
     * 
     * Moniker providers should call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-composewith">ComposeWith</a> to compose two monikers together. Implementations of <b>ComposeWith</b> should (as do OLE implementations) attempt, when reasonable for the class, to perform non-generic compositions first, in which two monikers of the same class are combined. If this is not possible, the implementation can call <b>CreateGenericComposite</b> to do a generic composition, which combines two monikers of different classes, within the rules of composition. You can define new types of non-generic compositions if you write a new moniker class.
     * 
     * During the process of composing the two monikers, <b>CreateGenericComposite</b> makes all possible simplifications. Consider the example where <i>pmkFirst</i> is the generic composite moniker, A + B + C, and <i>pmkRest</i> is the generic composite moniker, C -1 + B -1 + Z (where C -1 is the inverse of C). The function first composes C to C -1, which composes to nothing. Then it composes B and B -1 to nothing. Finally, it composes A to Z, and supplies a pointer to the generic composite moniker, A + Z.
     * @param {Pointer<IMoniker>} pmkFirst A pointer to the moniker to be composed to the left of the moniker that pmkRest points to. Can point to any kind of moniker, including a generic composite.
     * @param {Pointer<IMoniker>} pmkRest A pointer to the moniker to be composed to the right of the moniker to which <i>pmkFirst</i> points. Can point to any kind of moniker compatible with the type of the <i>pmkRest</i> moniker, including a generic composite.
     * @param {Pointer<IMoniker>} ppmkComposite The address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a>* pointer variable that receives the interface pointer to the composite moniker object that is the result of composing <i>pmkFirst</i> and <i>pmkRest</i>. This object supports the OLE composite moniker implementation of <b>IMoniker</b>. When successful, the function has called <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the moniker and the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If either <i>pmkFirst</i> or <i>pmkRest</i> are <b>NULL</b>, the supplied pointer is the one that is non-<b>NULL</b>. If both <i>pmkFirst</i> and <i>pmkRest</i> are <b>NULL</b>, or if an error occurs, the returned pointer is <b>NULL</b>.
     * @returns {Integer} This function can return the standard return value E_OUTOFMEMORY, as well as the following values.
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
     * The input monikers were composed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MK_E_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The two monikers could not be composed due to an error in the syntax of a path (for example, if both pmkFirst and pmkRest are file monikers based on absolute paths).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-creategenericcomposite
     * @since windows5.0
     */
    static CreateGenericComposite(pmkFirst, pmkRest, ppmkComposite) {
        result := DllCall("OLE32.dll\CreateGenericComposite", "ptr", pmkFirst, "ptr", pmkRest, "ptr", ppmkComposite, "int")
        return result
    }

    /**
     * Returns the CLSID associated with the specified file name.
     * @remarks
     * When given a file name, <b>GetClassFile</b> finds the CLSID associated with that file. Examples of its use are in the <a href="https://docs.microsoft.com/windows/desktop/api/ole/nf-ole-olecreatefromfile">OleCreateFromFile</a> function, which is passed a file name and requires an associated CLSID, and in the OLE implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-bindtoobject">IMoniker::BindToObject</a>, which, when a link to a file-based document is activated, calls <b>GetClassFile</b> to locate the object application that can open the file. 
     * 
     * 
     * 
     * <b>GetClassFile</b> uses the following strategies to determine an appropriate CLSID: 
     * 
     * <ol>
     * <li>
     * If the file contains a storage object, as determined by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-stgisstoragefile">StgIsStorageFile</a> function, <b>GetClassFile</b> returns the CLSID that was written with the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-setclass">IStorage::SetClass</a> method.
     * 
     * </li>
     * <li>
     * If the file is not a storage object, <b>GetClassFile</b> attempts to match various bits in the file against a pattern in the registry. A pattern in the registry can contain a series of entries of the form:
     * 
     * entry = <i>offset</i>, <i>cb</i>, <i>mask</i>, <i>value</i>
     * 
     * The value of the <i>offset</i> item is an offset from the beginning or end of the file and the <i>cb</i> item is a length in bytes. These two values represent a particular byte range in the file. (A negative value for the offset item is interpreted from the end of the file). The <i>mask</i> value is a bitmask that is used to perform a logical AND operation with the byte range specified by <i>offset</i> and <i>cb</i>. The result of the logical AND operation is compared with the <i>value</i> item. If the <i>mask</i> is omitted, it is assumed to be all ones.
     * 
     * Each pattern in the registry is compared to the file in the order of the patterns in the database. The first pattern where each of the value items matches the result of the AND operation determines the CLSID of the file. For example, the pattern contained in the following entries of the registry requires that the first four bytes be AB CD 12 34 and that the last four bytes be FE FE FE FE:
     * 
     * <pre><b>HKEY_CLASSES_ROOT </b>
     *    <b>FileType</b>
     *       <b>{12345678-0000-0001-C000-000000000095}</b>
     *          <b>0</b> = 0, 4, FFFFFFFF, ABCD1234 
     *          <b>1</b> = -4, 4, , FEFEFEFE </pre>
     * If a file contains such a pattern, the CLSID {12345678-0000-0001-C000-000000000095} will be associated with this file.
     * 
     * </li>
     * <li>
     * If the above strategies fail, <b>GetClassFile</b> searches for the <b>File Extension</b> key in the registry that corresponds to the .ext portion of the file name. If the database entry contains a valid CLSID, <b>GetClassFile</b> returns that CLSID.
     * 
     * </li>
     * <li>
     * If all strategies fail, the function returns MK_E_INVALIDEXTENSION.
     * 
     * </li>
     * </ol>
     * @param {Pointer<PWSTR>} szFilename A pointer to the filename for which you are requesting the associated CLSID.
     * @param {Pointer<Guid>} pclsid A pointer to the location where the associated CLSID is written on return.
     * @returns {Integer} This function can return any of the file system errors, as well as the following values.
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
     * The CLSID was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MK_E_CANTOPENFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to open the specified file name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MK_E_INVALIDEXTENSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified extension in the registry is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-getclassfile
     * @since windows5.0
     */
    static GetClassFile(szFilename, pclsid) {
        szFilename := szFilename is String? StrPtr(szFilename) : szFilename

        result := DllCall("OLE32.dll\GetClassFile", "ptr", szFilename, "ptr", pclsid, "int")
        return result
    }

    /**
     * Creates a class moniker that refers to the specified class.
     * @remarks
     * The class moniker will support the binding to a fresh instance of the class identified by the CLSID in <i>rclsid</i>.
     * @param {Pointer<Guid>} rclsid A reference to the CLSID of the object type to which this moniker binds.
     * @param {Pointer<IMoniker>} ppmk The address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a>* pointer variable that receives the interface pointer to the new class moniker. On successful return, the function has called <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the moniker and the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. When an error occurs, the value of the moniker pointer is <b>NULL</b>.
     * @returns {Integer} This function can return the following values.
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
     * The moniker has been created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-createclassmoniker
     * @since windows5.0
     */
    static CreateClassMoniker(rclsid, ppmk) {
        result := DllCall("OLE32.dll\CreateClassMoniker", "ptr", rclsid, "ptr", ppmk, "int")
        return result
    }

    /**
     * Creates a file moniker based on the specified path.
     * @remarks
     * <b>CreateFileMoniker</b> creates a moniker for an object that is stored in a file. A moniker provider (an object that provides monikers to other objects) can call this function to create a moniker to identify a file-based object that it controls, and can then make the pointer to this moniker available to other objects. An object identified by a file moniker must also implement the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersistfile">IPersistFile</a> interface so it can be loaded when a file moniker is bound.
     * 
     * When each object resides in its own file, as in an OLE server application that supports linking only to file-based documents in their entirety, file monikers are the only type of moniker necessary. To identify objects smaller than a file, the moniker provider must use another type of moniker (such as an item moniker) in addition to file monikers, creating a composite moniker. Composite monikers would be needed in an OLE server application that supports linking to objects smaller than a document (such as sections of a document or embedded objects).
     * 
     * A file moniker can be composed to the right only of another file moniker when the first moniker is based on an absolute path and the other is a relative path, resulting in a single file moniker based on the combination of the two paths. A moniker composed to the right of another moniker must be a refinement of that moniker, and the file moniker represents the largest unit of storage. To identify objects stored within a file, you would compose other types of monikers (usually item monikers) to the right of a file moniker.
     * @param {Pointer<PWSTR>} lpszPathName The path on which this moniker is to be based.
     * 
     * This parameter can specify a relative path, a UNC path, or a drive-letter-based path. If based on a relative path, the resulting moniker must be composed onto another file moniker before it can be bound.
     * @param {Pointer<IMoniker>} ppmk The address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a>* pointer variable that receives the interface pointer to the new file moniker. When successful, the function has called <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the file moniker and the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. When an error occurs, the value of the interface pointer is <b>NULL</b>.
     * @returns {Integer} This function can return the standard return value E_OUTOFMEMORY, as well as the following values.
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
     * The moniker was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MK_E_SYNTAX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was an error in the syntax of the path.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-createfilemoniker
     * @since windows5.0
     */
    static CreateFileMoniker(lpszPathName, ppmk) {
        lpszPathName := lpszPathName is String? StrPtr(lpszPathName) : lpszPathName

        result := DllCall("OLE32.dll\CreateFileMoniker", "ptr", lpszPathName, "ptr", ppmk, "int")
        return result
    }

    /**
     * Creates an item moniker that identifies an object within a containing object (typically a compound document).
     * @remarks
     * A moniker provider, which hands out monikers to identify its objects so they are accessible to other parties, would call <b>CreateItemMoniker</b> to identify its objects with item monikers. Item monikers are based on a string, and identify objects that are contained within another object and can be individually identified using a string. The containing object must also implement the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iolecontainer">IOleContainer</a> interface. 
     * 
     * Most moniker providers are OLE applications that support linking. Applications that support linking to objects smaller than file-based documents, such as a server application that allows linking to a selection within a document, should use item monikers to identify the objects. Container applications that allow linking to embedded objects use item monikers to identify the embedded objects. 
     * 
     * 
     * 
     * The <i>lpszItem</i> parameter is the name used by the document to uniquely identify the object. For example, if the object being identified is a cell range in a spreadsheet, an appropriate name might be something like "A1:E7." An appropriate name when the object being identified is an embedded object might be something like "embedobj1." The containing object must provide an implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleitemcontainer">IOleItemContainer</a> interface that can interpret this name and locate the corresponding object. This allows the item moniker to be bound to the object it identifies.
     * 
     * Item monikers are not used in isolation. They must be composed with a moniker that identifies the containing object as well. For example, if the object being identified is a cell range contained in a file-based document, the item moniker identifying that object must be composed with the file moniker identifying that document, resulting in a composite moniker that is the equivalent of "C:\work\sales.xls!A1:E7."
     * 
     * Nested containers are allowed also, as in the case where an object is contained within an embedded object inside another document. The complete moniker of such an object would be the equivalent of "C:\work\report.doc!embedobj1!A1:E7." In this case, each containing object must call <b>CreateItemMoniker</b> and provide its own implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-ioleitemcontainer">IOleItemContainer</a> interface.
     * @param {Pointer<PWSTR>} lpszDelim A pointer to a wide character string (two bytes per character) zero-terminated string containing the delimiter (typically "!") used to separate this item's display name from the display name of its containing object.
     * @param {Pointer<PWSTR>} lpszItem A pointer to a zero-terminated string indicating the containing object's name for the object being identified. This name can later be used to retrieve a pointer to the object in a call to <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleitemcontainer-getobject">IOleItemContainer::GetObject</a>.
     * @param {Pointer<IMoniker>} ppmk The address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a>* pointer variable that receives the interface pointer to the item moniker. When successful, the function has called <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the item moniker and the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs, the supplied interface pointer has a <b>NULL</b> value.
     * @returns {Integer} This function can return the standard return values E_OUTOFMEMORY and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-createitemmoniker
     * @since windows5.0
     */
    static CreateItemMoniker(lpszDelim, lpszItem, ppmk) {
        lpszDelim := lpszDelim is String? StrPtr(lpszDelim) : lpszDelim
        lpszItem := lpszItem is String? StrPtr(lpszItem) : lpszItem

        result := DllCall("OLE32.dll\CreateItemMoniker", "ptr", lpszDelim, "ptr", lpszItem, "ptr", ppmk, "int")
        return result
    }

    /**
     * Creates and returns a new anti-moniker.
     * @remarks
     * You would call this function only if you are writing your own moniker class (implementing the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface). If you are writing a new moniker class that has no internal structure, you can use <b>CreateAntiMoniker</b> in your implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-inverse">IMoniker::Inverse</a> method, and then check for an anti-moniker in your implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-composewith">IMoniker::ComposeWith</a>.
     * 
     * Like the ".." directory, which acts as the inverse to any directory name just preceding it in a path, an anti-moniker acts as the inverse of a simple moniker that precedes it in a composite moniker. An anti-moniker is used as the inverse of simple monikers with no internal structure. For example, the system-provided implementations of file monikers, item monikers, and pointer monikers all use anti-monikers as their inverse; consequently, an anti-moniker composed to the right of one of these monikers composes to nothing.
     * 
     * A moniker client (an object that is using a moniker to bind to another object) typically does not know the class of a given moniker, so the client cannot be sure that an anti-moniker is the inverse. Therefore, to get the inverse of a moniker, you would call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-inverse">IMoniker::Inverse</a> rather than <b>CreateAntiMoniker</b>.
     * 
     * To remove the last piece of a composite moniker, you would do the following:
     * 
     * <ol>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-enum">IMoniker::Enum</a> on the composite, specifying <b>FALSE</b> as the first parameter. This creates an enumerator that returns the component monikers in reverse order. </li>
     * <li>Use the enumerator to retrieve the last piece of the composite.</li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-inverse">IMoniker::Inverse</a> on that moniker. The moniker returned by <b>Inverse</b> will remove the last piece of the composite.
     * </li>
     * </ol>
     * @param {Pointer<IMoniker>} ppmk The address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a>* pointer variable that receives the interface pointer to the new anti-moniker. When successful, the function has called <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the anti-moniker and the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. When an error occurs, the anti-moniker pointer is <b>NULL</b>.
     * @returns {Integer} This function can return the standard return values E_OUTOFMEMORY and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-createantimoniker
     * @since windows5.0
     */
    static CreateAntiMoniker(ppmk) {
        result := DllCall("OLE32.dll\CreateAntiMoniker", "ptr", ppmk, "int")
        return result
    }

    /**
     * Creates a pointer moniker based on a pointer to an object.
     * @remarks
     * A pointer moniker wraps an existing interface pointer in a moniker that can be passed to those interfaces that require monikers. Pointer monikers allow an object that has no persistent representation to participate in a moniker-binding operation. 
     * 
     * 
     * 
     * Pointer monikers are not commonly used, so this function is not often called.
     * @param {Pointer<IUnknown>} punk A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the object to be identified by the resulting moniker.
     * @param {Pointer<IMoniker>} ppmk The address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a>* pointer variable that receives the interface pointer to the new pointer moniker. When successful, the function has called <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the moniker and the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. When an error occurs, the returned interface pointer has a <b>NULL</b> value.
     * @returns {Integer} This function can return the standard return values E_OUTOFMEMORY, E_UNEXPECTED, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-createpointermoniker
     * @since windows5.0
     */
    static CreatePointerMoniker(punk, ppmk) {
        result := DllCall("OLE32.dll\CreatePointerMoniker", "ptr", punk, "ptr", ppmk, "int")
        return result
    }

    /**
     * Creates an OBJREF moniker based on a pointer to an object.
     * @remarks
     * Clients use OBJREF monikers to obtain a marshaled pointer to a running object in the servers address space.
     * 
     * The server typically calls <b>CreateObjrefMoniker</b> to create an OBJREF moniker and then calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-getdisplayname">IMoniker::GetDisplayName</a>, and finally releases the moniker. The display name for an OBJREF moniker is of the form:
     * 
     * 
     * 
     * OBJREF:<i>nnnnnnnn</i>
     * 
     * Where <i>nnnnnnnn</i> is an arbitrarily long base-64 encoding that encapsulates the computer location, process endpoint, and interface pointer ID (IPID) of the running object
     * 
     * The display name can then be transferred to the client as text. For example, the display name can reside on an HTML page that the client downloads. 
     * 
     * The client can pass the display name to <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-mkparsedisplayname">MkParseDisplayName</a>, which creates an OBJREF moniker based on the display name. A call to the monikers <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-bindtoobject">IMoniker::BindToObject</a> method then obtains a marshaled pointer to the running instance on the server.
     * 
     * For example, a server-side COM component contained in an Active Server Page can create an OBJREF moniker, obtain its display name, and write the display name to the HTML output that is sent to the client browser. A script that runs on the client side can use the display name to get access to the running object itself. A client-side Visual Basic script, for instance, could store the display name in a variable called strMyName and include this line:
     * 
     * <c>objMyInstance = GetObject(strMyName)</c>
     * 
     * The script engine internally makes the calls to <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-mkparsedisplayname">MkParseDisplayName</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-bindtoobject">IMoniker::BindToObject</a>, and the script can then use objMyInstance to refer directly to the running object.
     * @param {Pointer<IUnknown>} punk A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the object that the moniker is to represent.
     * @param {Pointer<IMoniker>} ppmk Address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on the OBJREF moniker that was created.
     * @returns {Integer} This function can return the standard return values E_OUTOFMEMORY, E_UNEXPECTED, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-createobjrefmoniker
     * @since windows5.0
     */
    static CreateObjrefMoniker(punk, ppmk) {
        result := DllCall("OLE32.dll\CreateObjrefMoniker", "ptr", punk, "ptr", ppmk, "int")
        return result
    }

    /**
     * Returns a pointer to the IRunningObjectTable interface on the local running object table (ROT).
     * @remarks
     * Each workstation has a local ROT that maintains a table of the objects that have been registered as running on that computer. This function returns an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irunningobjecttable">IRunningObjectTable</a> interface pointer, which provides access to that table.
     * 
     * Moniker providers, which hand out monikers that identify objects so they are accessible to others, should call <b>GetRunningObjectTable</b>. Use the interface pointer returned by this function to register your objects when they begin running, to record the times that those objects are modified, and to revoke their registrations when they stop running. See the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irunningobjecttable">IRunningObjectTable</a> interface for more information.
     * 
     * 
     * 
     * Compound-document link sources are the most common example of moniker providers. These include server applications that support linking to their documents (or portions of a document) and container applications that support linking to embeddings within their documents. Server applications that do not support linking can also use the ROT to cooperate with container applications that support linking to embeddings.
     * 
     * If you are implementing the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface to write a new moniker class, and you need an interface pointer to the ROT, call <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ibindctx-getrunningobjecttable">IBindCtx::GetRunningObjectTable</a> rather than the <b>GetRunningObjectTable</b> function. This allows future implementations of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> interface to modify binding behavior.
     * @param {Integer} reserved This parameter is reserved and must be 0.
     * @param {Pointer<IRunningObjectTable>} pprot The address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irunningobjecttable">IRunningObjectTable</a>* pointer variable that receives the interface pointer to the local ROT. When the function is successful, the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the interface pointer. If an error occurs, *<i>pprot</i> is undefined.
     * @returns {Integer} This function can return the standard return values E_UNEXPECTED and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-getrunningobjecttable
     * @since windows5.0
     */
    static GetRunningObjectTable(reserved, pprot) {
        result := DllCall("OLE32.dll\GetRunningObjectTable", "uint", reserved, "ptr", pprot, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hwndParent 
     * @param {Pointer<PWSTR>} pszTitle 
     * @param {Pointer<IBindStatusCallback>} pIbscCaller 
     * @param {Pointer<IBindStatusCallback>} ppIbsc 
     * @returns {Integer} 
     */
    static CreateStdProgressIndicator(hwndParent, pszTitle, pIbscCaller, ppIbsc) {
        pszTitle := pszTitle is String? StrPtr(pszTitle) : pszTitle

        result := DllCall("ole32.dll\CreateStdProgressIndicator", "ptr", hwndParent, "ptr", pszTitle, "ptr", pIbscCaller, "ptr", ppIbsc, "int")
        return result
    }

    /**
     * Retrieves a pointer to the default OLE task memory allocator (which supports the system implementation of the IMalloc interface) so applications can call its methods to manage memory.
     * @remarks
     * The pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imalloc">IMalloc</a> interface pointer received through the <i>ppMalloc</i> parameter cannot be used from a remote process; each process must have its own allocator.
     * @param {Integer} dwMemContext This parameter must be 1.
     * @param {Pointer<IMalloc>} ppMalloc The address of an <b>IMalloc*</b> pointer variable that receives the interface pointer to the memory allocator.
     * @returns {Integer} This function can return the standard return values S_OK, E_INVALIDARG, and E_OUTOFMEMORY.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cogetmalloc
     * @since windows5.0
     */
    static CoGetMalloc(dwMemContext, ppMalloc) {
        result := DllCall("OLE32.dll\CoGetMalloc", "uint", dwMemContext, "ptr", ppMalloc, "int")
        return result
    }

    /**
     * Closes the COM library on the current thread, unloads all DLLs loaded by the thread, frees any other resources that the thread maintains, and forces all RPC connections on the thread to close.
     * @remarks
     * A thread must call <b>CoUninitialize</b> once for each successful call it has made to the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> function, including any call that returns S_FALSE. Only the <b>CoUninitialize</b> call corresponding to the <b>CoInitialize</b> or <b>CoInitializeEx</b> call that initialized the library can close it.
     * 
     * 
     * 
     * Calls to <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleinitialize">OleInitialize</a> must be balanced by calls to <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleuninitialize">OleUninitialize</a>. The <b>OleUninitialize</b> function calls <b>CoUninitialize</b> internally, so applications that call <b>OleUninitialize</b> do not also need to call <b>CoUninitialize</b>.
     * 
     * 
     * 
     * <b>CoUninitialize</b> should be called on application shutdown, as the last call made to the COM library after the application hides its main windows and falls through its main message loop. If there are open conversations remaining, <b>CoUninitialize</b> starts a modal message loop and dispatches any pending messages from the containers or server for this COM application. By dispatching the messages, <b>CoUninitialize</b> ensures that the application does not quit before receiving all of its pending messages. Non-COM messages are discarded.
     * 
     * 
     * 
     * Because there is no way to control the order in which in-process servers are loaded or unloaded, do not call <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a>, <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a>, or <b>CoUninitialize</b> from the <a href="https://docs.microsoft.com/windows/desktop/Dlls/dllmain">DllMain</a> function.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-couninitialize
     * @since windows5.0
     */
    static CoUninitialize() {
        DllCall("OLE32.dll\CoUninitialize")
    }

    /**
     * Returns a value that is unique to the current thread. CoGetCurrentProcess can be used to avoid thread ID reuse problems.
     * @remarks
     * Using the value returned from a call to <b>CoGetCurrentProcess</b> can help you in maintaining tables that are keyed by threads or in uniquely identifying a thread to other threads or processes.
     * 
     * <b>CoGetCurrentProcess</b> returns a value that is effectively unique, because it is not used again until 2³² more threads have been created on the current workstation or until the workstation is restarted.
     * 
     * The value returned by <b>CoGetCurrentProcess</b> will uniquely identify the same thread for the life of the caller. Because thread IDs can be reused without notice as threads are created and destroyed, this value is more reliable than the value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentthreadid">GetCurrentThreadId</a> function.
     * @returns {Integer} The function returns the unique identifier of the current thread.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cogetcurrentprocess
     * @since windows5.0
     */
    static CoGetCurrentProcess() {
        result := DllCall("OLE32.dll\CoGetCurrentProcess", "uint")
        return result
    }

    /**
     * Initializes the COM library for use by the calling thread, sets the thread's concurrency model, and creates a new apartment for the thread if one is required.
     * @remarks
     * <b>CoInitializeEx</b> must be called at least once, and is usually called only once, for each thread that uses the COM library. Multiple calls to <b>CoInitializeEx</b> by the same thread are allowed as long as they pass the same concurrency flag, but subsequent valid calls return S_FALSE. To close the COM library gracefully on a thread, each successful call to <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a> or <b>CoInitializeEx</b>, including any call that returns S_FALSE, must be balanced by a corresponding call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-couninitialize">CoUninitialize</a>.
     * 
     * You need to initialize the COM library on a thread before you call any of the library functions except <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetmalloc">CoGetMalloc</a>, to get a pointer to the standard allocator, and the memory allocation functions.
     * 
     * Otherwise, the COM function will return CO_E_NOTINITIALIZED.
     * 
     * After the concurrency model for a thread is set, it cannot be changed. A call to <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a> on an apartment that was previously initialized as multithreaded will fail and return RPC_E_CHANGED_MODE. 
     * 
     * 
     * 
     * Objects created in a single-threaded apartment (STA) receive method calls only from their apartment's thread, so calls are serialized and arrive only at message-queue boundaries (when the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-peekmessagea">PeekMessage</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/oe/oe-ihttpmailtransport-sendmessage">SendMessage</a> function is called).
     * 
     * Objects created on a COM thread in a multithread apartment (MTA) must be able to receive method calls from other threads at any time. You would typically implement some form of concurrency control in a multithreaded object's code using synchronization primitives such as critical sections, semaphores, or mutexes to help protect the object's data. 
     * 
     * When an object that is configured to run in the neutral threaded apartment (NTA) is called by a thread that is in either an STA or the MTA, that thread transfers to the NTA. If this thread subsequently calls <b>CoInitializeEx</b>, the call fails and returns RPC_E_CHANGED_MODE.
     * 
     * Because OLE technologies are not thread-safe, the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleinitialize">OleInitialize</a> function calls <b>CoInitializeEx</b> with the COINIT_APARTMENTTHREADED flag. As a result, an apartment that is initialized for multithreaded object concurrency cannot use the features enabled by <b>OleInitialize</b>.
     * 
     * 
     * 
     * Because there is no way to control the order in which in-process servers are loaded or unloaded, do not call <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a>, <b>CoInitializeEx</b>, or <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-couninitialize">CoUninitialize</a> from the <a href="https://docs.microsoft.com/windows/desktop/Dlls/dllmain">DllMain</a> function.
     * @param {Integer} dwCoInit The concurrency model and initialization options for the thread. Values for this parameter are taken from the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/ne-objbase-coinit">COINIT</a> enumeration. Any combination of values from <b>COINIT</b> can be used, except that the COINIT_APARTMENTTHREADED and COINIT_MULTITHREADED flags cannot both be set. The default is COINIT_MULTITHREADED.
     * @returns {Integer} This function can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
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
     * The COM library was initialized successfully on this thread.
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
     * The COM library is already initialized on this thread.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_E_CHANGED_MODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A previous call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> specified the concurrency model for this thread as multithread apartment (MTA). This could also indicate that a change from neutral-threaded apartment to single-threaded apartment has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-coinitializeex
     * @since windows5.0
     */
    static CoInitializeEx(dwCoInit) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("OLE32.dll\CoInitializeEx", "ptr", pvReserved, "uint", dwCoInit, "int")
        return result
    }

    /**
     * Returns a pointer to a DWORD that contains the apartment ID of the caller's thread.
     * @remarks
     * If the caller is not running on the same computer, this function does not return the apartment ID and the return value is S_FALSE.
     * 
     * There is no guarantee that the information returned from this API is not tampered with, so do not use the ID that is returned to make security decisions. The ID can only be used for logging and diagnostic purposes.
     * @param {Pointer<UInt32>} lpdwTID Receives the apartment ID of the caller's thread. For a single threaded apartment (STA), this is the current thread ID. For a multithreaded apartment (MTA), the value is 0.  For a neutral apartment (NA), the value is -1.
     * @returns {Integer} This function can return the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller's thread ID is set and the caller is in the same process.
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
     * The caller's thread ID is set and the caller is in a different process.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller's thread ID was not set.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cogetcallertid
     * @since windows5.0
     */
    static CoGetCallerTID(lpdwTID) {
        result := DllCall("OLE32.dll\CoGetCallerTID", "ptr", lpdwTID, "int")
        return result
    }

    /**
     * Returns the logical thread identifier of the current physical thread.
     * @remarks
     * This function retrieves the identifier of the current logical thread under which this physical thread is operating. The current physical thread takes on the logical thread identifier of any client thread that makes a COM call into this application. Similarly, the logical thread identifier of the current physical thread is used to denote the causality for outgoing COM calls from this physical thread.
     * @param {Pointer<Guid>} pguid A pointer to a GUID that contains the logical thread ID on return.
     * @returns {Integer} This function can return the following values.
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
     * The logical thread ID was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid pointer was passed in for the <i>pguid</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A memory allocation failed during the operation of the function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cogetcurrentlogicalthreadid
     * @since windows5.0
     */
    static CoGetCurrentLogicalThreadId(pguid) {
        result := DllCall("OLE32.dll\CoGetCurrentLogicalThreadId", "ptr", pguid, "int")
        return result
    }

    /**
     * Returns a pointer to an implementation of IObjContext for the current context.
     * @param {Pointer<UIntPtr>} pToken A pointer to an implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iobjcontext">IObjContext</a> for the current context.
     * @returns {Integer} This function can return the following values.
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
     * The token was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller did not pass a valid token pointer variable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_NOTINITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller is not in an initialized apartment.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cogetcontexttoken
     * @since windows5.0
     */
    static CoGetContextToken(pToken) {
        result := DllCall("OLE32.dll\CoGetContextToken", "ptr", pToken, "int")
        return result
    }

    /**
     * Returns the current apartment type and type qualifier.
     * @remarks
     * On Windows platforms prior to Windows 7, the following actions must be taken on a thread to query the apartment type:<ul>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetcontexttoken">CoGetContextToken</a> to obtain the current context token.</li>
     * <li>Cast the context token to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>* pointer.</li>
     * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method on that pointer to obtain the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-icomthreadinginfo">IComThreadingInfo</a> interface.</li>
     * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-icomthreadinginfo-getcurrentapartmenttype">GetCurrentApartmentType</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-icomthreadinginfo">IComThreadingInfo</a> interface to obtain the current apartment type.</li>
     * </ul>
     * 
     * 
     * In multithreaded scenarios, there is a race condition which can potentially cause an Access Violation within the process when executing the above sequence of operations. The <b>CoGetApartmentType</b> function is recommended as it does not potentially incur the Access Violation.
     * @param {Pointer<Int32>} pAptType <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-apttype">APTTYPE</a> enumeration value that specifies the type of the current apartment.
     * @param {Pointer<Int32>} pAptQualifier <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-apttypequalifier">APTTYPEQUALIFIER</a> enumeration value that specifies the type qualifier of the current apartment.
     * @returns {Integer} Returns S_OK if the call succeeded. Otherwise, one of the following error codes is returned.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call could not successfully query the current apartment type and type qualifier.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid parameter value was supplied to the function. Specifically, one or both of the parameters were set to <b>NULL</b> by the caller.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_NOTINITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> was not called on this thread prior to calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetapartmenttype">CoGetApartmentType</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cogetapartmenttype
     * @since windows6.1
     */
    static CoGetApartmentType(pAptType, pAptQualifier) {
        result := DllCall("OLE32.dll\CoGetApartmentType", "ptr", pAptType, "ptr", pAptQualifier, "int")
        return result
    }

    /**
     * Keeps MTA support active when no MTA threads are running.
     * @remarks
     * The <b>CoIncrementMTAUsage</b> function enables clients to create MTA workers and wait on them for completion before exiting the process.
     * 
     * The <b>CoIncrementMTAUsage</b> function ensures that the system doesn't free resources related to MTA support., even if the MTA thread count goes to 0.
     * 
     * On success, call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-codecrementmtausage">CoDecrementMTAUsage</a> once only. On failure, don't call the <b>CoDecrementMTAUsage</b> function.
     * 
     * Don't call <b>CoIncrementMTAUsage</b> during process shutdown or inside dllmain. You can call <b>CoIncrementMTAUsage</b> before the call to start the shutdown process. 
     * 
     * You can call <b>CoIncrementMTAUsage</b> from one thread and <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-codecrementmtausage">CoDecrementMTAUsage</a> from another as long as a cookie previously returned by <b>CoIncrementMTAUsage</b> is passed to <b>CoDecrementMTAUsage</b>. 
     * 
     * <b>CoIncrementMTAUsage</b> creates the MTA, if the MTA does not already exist. <b>CoIncrementMTAUsage</b> puts the current thread into the MTA, if the current thread is not already in an apartment
     * 
     * 
     * 
     * You can use <b>CoIncrementMTAUsage</b> when: 
     * 
     * <ul>
     * <li>You want a server to keep the MTA alive even when all worker threads are idle.</li>
     * <li> Your API implementation requires COM to be initialized, but has no information about whether the current thread is already in an apartment, and does not need the current thread to go into a particular apartment. </li>
     * </ul>
     * @param {Pointer<CO_MTA_USAGE_COOKIE>} pCookie Address of a <b>PVOID</b> variable that receives the cookie for the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-codecrementmtausage">CoDecrementMTAUsage</a> function, or <b>NULL</b> if the call fails.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-coincrementmtausage
     */
    static CoIncrementMTAUsage(pCookie) {
        result := DllCall("OLE32.dll\CoIncrementMTAUsage", "ptr", pCookie, "int")
        return result
    }

    /**
     * Releases the increment made by a previous call to the CoIncrementMTAUsage function.
     * @remarks
     * <i>Cookie</i> must be a valid value returned by a successful previous call to the  <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coincrementmtausage">CoIncrementMTAUsage</a> function. If the overall count of MTA usage reaches 0, including both through this API and through the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> and <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-couninitialize">CoUninitialize</a> functions, the system frees resources related to MTA support.
     * 
     * You can call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coincrementmtausage">CoIncrementMTAUsage</a> from one thread and <b>CoDecrementMTAUsage</b> from another as long as a cookie previously returned by <b>CoIncrementMTAUsage</b> is passed to <b>CoDecrementMTAUsage</b>. 
     * 
     * Don't call <b>CoDecrementMTAUsage</b> during process shutdown or inside dllmain. You can call <b>CoDecrementMTAUsage</b> before the call to start the shutdown process.
     * @param {Pointer<CO_MTA_USAGE_COOKIE>} Cookie A <b>PVOID</b> variable that was set by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coincrementmtausage">CoIncrementMTAUsage</a> function.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-codecrementmtausage
     */
    static CoDecrementMTAUsage(Cookie) {
        result := DllCall("OLE32.dll\CoDecrementMTAUsage", "ptr", Cookie, "int")
        return result
    }

    /**
     * Adds an unmarshaler CLSID to the allowed list for the calling process only.
     * @remarks
     * Don't call the <b>CoAllowUnmarshalerCLSID</b> function until after <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializesecurity">CoInitializeSecurity</a> has been called in the current process.
     * 
     * The <b>CoAllowUnmarshalerCLSID</b> function provides more granular control over unmarshaling policy than is provided by the policy options. If the process applies any unmarshaling policy, the effect of the <b>CoAllowUnmarshalerCLSID</b> function is to make the policy comparatively weaker. For this reason, only call <b>CoAllowUnmarshalerCLSID</b> when the security impact is well understood. Usually, this is used to facilitate applying a stronger unmarshaling policy option for the broad attack surface reduction this provides, when a specific unmarshaler CLSID not allowed by that option is needed due to other constraints.
     * 
     * For example, it's appropriate to call the <b>CoAllowUnmarshalerCLSID</b> function when an unmarshaler is known or believed to have a vulnerability but is required by an app. Also, it's appropriate to call <b>CoAllowUnmarshalerCLSID</b> if the unmarshaler is used in multiple processes, but only as part of an uncommon feature. Don't use the <b>CoAllowUnmarshalerCLSID</b> function as a replacement for hardening the unmarshaler.
     * @param {Pointer<Guid>} clsid The CLSID of the unmarshaler to be added to the per-process allowed list.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-coallowunmarshalerclsid
     * @since windows8.0
     */
    static CoAllowUnmarshalerCLSID(clsid) {
        result := DllCall("OLE32.dll\CoAllowUnmarshalerCLSID", "ptr", clsid, "int")
        return result
    }

    /**
     * Returns the context for the current object.
     * @remarks
     * <b>CoGetObjectContext</b> retrieves the context for the object from which it is called, and returns a pointer to an interface that can be used to manipulate context properties. Context properties are used to provide services to configured components running within COM+ applications.
     * 
     * For components running within COM applications, the following interfaces are supported for accessing context properties: <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-icomthreadinginfo">IComThreadingInfo</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-icontext">IContext</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/ctxtcall/nn-ctxtcall-icontextcallback">IContextCallback</a>.
     * 
     * For components running within COM+ applications, the following interfaces are supported for accessing context properties: <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iobjectcontext">IObjectContext</a>, <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iobjectcontextactivity">IObjectContextActivity</a>, <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iobjectcontextinfo">IObjectContextInfo</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-icontextstate">IContextState</a>.
     * @param {Pointer<Guid>} riid A reference to the ID of an interface that is implemented on the context object. 
     * 
     * For objects running within COM applications, IID_IComThreadingInfo, IID_IContext, and IID_IContextCallback are available.
     * 
     * For objects running within COM+ applications, IID_IObjectContext, IID_IObjectContextActivity IID_IObjectContextInfo, and IID_IContextState are available.
     * @param {Pointer<Void>} ppv The address of a pointer to the interface specified by <i>riid</i> on the context object.
     * @returns {Integer} This function can return the standard return values E_OUTOFMEMORY and E_UNEXPECTED, as well as the following values.
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
     * The object context was successfully retrieved.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested interface was not available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_NOTINITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Before this function can be called, the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> function must be called on the current thread.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cogetobjectcontext
     * @since windows5.0
     */
    static CoGetObjectContext(riid, ppv) {
        result := DllCall("OLE32.dll\CoGetObjectContext", "ptr", riid, "ptr", ppv, "int")
        return result
    }

    /**
     * Provides a pointer to an interface on a class object associated with a specified CLSID.
     * @remarks
     * A class object in OLE is an intermediate object that supports an interface that permits operations common to a group of objects. The objects in this group are instances derived from the same object definition represented by a single CLSID. Usually, the interface implemented on a class object is <a href="https://docs.microsoft.com/windows/desktop/com/implementing-iclassfactory">IClassFactory</a>, through which you can create object instances of a given definition (class).
     * 
     * 
     * 
     * A call to <b>CoGetClassObject</b> creates, initializes, and gives the caller access (through a pointer to an interface specified with the <i>riid</i> parameter) to the class object. The class object is the one associated with the CLSID that you specify in the <i>rclsid</i> parameter. The details of how the system locates the associated code and data within a computer are transparent to the caller, as is the dynamic loading of any code that is not already loaded. 
     * 
     * 
     * 
     * If the class context is CLSCTX_REMOTE_SERVER, indicating remote activation is required, the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-coserverinfo">COSERVERINFO</a> structure provided in the <i>pServerInfo</i> parameter allows you to specify the computer on which the server is located. For information on the algorithm used to locate a remote server when <i>pServerInfo</i> is <b>NULL</b>, refer to the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-clsctx">CLSCTX</a> enumeration.
     * 
     * 
     * 
     * There are two places to find a CLSID for a class:
     * 
     * <ul>
     * <li>The registry holds an association between CLSIDs and file suffixes, and between CLSIDs and file signatures for determining the class of an object.</li>
     * <li>When an object is saved to persistent storage, its CLSID is stored with its data.</li>
     * </ul>
     * To create and initialize embedded or linked OLE document objects, it is not necessary to call <b>CoGetClassObject</b> directly. Instead, call the <a href="https://docs.microsoft.com/windows/desktop/api/ole/nf-ole-olecreate">OleCreate</a> or <b>OleCreate</b><i>XXX</i> function. These functions encapsulate the entire object instantiation and initialization process, and call, among other functions, <b>CoGetClassObject</b>.
     * 
     * 
     * 
     * The <i>riid</i> parameter specifies the interface the client will use to communicate with the class object. In most cases, this interface is <a href="https://docs.microsoft.com/windows/desktop/com/implementing-iclassfactory">IClassFactory</a>. This provides access to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iclassfactory-createinstance">CreateInstance</a> method, through which the caller can then create an uninitialized object of the kind specified in its implementation. All classes registered in the system with a CLSID must implement <a href="https://docs.microsoft.com/windows/desktop/api/unknwnbase/nn-unknwnbase-iclassfactory">IClassFactory</a>. 
     * 
     * 
     * 
     * In rare cases, however, you may want to specify some other interface that defines operations common to a set of objects. For example, in the way OLE implements monikers, the interface on the class object is <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iparsedisplayname">IParseDisplayName</a>, used to transform the display name of an object into a moniker.
     * 
     * 
     * 
     * The <i>dwClsContext</i> parameter specifies the execution context, allowing one CLSID to be associated with different pieces of code in different execution contexts. The <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-clsctx">CLSCTX</a> enumeration specifies the available context flags. <b>CoGetClassObject</b> consults (as appropriate for the context indicated) both the registry and the class objects that are currently registered by calling the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coregisterclassobject">CoRegisterClassObject</a> function. 
     * 
     * 
     * 
     * To release a class object, use the class object's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method. The function <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-corevokeclassobject">CoRevokeClassObject</a> is to be used only to remove a class object's CLSID from the system registry.
     * @param {Pointer<Guid>} rclsid The CLSID associated with the data and code that you will use to create the objects.
     * @param {Integer} dwClsContext The context in which the executable code is to be run. To enable a remote activation, include CLSCTX_REMOTE_SERVER. For more information on the context values and their use, see the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-clsctx">CLSCTX</a> enumeration.
     * @param {Pointer<Void>} pvReserved A pointer to computer on which to instantiate the class object. If this parameter is <b>NULL</b>, the class object is instantiated on the current computer or at the computer specified under the class's <a href="https://docs.microsoft.com/windows/desktop/com/remoteservername">RemoteServerName</a> key, according to the interpretation of the <i>dwClsCtx</i> parameter. See <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-coserverinfo">COSERVERINFO</a>.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface, which will be supplied in _ppv_ on successful return. This interface will be used to communicate with the class object. Typically this value is IID_IClassFactory, although other values such as IID_IClassFactory2 which supports a form of licensing are allowed. All OLE-defined interface IIDs are defined in the OLE header files as IID_interfacename, where interfacename is the name of the interface.
     * @param {Pointer<Void>} ppv The address of pointer variable that receives the interface pointer requested in <i>riid</i>. Upon successful return, *<i>ppv</i> contains the requested interface pointer.
     * @returns {Integer} This function can return the following values.
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
     * Location and connection to the specified class object was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>REGDB_E_CLASSNOTREG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The CLSID is not properly registered. This error can also indicate that the value you specified in <i>dwClsContext</i> is not in the registry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either the object pointed to by <i>ppv</i> does not support the interface identified by <i>riid</i>, or the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> operation on the class object returned E_NOINTERFACE.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>REGDB_E_READREGDB</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was an error reading the registration database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_DLLNOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either the in-process DLL or handler DLL was not found (depending  on the context).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_APPNOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The executable (.exe) was not found (CLSCTX_LOCAL_SERVER only).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was a general access failure on load.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_ERRORINDLL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is an error in the executable image.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_APPDIDNTREG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The executable was launched, but it did not register the class object (and it may have shut down).
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cogetclassobject
     * @since windows5.0
     */
    static CoGetClassObject(rclsid, dwClsContext, pvReserved, riid, ppv) {
        result := DllCall("OLE32.dll\CoGetClassObject", "ptr", rclsid, "uint", dwClsContext, "ptr", pvReserved, "ptr", riid, "ptr", ppv, "int")
        return result
    }

    /**
     * Registers an EXE class object with OLE so other applications can connect to it.
     * @remarks
     * EXE object applications should call <b>CoRegisterClassObject</b> on startup. It can also be used to register internal objects for use by the same EXE or other code (such as DLLs) that the EXE uses.
     * Only EXE object applications call <b>CoRegisterClassObject</b>. Object handlers or DLL object applications do not call this function — instead, they must implement and export the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-dllgetclassobject">DllGetClassObject</a> function.
     * 
     * At startup, a multiple-use EXE object application must create a class object (with the <a href="https://docs.microsoft.com/windows/desktop/api/unknwnbase/nn-unknwnbase-iclassfactory">IClassFactory</a> interface on it), and call <b>CoRegisterClassObject</b> to register the class object. Object applications that support several different classes (such as multiple types of embeddable objects) must allocate and register a different class object for each.
     * 
     * Multiple registrations of the same class object are independent and do not produce an error. Each subsequent registration yields a unique key in <i>lpdwRegister</i>.
     * 
     * Multiple document interface (MDI) applications must register their class objects. Single document interface (SDI) applications must register their class objects only if they can be started by means of the <b>/Embedding</b> switch.
     * 
     * The server for a class object should call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-corevokeclassobject">CoRevokeClassObject</a> to revoke the class object (remove its registration) when all of the following are true:
     * 
     * <ul>
     * <li>
     * There are no existing instances of the object definition.
     * 
     * </li>
     * <li>
     * There are no locks on the class object.
     * 
     * </li>
     * <li>
     * The application providing services to the class object is not under user control (not visible to the user on the display).
     * 
     * </li>
     * </ul>
     * After the class object is revoked, when its reference count reaches zero, the class object can be released, allowing the application to exit. Note that <b>CoRegisterClassObject</b> calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a> and <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-corevokeclassobject">CoRevokeClassObject</a> calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a>, so the two functions form an <b>AddRef</b>/<b>Release</b> pair.
     * 
     * 
     * 
     * As of Windows Server 2003, if a COM object application is registered as a service, COM verifies the registration. COM makes sure the process ID of the service, in the service control manager (SCM), matches the process ID of the registering process. If not, COM fails the registration. If the COM object application runs in the system account with no registry key, COM treats the objects application identity as <a href="https://docs.microsoft.com/windows/desktop/com/launching-user">Launching User</a>.
     * @param {Pointer<Guid>} rclsid The CLSID to be registered.
     * @param {Pointer<IUnknown>} pUnk A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the class object whose availability is being published.
     * @param {Integer} dwClsContext The context in which the executable code is to be run. For information on these context values, see the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-clsctx">CLSCTX</a> enumeration.
     * @param {Integer} flags Indicates how connections are made to the class object. For information on these flags, see the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/ne-combaseapi-regcls">REGCLS</a> enumeration.
     * @param {Pointer<UInt32>} lpdwRegister A pointer to a value that identifies the class object registered; later used by the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-corevokeclassobject">CoRevokeClassObject</a> function to revoke the registration.
     * @returns {Integer} This function can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
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
     * The class object was registered successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-coregisterclassobject
     * @since windows5.0
     */
    static CoRegisterClassObject(rclsid, pUnk, dwClsContext, flags, lpdwRegister) {
        result := DllCall("OLE32.dll\CoRegisterClassObject", "ptr", rclsid, "ptr", pUnk, "uint", dwClsContext, "uint", flags, "ptr", lpdwRegister, "int")
        return result
    }

    /**
     * Informs OLE that a class object, previously registered with the CoRegisterClassObject function, is no longer available for use.
     * @remarks
     * A successful call to <b>CoRevokeClassObject</b> means that the class object has been removed from the global class object table (although it does not release the class object). If other clients still have pointers to the class object and have caused the reference count to be incremented by calls to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a>, the reference count will not be zero. When this occurs, applications may benefit if subsequent calls (with the obvious exceptions of <b>AddRef</b> and <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a>) to the class object fail. Note that <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coregisterclassobject">CoRegisterClassObject</a> calls <b>AddRef</b> and <b>CoRevokeClassObject</b> calls <b>Release</b>, so the two functions form an <b>AddRef</b>/<b>Release</b> pair.
     * 
     * 
     * 
     * An object application must call <b>CoRevokeClassObject</b> to revoke registered class objects before exiting the program. Class object implementers should call <b>CoRevokeClassObject</b> as part of the release sequence. You must specifically revoke the class object even when you have specified the flags value REGCLS_SINGLEUSE in a call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coregisterclassobject">CoRegisterClassObject</a>, indicating that only one application can connect to the class object.
     * @param {Integer} dwRegister A token previously returned from the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coregisterclassobject">CoRegisterClassObject</a> function.
     * @returns {Integer} This function can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
     * 
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
     * The class object was revoked successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-corevokeclassobject
     * @since windows5.0
     */
    static CoRevokeClassObject(dwRegister) {
        result := DllCall("OLE32.dll\CoRevokeClassObject", "uint", dwRegister, "int")
        return result
    }

    /**
     * Called by a server that can register multiple class objects to inform the SCM about all registered classes, and permits activation requests for those class objects.
     * @remarks
     * Servers that can register multiple class objects call <b>CoResumeClassObjects</b> once, after having first called <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coregisterclassobject">CoRegisterClassObject</a>, specifying REGCLS_LOCAL_SERVER | REGCLS_SUSPENDED for each CLSID the server supports. This function causes OLE to inform the SCM about all the registered classes, and begins letting activation requests into the server process.
     * 
     * This reduces the overall registration time, and thus the server application startup time, by making a single call to the SCM, no matter how many CLSIDs are registered for the server. Another advantage is that if the server has multiple apartments with different CLSIDs registered in different apartments, or is a free-threaded server, no activation requests will come in until the server calls <b>CoResumeClassObjects</b>. This gives the server a chance to register all of its CLSIDs and get properly set up before having to deal with activation requests, and possibly shutdown requests.
     * @returns {Integer} This function returns S_OK to indicate that the CLSID was retrieved successfully.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-coresumeclassobjects
     * @since windows5.0
     */
    static CoResumeClassObjects() {
        result := DllCall("OLE32.dll\CoResumeClassObjects", "int")
        return result
    }

    /**
     * Prevents any new activation requests from the SCM on all class objects registered within the process.
     * @remarks
     * <b>CoSuspendClassObjects</b> prevents any new activation requests from the SCM on all class objects registered within the process. Even though a process may call this function, the process still must call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-corevokeclassobject">CoRevokeClassObject</a> function for each CLSID it has registered, in the apartment it registered in. Applications typically do not need to call this function, which is generally only called internally by OLE when used in conjunction with the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coreleaseserverprocess">CoReleaseServerProcess</a> function.
     * @returns {Integer} This function returns S_OK to indicate that the activation of class objects was successfully suspended.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cosuspendclassobjects
     * @since windows5.0
     */
    static CoSuspendClassObjects() {
        result := DllCall("OLE32.dll\CoSuspendClassObjects", "int")
        return result
    }

    /**
     * Increments a global per-process reference count.
     * @remarks
     * Servers can call <b>CoAddRefServerProcess</b> to increment a global per-process reference count. This function is particularly helpful to servers that are implemented with multiple threads, either multi-apartmented or free-threaded. Servers of these types must coordinate the decision to shut down with activation requests across multiple threads. Calling <b>CoAddRefServerProcess</b> increments a global per-process reference count, and calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coreleaseserverprocess">CoReleaseServerProcess</a> decrements that count.
     * 
     * When that count reaches zero, OLE automatically calls <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cosuspendclassobjects">CoSuspendClassObjects</a>, which prevents new activation requests from coming in. This permits the server to deregister its class objects from its various threads without worry that another activation request may come in. New activation requests result in launching a new instance of the local server process.
     * 
     * The simplest way for a local server application to make use of these functions is to call <b>CoAddRefServerProcess</b> in the constructor for each of its instance objects, and in each of its <a href="https://docs.microsoft.com/windows/desktop/api/unknwnbase/nf-unknwnbase-iclassfactory-lockserver">IClassFactory::LockServer</a> methods when the <i>fLock</i> parameter is <b>TRUE</b>. The server application should also call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coreleaseserverprocess">CoReleaseServerProcess</a> in the destruction of each of its instance objects, and in each of its <b>LockServer</b> methods when the <i>fLock</i> parameter is <b>FALSE</b>. Finally, the server application should pay attention to the return code from <b>CoReleaseServerProcess</b> and if it returns 0, the server application should initiate its cleanup, which, for a server with multiple threads, typically means that it should signal its various threads to exit their message loops and call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-corevokeclassobject">CoRevokeClassObject</a> and <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-couninitialize">CoUninitialize</a>.
     * 
     * If these functions are used at all, they must be called in both the object instances and the <a href="https://docs.microsoft.com/windows/desktop/api/unknwnbase/nf-unknwnbase-iclassfactory-lockserver">LockServer</a> method, otherwise the server application may be shut down prematurely. In-process servers typically should not call <b>CoAddRefServerProcess</b> or <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coreleaseserverprocess">CoReleaseServerProcess</a>.
     * @returns {Integer} The current reference count.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-coaddrefserverprocess
     * @since windows5.0
     */
    static CoAddRefServerProcess() {
        result := DllCall("OLE32.dll\CoAddRefServerProcess", "uint")
        return result
    }

    /**
     * Decrements the global per-process reference count.
     * @remarks
     * Servers can call <b>CoReleaseServerProcess</b> to decrement a global per-process reference count incremented through a call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coaddrefserverprocess">CoAddRefServerProcess</a>.
     * 
     * 
     * 
     * When that count reaches zero, OLE automatically calls <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cosuspendclassobjects">CoSuspendClassObjects</a>, which prevents new activation requests from coming in. This permits the server to deregister its class objects from its various threads without worry that another activation request may come in. New activation requests result in launching a new instance of the local server process.
     * 
     * The simplest way for a local server application to make use of these functions is to call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coaddrefserverprocess">CoAddRefServerProcess</a> in the constructor for each of its instance objects, and in each of its <a href="https://docs.microsoft.com/windows/desktop/api/unknwnbase/nf-unknwnbase-iclassfactory-lockserver">IClassFactory::LockServer</a> methods when the <i>fLock</i> parameter is <b>TRUE</b>. The server application should also call <b>CoReleaseServerProcess</b> in the destructor of each of its instance objects, and in each of its <b>IClassFactory::LockServer</b> methods when the <i>fLock</i> parameter is <b>FALSE</b>. Finally, the server application must check the return code from <b>CoReleaseServerProcess</b>; if it returns 0, the server application should initiate its cleanup. This typically means that a server with multiple threads should signal its various threads to exit their message loops and call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-corevokeclassobject">CoRevokeClassObject</a> and <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-couninitialize">CoUninitialize</a>.
     * 
     * If these APIs are used at all, they must be called in both the object instances and the <a href="https://docs.microsoft.com/windows/desktop/api/unknwnbase/nf-unknwnbase-iclassfactory-lockserver">LockServer</a> method, otherwise the server application may be shutdown prematurely. In-process Servers typically should not call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coaddrefserverprocess">CoAddRefServerProcess</a> or <b>CoReleaseServerProcess</b>.
     * @returns {Integer} If the server application should initiate its cleanup, the function returns 0; otherwise, the function returns a nonzero value.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-coreleaseserverprocess
     * @since windows5.0
     */
    static CoReleaseServerProcess() {
        result := DllCall("OLE32.dll\CoReleaseServerProcess", "uint")
        return result
    }

    /**
     * Returns the CLSID of the DLL that implements the proxy and stub for the specified interface.
     * @remarks
     * The <b>CoGetPSClsid</b> function looks at the <b>HKEY_CLASSES_ROOT</b>&#92;<b>Interfaces</b>&#92;<i>{string form of riid}</i>&#92;<b>ProxyStubClsid32</b> key in the registry to determine the CLSID of the DLL to load in order to create the proxy and stub for the interface specified by <i>riid</i>. This function also returns the CLSID for any interface IID registered by <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coregisterpsclsid">CoRegisterPSClsid</a> within the current process.
     * @param {Pointer<Guid>} riid The interface whose proxy/stub CLSID is to be returned.
     * @param {Pointer<Guid>} pClsid Specifies where to store the proxy/stub CLSID for the interface specified by <i>riid</i>.
     * @returns {Integer} This function can return the following values.
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
     * The proxy/stub CLSID was successfully returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is insufficient memory to complete this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cogetpsclsid
     * @since windows5.0
     */
    static CoGetPSClsid(riid, pClsid) {
        result := DllCall("OLE32.dll\CoGetPSClsid", "ptr", riid, "ptr", pClsid, "int")
        return result
    }

    /**
     * Enables a downloaded DLL to register its custom interfaces within its running process so that the marshaling code will be able to marshal those interfaces.
     * @remarks
     * Typically, the code responsible for marshaling an interface pointer into the current running process reads the <b>HKEY_CLASSES_ROOT\Interfaces</b> section of the registry to obtain the CLSID of the DLL containing the ProxyStub code to be loaded. To obtain the ProxyStub CLSIDs for an existing interface, the code calls the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetpsclsid">CoGetPSClsid</a> function.
     * 
     * 
     * 
     * In some cases, however, it may be desirable or necessary for an in-process handler or in-process server to make its custom interfaces available without writing to the registry. A DLL downloaded across a network may not even have permission to access the local registry, and because the code originated on another computer, the user, for security purposes, may want to run it in a restricted environment. Or a DLL may have custom interfaces that it uses to talk to a remote server and may also include the ProxyStub code for those interfaces. In such cases, a DLL needs an alternative way to register its interfaces. <b>CoRegisterPSClsid</b>, used in conjunction with <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coregisterclassobject">CoRegisterClassObject</a>, provides that alternative.
     * @param {Pointer<Guid>} riid A pointer to the IID of the interface to be registered.
     * @param {Pointer<Guid>} rclsid A pointer to the CLSID of the DLL that contains the proxy/stub code for the custom interface specified by <i>riid</i>.
     * @returns {Integer} This function can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-coregisterpsclsid
     * @since windows5.0
     */
    static CoRegisterPSClsid(riid, rclsid) {
        result := DllCall("OLE32.dll\CoRegisterPSClsid", "ptr", riid, "ptr", rclsid, "int")
        return result
    }

    /**
     * Registers the surrogate process through its ISurrogate interface pointer.
     * @remarks
     * The <b>CoRegisterSurrogate</b> function sets a global interface pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-isurrogate">ISurrogate</a> interface implemented on the surrogate process. This pointer is set in the ole32 DLL loaded in the surrogate process. COM uses this global pointer in ole32 to call the methods of <b>ISurrogate</b>. This function is usually called by the surrogate implementation when it is launched.
     * 
     * 
     * 
     * As of Windows Server 2003, if a COM object application is registered as a service, COM verifies the registration. COM makes sure the process ID of the service, in the service control manager (SCM), matches the process ID of the registering process. If not, COM fails the registration.
     * @param {Pointer<ISurrogate>} pSurrogate A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-isurrogate">ISurrogate</a> interface on the surrogate process to be registered.
     * @returns {Integer} This function returns S_OK to indicate that the surrogate process was registered successfully.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-coregistersurrogate
     * @since windows5.0
     */
    static CoRegisterSurrogate(pSurrogate) {
        result := DllCall("OLE32.dll\CoRegisterSurrogate", "ptr", pSurrogate, "int")
        return result
    }

    /**
     * Disconnects all remote process connections being maintained on behalf of all the interface pointers that point to a specified object.
     * @remarks
     * The <b>CoDisconnectObject</b> function enables a server to correctly disconnect all external clients to the object specified by <i>pUnk</i>.
     * 
     * It performs the following tasks:
     * 
     * <ol>
     * <li>Checks to see whether the object to be disconnected implements the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imarshal">IMarshal</a> interface. If so, it gets the pointer to that interface; if not, it gets a pointer to the standard marshaler's (i.e., COM's) <b>IMarshal</b> implementation.</li>
     * <li>Using whichever <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imarshal">IMarshal</a> interface pointer it has acquired, the function then calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imarshal-disconnectobject">IMarshal::DisconnectObject</a> to disconnect all out-of-process clients.</li>
     * </ol>
     * An object's client does not call <b>CoDisconnectObject</b> to disconnect itself from the server (clients should use <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> for this purpose). Rather, an OLE server calls <b>CoDisconnectObject</b> to forcibly disconnect an object's clients, usually in response to a user closing the server application.
     * 
     * Similarly, an OLE container that supports external links to its embedded objects can call <b>CoDisconnectObject</b> to destroy those links. Again, this call is normally made in response to a user closing the application. The container should first call <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-close">IOleObject::Close</a> for all its OLE objects, each of which should send <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iadvisesink-onclose">IAdviseSink::OnClose</a> notifications to their various clients. Then the container can call <b>CoDisconnectObject</b> to close any existing connections.
     * 
     * 
     * 
     * <b>CoDisconnectObject</b> does not necessarily disconnect out-of-process clients immediately. If any marshaled calls are pending on the server object, <b>CoDisconnectObject</b> disconnects the object only when those calls have returned. In the meantime, <b>CoDisconnectObject</b> sets a flag that causes any new marshaled calls to return CO_E_OBJNOTCONNECTED.
     * @param {Pointer<IUnknown>} pUnk A pointer to any interface derived from <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> on the object to be disconnected.
     * @returns {Integer} This function returns S_OK to indicate that all connections to remote processes were successfully deleted.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-codisconnectobject
     * @since windows5.0
     */
    static CoDisconnectObject(pUnk) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("OLE32.dll\CoDisconnectObject", "ptr", pUnk, "uint", dwReserved, "int")
        return result
    }

    /**
     * Called either to lock an object to ensure that it stays in memory, or to release such a lock.
     * @remarks
     * The <b>CoLockObjectExternal</b> function must be called in the process in which the object actually resides (the EXE process, not the process in which handlers may be loaded). 
     * 
     * 
     * 
     * The <b>CoLockObjectExternal</b> function prevents the reference count of an object from going to zero, thereby "locking" it into existence until the lock is released. The same function (with different parameters) releases the lock. The lock is implemented by having the system call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a> on the object. The system then waits to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on the object until a later call to <b>CoLockObjectExternal</b> with <i>fLock</i> set to <b>FALSE</b>. This function can be used to maintain a reference count on the object on behalf of the end user, because it acts outside of the object, as does the user.
     * 
     * The end user has explicit control over the lifetime of an application, even if there are external locks on it. That is, if a user decides to close the application, it must shut down. In the presence of external locks (such as the lock set by <b>CoLockObjectExternal</b>), the application can call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-codisconnectobject">CoDisconnectObject</a> function to force these connections to close prior to shutdown.
     * 
     * 
     * Calling <b>CoLockObjectExternal</b> sets a strong lock on an object. A strong lock keeps an object in memory, while a weak lock does not. Strong locks are required, for example, during a silent update to an OLE embedding. The embedded object's container must remain in memory until the update process is complete. There must also be a strong lock on an application object to ensure that the application stays alive until it has finished providing services to its clients. All external references place a strong reference lock on an object.
     * 
     * 
     * 
     * The <b>CoLockObjectExternal</b> function is typically called in the following situations: 
     * 
     * <ul>
     * <li>
     * Object servers should call <b>CoLockObjectExternal</b> with both <i>fLock</i> and <i>fLastLockReleases</i> set to <b>TRUE</b> when they become visible. This call creates a strong lock on behalf of the user. When the application is closing, free the lock with a call to <b>CoLockObjectExternal</b>, setting <i>fLock</i> to <b>FALSE</b> and <i>fLastLockReleases</i> to <b>TRUE</b>.
     * 
     * </li>
     * <li>
     * A call to <b>CoLockObjectExternal</b> on the server can also be used in the implementation of <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolecontainer-lockcontainer">IOleContainer::LockContainer</a>.
     * 
     * </li>
     * </ul>
     * There are several things to be aware of when you use <b>CoLockObjectExternal</b> in the implementation of <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolecontainer-lockcontainer">LockContainer</a>. An embedded object would call <b>LockContainer</b> on its container to keep it running (to lock it) in the absence of other reasons to keep it running. When the embedded object becomes visible, the container must weaken its connection to the embedded object with a call to the <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olesetcontainedobject">OleSetContainedObject</a> function, so other connections can affect the object.
     * 
     * 
     * 
     * Unless an application manages all aspects of its application and document shutdown completely with calls to <b>CoLockObjectExternal</b>, the container must keep a private lock count in <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-iolecontainer-lockcontainer">LockContainer</a> so that it exits when the lock count reaches zero and the container is invisible. Maintaining all aspects of shutdown, and thereby avoiding keeping a private lock count, means that <b>CoLockObjectExternal</b> should be called whenever one of the following conditions occur: 
     * 
     * 
     * 
     * <ul>
     * <li>
     * A document is created and destroyed or made visible or invisible.
     * 
     * </li>
     * <li>
     * An application is started and shut down by the user.
     * 
     * </li>
     * <li>
     * A pseudo-object is created and destroyed.
     * 
     * </li>
     * </ul>
     * For debugging purposes, it may be useful to keep a count of the number of external locks (and unlocks) set on the application.
     * @param {Pointer<IUnknown>} pUnk A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the object to be locked or unlocked.
     * @param {Integer} fLock Indicates whether the object is to be locked or released. If this parameter is <b>TRUE</b>, the object is kept in memory, independent of <b>AddRef</b>/<b>Release</b> operations, registrations, or revocations. If this parameter is <b>FALSE</b>, the lock previously set with a call to this function is released.
     * @param {Integer} fLastUnlockReleases If the lock is the last reference that is supposed to keep an object alive, specify <b>TRUE</b> to release all pointers to the object (there may be other references that are not supposed to keep it alive).
     * Otherwise, specify <b>FALSE</b>.
     * 
     * If <i>fLock</i> is <b>TRUE</b>, this parameter is ignored.
     * @returns {Integer} This function can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-colockobjectexternal
     * @since windows5.0
     */
    static CoLockObjectExternal(pUnk, fLock, fLastUnlockReleases) {
        result := DllCall("OLE32.dll\CoLockObjectExternal", "ptr", pUnk, "int", fLock, "int", fLastUnlockReleases, "int")
        return result
    }

    /**
     * Determines whether a remote object is connected to the corresponding in-process object.
     * @remarks
     * The <b>CoIsHandlerConnected</b> function determines the status of a remote object. You can use it to determine when to release a remote object. You specify the remote object by giving the function a pointer to its controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface (the <i>pUnk</i> parameter). A value of <b>TRUE</b> returned from the function indicates either that the specified object is not remote, or that it is remote and is still connected to its remote handler. A value of <b>FALSE</b> returned from the function indicates that the object is remote but is no longer connected to its remote handler; in this case, the caller should respond by releasing the object.
     * @param {Pointer<IUnknown>} pUnk A pointer to the controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the remote object.
     * @returns {Integer} If the object is not remote or if it is remote and still connected, the return value is <b>TRUE</b>; otherwise, it is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-coishandlerconnected
     * @since windows5.0
     */
    static CoIsHandlerConnected(pUnk) {
        result := DllCall("OLE32.dll\CoIsHandlerConnected", "ptr", pUnk, "int")
        return result
    }

    /**
     * Creates an aggregatable object capable of context-dependent marshaling.
     * @remarks
     * The <b>CoCreateFreeThreadedMarshaler</b> function enables an object to efficiently marshal interface pointers between threads in the same process. If your objects do not support interthread marshaling, you have no need to call this function. It is intended for use by free-threaded DLL servers that must be accessed directly by all threads in a process, even those threads associated with single-threaded apartments. It custom-marshals the real memory pointer over into other apartments as a bogus "proxy" and thereby gives direct access to all callers, even if they are not free-threaded.
     * 
     * The <b>CoCreateFreeThreadedMarshaler</b> function performs the following tasks: 
     * 
     * 
     * 
     * <ol>
     * <li>Creates a free-threaded marshaler object.</li>
     * <li>Aggregates this marshaler to the object specified by the <i>punkOuter</i> parameter. This object is normally the one whose interface pointers are to be marshaled.</li>
     * </ol>
     * The aggregating object's implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imarshal">IMarshal</a> should delegate <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> calls for IID_IMarshal to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> of the free-threaded marshaler. Upon receiving a call, the free-threaded marshaler performs the following tasks: 
     * 
     * 
     * 
     * <ol>
     * <li>Checks the destination context specified by the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-comarshalinterface">CoMarshalInterface</a> function's <i>dwDestContext</i> parameter.</li>
     * <li>If the destination context is MSHCTX_INPROC, copies the interface pointer into the marshaling stream.</li>
     * <li>If the destination context is any other value, finds or creates an instance of COM's default (standard) marshaler and delegates marshaling to it.
     * </li>
     * </ol>
     * Values for <i>dwDestContext</i> come from the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-mshctx">MSHCTX</a> enumeration. MSHCTX_INPROC indicates that the interface pointer is to be marshaled between different threads in the same process. Because both threads have access to the same address space, the client thread can dereference the pointer directly rather than having to direct calls to a proxy. In all other cases, a proxy is required, so <b>CoCreateFreeThreadedMarshaler</b> delegates the marshaling job to COM's default implementation.
     * 
     * 
     * 
     * Great care should be exercised in using the <b>CoCreateFreeThreadedMarshaler</b> function. This is because the performance of objects which aggregate the free-threaded marshaler is obtained through a calculated violation of the rules of COM, with the ever-present risk of undefined behavior unless the object operates within certain restrictions. The most important restrictions are:
     * 
     * <ul>
     * <li>A free-threaded marshaler object cannot hold direct pointers to interfaces on an object that does not aggregate the free-threaded marshaler as part of its state. If the object were to use direct references to ordinary single-threaded aggregate objects, it may break their single threaded property. If the object were to use direct references to ordinary multithreaded aggregate objects, these objects can behave in ways that show no sensitivity to the needs of direct single-threaded aggregate clients. For example, these objects can spin new threads and pass parameters to the threads that are references to ordinary single-threaded aggregate objects.
     * </li>
     * <li>A free-threaded marshaler object cannot hold references to proxies to objects in other apartments. Proxies are sensitive to the threading model and can return RPC_E_WRONG_THREAD if called by the wrong client.
     * </li>
     * </ul>
     * @param {Pointer<IUnknown>} punkOuter A pointer to the aggregating object's controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>.
     * @param {Pointer<IUnknown>} ppunkMarshal Address of the pointer variable that receives the interface pointer to the aggregatable marshaler.
     * @returns {Integer} This function can return the standard return value E_OUTOFMEMORY, as well as the following value.
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
     * The marshaler was created.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cocreatefreethreadedmarshaler
     * @since windows5.0
     */
    static CoCreateFreeThreadedMarshaler(punkOuter, ppunkMarshal) {
        result := DllCall("OLE32.dll\CoCreateFreeThreadedMarshaler", "ptr", punkOuter, "ptr", ppunkMarshal, "int")
        return result
    }

    /**
     * Unloads any DLLs that are no longer in use, probably because the DLL no longer has any instantiated COM objects outstanding.
     * @remarks
     * Applications can call <b>CoFreeUnusedLibraries</b> periodically to free resources. It is most efficient to call it either at the top of a message loop or in some idle-time task. <b>CoFreeUnusedLibraries</b> internally calls <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-dllcanunloadnow">DllCanUnloadNow</a> for DLLs that implement and export that function.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cofreeunusedlibraries
     * @since windows5.0
     */
    static CoFreeUnusedLibraries() {
        DllCall("OLE32.dll\CoFreeUnusedLibraries")
    }

    /**
     * Unloads any DLLs that are no longer in use and whose unload delay has expired.
     * @remarks
     * COM supplies functions to reclaim memory held by DLLs containing components. The most commonly used function is <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cofreeunusedlibraries">CoFreeUnusedLibraries</a>. <b>CoFreeUnusedLibraries</b> does not immediately release DLLs that have no active object. There is a 10-minute delay for multithreaded apartments (MTAs) and neutral apartments (NAs). For single-threaded apartments (STAs), there is no delay.
     * 
     * 
     * 
     * The 10-minute delay for <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cofreeunusedlibraries">CoFreeUnusedLibraries</a> is to avoid multithread race conditions caused by unloading a component DLL. This default delay may be too long for many applications.
     * 
     * 
     * 
     * COM maintains a list of active DLLs that have had components loaded for the apartments that can be hosted on the thread where this function is called. When <b>CoFreeUnusedLibrariesEx</b> is called, each DLL on that list has its <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-dllcanunloadnow">DllCanUnloadNow</a> function called. If <b>DllCanUnloadNow</b> returns S_FALSE (or is not exported), this DLL is not ready to be unloaded. If <b>DllCanUnloadNow</b> returns S_OK, this DLL is moved off the active list to a "candidate-for-unloading" list.
     * 
     * 
     * 
     * Adding the DLL to the candidate-for-unloading list time-stamps the DLL <i>dwUnloadDelay</i> milliseconds from when this move occurs. When <b>CoFreeUnusedLibrariesEx</b> (or <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cofreeunusedlibraries">CoFreeUnusedLibraries</a>) is called again, at least <i>dwUnloadDelay</i> milliseconds from the call that moved the DLL to the candidate-for-unloading list, the DLL is actually freed from memory. If COM uses the component DLL while the DLL is on the candidate-for-unloading list, it is moved back to the active list.
     * 
     * 
     * 
     * Setting <i>dwUnloadDelay</i> to 0 may have unexpected consequences. The component DLL may need some time for cleanup after it returns from the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-dllcanunloadnow">DllCanUnloadNow</a> function. For example, if the DLL had its own worker threads, using a value of 0 would most likely lead to a problem because the code executing on these threads would be unmapped, caused by the unloading of the DLL before the worker threads have a chance to exit. Also, using too brief of a value for <i>dwUnloadDelay</i> can lead to performance issues because there is more overhead in reloading a DLL than letting it page out.
     * 
     * This behavior is triggered by the DLL supplying components with threading models set to Free, Neutral, or Both. For a threading model set to Apartment (or if no threading model is specified), <i>dwUnloadDelay</i> is treated as 0 because these components are tied to the single thread hosting the apartment.
     * @param {Integer} dwUnloadDelay The delay in milliseconds between the time that the DLL has stated it can be unloaded until it becomes a candidate to unload. Setting this parameter to INFINITE uses the system default delay (10 minutes). Setting this parameter to 0 forces the unloading of any DLLs without any delay.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cofreeunusedlibrariesex
     * @since windows5.1.2600
     */
    static CoFreeUnusedLibrariesEx(dwUnloadDelay) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        DllCall("OLE32.dll\CoFreeUnusedLibrariesEx", "uint", dwUnloadDelay, "uint", dwReserved)
    }

    /**
     * Disconnects all proxy connections that are being maintained on behalf of all interface pointers that point to objects in the current context.
     * @remarks
     * The <b>CoDisconnectContext</b> function is used to support unloading services in shared service hosts where you must unload your service's binaries without affecting other COM servers that are running in the same process. If you control the process lifetime and you do not unload until the process exits, the COM infrastructure will perform the necessary cleanup automatically and you do not have to call this function.
     * 
     * The <b>CoDisconnectContext</b> function enables a server to correctly disconnect all external clients of all objects in the current context. Default contexts cannot be disconnected. To use <b>CoDisconnectContext</b>, you must first create a context that can be disconnected and register your class factories for objects from which you want to disconnect within that context. You can do this with the <a href="https://docs.microsoft.com/windows/desktop/api/ctxtcall/nn-ctxtcall-icontextcallback">IContextCallback</a> interface.
     * 
     * 
     * 
     * If <b>CoDisconnectContext</b> returns RPC_E_TIMEOUT, this does not indicate that the function did not disconnect the objects, but that not all disconnections could be completed in the time specified by <i>dwTimeout</i> because of outstanding calls on the objects. All objects will be disconnected after all calls on them have been completed.
     * 
     * 
     * 
     * It is not safe to unload the DLL that hosts the service until <b>CoDisconnectContext</b> returns S_OK. If the function returns RPC_E_TIMEOUT, the service may perform other clean-up. The service must call the function until it returns S_OK, and then it can safely unload its DLL.
     * 
     * 
     * 
     * The <b>CoDisconnectContext</b> function performs the following tasks:
     * 
     * <ul>
     * <li>Calls <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-codisconnectobject">CoDisconnectObject</a> on all objects in the current context.</li>
     * <li>Blocks until all objects have been disconnected or the time-out has expired.</li>
     * </ul>
     * The <b>CoDisconnectContext</b> function has the following limitations:
     * 
     * <ul>
     * <li>Asynchronous COM calls are not supported.</li>
     * <li>In-process objects must be registered and enabled using the CLSCTX_LOCAL_SERVER flag, or they will not be disconnected.
     * </li>
     * <li>COM+ is not supported.</li>
     * <li>COM interface pointers are context-sensitive. Therefore, any interface pointer created in the context to be disconnected can only be used within that context.</li>
     * </ul>
     * @param {Integer} dwTimeout The time in milliseconds after which <b>CoDisconnectContext</b> returns even if the proxy connections for all objects have not been disconnected. INFINITE is an acceptable value for this parameter.
     * @returns {Integer} This function can return the standard return values E_FAIL, E_INVALIDARG, and E_OUTOFMEMORY, as well as the following values.
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
     * The proxy connections for all objects were successfully disconnected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_E_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not all proxy connections were successfully deleted in the time specified in <i>dwTimeout</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current context cannot be disconnected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CONTEXT_E_WOULD_DEADLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An object tried to call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-codisconnectcontext">CoDisconnectContext</a> on the context it is residing in. This would cause the function to time-out and deadlock if <i>dwTimeout</i> were set to INFINITE.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-codisconnectcontext
     * @since windows6.0.6000
     */
    static CoDisconnectContext(dwTimeout) {
        result := DllCall("OLE32.dll\CoDisconnectContext", "uint", dwTimeout, "int")
        return result
    }

    /**
     * Registers security and sets the default security values for the process.
     * @remarks
     * The <b>CoInitializeSecurity</b> function initializes the security layer and sets the specified values as the security default. If a process does not call <b>CoInitializeSecurity</b>, COM calls it automatically the first time an interface is marshaled or unmarshaled, registering the system default security. No default security packages are registered until then.
     * 
     * 
     * 
     * This function is called exactly once per process, either explicitly or implicitly. It can be called by the client, server, or both. For legacy applications and other applications that do not explicitly call <b>CoInitializeSecurity</b>, COM calls this function implicitly with values from the registry. If you set processwide security using the registry and then call <b>CoInitializeSecurity</b>, the <a href="https://docs.microsoft.com/windows/desktop/com/appid-key">AppID</a> registry values will be ignored and the <b>CoInitializeSecurity</b> values will be used.
     * 
     * <b>CoInitializeSecurity</b> can be used to override both computer-wide access permissions and application-specific access permissions, but not to override the computer-wide restriction policy.
     * 
     * 
     * 
     * If <i>pSecDesc</i> points to an AppID, the EOAC_APPID flag must be set in <i>dwCapabilities</i> and, when the EOAC_APPID flag is set, all other parameters to <b>CoInitializeSecurity</b> are ignored. <b>CoInitializeSecurity</b> looks for the authentication level under the <b>AppID</b> key in the registry and uses it to determine the default security. For more information about how the <b>AppID</b> key is used to set security, see <a href="https://docs.microsoft.com/windows/desktop/com/setting-processwide-security-through-the-registry">Setting Process-Wide Security Through the Registry</a>.
     * 
     * 
     * 
     * If <i>pSecDesc</i> is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/iaccess/nn-iaccess-iaccesscontrol">IAccessControl</a> object, the EOAC_ACCESS_CONTROL flag must be set and <i>dwAuthnLevel</i> cannot be none. The <b>IAccessControl</b> object is used to determine who can call the process. DCOM will <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> the <b>IAccessControl</b> and will <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> it when <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-couninitialize">CoUninitialize</a> is called. The state of the <b>IAccessControl</b> object should not be changed.
     * 
     * 
     * 
     * If <i>pSecDesc</i> is a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a>, neither the EOAC_APPID nor the EOAC_ACCESS_CONTROL flag can be set in <i>dwCapabilities</i>. The owner and group of the <b>SECURITY_DESCRIPTOR</b> must be set, and until DCOM supports auditing, the system ACL must be <b>NULL</b>. The access-control entries (ACEs) in the discretionary ACL (DACL) of the <b>SECURITY_DESCRIPTOR</b> are used to find out which callers are permitted to connect to the process's objects. A DACL with no ACEs allows no access, while a <b>NULL</b> DACL will allow calls from anyone. For more information on ACLs and ACEs, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-control-model">Access Control Model</a>. Applications should call <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-accesscheck">AccessCheck</a> (not <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-isvalidsecuritydescriptor">IsValidSecurityDescriptor</a>) to ensure that their <b>SECURITY_DESCRIPTOR</b> is correctly formed prior to calling <b>CoInitializeSecurity</b>.
     * 
     * 
     * 
     * Passing <i>pSecDesc</i> as <b>NULL</b> is strongly discouraged. An appropriate alternative might be to use a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> that allows Everyone. If <i>pSecDesc</i> is <b>NULL</b>, the flags in <i>dwCapabilities</i> determine how <b>CoInitializeSecurity</b> defines the access permissions that a server will use, as follows: 
     * 
     * 
     * 
     * <ul>
     * <li>If the EOAC_APPID flag is set, <b>CoInitializeSecurity</b> will look up the application's .exe name in the registry and use the AppID stored there.</li>
     * <li>If the EOAC_ACCESS_CONTROL flag is set, <b>CoInitializeSecurity</b> will return an error.
     * </li>
     * <li>If neither the EOAC_APPID flag nor the EOAC_ACCESS_CONTROL flag is set, <b>CoInitializeSecurity</b> allows all callers including Local and Remote Anonymous Users.
     * </li>
     * </ul>
     * The <b>CoInitializeSecurity</b> function returns an error if both the EOAC_APPID and EOAC_ACCESS_CONTROL flags are set in <i>dwCapabilities</i>.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} pSecDesc The access permissions that a server will use to receive calls. This parameter is used by COM only when a server calls <b>CoInitializeSecurity</b>. Its value is a pointer to one of three types: an AppID, an <a href="https://docs.microsoft.com/windows/desktop/api/iaccess/nn-iaccess-iaccesscontrol">IAccessControl</a> object, or a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a>, in absolute format. See the Remarks section for more information.
     * @param {Integer} cAuthSvc The count of entries in the <i>asAuthSvc</i> parameter. This parameter is used by COM only when a server calls <b>CoInitializeSecurity</b>. If this parameter is 0, no authentication services will be registered and the server cannot receive secure calls. A value of -1 tells COM to choose which authentication services to register, and if this is the case, the <i>asAuthSvc</i> parameter must be <b>NULL</b>. However, Schannel will never be chosen as an authentication service by the server if this parameter is -1.
     * @param {Pointer<SOLE_AUTHENTICATION_SERVICE>} asAuthSvc An array of authentication services that a server is willing to use to receive a call. This parameter is used by COM only when a server calls <b>CoInitializeSecurity</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-sole_authentication_service">SOLE_AUTHENTICATION_SERVICE</a>.
     * @param {Integer} dwAuthnLevel The default authentication level for the process. Both servers and clients use this parameter when they call <b>CoInitializeSecurity</b>. COM will fail calls that arrive with a lower authentication level. By default, all proxies will use at least this authentication level. This value should contain one of the <a href="https://docs.microsoft.com/windows/desktop/com/com-authentication-level-constants">authentication level constants</a>. By default, all calls to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> are made at this level.
     * @param {Integer} dwImpLevel The default impersonation level for proxies. The value of this parameter is used only when the process is a client. It should be a value from the <a href="https://docs.microsoft.com/windows/desktop/com/com-impersonation-level-constants">impersonation level constants</a>, except for RPC_C_IMP_LEVEL_DEFAULT, which is not for use with <b>CoInitializeSecurity</b>.
     * 
     * Outgoing calls from the client always use the impersonation level as specified. (It is not negotiated.) Incoming calls to the client can be at any impersonation level. By default, all <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> calls are made with this impersonation level, so even security-aware applications should set this level carefully. To determine which impersonation levels each authentication service supports, see the description of the authentication services in <a href="https://docs.microsoft.com/windows/desktop/com/com-and-security-packages">COM and Security Packages</a>. For more information about impersonation levels, see <a href="https://docs.microsoft.com/windows/desktop/com/impersonation">Impersonation</a>.
     * @param {Pointer<Void>} pAuthList A pointer to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-sole_authentication_list">SOLE_AUTHENTICATION_LIST</a>, which is an array of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-sole_authentication_info">SOLE_AUTHENTICATION_INFO</a> structures. This list indicates the information for each authentication service that a client can use to call a server. This parameter is used by COM only when a client calls <b>CoInitializeSecurity</b>.
     * @param {Integer} dwCapabilities Additional capabilities of the client or server, specified by setting one or more <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-eole_authentication_capabilities">EOLE_AUTHENTICATION_CAPABILITIES</a> values. Some of these value cannot be used simultaneously, and some cannot be set when particular authentication services are being used. For more information about these flags, see the Remarks section.
     * @returns {Integer} This function can return the standard return value E_INVALIDARG, as well as the following values.
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
     * Indicates success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_E_TOO_LATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializesecurity">CoInitializeSecurity</a> has already been called.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_E_NO_GOOD_SECURITY_PACKAGES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>asAuthSvc</i> parameter was not <b>NULL</b>, and none of the authentication services in the list could be registered. Check the results saved in <i>asAuthSvc</i> for authentication service–specific error codes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUT_OF_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-coinitializesecurity
     * @since windows5.0
     */
    static CoInitializeSecurity(pSecDesc, cAuthSvc, asAuthSvc, dwAuthnLevel, dwImpLevel, pAuthList, dwCapabilities) {
        static pReserved1 := 0, pReserved3 := 0 ;Reserved parameters must always be NULL

        result := DllCall("OLE32.dll\CoInitializeSecurity", "ptr", pSecDesc, "int", cAuthSvc, "ptr", asAuthSvc, "ptr", pReserved1, "uint", dwAuthnLevel, "uint", dwImpLevel, "ptr", pAuthList, "uint", dwCapabilities, "ptr", pReserved3, "int")
        return result
    }

    /**
     * Retrieves the context of the current call on the current thread.
     * @remarks
     * <b>CoGetCallContext</b> retrieves the context of the current call on the current thread. The <i>riid</i> parameter specifies the interface on the context to be retrieved. This is one of the functions provided to give the server access to any contextual information of the caller.
     * @param {Pointer<Guid>} riid Interface identifier (IID) of the call context that is being requested. If you are using the default call context supported by standard marshaling, IID_IServerSecurity is available. For COM+ applications using role-based security, IID_ISecurityCallContext is available.
     * @param {Pointer<Void>} ppInterface Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *<i>ppInterface</i> contains the requested interface pointer.
     * @returns {Integer} This function can return the following values.
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
     * The context was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call context does not support the interface specified by <i>riid</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cogetcallcontext
     * @since windows5.0
     */
    static CoGetCallContext(riid, ppInterface) {
        result := DllCall("OLE32.dll\CoGetCallContext", "ptr", riid, "ptr", ppInterface, "int")
        return result
    }

    /**
     * Retrieves the authentication information the client uses to make calls on the specified proxy.
     * @remarks
     * <b>CoQueryProxyBlanket</b> is called by the client to retrieve the authentication information COM will use on calls made from the specified proxy. This function encapsulates the following sequence of common calls (error handling excluded):
     * 
     * 
     * 
     * 
     * ``` syntax
     * pProxy-&gt;QueryInterface(IID_IClientSecurity, (void**)&amp;pcs);
     * pcs-&gt;QueryBlanket(
     *     pProxy, pAuthnSvc, pAuthzSvc, pServerPrincName, pAuthnLevel, pImpLevel, ppAuthInfo, pCapabilities
     *   );
     * pcs-&gt;Release();
     * 
     * ```
     * 
     * This sequence calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the proxy to get a pointer to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iclientsecurity">IClientSecurity</a>, and with the resulting pointer, calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iclientsecurity-queryblanket">IClientSecurity::QueryBlanket</a> and then releases the pointer.
     * 
     * In <i>pProxy</i>, you can pass any proxy, such as a proxy you get through a call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> or <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-counmarshalinterface">CoUnmarshalInterface</a>, or you can pass an interface pointer. It can be any interface. You cannot pass a pointer to something that is not a proxy. Therefore, you can't pass a pointer to an interface that has the local keyword in its interface definition because no proxy is created for such an interface. <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> is the exception to this rule.
     * @param {Pointer<IUnknown>} pProxy A pointer indicating the proxy to query. This parameter cannot be <b>NULL</b>. For more information, see the Remarks section.
     * @param {Pointer<UInt32>} pwAuthnSvc A pointer to a variable that receives the current authentication service. This will be a single value taken from the <a href="https://docs.microsoft.com/windows/desktop/com/com-authentication-service-constants">authentication service constants</a>. This parameter cannot be <b>NULL</b>.
     * @param {Pointer<UInt32>} pAuthzSvc A pointer to a variable that receives the current authorization service. This will be a single value taken from the <a href="https://docs.microsoft.com/windows/desktop/com/com-authorization-constants">authorization constants</a>. If the caller specifies <b>NULL</b>, the current authorization service is not retrieved.
     * @param {Pointer<PWSTR>} pServerPrincName The current principal name. The string will be allocated by the callee using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>, and must be freed by the caller using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>. The EOAC_MAKE_FULLSIC flag is not accepted in the <i>pCapabilities</i> parameter. For more information about the msstd and fullsic forms, see <a href="https://docs.microsoft.com/windows/desktop/Rpc/principal-names">Principal Names</a>. If the caller specifies <b>NULL</b>, the current principal name is not retrieved.
     * @param {Pointer<UInt32>} pAuthnLevel A pointer to a variable that receives the current authentication level. This will be a single value taken from the <a href="https://docs.microsoft.com/windows/desktop/com/com-authentication-level-constants">authentication level constants</a>. If the caller specifies <b>NULL</b>, the current authentication level is not retrieved.
     * @param {Pointer<UInt32>} pImpLevel A pointer to a variable that receives the current impersonation level. This will be a single value taken from the <a href="https://docs.microsoft.com/windows/desktop/com/com-impersonation-level-constants">impersonation level constants</a>. If the caller specifies <b>NULL</b>, the current impersonation level is not retrieved.
     * @param {Pointer<Void>} pAuthInfo A pointer to a handle that receives the identity of the client that was passed to the last <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iclientsecurity-setblanket">IClientSecurity::SetBlanket</a> call (or the default value). Default values are only valid until the proxy is released. If the caller specifies <b>NULL</b>, the client identity is not retrieved. The format of the structure that the handle refers to depends on the authentication service. The application should not write or free the memory. For NTLMSSP and Kerberos, if the client specified a structure in the <i>pAuthInfo</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializesecurity">CoInitializeSecurity</a>, that value is returned. For Schannel, if a certificate for the client could be retrieved from the certificate manager, that value is returned here. Otherwise, <b>NULL</b> is returned. See <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-auth-identity-handle">RPC_AUTH_IDENTITY_HANDLE</a>.
     * @param {Pointer<UInt32>} pCapabilites A pointer to a variable that receives the capabilities of the proxy. If the caller specifies <b>NULL</b>, the current capability flags are not retrieved.
     * @returns {Integer} This function can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-coqueryproxyblanket
     * @since windows5.0
     */
    static CoQueryProxyBlanket(pProxy, pwAuthnSvc, pAuthzSvc, pServerPrincName, pAuthnLevel, pImpLevel, pAuthInfo, pCapabilites) {
        pServerPrincName := pServerPrincName is String? StrPtr(pServerPrincName) : pServerPrincName

        result := DllCall("OLE32.dll\CoQueryProxyBlanket", "ptr", pProxy, "ptr", pwAuthnSvc, "ptr", pAuthzSvc, "ptr", pServerPrincName, "ptr", pAuthnLevel, "ptr", pImpLevel, "ptr", pAuthInfo, "ptr", pCapabilites, "int")
        return result
    }

    /**
     * Sets the authentication information that will be used to make calls on the specified proxy.
     * @remarks
     * <b>CoSetProxyBlanket</b> sets the authentication information that will be used to make calls on the specified proxy. This function encapsulates the following sequence of common calls (error handling excluded).
     * 
     * 
     * ``` syntax
     *     pProxy-&gt;QueryInterface(IID_IClientSecurity, (void**)&amp;pcs);
     *     pcs-&gt;SetBlanket(pProxy, dwAuthnSvc, dwAuthzSvc, pServerPrincName, 
     *         dwAuthnLevel, dwImpLevel, pAuthInfo, dwCapabilities);
     *     pcs-&gt;Release();
     * 
     * ```
     * 
     * This sequence calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the proxy to get a pointer to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iclientsecurity">IClientSecurity</a>, and with the resulting pointer, calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iclientsecurity-setblanket">IClientSecurity::SetBlanket</a> and then releases the pointer.
     * @param {Pointer<IUnknown>} pProxy The proxy to be set.
     * @param {Integer} dwAuthnSvc The authentication service to be used. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/com/com-authentication-service-constants">Authentication Service Constants</a>. Use RPC_C_AUTHN_NONE if no authentication is required. If RPC_C_AUTHN_DEFAULT is specified, DCOM will pick an authentication service following its normal security blanket negotiation algorithm.
     * @param {Integer} dwAuthzSvc The authorization service to be used. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/com/com-authorization-constants">Authorization Constants</a>. If RPC_C_AUTHZ_DEFAULT is specified, DCOM will pick an authorization service following its normal security blanket negotiation algorithm. RPC_C_AUTHZ_NONE should be used as the authorization service if NTLMSSP, Kerberos, or Schannel is used as the authentication service.
     * @param {Pointer<PWSTR>} pServerPrincName The server principal name to be used with the authentication service. If COLE_DEFAULT_PRINCIPAL is specified, DCOM will pick a principal name using its security blanket negotiation algorithm. If Kerberos is used as the authentication service, this value must not be <b>NULL</b>. It must be the correct principal name of the server or the call will fail.
     * 
     * If Schannel is used as the authentication service, this value must be one of the msstd or fullsic forms described in <a href="https://docs.microsoft.com/windows/desktop/Rpc/principal-names">Principal Names</a>, or <b>NULL</b> if you do not want mutual authentication.
     * 
     * Generally, specifying <b>NULL</b> will not reset the server principal name on the proxy; rather, the previous setting will be retained. You must be careful when using <b>NULL</b> as <i>pServerPrincName</i> when selecting a different authentication service for the proxy, because there is no guarantee that the previously set principal name would be valid for the newly selected authentication service.
     * @param {Integer} dwAuthnLevel The authentication level to be used. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/com/com-authentication-level-constants">Authentication Level Constants</a>. If RPC_C_AUTHN_LEVEL_DEFAULT is specified, DCOM will pick an authentication level following its normal security blanket negotiation algorithm. If this value is none, the authentication service must also be none.
     * @param {Integer} dwImpLevel The impersonation level to be used. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/com/com-impersonation-level-constants">Impersonation Level Constants</a>. If RPC_C_IMP_LEVEL_DEFAULT is specified, DCOM will pick an impersonation level following its normal security blanket negotiation algorithm. If NTLMSSP is the authentication service, this value must be RPC_C_IMP_LEVEL_IMPERSONATE or RPC_C_IMP_LEVEL_IDENTIFY. NTLMSSP also supports delegate-level impersonation (RPC_C_IMP_LEVEL_DELEGATE) on the same computer. If Schannel is the authentication service, this parameter must be RPC_C_IMP_LEVEL_IMPERSONATE.
     * @param {Pointer<Void>} pAuthInfo A pointer to an <b>RPC_AUTH_IDENTITY_HANDLE</b> value that establishes the identity of the client. The format of the structure referred to by the handle depends on the provider of the authentication service.
     * 
     * For calls on the same computer, RPC logs on the user with the supplied credentials and uses the resulting token for the method call. 
     * 
     * For NTLMSSP or Kerberos, the structure is a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> or <a href="https://docs.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_winnt_auth_identity_ex2">SEC_WINNT_AUTH_IDENTITY_EX</a> structure.  The client can discard  <i>pAuthInfo</i> after calling the API. RPC does not keep a copy of the <i>pAuthInfo</i> pointer, and the client cannot retrieve it later in the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coqueryproxyblanket">CoQueryProxyBlanket</a> method. 
     * 
     * If this parameter is <b>NULL</b>, DCOM uses the current proxy identity (which is either the process token or the impersonation token). If the handle refers to a structure, that identity is used.
     * 
     * For Schannel, this parameter must be either a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that contains the client's X.509 certificate or is <b>NULL</b> if the client wishes to make an anonymous connection to the server. If a certificate is specified, the caller must not free it as long as any proxy to the object exists in the current apartment.
     * 
     * For Snego, this member is either <b>NULL</b>, points to a <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY</a> structure, or points to a <a href="https://docs.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_winnt_auth_identity_ex2">SEC_WINNT_AUTH_IDENTITY_EX</a> structure. If it is <b>NULL</b>, Snego will pick a list of authentication services based on those available on the client computer. If it points to a <b>SEC_WINNT_AUTH_IDENTITY_EX</b> structure, the structure's <b>PackageList</b> member must point to a string containing a comma-separated list of authentication service names and the <b>PackageListLength</b> member must give the number of bytes in the <b>PackageList</b> string. If <b>PackageList</b> is <b>NULL</b>, all calls using Snego will fail.
     * 
     * If COLE_DEFAULT_AUTHINFO is specified for this parameter, DCOM will pick the authentication information following its normal security blanket negotiation algorithm.
     * 
     * <b>CoSetProxyBlanket</b> will fail if <i>pAuthInfo</i> is set and one of the cloaking flags is set in the <i>dwCapabilities</i> parameter.
     * @param {Integer} dwCapabilities The capabilities of this proxy. For a list of possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-eole_authentication_capabilities">EOLE_AUTHENTICATION_CAPABILITIES</a> enumeration. The only flags that can be set through this function are EOAC_MUTUAL_AUTH, EOAC_STATIC_CLOAKING, EOAC_DYNAMIC_CLOAKING, EOAC_ANY_AUTHORITY (this flag is deprecated), EOAC_MAKE_FULLSIC, and EOAC_DEFAULT. Either EOAC_STATIC_CLOAKING or EOAC_DYNAMIC_CLOAKING can be set if <i>pAuthInfo</i> is not set and Schannel is not the authentication service. (See <a href="https://docs.microsoft.com/windows/desktop/com/cloaking">Cloaking</a> for more information.) If any capability flags other than those mentioned here are set, <b>CoSetProxyBlanket</b> will fail.
     * @returns {Integer} This function can return the following values.
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
     * The function was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cosetproxyblanket
     * @since windows5.0
     */
    static CoSetProxyBlanket(pProxy, dwAuthnSvc, dwAuthzSvc, pServerPrincName, dwAuthnLevel, dwImpLevel, pAuthInfo, dwCapabilities) {
        pServerPrincName := pServerPrincName is String? StrPtr(pServerPrincName) : pServerPrincName

        result := DllCall("OLE32.dll\CoSetProxyBlanket", "ptr", pProxy, "uint", dwAuthnSvc, "uint", dwAuthzSvc, "ptr", pServerPrincName, "uint", dwAuthnLevel, "uint", dwImpLevel, "ptr", pAuthInfo, "uint", dwCapabilities, "int")
        return result
    }

    /**
     * Makes a private copy of the specified proxy.
     * @remarks
     * <b>CoCopyProxy</b> makes a private copy of the specified proxy. Typically, this function is called when a client needs to change the authentication information of its proxy through a call to either <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cosetproxyblanket">CoSetProxyBlanket</a> or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iclientsecurity-setblanket">IClientSecurity::SetBlanket</a> without changing this information for other clients. <b>CoSetProxyBlanket</b> affects all the users of an instance of a proxy, so creating a private copy of the proxy through a call to <b>CoCopyProxy</b> and then calling <b>CoSetProxyBlanket</b> (or <b>IClientSecurity::SetBlanket</b>) using the copy eliminates the problem.
     * 
     * This helper function encapsulates the following sequence of common calls (error handling excluded):
     * 
     * 
     * 
     * 
     * ``` syntax
     *     pProxy->QueryInterface(IID_IClientSecurity, (void**)&pcs);
     *     pcs->CopyProxy(punkProxy, ppunkCopy);
     *     pcs->Release();
     * ```
     * 
     * Local interfaces may not be copied. <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iclientsecurity">IClientSecurity</a> are examples of existing local interfaces.
     * 
     * Copies of the same proxy have a special relationship with respect to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a>. Given a proxy, a, of the IA interface of a remote object, suppose a copy of a is created, called b. In this case, calling <b>QueryInterface</b> from the b proxy for IID_IA will not retrieve the IA interface on b, but the one on a, the original proxy with the "default" security settings for the IA interface.
     * @param {Pointer<IUnknown>} pProxy A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the proxy to be copied. This parameter cannot be <b>NULL</b>.
     * @param {Pointer<IUnknown>} ppCopy Address of the pointer variable that receives the interface pointer to the copy of the proxy. This parameter cannot be <b>NULL</b>.
     * @returns {Integer} This function can return the following values.
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
     * Indicates success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cocopyproxy
     * @since windows5.0
     */
    static CoCopyProxy(pProxy, ppCopy) {
        result := DllCall("OLE32.dll\CoCopyProxy", "ptr", pProxy, "ptr", ppCopy, "int")
        return result
    }

    /**
     * Called by the server to find out about the client that invoked the method executing on the current thread.
     * @remarks
     * <b>CoQueryClientBlanket</b> is called by the server to get security information about the client that invoked the method executing on the current thread. This function encapsulates the following sequence of common calls (error handling excluded):
     * 
     * 
     * 
     * 
     * ``` syntax
     *     CoGetCallContext(IID_IServerSecurity, (void**)&amp;pss);
     *     pss-&gt;QueryBlanket(pAuthnSvc, pAuthzSvc, pServerPrincName, 
     *                 pAuthnLevel, pImpLevel, pPrivs, pCapabilities);
     *     pss-&gt;Release();
     * 
     * ```
     * 
     * This sequence calls <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetcallcontext">CoGetCallContext</a> to get a pointer to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iserversecurity">IServerSecurity</a> and, with the resulting pointer, calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iserversecurity-queryblanket">IServerSecurity::QueryBlanket</a> and then releases the pointer.
     * @param {Pointer<UInt32>} pAuthnSvc A pointer to a variable that receives the current authentication service. This will be a single value taken from the <a href="https://docs.microsoft.com/windows/desktop/com/com-authentication-service-constants">authentication service constants</a>. If the caller specifies <b>NULL</b>, the current authentication service is not retrieved.
     * @param {Pointer<UInt32>} pAuthzSvc A pointer to a variable that receives the current authorization service. This will be a single value taken from the <a href="https://docs.microsoft.com/windows/desktop/com/com-authorization-constants">authorization constants</a>. If the caller specifies <b>NULL</b>, the current authorization service is not retrieved.
     * @param {Pointer<PWSTR>} pServerPrincName The current principal name. The string will be allocated by the callee using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>, and must be freed by the caller using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>. By default, Schannel principal names will be in the msstd form. The fullsic form will be returned if EOAC_MAKE_FULLSIC is specified in the <i>pCapabilities</i> parameter. For more information about the msstd and fullsic forms, see <a href="https://docs.microsoft.com/windows/desktop/Rpc/principal-names">Principal Names</a>. If the caller specifies <b>NULL</b>, the current principal name is not retrieved.
     * @param {Pointer<UInt32>} pAuthnLevel A pointer to a variable that receives the current authentication level. This will be a single value taken from the <a href="https://docs.microsoft.com/windows/desktop/com/com-authentication-level-constants">authentication level constants</a>. If the caller specifies <b>NULL</b>, the current authentication level is not retrieved.
     * @param {Pointer<UInt32>} pImpLevel This parameter must be <b>NULL</b>.
     * @param {Pointer<Void>} pPrivs A pointer to a handle that receives the privilege information for the client application. The format of the structure that the handle refers to depends on the authentication service. The application should not write or free the memory. The information is valid only for the duration of the current call. For NTLMSSP and Kerberos, this is a string identifying the client principal. For Schannel, this is a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that represents the client's certificate. If the client has no certificate, <b>NULL</b> is returned. If the caller specifies <b>NULL</b>, the current privilege information is not retrieved. See <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-authz-handle">RPC_AUTHZ_HANDLE</a>.
     * @param {Pointer<UInt32>} pCapabilities A pointer to return flags indicating capabilities of the call. To request that the principal name be returned in fullsic form if Schannel is the authentication service, the caller can set the EOAC_MAKE_FULLSIC flag in this parameter. If the caller specifies <b>NULL</b>, the current capabilities are not retrieved.
     * @returns {Integer} This function can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-coqueryclientblanket
     * @since windows5.0
     */
    static CoQueryClientBlanket(pAuthnSvc, pAuthzSvc, pServerPrincName, pAuthnLevel, pImpLevel, pPrivs, pCapabilities) {
        pServerPrincName := pServerPrincName is String? StrPtr(pServerPrincName) : pServerPrincName

        result := DllCall("OLE32.dll\CoQueryClientBlanket", "ptr", pAuthnSvc, "ptr", pAuthzSvc, "ptr", pServerPrincName, "ptr", pAuthnLevel, "ptr", pImpLevel, "ptr", pPrivs, "ptr", pCapabilities, "int")
        return result
    }

    /**
     * Enables the server to impersonate the client of the current call for the duration of the call.
     * @remarks
     * This method allows the server to impersonate the client of the current call for the duration of the call. If you do not call CoRevertToSelf, COM reverts automatically for you. This function will fail unless the object is being called with RPC_C_AUTHN_LEVEL_CONNECT or higher authentication in effect (which is any authentication level except RPC_C_AUTHN_LEVEL_NONE). This function encapsulates the following sequence of common calls (error handling excluded):
     * 
     * 
     * ``` syntax
     *     CoGetCallContext(IID_IServerSecurity, (void**)&amp;pss);
     *     pss-&gt;ImpersonateClient();
     *     pss-&gt;Release();
     * 
     * ```
     * 
     * <b>CoImpersonateClient</b> encapsulates the process of getting a pointer to an instance of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iserversecurity">IServerSecurity</a> that contains data about the current call, calling its <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iserversecurity-impersonateclient">ImpersonateClient</a> method, and then releasing the pointer. One call to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coreverttoself">CoRevertToSelf</a> (or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iserversecurity-reverttoself">IServerSecurity::RevertToSelf</a>) will undo any number of  calls to impersonate the client.
     * @returns {Integer} This function supports the standard return values, including S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-coimpersonateclient
     * @since windows5.0
     */
    static CoImpersonateClient() {
        result := DllCall("OLE32.dll\CoImpersonateClient", "int")
        return result
    }

    /**
     * Restores the authentication information on a thread of execution.
     * @remarks
     * <b>CoRevertToSelf</b>, which is a helper function that calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iserversecurity-reverttoself">IServerSecurity::RevertToSelf</a>, restores the authentication information on a thread to the authentication information on the thread before impersonation began.
     * 
     * <b>CoRevertToSelf</b> encapsulates the following common sequence of calls (error handling excluded):
     * 
     * 
     * ``` syntax
     *     CoGetCallContext(IID_IServerSecurity, (void**)&amp;pss);
     *     pss-&gt;RevertToSelf();
     *     pss-&gt;Release();
     * 
     * ```
     * @returns {Integer} This function supports the standard return values, including S_OK to indicate success.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-coreverttoself
     * @since windows5.0
     */
    static CoRevertToSelf() {
        result := DllCall("OLE32.dll\CoRevertToSelf", "int")
        return result
    }

    /**
     * Retrieves a list of the authentication services registered when the process called CoInitializeSecurity.
     * @remarks
     * <b>CoQueryAuthenticationServices</b> retrieves a list of the authentication services currently registered. If the process calls <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializesecurity">CoInitializeSecurity</a>, these are the services registered through that call. If the application does not call it, <b>CoInitializeSecurity</b> is called automatically by COM, registering the default security package, the first time an interface is marshaled or unmarshaled. 
     * 
     * This function returns only the authentication services registered with <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializesecurity">CoInitializeSecurity</a>. It does not return all of the authentication services installed on the computer, but <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-enumeratesecuritypackagesa">EnumerateSecurityPackages</a> does. <b>CoQueryAuthenticationServices</b> is primarily useful for custom marshalers, to determine which principal names an application can use.
     * 
     * Different authentication services support different levels of security. For example, NTLMSSP does not support delegation or mutual authentication while Kerberos does. The application is responsible only for registering authentication services that provide the features the application needs. This function provides a way to find out which services have been registered with <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializesecurity">CoInitializeSecurity</a>.
     * @param {Pointer<UInt32>} pcAuthSvc A pointer to a variable that receives the number of entries returned in the <i>asAuthSvc</i> array.
     * @param {Pointer<SOLE_AUTHENTICATION_SERVICE>} asAuthSvc A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-sole_authentication_service">SOLE_AUTHENTICATION_SERVICE</a> structures. The list is allocated through a call to the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> function. The caller must free the list when finished with it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @returns {Integer} This function can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-coqueryauthenticationservices
     * @since windows5.0
     */
    static CoQueryAuthenticationServices(pcAuthSvc, asAuthSvc) {
        result := DllCall("OLE32.dll\CoQueryAuthenticationServices", "ptr", pcAuthSvc, "ptr", asAuthSvc, "int")
        return result
    }

    /**
     * Switches the call context object used by CoGetCallContext.
     * @remarks
     * Custom marshallers call <b>CoSwitchCallContext</b> to change the call context object used by the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetcallcontext">CoGetCallContext</a> function. Before dispatching an arriving call, custom marshallers call <b>CoSwitchCallContext</b>, specifying the new context object. After sending a reply, they must restore the original call context by calling <b>CoSwitchCallContext</b> again, this time passing a pointer to the original context object.
     * 
     * <b>CoSwitchCallContext</b> does not add a reference to the new context object. Custom marshallers must ensure that the lifetime of their context object continues throughout their call and until the call to restore the original context.  Custom marshallers should not release the value that they placed into the <i>ppOldObject</i> parameter when they set their context.
     * 
     * Call context objects provided by custom marshallers should support the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iserversecurity">IServerSecurity</a> interface.
     * @param {Pointer<IUnknown>} pNewObject A pointer to an interface on the new call context object. COM stores this pointer without adding a reference to the pointer until <b>CoSwitchCallContext</b> is called with another object. This parameter may be <b>NULL</b> if you are calling <b>CoSwitchCallContext</b> to switch back to the original call context but there was no original call context.
     * @param {Pointer<IUnknown>} ppOldObject The address of pointer variable that receives a pointer to the call context object of the call currently in progress. This value is returned so that the original call context can be restored by the custom marshaller. The returned pointer will be <b>NULL</b> if there was no call in progress.
     * @returns {Integer} This function can return the following values.
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
     * The function was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUT_OF_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-coswitchcallcontext
     * @since windows5.0
     */
    static CoSwitchCallContext(pNewObject, ppOldObject) {
        result := DllCall("OLE32.dll\CoSwitchCallContext", "ptr", pNewObject, "ptr", ppOldObject, "int")
        return result
    }

    /**
     * Creates a single uninitialized object of the class associated with a specified CLSID.
     * @remarks
     * The <b>CoCreateInstance</b> function provides a convenient shortcut by connecting to the class object associated with the specified CLSID, creating a default-initialized instance, and releasing the class object. As such, it encapsulates the following functionality:
     * 
     * 
     * ``` syntax
     * CoGetClassObject(rclsid, dwClsContext, NULL, IID_IClassFactory, &pCF); 
     * hresult = pCF->CreateInstance(pUnkOuter, riid, ppvObj);
     * pCF->Release(); 
     * 
     * ```
     * 
     * It is convenient to use <b>CoCreateInstance</b> when you need to create only a single instance of an object on the local machine. If you are creating an instance on remote computer, call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstanceex">CoCreateInstanceEx</a>. When you are creating multiple instances, it is more efficient to obtain a pointer to the class object's <a href="https://docs.microsoft.com/windows/desktop/api/unknwnbase/nn-unknwnbase-iclassfactory">IClassFactory</a> interface and use its methods as needed. In the latter case, you should use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetclassobject">CoGetClassObject</a> function.
     * 
     * In the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-clsctx">CLSCTX</a> enumeration, you can specify the type of server used to manage the object. The constants can be CLSCTX_INPROC_SERVER, CLSCTX_INPROC_HANDLER, CLSCTX_LOCAL_SERVER, CLSCTX_REMOTE_SERVER or any combination of these values. The constant CLSCTX_ALL is defined as the combination of all four. For more information about the use of one or a combination of these constants, see <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-clsctx">CLSCTX</a>.
     * @param {Pointer<Guid>} rclsid The CLSID associated with the data and code that will be used to create the object.
     * @param {Pointer<IUnknown>} pUnkOuter If <b>NULL</b>, indicates that the object is not being created as part of an aggregate. If non-<b>NULL</b>, pointer to the aggregate object's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface (the controlling <b>IUnknown</b>).
     * @param {Integer} dwClsContext Context in which the code that manages the newly created object will run. The values are taken from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-clsctx">CLSCTX</a>.
     * @param {Pointer<Guid>} riid A reference to the identifier of the interface to be used to communicate with the object.
     * @param {Pointer<Void>} ppv Address of pointer variable that receives the interface pointer requested in <i>riid</i>. Upon successful return, *<i>ppv</i> contains the requested interface pointer. Upon failure, *<i>ppv</i> contains <b>NULL</b>.
     * @returns {Integer} This function can return the following values.
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
     * An instance of the specified object class was successfully created.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>REGDB_E_CLASSNOTREG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A specified class is not registered in the registration database. Also can indicate that the type of server you requested in the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-clsctx">CLSCTX</a> enumeration is not registered or the values for the server types in the registry are corrupt.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CLASS_E_NOAGGREGATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This class cannot be created as part of an aggregate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified class does not implement the requested interface, or the controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> does not expose the requested interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>ppv</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cocreateinstance
     * @since windows5.0
     */
    static CoCreateInstance(rclsid, pUnkOuter, dwClsContext, riid, ppv) {
        result := DllCall("OLE32.dll\CoCreateInstance", "ptr", rclsid, "ptr", pUnkOuter, "uint", dwClsContext, "ptr", riid, "ptr", ppv, "int")
        return result
    }

    /**
     * Creates an instance of a specific class on a specific computer.
     * @remarks
     * <b>CoCreateInstanceEx</b> creates a single uninitialized object associated with the given CLSID on a specified remote computer. This is an extension of the function <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a>, which creates an object on the local computer only. In addition, rather than requesting a single interface and obtaining a single pointer to that interface, <b>CoCreateInstanceEx</b> makes it possible to specify an array of structures, each pointing to an interface identifier (IID) on input, and, on return, containing (if available) a pointer to the requested interface and the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> call for that interface. This permits fewer round trips between computers.
     * 
     * This function encapsulates three calls: first, to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetclassobject">CoGetClassObject</a> to connect to the class object associated with the specified CLSID, specifying the location of the class; second, to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iclassfactory-createinstance">IClassFactory::CreateInstance</a> to create an uninitialized instance, and finally, to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IClassFactory::Release</a>, to release the class object. 
     * 
     * 
     * 
     * The object so created must still be initialized through a call to one of the initialization interfaces (such as <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststorage-load">IPersistStorage::Load</a>). Two functions, <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-cogetinstancefromfile">CoGetInstanceFromFile</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-cogetinstancefromistorage">CoGetInstanceFromIStorage</a> encapsulate both the instance creation and initialization from the obvious sources.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-coserverinfo">COSERVERINFO</a> structure passed as the <i>pServerInfo</i> parameter contains the security settings that COM will use when creating a new instance of the specified object. Note that this parameter does not influence the security settings used when making method calls on the instantiated object. Those security settings are configurable, on a per-interface basis, with the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cosetproxyblanket">CoSetProxyBlanket</a> function. Also see, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iclientsecurity-setblanket">IClientSecurity::SetBlanket</a>.
     * @param {Pointer<Guid>} Clsid The CLSID of the object to be created.
     * @param {Pointer<IUnknown>} punkOuter If this parameter non-<b>NULL</b>, indicates the instance is being created as part of an aggregate, and <i>punkOuter</i> is to be used as the new instance's controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>. Aggregation is currently not supported cross-process or cross-computer. When instantiating an object out of process, CLASS_E_NOAGGREGATION will be returned if <i>punkOuter</i> is non-<b>NULL</b>.
     * @param {Integer} dwClsCtx A value from the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-clsctx">CLSCTX</a> enumeration.
     * @param {Pointer<COSERVERINFO>} pServerInfo Information about the computer on which to instantiate the object. See <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-coserverinfo">COSERVERINFO</a>. This parameter can be <b>NULL</b>, in which case the object is instantiated on the local computer or at the computer specified in the registry under the class's <a href="https://docs.microsoft.com/windows/desktop/com/remoteservername">RemoteServerName</a> value, according to the interpretation of the <i>dwClsCtx</i> parameter.
     * @param {Integer} dwCount The number of structures in <i>pResults</i>. This value must be greater than 0.
     * @param {Pointer<MULTI_QI>} pResults An array of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-multi_qi">MULTI_QI</a> structures. Each structure has three members: the identifier for a requested interface (<b>pIID</b>), the location to return the interface pointer (<b>pItf</b>) and the return value of the call to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> (<b>hr</b>).
     * @returns {Integer} This function can return the standard return value E_INVALIDARG, as well as the following values.
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
     * Indicates success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>REGDB_E_CLASSNOTREG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A specified class is not registered in the registration database. Also can indicate that the type of server you requested in the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-clsctx">CLSCTX</a> enumeration is not registered or the values for the server types in the registry are corrupt.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CLASS_E_NOAGGREGATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This class cannot be created as part of an aggregate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_S_NOTALLINTERFACES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one, but not all of the interfaces requested in the <i>pResults</i> array were successfully retrieved. The <b>hr</b> member of each of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-multi_qi">MULTI_QI</a> structures in <i>pResults</i> indicates with S_OK or E_NOINTERFACE whether the specific interface was returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * None of the interfaces requested in the <i>pResults</i> array were successfully retrieved.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cocreateinstanceex
     * @since windows5.0
     */
    static CoCreateInstanceEx(Clsid, punkOuter, dwClsCtx, pServerInfo, dwCount, pResults) {
        result := DllCall("OLE32.dll\CoCreateInstanceEx", "ptr", Clsid, "ptr", punkOuter, "uint", dwClsCtx, "ptr", pServerInfo, "uint", dwCount, "ptr", pResults, "int")
        return result
    }

    /**
     * Creates an instance of a specific class on a specific computer from within an app container.
     * @remarks
     * The <b>CoCreateInstanceFromApp</b> function is the same as the  <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstanceex">CoCreateInstanceEx</a> function, with the following differences.
     * 
     * 
     * <ul>
     * <li>The <b>CoCreateInstanceFromApp</b> function reads class registrations only from application contexts, and from the HKLM\SOFTWARE\Classes\CLSID registry hive.</li>
     * <li>Only built-in classes that are supported in the app container are supplied. Attempts to activate unsupported classes, including all classes installed by 3rd-party code as well as many Windows classes, result in error code <b>REGDB_E_CLASSNOTREG</b>.</li>
     * <li>The <b>CoCreateInstanceFromApp</b> function is available to Windows Store apps. Desktop applications can call this function, but they have the same restrictions as Windows Store apps.</li>
     * </ul>
     * @param {Pointer<Guid>} Clsid The CLSID of the object to be created.
     * @param {Pointer<IUnknown>} punkOuter If this parameter non-<b>NULL</b>, indicates the instance is being created as part of an aggregate, and <i>punkOuter</i> is to be used as the new instance's controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>. Aggregation is currently not supported cross-process or cross-computer. When instantiating an object out of process, CLASS_E_NOAGGREGATION will be returned if <i>punkOuter</i> is non-<b>NULL</b>.
     * @param {Integer} dwClsCtx A value from the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-clsctx">CLSCTX</a> enumeration.
     * @param {Pointer<Void>} reserved Reserved for future use.
     * @param {Integer} dwCount The number of structures in <i>pResults</i>. This value must be greater than 0.
     * @param {Pointer<MULTI_QI>} pResults An array of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-multi_qi">MULTI_QI</a> structures. Each structure has three members: the identifier for a requested interface (<b>pIID</b>), the location to return the interface pointer (<b>pItf</b>) and the return value of the call to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> (<b>hr</b>).
     * @returns {Integer} This function can return the standard return value E_INVALIDARG, as well as the following values.
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
     * Indicates success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>REGDB_E_CLASSNOTREG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A specified class is not registered in the registration database, or the class is not supported in the app container. Also can indicate that the type of server you requested in the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-clsctx">CLSCTX</a> enumeration is not registered or the values for the server types in the registry are corrupt. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CLASS_E_NOAGGREGATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This class cannot be created as part of an aggregate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_S_NOTALLINTERFACES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * At least one, but not all of the interfaces requested in the <i>pResults</i> array were successfully retrieved. The <b>hr</b> member of each of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-multi_qi">MULTI_QI</a> structures in <i>pResults</i> indicates with S_OK or E_NOINTERFACE whether the specific interface was returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * None of the interfaces requested in the <i>pResults</i> array were successfully retrieved.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cocreateinstancefromapp
     * @since windows8.0
     */
    static CoCreateInstanceFromApp(Clsid, punkOuter, dwClsCtx, reserved, dwCount, pResults) {
        result := DllCall("OLE32.dll\CoCreateInstanceFromApp", "ptr", Clsid, "ptr", punkOuter, "uint", dwClsCtx, "ptr", reserved, "uint", dwCount, "ptr", pResults, "int")
        return result
    }

    /**
     * Registers a process-wide filter to process activation requests.
     * @remarks
     * This registers one and only one process-wide filter.
     * @param {Pointer<IActivationFilter>} pActivationFilter Pointer to the filter to register.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-coregisteractivationfilter
     * @since windows5.1.2600
     */
    static CoRegisterActivationFilter(pActivationFilter) {
        result := DllCall("OLE32.dll\CoRegisterActivationFilter", "ptr", pActivationFilter, "int")
        return result
    }

    /**
     * Obtains a pointer to a call control interface, normally ICancelMethodCalls, on the cancel object corresponding to an outbound COM method call pending on the same or another client thread.
     * @remarks
     * If two or more calls are pending on the same thread through nested calls, the thread ID may not be sufficient to identify the call to be canceled. In this case, <b>CoGetCancelObject</b> returns a cancel interface corresponding to the innermost call that is pending on the thread and has registered a cancel object.
     * 
     * This function does not locate cancel objects for asynchronous calls.
     * @param {Integer} dwThreadId The identifier of the thread on which the pending COM call is to be canceled. If this parameter is 0, the call is on the current thread.
     * @param {Pointer<Guid>} iid The globally unique identifier of an interface on the cancel object for the call to be canceled. This argument is usually IID_ICancelMethodCalls.
     * @param {Pointer<Void>} ppUnk Receives the address of a pointer to the interface specified by <i>riid</i>.
     * @returns {Integer} This function can return the standard return values E_FAIL, E_INVALIDARG, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
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
     * The call control object was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object on which the call is executing does not support the interface specified by <i>riid</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cogetcancelobject
     * @since windows5.0
     */
    static CoGetCancelObject(dwThreadId, iid, ppUnk) {
        result := DllCall("OLE32.dll\CoGetCancelObject", "uint", dwThreadId, "ptr", iid, "ptr", ppUnk, "int")
        return result
    }

    /**
     * Sets (registers) or resets (unregisters) a cancel object for use during subsequent cancel operations on the current thread.
     * @remarks
     * For objects that support standard marshaling, the proxy object begins marshaling a method call by calling <b>CoSetCancelObject</b> to register a cancel object for the current thread.
     * 
     * <b>CoSetCancelObject</b> calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> for <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-icancelmethodcalls">ICancelMethodCalls</a> on the cancel object. If the cancel object does not implement <b>ICancelMethodCalls</b>, <b>CoSetCancelObject</b> fails with E_NOINTERFACE. To disable cancel operations on a custom-marshaled interface, the implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-icancelmethodcalls-cancel">ICancelMethodCalls::Cancel</a> should do nothing but return E_NOTIMPL, E_FAIL, or some other appropriate value.
     * 
     * <b>CoSetCancelObject</b> calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on objects that it registers and <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on objects that it unregisters.
     * 
     * <b>CoSetCancelObject</b> does not set or reset cancel objects for asynchronous methods.
     * @param {Pointer<IUnknown>} pUnk Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the cancel object to be set or reset on the current thread. If this parameter is <b>NULL</b>, the topmost cancel object is reset.
     * @returns {Integer} This function can return the standard return values E_FAIL, E_INVALIDARG, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
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
     * The cancel object was successfully set or reset.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cancel object cannot be set or reset at this time because of a block on cancel operations.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cosetcancelobject
     * @since windows5.0
     */
    static CoSetCancelObject(pUnk) {
        result := DllCall("OLE32.dll\CoSetCancelObject", "ptr", pUnk, "int")
        return result
    }

    /**
     * Requests cancellation of an outbound DCOM method call pending on a specified thread.
     * @remarks
     * <b>CoCancelCall</b> calls <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetcancelobject">CoGetCancelObject</a> and then <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-icancelmethodcalls-cancel">ICancelMethodCalls::Cancel</a> on the cancel object for the call being executed.
     * 
     * This function does not locate cancel objects for asynchronous calls.
     * 
     * The object server can determine if the call has been canceled by periodically calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotestcancel">CoTestCancel</a>. If the call has been canceled, the object server should clean up and return control to the client.
     * @param {Integer} dwThreadId The identifier of the thread on which the pending DCOM call is to be canceled. If this parameter is 0, the call is on the current thread.
     * @param {Integer} ulTimeout The number of seconds <b>CoCancelCall</b> waits for the server to complete the outbound call after the client requests cancellation.
     * @returns {Integer} This function can return the standard return values E_FAIL, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
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
     * The cancellation request was made.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no cancel object corresponding to the specified thread.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_CANCEL_DISABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Call cancellation is not enabled on the specified thread.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_E_CALL_COMPLETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call was completed during the timeout interval.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_E_CALL_CANCELED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call was already canceled.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cocancelcall
     * @since windows5.0
     */
    static CoCancelCall(dwThreadId, ulTimeout) {
        result := DllCall("OLE32.dll\CoCancelCall", "uint", dwThreadId, "uint", ulTimeout, "int")
        return result
    }

    /**
     * Determines whether the call being executed on the server has been canceled by the client.
     * @remarks
     * Server objects should call <b>CoTestCancel</b> at least once before returning to detect client cancellation requests. Doing so can save the server unnecessary work if the client has issued a cancellation request, and it can reduce the client's wait time if it has set the cancel timeout as RPC_C_CANCEL_INFINITE_TIMEOUT. Furthermore, if the server object detects a cancellation request before returning from a pending call, it can clean up any memory, marshaled interfaces, or handles it has created or obtained. 
     * 
     * <b>CoTestCancel</b> calls <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetcallcontext">CoGetCallContext</a> to obtain the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-icancelmethodcalls">ICancelMethodCalls</a> interface on the current cancel object and then calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-icancelmethodcalls-testcancel">ICancelMethodCalls::TestCancel</a>. Objects that implement custom marshaling should first call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coswitchcallcontext">CoSwitchCallContext</a> to install the appropriate call context object.
     * 
     * This function does not test cancellation for asynchronous calls.
     * @returns {Integer} This function can return the standard return values E_FAIL, E_INVALIDARG, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_CALLPENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call is still pending and has not yet been canceled by the client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_E_CALL_CANCELED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The call has been canceled by the client.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cotestcancel
     * @since windows5.0
     */
    static CoTestCancel() {
        result := DllCall("OLE32.dll\CoTestCancel", "int")
        return result
    }

    /**
     * Enables cancellation of synchronous calls on the calling thread.
     * @remarks
     * When call cancellation is enabled on a thread, marshaled synchronous calls from that thread to objects on the same computer can suffer serious performance degradation. By default, synchronous calls cannot be canceled, even if a cancel object is available. To enable call cancellation, you must call <b>CoEnableCallCancellation</b> first.
     * 
     * Unless you want to enable call cancellation on a thread at all times, you should pair calls to <b>CoEnableCallCancellation</b> with calls to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-codisablecallcancellation">CoDisableCallCancellation</a>. Call cancellation is disabled only if <b>CoDisableCallCancellation</b> has been called once for each time <b>CoEnableCallCancellation</b> was called successfully.
     * 
     * A call will be cancelable or not depending on the state of the thread at the time the call was made. Subsequently enabling or disabling call cancellation has no effect on any calls that are pending on the thread.
     * @returns {Integer} This function can return the standard return values S_OK, E_FAIL, E_INVALIDARG, and E_OUTOFMEMORY.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-coenablecallcancellation
     * @since windows5.0
     */
    static CoEnableCallCancellation() {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("OLE32.dll\CoEnableCallCancellation", "ptr", pReserved, "int")
        return result
    }

    /**
     * Undoes the action of a call to CoEnableCallCancellation. Disables cancellation of synchronous calls on the calling thread when all calls to CoEnableCallCancellation are balanced by calls to CoDisableCallCancellation.
     * @remarks
     * When call cancellation is enabled on a thread, marshaled synchronous calls from that thread to objects on the same computer can suffer serious performance degradation. By default, then, synchronous calls cannot be canceled, even if a cancel object is available. To enable call cancellation, you must call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coenablecallcancellation">CoEnableCallCancellation</a> first. 
     * 
     * 
     * 
     * When call cancellation is disabled, attempts to gain a pointer to a call object will fail. If the calling thread already has a pointer to a call object, calls on that object will fail.
     * 
     * Unless you want to enable call cancellation on a thread at all times, you should pair calls to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coenablecallcancellation">CoEnableCallCancellation</a> with calls to <b>CoDisableCallCancellation</b>. Call cancellation is disabled only if each successful call to <b>CoEnableCallCancellation</b> is balanced by a successful call to <b>CoDisableCallCancellation</b>. 
     * 
     * 
     * 
     * A call will be cancelable or not depending on the state of the thread at the time the call was made. Subsequently enabling or disabling call cancellation has no effect on any calls that are pending on the thread.
     * 
     * If a thread is uninitialized and then reinitialized by calls to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-couninitialize">CoUninitialize</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a>, call cancellation is disabled on the thread, even if it was enabled when the thread was uninitialized.
     * @returns {Integer} This function can return the standard return values E_FAIL, E_INVALIDARG, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
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
     * Call cancellation was successfully disabled on the thread.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_CANCEL_DISABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There have been more successful calls to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coenablecallcancellation">CoEnableCallCancellation</a> on the thread than there have been calls to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-codisablecallcancellation">CoDisableCallCancellation</a>. Cancellation is still enabled on the thread.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-codisablecallcancellation
     * @since windows5.0
     */
    static CoDisableCallCancellation() {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("OLE32.dll\CoDisableCallCancellation", "ptr", pReserved, "int")
        return result
    }

    /**
     * Converts a CLSID into a string of printable characters. Different CLSIDs always convert to different strings.
     * @remarks
     * <b>StringFromCLSID</b> calls the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-stringfromguid2">StringFromGUID2</a> function to convert a globally unique identifier (GUID) into a string of printable characters.
     * 
     * The caller is responsible for freeing the memory allocated for the string by calling the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @param {Pointer<Guid>} rclsid The CLSID to be converted.
     * @param {Pointer<PWSTR>} lplpsz The address of a pointer variable that receives a pointer to the resulting string. The string that represents <i>rclsid</i> includes enclosing braces.
     * @returns {Integer} This function can return the standard return values E_OUTOFMEMORY and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-stringfromclsid
     * @since windows5.0
     */
    static StringFromCLSID(rclsid, lplpsz) {
        lplpsz := lplpsz is String? StrPtr(lplpsz) : lplpsz

        result := DllCall("OLE32.dll\StringFromCLSID", "ptr", rclsid, "ptr", lplpsz, "int")
        return result
    }

    /**
     * Converts a string generated by the StringFromCLSID function back into the original CLSID.
     * @remarks
     * The CLSID format is <b>{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}</b>.
     * 
     * Passing the <a href="https://docs.microsoft.com/windows/win32/com/progid">ProgID</a> results in saving associated CLSID in <b>pclsid</b>. Passing <b>NULL</b> results in <b>GUID_NULL</b>.
     * @param {Pointer<PWSTR>} lpsz The zero terminated string representation of the CLSID or the <a href="https://docs.microsoft.com/windows/win32/com/progid">ProgID</a> or <b>NULL</b>.
     * @param {Pointer<Guid>} pclsid A pointer to the CLSID.
     * @returns {Integer} This function can return the standard return value E_INVALIDARG, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NOERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The CLSID was obtained successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_CLASSSTRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The class string was improperly formatted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-clsidfromstring
     * @since windows5.0
     */
    static CLSIDFromString(lpsz, pclsid) {
        lpsz := lpsz is String? StrPtr(lpsz) : lpsz

        result := DllCall("OLE32.dll\CLSIDFromString", "ptr", lpsz, "ptr", pclsid, "int")
        return result
    }

    /**
     * Converts an interface identifier into a string of printable characters.
     * @remarks
     * The caller is responsible for freeing the memory allocated for the string by calling the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @param {Pointer<Guid>} rclsid The interface identifier to be converted.
     * @param {Pointer<PWSTR>} lplpsz The address of a pointer variable that receives a pointer to the resulting string. The string that represents <i>rclsid</i> includes enclosing braces.
     * @returns {Integer} This function can return the standard return values E_OUTOFMEMORY and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-stringfromiid
     * @since windows5.0
     */
    static StringFromIID(rclsid, lplpsz) {
        lplpsz := lplpsz is String? StrPtr(lplpsz) : lplpsz

        result := DllCall("OLE32.dll\StringFromIID", "ptr", rclsid, "ptr", lplpsz, "int")
        return result
    }

    /**
     * Converts a string generated by the StringFromIID function back into the original interface identifier (IID).
     * @remarks
     * The function converts the interface identifier in a way that guarantees different interface identifiers will always be converted to different strings.
     * 
     * The IID format is <b>{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}</b>.
     * 
     * Passing <b>NULL</b> results in <b>GUID_NULL</b> value.
     * @param {Pointer<PWSTR>} lpsz A pointer to the string representation of the IID or <b>NULL</b>.
     * @param {Pointer<Guid>} lpiid A pointer to the requested IID on return.
     * @returns {Integer} This function can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-iidfromstring
     * @since windows5.0
     */
    static IIDFromString(lpsz, lpiid) {
        lpsz := lpsz is String? StrPtr(lpsz) : lpsz

        result := DllCall("OLE32.dll\IIDFromString", "ptr", lpsz, "ptr", lpiid, "int")
        return result
    }

    /**
     * Retrieves the ProgID for a given CLSID.
     * @remarks
     * Every OLE object class listed in the <b>Insert Object</b> dialog box must have a programmatic identifier (ProgID), a string that uniquely identifies a given class, stored in the registry. In addition to determining the eligibility for the <b>Insert Object</b> dialog box, the ProgID can be used as an identifier in a macro programming language to identify a class. Finally, the ProgID is also the class name used for an object of an OLE class that is placed in an OLE 1 container.
     * 
     * <b>ProgIDFromCLSID</b> uses entries in the registry to do the conversion. OLE application authors are responsible for ensuring that the registry is configured correctly in the application's setup program.
     * 
     * The ProgID string must be different than the class name of any OLE 1 application, including the OLE 1 version of the same application, if there is one. In addition, a ProgID string must not contain more than 39 characters, start with a digit, or, except for a single period, contain any punctuation (including underscores).
     * 
     * The ProgID must never be shown to the user in the user interface. If you need a short displayable string for an object, call <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-olereggetusertype">IOleObject::GetUserType</a>.
     * 
     * 
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-clsidfromprogid">CLSIDFromProgID</a> function to find the CLSID associated with a given ProgID. Be sure to free the returned ProgID  when you are finished with it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @param {Pointer<Guid>} clsid The CLSID for which the ProgID is to be requested.
     * @param {Pointer<PWSTR>} lplpszProgID The address of a pointer variable that receives the ProgID string. The string that represents <i>clsid</i> includes enclosing braces.
     * @returns {Integer} This function can return the following values.
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
     * The ProgID was returned successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>REGDB_E_CLASSNOTREG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Class not registered in the registry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>REGDB_E_READREGDB</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was an error reading from the registry.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-progidfromclsid
     * @since windows5.0
     */
    static ProgIDFromCLSID(clsid, lplpszProgID) {
        lplpszProgID := lplpszProgID is String? StrPtr(lplpszProgID) : lplpszProgID

        result := DllCall("OLE32.dll\ProgIDFromCLSID", "ptr", clsid, "ptr", lplpszProgID, "int")
        return result
    }

    /**
     * Looks up a CLSID in the registry, given a ProgID.
     * @remarks
     * Given a ProgID, <b>CLSIDFromProgID</b> looks up its associated CLSID in the registry. If the ProgID cannot be found in the registry, <b>CLSIDFromProgID</b> creates an OLE 1 CLSID for the ProgID and a CLSID entry in the registry. Because of the restrictions placed on OLE 1 CLSID values, <b>CLSIDFromProgID</b> and <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-clsidfromstring">CLSIDFromString</a> are the only two functions that can be used to generate a CLSID for an OLE 1 object.
     * @param {Pointer<PWSTR>} lpszProgID A pointer to the ProgID whose CLSID is requested.
     * @param {Pointer<Guid>} lpclsid Receives a pointer to the retrieved CLSID on return.
     * @returns {Integer} This function can return the following values.
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
     * The CLSID was retrieved successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_CLASSSTRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The registered CLSID for the ProgID is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>REGDB_E_WRITEREGDB</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred writing the CLSID to the registry. See Remarks below.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-clsidfromprogid
     * @since windows5.0
     */
    static CLSIDFromProgID(lpszProgID, lpclsid) {
        lpszProgID := lpszProgID is String? StrPtr(lpszProgID) : lpszProgID

        result := DllCall("OLE32.dll\CLSIDFromProgID", "ptr", lpszProgID, "ptr", lpclsid, "int")
        return result
    }

    /**
     * Converts a globally unique identifier (GUID) into a string of printable characters.
     * @param {Pointer<Guid>} rguid The GUID to be converted.
     * @param {Pointer<PWSTR>} lpsz A pointer to a caller-allocated string variable to receive the resulting string. The string that represents <i>rguid</i> includes enclosing braces.
     * @param {Integer} cchMax The number of characters available in the <i>lpsz</i> buffer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-stringfromguid2
     * @since windows5.0
     */
    static StringFromGUID2(rguid, lpsz, cchMax) {
        lpsz := lpsz is String? StrPtr(lpsz) : lpsz

        DllCall("OLE32.dll\StringFromGUID2", "ptr", rguid, "ptr", lpsz, "int", cchMax)
    }

    /**
     * Creates a GUID, a unique 128-bit integer used for CLSIDs and interface identifiers.
     * @remarks
     * The <b>CoCreateGuid</b> function calls the RPC function <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-uuidcreate">UuidCreate</a>, which creates a GUID, a globally unique 128-bit integer. Use <b>CoCreateGuid</b> when you need an absolutely unique number that you will use as a persistent identifier in a distributed environment. To a very high degree of certainty, this function returns a unique value – no other invocation, on the same or any other system (networked or not), should return the same value.
     * @param {Pointer<Guid>} pguid A pointer to the requested GUID.
     * @returns {Integer} <table>
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
     * The GUID was successfully created.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Errors returned by <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-uuidcreate">UuidCreate</a> are wrapped as an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cocreateguid
     * @since windows5.0
     */
    static CoCreateGuid(pguid) {
        result := DllCall("OLE32.dll\CoCreateGuid", "ptr", pguid, "int")
        return result
    }

    /**
     * Waits for specified handles to be signaled or for a specified timeout period to elapse.
     * @remarks
     * Depending on which flags are set in the dwFlags parameter, <b>CoWaitForMultipleHandles</b> blocks the calling thread until one of the following events occurs: 
     * 
     * 
     * 
     * <ul>
     * <li>One or all of the handles is signaled. In the case of mutex objects, this condition is also satisfied by a mutex being abandoned.</li>
     * <li>An asynchronous procedure call (APC) has been queued to the calling thread with a call to the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-queueuserapc">QueueUserAPC</a> function.</li>
     * <li>The timeout period expires.</li>
     * </ul>
     * If the caller resides in a single-thread apartment, <b>CoWaitForMultipleHandles</b> enters the COM modal loop, and the thread's message loop will continue to dispatch messages using the thread's message filter. If no message filter is registered for the thread, the default COM message processing is used.
     * 
     * If the calling thread resides in a multithread apartment (MTA), <b>CoWaitForMultipleHandles</b> calls the  <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-waitformultipleobjectsex">WaitForMultipleObjectsEx</a> function.
     * @param {Integer} dwFlags The wait options. Possible values are taken from the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/ne-combaseapi-cowait_flags">COWAIT_FLAGS</a> enumeration.
     * @param {Integer} dwTimeout The timeout period, in milliseconds.
     * @param {Integer} cHandles The number of elements in the <i>pHandles</i> array.
     * @param {Pointer<HANDLE>} pHandles An array of handles.
     * @param {Pointer<UInt32>} lpdwindex A pointer to a variable that, when the returned status is S_OK, receives a value indicating the event that caused the function to return. This value is usually the index into <i>pHandles</i> for the handle that was signaled.
     * 
     * If <i>pHandles</i> includes one or more handles to mutex objects, a value between WAIT_ABANDONED_0 and (WAIT_ABANDONED_0 + nCount - 1) indicates the index into <i>pHandles</i> for the mutex that was abandoned.
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/ne-combaseapi-cowait_flags">COWAIT_ALERTABLE</a> flag is set in <i>dwFlags</i>, a value of WAIT_IO_COMPLETION indicates the wait was ended by one or more user-mode asynchronous procedure calls (APC) queued to the thread.
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-waitformultipleobjectsex">WaitForMultipleObjectsEx</a> for more information.
     * @returns {Integer} This function can return the following values.
     * 
     * <div class="alert"><b>Note</b>  The return value of <b>CoWaitForMultipleHandles</b> can be nondeterministic if the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/ne-combaseapi-cowait_flags">COWAIT_ALERTABLE</a> flag is set in <i>dwFlags</i>, or if <i>pHandles</i> includes one or more handles to mutex objects. The recommended workaround is to call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError(ERROR_SUCCESS)</a> before <b>CoWaitForMultipleHandles</b>.</div>
     * <div> </div>
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
     * The required handle or handles were signaled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pHandles</i> was <b>NULL</b>, <i>lpdwindex</i> was <b>NULL</b>, or <i>dwFlags</i> was not a value from the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/ne-combaseapi-cowait_flags">COWAIT_FLAGS</a> enumeration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_E_NO_SYNC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of <i>pHandles</i> was 0.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>RPC_S_CALLPENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The timeout period elapsed before the required handle or handles were signaled.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cowaitformultiplehandles
     * @since windows5.0
     */
    static CoWaitForMultipleHandles(dwFlags, dwTimeout, cHandles, pHandles, lpdwindex) {
        result := DllCall("OLE32.dll\CoWaitForMultipleHandles", "uint", dwFlags, "uint", dwTimeout, "uint", cHandles, "ptr", pHandles, "ptr", lpdwindex, "int")
        return result
    }

    /**
     * A replacement for CoWaitForMultipleHandles. This replacement API hides the options for CoWaitForMultipleHandles that are not supported in ASTA.
     * @param {Integer} dwFlags <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/ne-combaseapi-cwmo_flags">CWMO_FLAGS</a> flag controlling whether call/window message reentrancy is enabled from this wait. By default, neither COM calls nor window messages are dispatched from <b>CoWaitForMultipleObjects</b> in ASTA.
     * @param {Integer} dwTimeout The timeout in milliseconds of the wait.
     * @param {Integer} cHandles The length of the <i>pHandles</i> array. Must be &lt;= 56.
     * @param {Pointer<HANDLE>} pHandles An array of handles to waitable kernel objects.
     * @param {Pointer<UInt32>} lpdwindex Receives the index of the handle that satisfied the wait.
     * @returns {Integer} Same return values as <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cowaitformultiplehandles">CoWaitForMultipleHandles</a>, except the ASTA-specific CO_E_NOTSUPPORTED cases instead return E_INVALIDARG from all apartment types.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cowaitformultipleobjects
     */
    static CoWaitForMultipleObjects(dwFlags, dwTimeout, cHandles, pHandles, lpdwindex) {
        result := DllCall("OLE32.dll\CoWaitForMultipleObjects", "uint", dwFlags, "uint", dwTimeout, "uint", cHandles, "ptr", pHandles, "ptr", lpdwindex, "int")
        return result
    }

    /**
     * Returns the CLSID of an object that can emulate the specified object.
     * @remarks
     * <b>CoGetTreatAsClass</b> returns the <a href="https://docs.microsoft.com/windows/desktop/com/treatas">TreatAs</a> entry in the registry for the specified object. The <b>TreatAs</b> entry, if set, is the CLSID of a registered object (an application) that can emulate the object in question. The <b>TreatAs</b> entry is set through a call to the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-cotreatasclass">CoTreatAsClass</a> function. Emulation allows an application to open and edit an object of a different format, while retaining the original format of the object. Objects of the original CLSID are activated and treated as objects of the second CLSID. When the object is saved, this may result in loss of edits not supported by the original format. If there is no <b>TreatAs</b> entry for the specified object, this function returns the CLSID of the original object (<i>clsidOld</i>).
     * @param {Pointer<Guid>} clsidOld The CLSID of the object that can be emulated (treated as) an object with a different CLSID.
     * @param {Pointer<Guid>} pClsidNew A pointer to where the CLSID that can emulate <i>clsidOld</i> objects is retrieved. This parameter cannot be <b>NULL</b>. If there is no emulation information for <i>clsidOld</i> objects, the <i>clsidOld</i> parameter is supplied.
     * @returns {Integer} This function can return the following values, as well as any error values returned by the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-clsidfromstring">CLSIDFromString</a> function.
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
     * A new CLSID was successfully returned.
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
     * There is no emulation information for the <i>clsidOld</i> parameter, so the <i>pClsidNew</i> parameter is set to <i>clsidOld</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>REGDB_E_READREGDB </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was an error reading the registry.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cogettreatasclass
     * @since windows5.0
     */
    static CoGetTreatAsClass(clsidOld, pClsidNew) {
        result := DllCall("OLE32.dll\CoGetTreatAsClass", "ptr", clsidOld, "ptr", pClsidNew, "int")
        return result
    }

    /**
     * Tells the service control manager to flush any cached RPC binding handles for the specified computer.
     * @remarks
     * The OLE Service Control Manager is used by COM to send component activation requests to other machines. To do this, the OLE Service Control Manager maintains a cache of RPC binding handles to send activation requests to computer, keyed by computer name. Under normal circumstances, this works well, but in some scenarios, such as Web farms and load-balancing situations, the ability to purge this cache of specific handles might be needed in order to facilitate rebinding to a different physical server by the same name. <b>CoInvalidateRemoteMachineBindings</b> is used for this purpose.
     * 
     * The OLE Service Control Manager will flush unused binding handles over time. It is not necessary to call <b>CoInvalidateRemoteMachineBindings</b> to do this.
     * @param {Pointer<PWSTR>} pszMachineName The computer name for which binding handles should be flushed, or an empty string to signify that all handles in the cache should be flushed.
     * @returns {Integer} This function can return the following values.
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
     * Indicates success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_S_MACHINENAMENOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the specified computer name was not found or that the binding handle cache was empty, indicating that an empty string was passed instead of a specific computer name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates the caller was not an administrator for this computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that a <b>NULL</b> value was passed for <i>pszMachineName</i>.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-coinvalidateremotemachinebindings
     * @since windows5.1.2600
     */
    static CoInvalidateRemoteMachineBindings(pszMachineName) {
        pszMachineName := pszMachineName is String? StrPtr(pszMachineName) : pszMachineName

        result := DllCall("OLE32.dll\CoInvalidateRemoteMachineBindings", "ptr", pszMachineName, "int")
        return result
    }

    /**
     * Allocates a block of task memory in the same way that IMalloc::Alloc does.
     * @remarks
     * <b>CoTaskMemAlloc</b> uses the default allocator to allocate a memory block in the same way that <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-alloc">IMalloc::Alloc</a> does. It is not necessary to call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetmalloc">CoGetMalloc</a> function before calling <b>CoTaskMemAlloc</b>.
     * 
     * The initial contents of the returned memory block are undefined – there is no guarantee that the block has been initialized. The allocated block may be larger than <i>cb</i> bytes because of the space required for alignment and for maintenance information.
     * 
     * If <i>cb</i> is 0, <b>CoTaskMemAlloc</b> allocates a zero-length item and returns a valid pointer to that item. If there is insufficient memory available, <b>CoTaskMemAlloc</b> returns <b>NULL</b>. Applications should always check the return value from this function, even when requesting small amounts of memory, because there is no guarantee that the memory will be allocated.
     * @param {Pointer} cb The size of the memory block to be allocated, in bytes.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cotaskmemalloc
     * @since windows5.0
     */
    static CoTaskMemAlloc(cb) {
        DllCall("OLE32.dll\CoTaskMemAlloc", "ptr", cb)
    }

    /**
     * Changes the size of a previously allocated block of task memory.
     * @remarks
     * This function changes the size of a previously allocated memory block in the same way that <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-realloc">IMalloc::Realloc</a> does. It is not necessary to call the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetmalloc">CoGetMalloc</a> function to get a pointer to the OLE allocator before calling <b>CoTaskMemRealloc</b>.
     * 
     * The <i>pv</i> parameter points to the beginning of the memory block. If <i>pv</i> is <b>NULL</b>, <b>CoTaskMemRealloc</b> allocates a new memory block in the same way as the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> function. If <i>pv</i> is not <b>NULL</b>, it should be a pointer returned by a prior call to <b>CoTaskMemAlloc</b>.
     * 
     * The <i>cb</i> parameter specifies the size of the new block. The contents of the block are unchanged up to the shorter of the new and old sizes, although the new block can be in a different location. Because the new block can be in a different memory location, the pointer returned by <b>CoTaskMemRealloc</b> is not guaranteed to be the pointer passed through the <i>pv</i> argument. If <i>pv</i> is not <b>NULL</b> and <i>cb</i> is 0, then the memory pointed to by <i>pv</i> is freed.
     * 
     * <b>CoTaskMemRealloc</b> returns a void pointer to the reallocated (and possibly moved) memory block. The return value is <b>NULL</b> if the size is 0 and the buffer argument is not <b>NULL</b>, or if there is not enough memory available to expand the block to the specified size. In the first case, the original block is freed; in the second case, the original block is unchanged.
     * 
     * The storage space pointed to by the return value is guaranteed to be suitably aligned for storage of any type of object. To get a pointer to a type other than <b>void</b>, use a type cast on the return value.
     * @param {Pointer<Void>} pv A pointer to the memory block to be reallocated. This parameter can be <b>NULL</b>, as discussed in Remarks.
     * @param {Pointer} cb The size of the memory block to be reallocated, in bytes. This parameter can be 0, as discussed in Remarks.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cotaskmemrealloc
     * @since windows5.0
     */
    static CoTaskMemRealloc(pv, cb) {
        DllCall("OLE32.dll\CoTaskMemRealloc", "ptr", pv, "ptr", cb)
    }

    /**
     * Frees a block of task memory previously allocated through a call to the CoTaskMemAlloc or CoTaskMemRealloc function.
     * @remarks
     * The <b>CoTaskMemFree</b> function uses the default OLE allocator.
     * 
     * The number of bytes freed equals the number of bytes that were originally allocated or reallocated. After the call, the memory block pointed to by pv is invalid and can no longer be used.
     * @param {Pointer<Void>} pv A pointer to the memory block to be freed. If this parameter is <b>NULL</b>, the function has no effect.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-cotaskmemfree
     * @since windows5.0
     */
    static CoTaskMemFree(pv) {
        DllCall("OLE32.dll\CoTaskMemFree", "ptr", pv)
    }

    /**
     * Enables a downloaded DLL to register its device catalog interfaces within its running process so that the marshaling code will be able to marshal those interfaces.
     * @param {Pointer<PWSTR>} deviceInstanceId Type: \_In\_ **[PCWSTR](/windows/desktop/winprog/windows-data-types)**
     * 
     * A null-terminated string containing the instance identifier of the device to register.
     * @param {Pointer<CO_DEVICE_CATALOG_COOKIE>} cookie Type: \_Out\_ **CO_DEVICE_CATALOG_COOKIE\***
     * 
     * Returns an instance of **CO_DEVICE_CATALOG_COOKIE**. You can use this value to revoke the device catalog using [CoRevokeDeviceCatalog](nf-combaseapi-corevokedevicecatalog.md).
     * @returns {Integer} This function can return the standard return values **E_INVALIDARG**, **E_OUTOFMEMORY**, and **S_OK**.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-coregisterdevicecatalog
     */
    static CoRegisterDeviceCatalog(deviceInstanceId, cookie) {
        deviceInstanceId := deviceInstanceId is String? StrPtr(deviceInstanceId) : deviceInstanceId

        result := DllCall("OLE32.dll\CoRegisterDeviceCatalog", "ptr", deviceInstanceId, "ptr", cookie, "int")
        return result
    }

    /**
     * Revokes the registration of a device catalog performed by a previous call to [CoRegisterDeviceCatalog](/windows/win32/api/combaseapi/nf-combaseapi-coregisterdevicecatalog).
     * @param {Pointer<CO_DEVICE_CATALOG_COOKIE>} cookie Type: \_In\_ **CO_DEVICE_CATALOG_COOKIE**
     * 
     * The **CO_DEVICE_CATALOG_COOKIE** that was returned by **CoRegisterDeviceCatalog**.
     * @returns {Integer} This function can return the standard return values **E_INVALIDARG**, **E_OUTOFMEMORY**, and **S_OK**.
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-corevokedevicecatalog
     */
    static CoRevokeDeviceCatalog(cookie) {
        result := DllCall("OLE32.dll\CoRevokeDeviceCatalog", "ptr", cookie, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pwzURI 
     * @param {Integer} dwFlags 
     * @param {Pointer<IUri>} ppURI 
     * @returns {Integer} 
     */
    static CreateUri(pwzURI, dwFlags, ppURI) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        pwzURI := pwzURI is String? StrPtr(pwzURI) : pwzURI

        result := DllCall("URLMON.dll\CreateUri", "ptr", pwzURI, "uint", dwFlags, "ptr", dwReserved, "ptr", ppURI, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pwzURI 
     * @param {Pointer<PWSTR>} pwzFragment 
     * @param {Integer} dwFlags 
     * @param {Pointer<IUri>} ppURI 
     * @returns {Integer} 
     */
    static CreateUriWithFragment(pwzURI, pwzFragment, dwFlags, ppURI) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        pwzURI := pwzURI is String? StrPtr(pwzURI) : pwzURI
        pwzFragment := pwzFragment is String? StrPtr(pwzFragment) : pwzFragment

        result := DllCall("URLMON.dll\CreateUriWithFragment", "ptr", pwzURI, "ptr", pwzFragment, "uint", dwFlags, "ptr", dwReserved, "ptr", ppURI, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PSTR>} pszANSIInputUri 
     * @param {Integer} dwEncodingFlags 
     * @param {Integer} dwCodePage 
     * @param {Integer} dwCreateFlags 
     * @param {Pointer<IUri>} ppUri 
     * @returns {Integer} 
     */
    static CreateUriFromMultiByteString(pszANSIInputUri, dwEncodingFlags, dwCodePage, dwCreateFlags, ppUri) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        pszANSIInputUri := pszANSIInputUri is String? StrPtr(pszANSIInputUri) : pszANSIInputUri

        result := DllCall("urlmon.dll\CreateUriFromMultiByteString", "ptr", pszANSIInputUri, "uint", dwEncodingFlags, "uint", dwCodePage, "uint", dwCreateFlags, "ptr", dwReserved, "ptr", ppUri, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IUri>} pIUri 
     * @param {Integer} dwFlags 
     * @param {Pointer} dwReserved 
     * @param {Pointer<IUriBuilder>} ppIUriBuilder 
     * @returns {Integer} 
     */
    static CreateIUriBuilder(pIUri, dwFlags, dwReserved, ppIUriBuilder) {
        result := DllCall("URLMON.dll\CreateIUriBuilder", "ptr", pIUri, "uint", dwFlags, "ptr", dwReserved, "ptr", ppIUriBuilder, "int")
        return result
    }

    /**
     * Sets the error information object for the current logical thread of execution.
     * @remarks
     * This function releases the existing error information object, if one exists, and sets the pointer to <i>perrinfo</i>. Use this function after creating an error object that associates the object with the current logical thread of execution.
     * 
     * If the property or method that calls <b>SetErrorInfo</b> is called by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-dispinvoke">DispInvoke</a>, then <b>DispInvoke</b> will fill the EXCEPINFO parameter with the values specified in the error information object. <b>DispInvoke</b> will return DISP_E_EXCEPTION when the property or method returns a failure return value for <b>DispInvoke</b>
     * 
     * Virtual function table (VTBL) binding controllers that do not use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nf-oaidl-idispatch-invoke">IDispatch::Invoke</a> can get the error information object by using <a href="https://docs.microsoft.com/windows/desktop/api/oleauto/nf-oleauto-geterrorinfo">GetErrorInfo</a>. This allows an object that supports a dual interface to use <b>SetErrorInfo</b>, regardless of whether the client uses VTBL binding or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a>.
     * 
     * 
     * 
     * When a cross apartment call is made COM clears out any error object.
     * 
     * 
     * 
     * Making a COM call that goes through a proxy-stub will clear any existing error object for the calling thread. A called object should not make any such calls after calling <b>SetErrorInfo</b> and before returning. The caller should not make any such calls after the call returns and before calling <a href="https://docs.microsoft.com/windows/desktop/api/oleauto/nf-oleauto-geterrorinfo">GetErrorInfo</a>. As a rule of thumb, an interface method should return as soon as possible after calling <b>SetErrorInfo</b>, and the caller should call <b>GetErrorInfo</b> as soon as possible after the call returns.
     * 
     * 
     * 
     * Entering the COM modal message loop will clear any existing error object. A called object should not enter a message loop after calling <b>SetErrorInfo</b>.
     * @param {Integer} dwReserved Reserved for future use. Must be zero.
     * @param {Pointer<IErrorInfo>} perrinfo An error object.
     * @returns {Integer} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/oleauto/nf-oleauto-seterrorinfo
     */
    static SetErrorInfo(dwReserved, perrinfo) {
        result := DllCall("OLEAUT32.dll\SetErrorInfo", "uint", dwReserved, "ptr", perrinfo, "int")
        return result
    }

    /**
     * Obtains the error information pointer set by the previous call to SetErrorInfo in the current logical thread.
     * @remarks
     * This function returns a pointer to the most recently set <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ierrorinfo">IErrorInfo</a> pointer in the current logical thread. It transfers ownership of the error object to the caller, and clears the error state for the thread.
     * 
     * Making a COM call that goes through a proxy-stub will clear any existing error object for the calling thread. A called object should not make any such calls after calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-seterrorinfo">SetErrorInfo</a> and before returning. The caller should not make any such calls after the call returns and before calling <b>GetErrorInfo</b>. As a rule of thumb, an interface method should return as soon as possible after calling <b>SetErrorInfo</b>, and the caller should call <b>GetErrorInfo</b> as soon as possible after the call returns.
     * @param {Integer} dwReserved Reserved for future use. Must be zero.
     * @param {Pointer<IErrorInfo>} pperrinfo An error object.
     * @returns {Integer} This function can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api/oleauto/nf-oleauto-geterrorinfo
     */
    static GetErrorInfo(dwReserved, pperrinfo) {
        result := DllCall("OLEAUT32.dll\GetErrorInfo", "uint", dwReserved, "ptr", pperrinfo, "int")
        return result
    }

;@endregion Methods
}
