#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HINSTANCE.ahk
#Include .\IDataAdviseHolder.ahk
#Include .\IMoniker.ahk
#Include .\IBindCtx.ahk
#Include .\IRunningObjectTable.ahk
#Include .\IBindStatusCallback.ahk
#Include .\IMalloc.ahk
#Include .\IUnknown.ahk
#Include .\IUri.ahk
#Include .\IUriBuilder.ahk
#Include .\IErrorInfo.ahk

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
     * @type {Guid}
     */
    static CLSID_GlobalOptions => Guid("{0000034b-0000-0000-c000-000000000046}")

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
    static APPIDREGFLAGS_RESERVED10 => 32768

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
     * @returns {HRESULT} This function can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
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
     * A previous call to <a href="/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> specified the concurrency model for this thread as multithread apartment (MTA). This could also indicate that a change from neutral-threaded apartment to single-threaded apartment has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-coinitialize
     * @since windows5.0
     */
    static CoInitialize() {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("OLE32.dll\CoInitialize", "ptr", pvReserved, "int")
        return result
    }

    /**
     * Registers an implementation of the IMallocSpy interface, thereafter requiring OLE to call its wrapper methods around every call to the corresponding IMalloc method.
     * @param {IMallocSpy} pMallocSpy A pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imallocspy">IMallocSpy</a> implementation.
     * @returns {HRESULT} This function can return the standard return value E_INVALIDARG, as well as the following values.
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
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-coregistermallocspy
     * @since windows5.0
     */
    static CoRegisterMallocSpy(pMallocSpy) {
        result := DllCall("OLE32.dll\CoRegisterMallocSpy", "ptr", pMallocSpy, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Revokes a registered IMallocSpy object.
     * @returns {HRESULT} This function can return the following values.
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
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-corevokemallocspy
     * @since windows5.0
     */
    static CoRevokeMallocSpy() {
        result := DllCall("OLE32.dll\CoRevokeMallocSpy", "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Registers an implementation of the IInitializeSpy interface. The IInitializeSpy interface is defied to allow developers to perform initialization and cleanup on COM apartments.
     * @param {IInitializeSpy} pSpy A pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iinitializespy">IInitializeSpy</a> implementation.
     * @returns {Integer} The address at which to store a cookie that identifies this registration.
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-coregisterinitializespy
     * @since windows5.1.2600
     */
    static CoRegisterInitializeSpy(pSpy) {
        result := DllCall("OLE32.dll\CoRegisterInitializeSpy", "ptr", pSpy, "uint*", &puliCookie := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return puliCookie
    }

    /**
     * Revokes a registered implementation of the IInitializeSpy interface.
     * @param {Integer} uliCookie A <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-ularge_integer~r1">ULARGE_INTEGER</a> cookie identifying the registration.
     * @returns {HRESULT} This function can return the standard return value E_INVALIDARG, as well as S_OK to indicate success.
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-corevokeinitializespy
     * @since windows5.0
     */
    static CoRevokeInitializeSpy(uliCookie) {
        result := DllCall("OLE32.dll\CoRevokeInitializeSpy", "uint", uliCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the default values of the Security Descriptors of the machine-wide launch and access permissions, as well as launch and access limits.
     * @param {Integer} comSDType A value from the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/ne-objbase-comsd">COMSD</a> enumeration. Specifies the type of the requested system security permissions, such as launch permissions, access permissions, launch restrictions, and access restrictions.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} ppSD Pointer to a caller-supplied variable that this routine sets to the address of a buffer containing the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> for the system security permissions. Memory will be allocated by <b>CoGetSystemSecurityPermissions</b> and should be freed by caller with <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a>.
     * @returns {HRESULT} This function can return one of these values.
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
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-cogetsystemsecuritypermissions
     * @since windows5.0
     */
    static CoGetSystemSecurityPermissions(comSDType, ppSD) {
        result := DllCall("OLE32.dll\CoGetSystemSecurityPermissions", "int", comSDType, "ptr", ppSD, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Loads a specific DLL into the caller's process.
     * @param {PWSTR} lpszLibName The name of the library to be loaded.
     * @param {BOOL} bAutoFree This parameter is maintained for compatibility with 16-bit applications, but is ignored.
     * @returns {HINSTANCE} If the function succeeds, the return value is a handle to the loaded library; otherwise, it is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-coloadlibrary
     * @since windows5.0
     */
    static CoLoadLibrary(lpszLibName, bAutoFree) {
        lpszLibName := lpszLibName is String ? StrPtr(lpszLibName) : lpszLibName

        result := DllCall("OLE32.dll\CoLoadLibrary", "ptr", lpszLibName, "int", bAutoFree, "ptr")
        resultHandle := HINSTANCE({Value: result}, True)
        return resultHandle
    }

    /**
     * Frees a library that, when loaded, was specified to be freed explicitly.
     * @remarks
     * 
     * The <b>CoFreeLibrary</b> function should be called to free a library that is to be freed explicitly. This is established when the library is loaded with the <i>bAutoFree</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coloadlibrary">CoLoadLibrary</a> set to <b>FALSE</b>. It is illegal to free a library explicitly when the corresponding <b>CoLoadLibrary</b> call specifies that it be freed automatically (the <i>bAutoFree</i> parameter is set to <b>TRUE</b>).
     * 
     * 
     * @param {HINSTANCE} hInst A handle to the library module to be freed, as returned by the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coloadlibrary">CoLoadLibrary</a> function.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-cofreelibrary
     * @since windows5.0
     */
    static CoFreeLibrary(hInst) {
        hInst := hInst is Win32Handle ? NumGet(hInst, "ptr") : hInst

        DllCall("OLE32.dll\CoFreeLibrary", "ptr", hInst)
    }

    /**
     * Frees all the DLLs that have been loaded with the CoLoadLibrary function (called internally by CoGetClassObject), regardless of whether they are currently in use.
     * @remarks
     * 
     * To unload libraries, <b>CoFreeAllLibraries</b> uses a list of loaded DLLs for each process that the COM library maintains. The <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-couninitialize">CoUninitialize</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-oleuninitialize">OleUninitialize</a> functions call <b>CoFreeAllLibraries</b> internally, so applications usually have no need to call this function directly.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-cofreealllibraries
     * @since windows5.0
     */
    static CoFreeAllLibraries() {
        DllCall("OLE32.dll\CoFreeAllLibraries")
    }

    /**
     * This function passes the foreground privilege (the privilege to set the foreground window) from one process to another. The process that has the foreground privilege can call this function to pass that privilege on to a local COM server process.
     * @param {IUnknown} pUnk A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the proxy of the 
     *       target COM server.
     * @returns {HRESULT} This function can return the following values.
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
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-coallowsetforegroundwindow
     * @since windows5.0
     */
    static CoAllowSetForegroundWindow(pUnk) {
        static lpvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("OLE32.dll\CoAllowSetForegroundWindow", "ptr", pUnk, "ptr", lpvReserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvReserved 
     * @param {Pointer<Integer>} pulReserved 
     * @param {HRESULT} appsHR 
     * @returns {HRESULT} 
     */
    static DcomChannelSetHResult(pvReserved, pulReserved, appsHR) {
        pvReservedMarshal := pvReserved is VarRef ? "ptr" : "ptr"
        pulReservedMarshal := pulReserved is VarRef ? "uint*" : "ptr"

        result := DllCall("ole32.dll\DcomChannelSetHResult", pvReservedMarshal, pvReserved, pulReservedMarshal, pulReserved, "int", appsHR, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines whether the specified CLSID represents an OLE 1 object.
     * @param {Pointer<Guid>} rclsid The CLSID to be checked.
     * @returns {BOOL} If the CLSID refers to an OLE 1 object, the return value is <b>TRUE</b>; otherwise, it is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-coisole1class
     * @since windows5.0
     */
    static CoIsOle1Class(rclsid) {
        result := DllCall("ole32.dll\CoIsOle1Class", "ptr", rclsid, "int")
        return result
    }

    /**
     * Triggers automatic installation if the COMClassStore policy is enabled.
     * @param {PWSTR} lpszProgID A pointer to the ProgID whose CLSID is requested.
     * @param {Pointer<Guid>} lpclsid Receives a pointer to the retrieved CLSID on return.
     * @returns {HRESULT} This function can return the following values.
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
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-clsidfromprogidex
     * @since windows5.0
     */
    static CLSIDFromProgIDEx(lpszProgID, lpclsid) {
        lpszProgID := lpszProgID is String ? StrPtr(lpszProgID) : lpszProgID

        result := DllCall("OLE32.dll\CLSIDFromProgIDEx", "ptr", lpszProgID, "ptr", lpclsid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Converts a FILETIME into MS-DOS date and time values.
     * @param {Pointer<FILETIME>} lpFileTime A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     * @param {Pointer<Integer>} lpDosDate Receives the MS-DOS date.
     * @param {Pointer<Integer>} lpDosTime Receives the MS-DOS time.
     * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>; otherwise, it is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-cofiletimetodosdatetime
     * @since windows5.0
     */
    static CoFileTimeToDosDateTime(lpFileTime, lpDosDate, lpDosTime) {
        lpDosDateMarshal := lpDosDate is VarRef ? "ushort*" : "ptr"
        lpDosTimeMarshal := lpDosTime is VarRef ? "ushort*" : "ptr"

        result := DllCall("OLE32.dll\CoFileTimeToDosDateTime", "ptr", lpFileTime, lpDosDateMarshal, lpDosDate, lpDosTimeMarshal, lpDosTime, "int")
        return result
    }

    /**
     * Converts the MS-DOS representation of the time and date to a FILETIME structure used by Windows.
     * @param {Integer} nDosDate The MS-DOS date.
     * @param {Integer} nDosTime The MS-DOS time.
     * @param {Pointer<FILETIME>} lpFileTime A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>; otherwise, it is <b>FALSE</b>, probably because of invalid arguments.
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-codosdatetimetofiletime
     * @since windows5.0
     */
    static CoDosDateTimeToFileTime(nDosDate, nDosTime, lpFileTime) {
        result := DllCall("OLE32.dll\CoDosDateTimeToFileTime", "ushort", nDosDate, "ushort", nDosTime, "ptr", lpFileTime, "int")
        return result
    }

    /**
     * Returns the current time as a FILETIME structure.
     * @param {Pointer<FILETIME>} lpFileTime A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that receives the current time.
     * @returns {HRESULT} This function returns S_OK to indicate success.
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-cofiletimenow
     * @since windows5.0
     */
    static CoFileTimeNow(lpFileTime) {
        result := DllCall("OLE32.dll\CoFileTimeNow", "ptr", lpFileTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Registers a channel hook.
     * @param {Pointer<Guid>} ExtensionUuid The extension to register.
     * @param {IChannelHook} pChannelHook The channel hook to register.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-coregisterchannelhook
     */
    static CoRegisterChannelHook(ExtensionUuid, pChannelHook) {
        result := DllCall("ole32.dll\CoRegisterChannelHook", "ptr", ExtensionUuid, "ptr", pChannelHook, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Establishes or removes an emulation, in which objects of one class are treated as objects of a different class.
     * @param {Pointer<Guid>} clsidOld The CLSID of the object to be emulated.
     * @param {Pointer<Guid>} clsidNew The CLSID of the object that should emulate the original object. This replaces any existing emulation for <i>clsidOld</i>. This parameter can be CLSID_NULL, in which case any existing emulation for <i>clsidOld</i> is removed.
     * @returns {HRESULT} This function can return the standard return values E_INVALIDARG, as well as the following values.
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
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-cotreatasclass
     * @since windows5.0
     */
    static CoTreatAsClass(clsidOld, clsidNew) {
        result := DllCall("OLE32.dll\CoTreatAsClass", "ptr", clsidOld, "ptr", clsidNew, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a pointer to the OLE implementation of IDataAdviseHolder on the data advise holder object.
     * @returns {IDataAdviseHolder} Address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataadviseholder">IDataAdviseHolder</a> pointer variable that receives the interface pointer to the new advise holder object.
     * @see https://docs.microsoft.com/windows/win32/api//ole2/nf-ole2-createdataadviseholder
     * @since windows5.0
     */
    static CreateDataAdviseHolder() {
        result := DllCall("OLE32.dll\CreateDataAdviseHolder", "ptr*", &ppDAHolder := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDataAdviseHolder(ppDAHolder)
    }

    /**
     * Retrieves a pointer to a new instance of an OLE-provided implementation of a data cache.
     * @param {IUnknown} pUnkOuter If the cache is to be created as part of an aggregate, pointer to the controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> of the aggregate. If not, the parameter should be <b>NULL</b>.
     * @param {Pointer<Guid>} rclsid CLSID used to generate icon labels. This value is typically CLSID_NULL.
     * @param {Pointer<Guid>} iid Reference to the identifier of the interface the caller wants to use to communicate with the cache. This value is typically IID_IOleCache (defined in the OLE headers to equal the interface identifier for <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nn-oleidl-iolecache">IOleCache</a>).
     * @returns {Pointer<Void>} Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *<i>ppvObj</i> contains the requested interface pointer to the supplied cache object.
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-createdatacache
     * @since windows5.0
     */
    static CreateDataCache(pUnkOuter, rclsid, iid) {
        result := DllCall("OLE32.dll\CreateDataCache", "ptr", pUnkOuter, "ptr", rclsid, "ptr", iid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }

    /**
     * Installs the requested COM server application.
     * @param {IBindCtx} pbc Reserved for future use; this value must be <b>NULL</b>.
     * @param {Integer} dwFlags Reserved for future use; this value must be 0.
     * @param {Pointer<uCLSSPEC>} pClassSpec A pointer to a <b>uCLSSPEC</b> union. The <b>tyspec</b> member must be set to TYSPEC_CLSID and the <b>clsid</b> member must be set to the CLSID to be installed. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DevNotes/tyspec">TYSPEC</a>.
     * @param {Pointer<QUERYCONTEXT>} pQuery A pointer to a <a href="https://docs.microsoft.com/previous-versions/bb432414(v=vs.85)">QUERYCONTEXT</a> structure. The <b>dwContext</b> field must be set to the desired <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-clsctx">CLSCTX</a> value. For more information, see <b>QUERYCONTEXT</b>.
     * @param {PWSTR} pszCodeBase Reserved for future use; this value must be <b>NULL</b>.
     * @returns {HRESULT} This function supports the standard return value E_INVALIDARG, as well as the following.
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
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-coinstall
     */
    static CoInstall(pbc, dwFlags, pClassSpec, pQuery, pszCodeBase) {
        pszCodeBase := pszCodeBase is String ? StrPtr(pszCodeBase) : pszCodeBase

        result := DllCall("ole32.dll\CoInstall", "ptr", pbc, "uint", dwFlags, "ptr", pClassSpec, "ptr", pQuery, "ptr", pszCodeBase, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Locates an object by means of its moniker, activates the object if it is inactive, and retrieves a pointer to the specified interface on that object.
     * @param {IMoniker} pmk A pointer to the object's moniker. See <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a>.
     * @param {Integer} grfOpt This parameter is reserved for future use and must be 0.
     * @param {Pointer<Guid>} iidResult The interface identifier to be used to communicate with the object.
     * @returns {Pointer<Void>} The address of pointer variable that receives the interface pointer requested in <i>iidResult</i>. Upon successful return, *<i>ppvResult</i> contains the requested interface pointer. If an error occurs, *<i>ppvResult</i> is <b>NULL</b>. If the call is successful, the caller is responsible for releasing the pointer with a call to the object's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-bindmoniker
     * @since windows5.0
     */
    static BindMoniker(pmk, grfOpt, iidResult) {
        result := DllCall("OLE32.dll\BindMoniker", "ptr", pmk, "uint", grfOpt, "ptr", iidResult, "ptr*", &ppvResult := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppvResult
    }

    /**
     * Converts a display name into a moniker that identifies the object named, and then binds to the object identified by the moniker.
     * @param {PWSTR} pszName The display name of the object to be created.
     * @param {Pointer<BIND_OPTS>} pBindOptions The binding options used to create a moniker that creates the actual object. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-bind_opts">BIND_OPTS</a>. This parameter can be <b>NULL</b>.
     * @param {Pointer<Guid>} riid A reference to the identifier of an interface that is implemented on the object to be created.
     * @returns {Pointer<Void>} The address of a pointer to the interface specified by <i>riid</i> on the object that is created.
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-cogetobject
     * @since windows5.0
     */
    static CoGetObject(pszName, pBindOptions, riid) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := DllCall("OLE32.dll\CoGetObject", "ptr", pszName, "ptr", pBindOptions, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }

    /**
     * Converts a string into a moniker that identifies the object named by the string.
     * @param {IBindCtx} pbc A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a> interface on the bind context object to be used in this binding operation.
     * @param {PWSTR} szUserName A pointer to the display name to be parsed.
     * @param {Pointer<Integer>} pchEaten A pointer to the number of characters of <i>szUserName</i> that were consumed. If the function is successful, *<i>pchEaten</i> is the length of <i>szUserName</i>; otherwise, it is the number of characters successfully parsed.
     * @param {Pointer<IMoniker>} ppmk The address of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a>* pointer variable that receives the interface pointer to the moniker that was built from <i>szUserName</i>. When successful, the function has called <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the moniker and the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs, the specified interface pointer will contain as much of the moniker that the method was able to create before the error occurred.
     * @returns {HRESULT} This function can return the standard return value E_OUTOFMEMORY, as well as the following values.
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
     * This function can also return any of the error values returned by <a href="/windows/desktop/api/objidl/nf-objidl-imoniker-bindtoobject">IMoniker::BindToObject</a>, <a href="/windows/desktop/api/oleidl/nf-oleidl-ioleitemcontainer-getobject">IOleItemContainer::GetObject</a>, or <a href="/windows/desktop/api/oleidl/nf-oleidl-iparsedisplayname-parsedisplayname">IParseDisplayName::ParseDisplayName</a>.
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-mkparsedisplayname
     * @since windows5.0
     */
    static MkParseDisplayName(pbc, szUserName, pchEaten, ppmk) {
        szUserName := szUserName is String ? StrPtr(szUserName) : szUserName

        pchEatenMarshal := pchEaten is VarRef ? "uint*" : "ptr"

        result := DllCall("OLE32.dll\MkParseDisplayName", "ptr", pbc, "ptr", szUserName, pchEatenMarshal, pchEaten, "ptr*", ppmk, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Provides a moniker that, when composed onto the end of the first specified moniker (or one with a similar structure), yields the second specified moniker.
     * @param {IMoniker} pmkSrc A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on the moniker that, when composed with the relative moniker to be created, produces <i>pmkDest</i>. This moniker identifies the "source" of the relative moniker to be created.
     * @param {IMoniker} pmkDest A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on the moniker to be expressed relative to <i>pmkSrc</i>. This moniker identifies the destination of the relative moniker to be created.
     * @param {BOOL} dwReserved This parameter is reserved and must be nonzero.
     * @returns {IMoniker} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a>* pointer variable that receives the interface pointer to the new relative moniker. When successful, the function has called <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the moniker and the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs, the interface pointer value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-monikerrelativepathto
     * @since windows5.0
     */
    static MonikerRelativePathTo(pmkSrc, pmkDest, dwReserved) {
        result := DllCall("ole32.dll\MonikerRelativePathTo", "ptr", pmkSrc, "ptr", pmkDest, "ptr*", &ppmkRelPath := 0, "int", dwReserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMoniker(ppmkRelPath)
    }

    /**
     * Creates a new moniker based on the common prefix that this moniker (the one comprising the data of this moniker object) shares with another moniker.
     * @param {IMoniker} pmkThis A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on one of the monikers for which a common prefix is sought; usually the moniker in which this call is used to implement <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-commonprefixwith">IMoniker::CommonPrefixWith</a>.
     * @param {IMoniker} pmkOther A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on the moniker to be compared with the first moniker.
     * @returns {IMoniker} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a>* pointer variable that receives the interface pointer to the moniker based on the common prefix of <i>pmkThis</i> and <i>pmkOther</i>. When successful, the function has called <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the moniker and the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs, the supplied interface pointer value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-monikercommonprefixwith
     * @since windows5.0
     */
    static MonikerCommonPrefixWith(pmkThis, pmkOther) {
        result := DllCall("ole32.dll\MonikerCommonPrefixWith", "ptr", pmkThis, "ptr", pmkOther, "ptr*", &ppmkCommon := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMoniker(ppmkCommon)
    }

    /**
     * Returns a pointer to an implementation of IBindCtx (a bind context object). This object stores information about a particular moniker-binding operation.
     * @param {Integer} reserved This parameter is reserved and must be 0.
     * @returns {IBindCtx} Address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a>* pointer variable that receives the interface pointer to the new bind context object. When the function is successful, the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the bind context. A <b>NULL</b> value for the bind context indicates that an error occurred.
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-createbindctx
     * @since windows5.0
     */
    static CreateBindCtx(reserved) {
        result := DllCall("OLE32.dll\CreateBindCtx", "uint", reserved, "ptr*", &ppbc := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBindCtx(ppbc)
    }

    /**
     * Performs a generic composition of two monikers and supplies a pointer to the resulting composite moniker.
     * @param {IMoniker} pmkFirst A pointer to the moniker to be composed to the left of the moniker that pmkRest points to. Can point to any kind of moniker, including a generic composite.
     * @param {IMoniker} pmkRest A pointer to the moniker to be composed to the right of the moniker to which <i>pmkFirst</i> points. Can point to any kind of moniker compatible with the type of the <i>pmkRest</i> moniker, including a generic composite.
     * @returns {IMoniker} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a>* pointer variable that receives the interface pointer to the composite moniker object that is the result of composing <i>pmkFirst</i> and <i>pmkRest</i>. This object supports the OLE composite moniker implementation of <b>IMoniker</b>. When successful, the function has called <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the moniker and the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If either <i>pmkFirst</i> or <i>pmkRest</i> are <b>NULL</b>, the supplied pointer is the one that is non-<b>NULL</b>. If both <i>pmkFirst</i> and <i>pmkRest</i> are <b>NULL</b>, or if an error occurs, the returned pointer is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-creategenericcomposite
     * @since windows5.0
     */
    static CreateGenericComposite(pmkFirst, pmkRest) {
        result := DllCall("OLE32.dll\CreateGenericComposite", "ptr", pmkFirst, "ptr", pmkRest, "ptr*", &ppmkComposite := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMoniker(ppmkComposite)
    }

    /**
     * Returns the CLSID associated with the specified file name.
     * @param {PWSTR} szFilename A pointer to the filename for which you are requesting the associated CLSID.
     * @param {Pointer<Guid>} pclsid A pointer to the location where the associated CLSID is written on return.
     * @returns {HRESULT} This function can return any of the file system errors, as well as the following values.
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
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-getclassfile
     * @since windows5.0
     */
    static GetClassFile(szFilename, pclsid) {
        szFilename := szFilename is String ? StrPtr(szFilename) : szFilename

        result := DllCall("OLE32.dll\GetClassFile", "ptr", szFilename, "ptr", pclsid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a class moniker that refers to the specified class.
     * @param {Pointer<Guid>} rclsid A reference to the CLSID of the object type to which this moniker binds.
     * @returns {IMoniker} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a>* pointer variable that receives the interface pointer to the new class moniker. On successful return, the function has called <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the moniker and the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. When an error occurs, the value of the moniker pointer is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-createclassmoniker
     * @since windows5.0
     */
    static CreateClassMoniker(rclsid) {
        result := DllCall("OLE32.dll\CreateClassMoniker", "ptr", rclsid, "ptr*", &ppmk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMoniker(ppmk)
    }

    /**
     * Creates a file moniker based on the specified path.
     * @param {PWSTR} lpszPathName The path on which this moniker is to be based.
     * 
     * This parameter can specify a relative path, a UNC path, or a drive-letter-based path. If based on a relative path, the resulting moniker must be composed onto another file moniker before it can be bound.
     * @returns {IMoniker} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a>* pointer variable that receives the interface pointer to the new file moniker. When successful, the function has called <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the file moniker and the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. When an error occurs, the value of the interface pointer is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-createfilemoniker
     * @since windows5.0
     */
    static CreateFileMoniker(lpszPathName) {
        lpszPathName := lpszPathName is String ? StrPtr(lpszPathName) : lpszPathName

        result := DllCall("OLE32.dll\CreateFileMoniker", "ptr", lpszPathName, "ptr*", &ppmk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMoniker(ppmk)
    }

    /**
     * Creates an item moniker that identifies an object within a containing object (typically a compound document).
     * @param {PWSTR} lpszDelim A pointer to a wide character string (two bytes per character) zero-terminated string containing the delimiter (typically "!") used to separate this item's display name from the display name of its containing object.
     * @param {PWSTR} lpszItem A pointer to a zero-terminated string indicating the containing object's name for the object being identified. This name can later be used to retrieve a pointer to the object in a call to <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleitemcontainer-getobject">IOleItemContainer::GetObject</a>.
     * @returns {IMoniker} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a>* pointer variable that receives the interface pointer to the item moniker. When successful, the function has called <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the item moniker and the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. If an error occurs, the supplied interface pointer has a <b>NULL</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-createitemmoniker
     * @since windows5.0
     */
    static CreateItemMoniker(lpszDelim, lpszItem) {
        lpszDelim := lpszDelim is String ? StrPtr(lpszDelim) : lpszDelim
        lpszItem := lpszItem is String ? StrPtr(lpszItem) : lpszItem

        result := DllCall("OLE32.dll\CreateItemMoniker", "ptr", lpszDelim, "ptr", lpszItem, "ptr*", &ppmk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMoniker(ppmk)
    }

    /**
     * Creates and returns a new anti-moniker.
     * @returns {IMoniker} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a>* pointer variable that receives the interface pointer to the new anti-moniker. When successful, the function has called <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the anti-moniker and the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. When an error occurs, the anti-moniker pointer is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-createantimoniker
     * @since windows5.0
     */
    static CreateAntiMoniker() {
        result := DllCall("OLE32.dll\CreateAntiMoniker", "ptr*", &ppmk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMoniker(ppmk)
    }

    /**
     * Creates a pointer moniker based on a pointer to an object.
     * @param {IUnknown} punk A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the object to be identified by the resulting moniker.
     * @returns {IMoniker} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a>* pointer variable that receives the interface pointer to the new pointer moniker. When successful, the function has called <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on the moniker and the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a>. When an error occurs, the returned interface pointer has a <b>NULL</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-createpointermoniker
     * @since windows5.0
     */
    static CreatePointerMoniker(punk) {
        result := DllCall("OLE32.dll\CreatePointerMoniker", "ptr", punk, "ptr*", &ppmk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMoniker(ppmk)
    }

    /**
     * Creates an OBJREF moniker based on a pointer to an object.
     * @param {IUnknown} punk A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the object that the moniker is to represent.
     * @returns {IMoniker} Address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on the OBJREF moniker that was created.
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-createobjrefmoniker
     * @since windows5.0
     */
    static CreateObjrefMoniker(punk) {
        result := DllCall("OLE32.dll\CreateObjrefMoniker", "ptr", punk, "ptr*", &ppmk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMoniker(ppmk)
    }

    /**
     * Returns a pointer to the IRunningObjectTable interface on the local running object table (ROT).
     * @param {Integer} reserved This parameter is reserved and must be 0.
     * @returns {IRunningObjectTable} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irunningobjecttable">IRunningObjectTable</a>* pointer variable that receives the interface pointer to the local ROT. When the function is successful, the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the interface pointer. If an error occurs, *<i>pprot</i> is undefined.
     * @see https://docs.microsoft.com/windows/win32/api//objbase/nf-objbase-getrunningobjecttable
     * @since windows5.0
     */
    static GetRunningObjectTable(reserved) {
        result := DllCall("OLE32.dll\GetRunningObjectTable", "uint", reserved, "ptr*", &pprot := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRunningObjectTable(pprot)
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {PWSTR} pszTitle 
     * @param {IBindStatusCallback} pIbscCaller 
     * @returns {IBindStatusCallback} 
     */
    static CreateStdProgressIndicator(hwndParent, pszTitle, pIbscCaller) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        pszTitle := pszTitle is String ? StrPtr(pszTitle) : pszTitle

        result := DllCall("ole32.dll\CreateStdProgressIndicator", "ptr", hwndParent, "ptr", pszTitle, "ptr", pIbscCaller, "ptr*", &ppIbsc := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBindStatusCallback(ppIbsc)
    }

    /**
     * Retrieves a pointer to the default OLE task memory allocator (which supports the system implementation of the IMalloc interface) so applications can call its methods to manage memory.
     * @param {Integer} dwMemContext This parameter must be 1.
     * @returns {IMalloc} The address of an <b>IMalloc*</b> pointer variable that receives the interface pointer to the memory allocator.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cogetmalloc
     * @since windows5.0
     */
    static CoGetMalloc(dwMemContext) {
        result := DllCall("OLE32.dll\CoGetMalloc", "uint", dwMemContext, "ptr*", &ppMalloc := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMalloc(ppMalloc)
    }

    /**
     * Closes the COM library on the current thread, unloads all DLLs loaded by the thread, frees any other resources that the thread maintains, and forces all RPC connections on the thread to close.
     * @remarks
     * 
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
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-couninitialize
     * @since windows5.0
     */
    static CoUninitialize() {
        DllCall("OLE32.dll\CoUninitialize")
    }

    /**
     * Returns a value that is unique to the current thread. CoGetCurrentProcess can be used to avoid thread ID reuse problems.
     * @returns {Integer} The function returns the unique identifier of the current thread.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cogetcurrentprocess
     * @since windows5.0
     */
    static CoGetCurrentProcess() {
        result := DllCall("OLE32.dll\CoGetCurrentProcess", "uint")
        return result
    }

    /**
     * Initializes the COM library for use by the calling thread, sets the thread's concurrency model, and creates a new apartment for the thread if one is required.
     * @param {Integer} dwCoInit The concurrency model and initialization options for the thread. Values for this parameter are taken from the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/ne-objbase-coinit">COINIT</a> enumeration. Any combination of values from <b>COINIT</b> can be used, except that the COINIT_APARTMENTTHREADED and COINIT_MULTITHREADED flags cannot both be set. The default is COINIT_MULTITHREADED.
     * @returns {HRESULT} This function can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
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
     * A previous call to <a href="/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> specified the concurrency model for this thread as multithread apartment (MTA). This could also indicate that a change from neutral-threaded apartment to single-threaded apartment has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-coinitializeex
     * @since windows5.0
     */
    static CoInitializeEx(dwCoInit) {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("OLE32.dll\CoInitializeEx", "ptr", pvReserved, "uint", dwCoInit, "int")
        return result
    }

    /**
     * Returns a pointer to a DWORD that contains the apartment ID of the caller's thread.
     * @returns {Integer} Receives the apartment ID of the caller's thread. For a single threaded apartment (STA), this is the current thread ID. For a multithreaded apartment (MTA), the value is 0.  For a neutral apartment (NA), the value is -1.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cogetcallertid
     * @since windows5.0
     */
    static CoGetCallerTID() {
        result := DllCall("OLE32.dll\CoGetCallerTID", "uint*", &lpdwTID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lpdwTID
    }

    /**
     * Returns the logical thread identifier of the current physical thread.
     * @param {Pointer<Guid>} pguid A pointer to a GUID that contains the logical thread ID on return.
     * @returns {HRESULT} This function can return the following values.
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
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cogetcurrentlogicalthreadid
     * @since windows5.0
     */
    static CoGetCurrentLogicalThreadId(pguid) {
        result := DllCall("OLE32.dll\CoGetCurrentLogicalThreadId", "ptr", pguid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns a pointer to an implementation of IObjContext for the current context.
     * @returns {Pointer} A pointer to an implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iobjcontext">IObjContext</a> for the current context.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cogetcontexttoken
     * @since windows5.0
     */
    static CoGetContextToken() {
        result := DllCall("OLE32.dll\CoGetContextToken", "ptr*", &pToken := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pToken
    }

    /**
     * Returns the current apartment type and type qualifier.
     * @param {Pointer<Integer>} pAptType <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-apttype">APTTYPE</a> enumeration value that specifies the type of the current apartment.
     * @param {Pointer<Integer>} pAptQualifier <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-apttypequalifier">APTTYPEQUALIFIER</a> enumeration value that specifies the type qualifier of the current apartment.
     * @returns {HRESULT} Returns S_OK if the call succeeded. Otherwise, one of the following error codes is returned.
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
     * <a href="/windows/desktop/api/objbase/nf-objbase-coinitialize">CoInitialize</a> or <a href="/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> was not called on this thread prior to calling <a href="/windows/desktop/api/combaseapi/nf-combaseapi-cogetapartmenttype">CoGetApartmentType</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cogetapartmenttype
     * @since windows6.1
     */
    static CoGetApartmentType(pAptType, pAptQualifier) {
        pAptTypeMarshal := pAptType is VarRef ? "int*" : "ptr"
        pAptQualifierMarshal := pAptQualifier is VarRef ? "int*" : "ptr"

        result := DllCall("OLE32.dll\CoGetApartmentType", pAptTypeMarshal, pAptType, pAptQualifierMarshal, pAptQualifier, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Keeps MTA support active when no MTA threads are running.
     * @param {Pointer<CO_MTA_USAGE_COOKIE>} pCookie Address of a <b>PVOID</b> variable that receives the cookie for the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-codecrementmtausage">CoDecrementMTAUsage</a> function, or <b>NULL</b> if the call fails.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-coincrementmtausage
     */
    static CoIncrementMTAUsage(pCookie) {
        result := DllCall("OLE32.dll\CoIncrementMTAUsage", "ptr", pCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Releases the increment made by a previous call to the CoIncrementMTAUsage function.
     * @param {CO_MTA_USAGE_COOKIE} Cookie A <b>PVOID</b> variable that was set by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coincrementmtausage">CoIncrementMTAUsage</a> function.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-codecrementmtausage
     */
    static CoDecrementMTAUsage(Cookie) {
        Cookie := Cookie is Win32Handle ? NumGet(Cookie, "ptr") : Cookie

        result := DllCall("OLE32.dll\CoDecrementMTAUsage", "ptr", Cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds an unmarshaler CLSID to the allowed list for the calling process only.
     * @param {Pointer<Guid>} clsid The CLSID of the unmarshaler to be added to the per-process allowed list.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-coallowunmarshalerclsid
     * @since windows8.0
     */
    static CoAllowUnmarshalerCLSID(clsid) {
        result := DllCall("OLE32.dll\CoAllowUnmarshalerCLSID", "ptr", clsid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the context for the current object.
     * @param {Pointer<Guid>} riid A reference to the ID of an interface that is implemented on the context object. 
     * 
     * For objects running within COM applications, IID_IComThreadingInfo, IID_IContext, and IID_IContextCallback are available.
     * 
     * For objects running within COM+ applications, IID_IObjectContext, IID_IObjectContextActivity IID_IObjectContextInfo, and IID_IContextState are available.
     * @returns {Pointer<Void>} The address of a pointer to the interface specified by <i>riid</i> on the context object.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cogetobjectcontext
     * @since windows5.0
     */
    static CoGetObjectContext(riid) {
        result := DllCall("OLE32.dll\CoGetObjectContext", "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }

    /**
     * Provides a pointer to an interface on a class object associated with a specified CLSID.
     * @param {Pointer<Guid>} rclsid The CLSID associated with the data and code that you will use to create the objects.
     * @param {Integer} dwClsContext The context in which the executable code is to be run. To enable a remote activation, include CLSCTX_REMOTE_SERVER. For more information on the context values and their use, see the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-clsctx">CLSCTX</a> enumeration.
     * @param {Pointer<Void>} pvReserved A pointer to computer on which to instantiate the class object. If this parameter is <b>NULL</b>, the class object is instantiated on the current computer or at the computer specified under the class's <a href="https://docs.microsoft.com/windows/desktop/com/remoteservername">RemoteServerName</a> key, according to the interpretation of the <i>dwClsCtx</i> parameter. See <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-coserverinfo">COSERVERINFO</a>.
     * @param {Pointer<Guid>} riid Reference to the identifier of the interface, which will be supplied in _ppv_ on successful return. This interface will be used to communicate with the class object. Typically this value is IID_IClassFactory, although other values such as IID_IClassFactory2 which supports a form of licensing are allowed. All OLE-defined interface IIDs are defined in the OLE header files as IID_interfacename, where interfacename is the name of the interface.
     * @returns {Pointer<Void>} The address of pointer variable that receives the interface pointer requested in <i>riid</i>. Upon successful return, *<i>ppv</i> contains the requested interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cogetclassobject
     * @since windows5.0
     */
    static CoGetClassObject(rclsid, dwClsContext, pvReserved, riid) {
        pvReservedMarshal := pvReserved is VarRef ? "ptr" : "ptr"

        result := DllCall("OLE32.dll\CoGetClassObject", "ptr", rclsid, "uint", dwClsContext, pvReservedMarshal, pvReserved, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }

    /**
     * Registers an EXE class object with OLE so other applications can connect to it.
     * @param {Pointer<Guid>} rclsid The CLSID to be registered.
     * @param {IUnknown} pUnk A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the class object whose availability is being published.
     * @param {Integer} dwClsContext The context in which the executable code is to be run. For information on these context values, see the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-clsctx">CLSCTX</a> enumeration.
     * @param {Integer} flags Indicates how connections are made to the class object. For information on these flags, see the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/ne-combaseapi-regcls">REGCLS</a> enumeration.
     * @returns {Integer} A pointer to a value that identifies the class object registered; later used by the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-corevokeclassobject">CoRevokeClassObject</a> function to revoke the registration.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-coregisterclassobject
     * @since windows5.0
     */
    static CoRegisterClassObject(rclsid, pUnk, dwClsContext, flags) {
        result := DllCall("OLE32.dll\CoRegisterClassObject", "ptr", rclsid, "ptr", pUnk, "uint", dwClsContext, "uint", flags, "uint*", &lpdwRegister := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lpdwRegister
    }

    /**
     * Informs OLE that a class object, previously registered with the CoRegisterClassObject function, is no longer available for use.
     * @param {Integer} dwRegister A token previously returned from the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coregisterclassobject">CoRegisterClassObject</a> function.
     * @returns {HRESULT} This function can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
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
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-corevokeclassobject
     * @since windows5.0
     */
    static CoRevokeClassObject(dwRegister) {
        result := DllCall("OLE32.dll\CoRevokeClassObject", "uint", dwRegister, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called by a server that can register multiple class objects to inform the SCM about all registered classes, and permits activation requests for those class objects.
     * @returns {HRESULT} This function returns S_OK to indicate that the CLSID was retrieved successfully.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-coresumeclassobjects
     * @since windows5.0
     */
    static CoResumeClassObjects() {
        result := DllCall("OLE32.dll\CoResumeClassObjects", "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Prevents any new activation requests from the SCM on all class objects registered within the process.
     * @returns {HRESULT} This function returns S_OK to indicate that the activation of class objects was successfully suspended.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cosuspendclassobjects
     * @since windows5.0
     */
    static CoSuspendClassObjects() {
        result := DllCall("OLE32.dll\CoSuspendClassObjects", "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Increments a global per-process reference count.
     * @returns {Integer} The current reference count.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-coaddrefserverprocess
     * @since windows5.0
     */
    static CoAddRefServerProcess() {
        result := DllCall("OLE32.dll\CoAddRefServerProcess", "uint")
        return result
    }

    /**
     * Decrements the global per-process reference count.
     * @returns {Integer} If the server application should initiate its cleanup, the function returns 0; otherwise, the function returns a nonzero value.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-coreleaseserverprocess
     * @since windows5.0
     */
    static CoReleaseServerProcess() {
        result := DllCall("OLE32.dll\CoReleaseServerProcess", "uint")
        return result
    }

    /**
     * Returns the CLSID of the DLL that implements the proxy and stub for the specified interface.
     * @param {Pointer<Guid>} riid The interface whose proxy/stub CLSID is to be returned.
     * @param {Pointer<Guid>} pClsid Specifies where to store the proxy/stub CLSID for the interface specified by <i>riid</i>.
     * @returns {HRESULT} This function can return the following values.
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
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cogetpsclsid
     * @since windows5.0
     */
    static CoGetPSClsid(riid, pClsid) {
        result := DllCall("OLE32.dll\CoGetPSClsid", "ptr", riid, "ptr", pClsid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enables a downloaded DLL to register its custom interfaces within its running process so that the marshaling code will be able to marshal those interfaces.
     * @param {Pointer<Guid>} riid A pointer to the IID of the interface to be registered.
     * @param {Pointer<Guid>} rclsid A pointer to the CLSID of the DLL that contains the proxy/stub code for the custom interface specified by <i>riid</i>.
     * @returns {HRESULT} This function can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-coregisterpsclsid
     * @since windows5.0
     */
    static CoRegisterPSClsid(riid, rclsid) {
        result := DllCall("OLE32.dll\CoRegisterPSClsid", "ptr", riid, "ptr", rclsid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Registers the surrogate process through its ISurrogate interface pointer.
     * @param {ISurrogate} pSurrogate A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-isurrogate">ISurrogate</a> interface on the surrogate process to be registered.
     * @returns {HRESULT} This function returns S_OK to indicate that the surrogate process was registered successfully.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-coregistersurrogate
     * @since windows5.0
     */
    static CoRegisterSurrogate(pSurrogate) {
        result := DllCall("OLE32.dll\CoRegisterSurrogate", "ptr", pSurrogate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Disconnects all remote process connections being maintained on behalf of all the interface pointers that point to a specified object.
     * @param {IUnknown} pUnk A pointer to any interface derived from <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> on the object to be disconnected.
     * @returns {HRESULT} This function returns S_OK to indicate that all connections to remote processes were successfully deleted.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-codisconnectobject
     * @since windows5.0
     */
    static CoDisconnectObject(pUnk) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("OLE32.dll\CoDisconnectObject", "ptr", pUnk, "uint", dwReserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Called either to lock an object to ensure that it stays in memory, or to release such a lock.
     * @param {IUnknown} pUnk A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the object to be locked or unlocked.
     * @param {BOOL} fLock Indicates whether the object is to be locked or released. If this parameter is <b>TRUE</b>, the object is kept in memory, independent of <b>AddRef</b>/<b>Release</b> operations, registrations, or revocations. If this parameter is <b>FALSE</b>, the lock previously set with a call to this function is released.
     * @param {BOOL} fLastUnlockReleases If the lock is the last reference that is supposed to keep an object alive, specify <b>TRUE</b> to release all pointers to the object (there may be other references that are not supposed to keep it alive).
     * Otherwise, specify <b>FALSE</b>.
     * 
     * If <i>fLock</i> is <b>TRUE</b>, this parameter is ignored.
     * @returns {HRESULT} This function can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-colockobjectexternal
     * @since windows5.0
     */
    static CoLockObjectExternal(pUnk, fLock, fLastUnlockReleases) {
        result := DllCall("OLE32.dll\CoLockObjectExternal", "ptr", pUnk, "int", fLock, "int", fLastUnlockReleases, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines whether a remote object is connected to the corresponding in-process object.
     * @param {IUnknown} pUnk A pointer to the controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the remote object.
     * @returns {BOOL} If the object is not remote or if it is remote and still connected, the return value is <b>TRUE</b>; otherwise, it is <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-coishandlerconnected
     * @since windows5.0
     */
    static CoIsHandlerConnected(pUnk) {
        result := DllCall("OLE32.dll\CoIsHandlerConnected", "ptr", pUnk, "int")
        return result
    }

    /**
     * Creates an aggregatable object capable of context-dependent marshaling.
     * @param {IUnknown} punkOuter A pointer to the aggregating object's controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>.
     * @returns {IUnknown} Address of the pointer variable that receives the interface pointer to the aggregatable marshaler.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cocreatefreethreadedmarshaler
     * @since windows5.0
     */
    static CoCreateFreeThreadedMarshaler(punkOuter) {
        result := DllCall("OLE32.dll\CoCreateFreeThreadedMarshaler", "ptr", punkOuter, "ptr*", &ppunkMarshal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppunkMarshal)
    }

    /**
     * Unloads any DLLs that are no longer in use, probably because the DLL no longer has any instantiated COM objects outstanding.
     * @remarks
     * 
     * Applications can call <b>CoFreeUnusedLibraries</b> periodically to free resources. It is most efficient to call it either at the top of a message loop or in some idle-time task. <b>CoFreeUnusedLibraries</b> internally calls <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-dllcanunloadnow">DllCanUnloadNow</a> for DLLs that implement and export that function.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cofreeunusedlibraries
     * @since windows5.0
     */
    static CoFreeUnusedLibraries() {
        DllCall("OLE32.dll\CoFreeUnusedLibraries")
    }

    /**
     * Unloads any DLLs that are no longer in use and whose unload delay has expired.
     * @remarks
     * 
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
     * 
     * 
     * @param {Integer} dwUnloadDelay The delay in milliseconds between the time that the DLL has stated it can be unloaded until it becomes a candidate to unload. Setting this parameter to INFINITE uses the system default delay (10 minutes). Setting this parameter to 0 forces the unloading of any DLLs without any delay.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cofreeunusedlibrariesex
     * @since windows5.1.2600
     */
    static CoFreeUnusedLibrariesEx(dwUnloadDelay) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        DllCall("OLE32.dll\CoFreeUnusedLibrariesEx", "uint", dwUnloadDelay, "uint", dwReserved)
    }

    /**
     * Disconnects all proxy connections that are being maintained on behalf of all interface pointers that point to objects in the current context.
     * @param {Integer} dwTimeout The time in milliseconds after which <b>CoDisconnectContext</b> returns even if the proxy connections for all objects have not been disconnected. INFINITE is an acceptable value for this parameter.
     * @returns {HRESULT} This function can return the standard return values E_FAIL, E_INVALIDARG, and E_OUTOFMEMORY, as well as the following values.
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
     * An object tried to call <a href="/windows/desktop/api/combaseapi/nf-combaseapi-codisconnectcontext">CoDisconnectContext</a> on the context it is residing in. This would cause the function to time-out and deadlock if <i>dwTimeout</i> were set to INFINITE.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-codisconnectcontext
     * @since windows6.0.6000
     */
    static CoDisconnectContext(dwTimeout) {
        result := DllCall("OLE32.dll\CoDisconnectContext", "uint", dwTimeout, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Registers security and sets the default security values for the process.
     * @param {PSECURITY_DESCRIPTOR} pSecDesc The access permissions that a server will use to receive calls. This parameter is used by COM only when a server calls <b>CoInitializeSecurity</b>. Its value is a pointer to one of three types: an AppID, an <a href="https://docs.microsoft.com/windows/desktop/api/iaccess/nn-iaccess-iaccesscontrol">IAccessControl</a> object, or a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a>, in absolute format. See the Remarks section for more information.
     * @param {Integer} cAuthSvc The count of entries in the <i>asAuthSvc</i> parameter. This parameter is used by COM only when a server calls <b>CoInitializeSecurity</b>. If this parameter is 0, no authentication services will be registered and the server cannot receive secure calls. A value of -1 tells COM to choose which authentication services to register, and if this is the case, the <i>asAuthSvc</i> parameter must be <b>NULL</b>. However, Schannel will never be chosen as an authentication service by the server if this parameter is -1.
     * @param {Pointer<SOLE_AUTHENTICATION_SERVICE>} asAuthSvc An array of authentication services that a server is willing to use to receive a call. This parameter is used by COM only when a server calls <b>CoInitializeSecurity</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-sole_authentication_service">SOLE_AUTHENTICATION_SERVICE</a>.
     * @param {Integer} dwAuthnLevel The default authentication level for the process. Both servers and clients use this parameter when they call <b>CoInitializeSecurity</b>. COM will fail calls that arrive with a lower authentication level. By default, all proxies will use at least this authentication level. This value should contain one of the <a href="https://docs.microsoft.com/windows/desktop/com/com-authentication-level-constants">authentication level constants</a>. By default, all calls to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> are made at this level.
     * @param {Integer} dwImpLevel The default impersonation level for proxies. The value of this parameter is used only when the process is a client. It should be a value from the <a href="https://docs.microsoft.com/windows/desktop/com/com-impersonation-level-constants">impersonation level constants</a>, except for RPC_C_IMP_LEVEL_DEFAULT, which is not for use with <b>CoInitializeSecurity</b>.
     * 
     * Outgoing calls from the client always use the impersonation level as specified. (It is not negotiated.) Incoming calls to the client can be at any impersonation level. By default, all <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> calls are made with this impersonation level, so even security-aware applications should set this level carefully. To determine which impersonation levels each authentication service supports, see the description of the authentication services in <a href="https://docs.microsoft.com/windows/desktop/com/com-and-security-packages">COM and Security Packages</a>. For more information about impersonation levels, see <a href="https://docs.microsoft.com/windows/desktop/com/impersonation">Impersonation</a>.
     * @param {Pointer<Void>} pAuthList A pointer to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-sole_authentication_list">SOLE_AUTHENTICATION_LIST</a>, which is an array of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-sole_authentication_info">SOLE_AUTHENTICATION_INFO</a> structures. This list indicates the information for each authentication service that a client can use to call a server. This parameter is used by COM only when a client calls <b>CoInitializeSecurity</b>.
     * @param {Integer} dwCapabilities Additional capabilities of the client or server, specified by setting one or more <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-eole_authentication_capabilities">EOLE_AUTHENTICATION_CAPABILITIES</a> values. Some of these value cannot be used simultaneously, and some cannot be set when particular authentication services are being used. For more information about these flags, see the Remarks section.
     * @returns {HRESULT} This function can return the standard return value E_INVALIDARG, as well as the following values.
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
     * <a href="/windows/desktop/api/combaseapi/nf-combaseapi-coinitializesecurity">CoInitializeSecurity</a> has already been called.
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
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-coinitializesecurity
     * @since windows5.0
     */
    static CoInitializeSecurity(pSecDesc, cAuthSvc, asAuthSvc, dwAuthnLevel, dwImpLevel, pAuthList, dwCapabilities) {
        static pReserved1 := 0, pReserved3 := 0 ;Reserved parameters must always be NULL

        pSecDesc := pSecDesc is Win32Handle ? NumGet(pSecDesc, "ptr") : pSecDesc

        pAuthListMarshal := pAuthList is VarRef ? "ptr" : "ptr"

        result := DllCall("OLE32.dll\CoInitializeSecurity", "ptr", pSecDesc, "int", cAuthSvc, "ptr", asAuthSvc, "ptr", pReserved1, "uint", dwAuthnLevel, "uint", dwImpLevel, pAuthListMarshal, pAuthList, "uint", dwCapabilities, "ptr", pReserved3, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the context of the current call on the current thread.
     * @param {Pointer<Guid>} riid Interface identifier (IID) of the call context that is being requested. If you are using the default call context supported by standard marshaling, IID_IServerSecurity is available. For COM+ applications using role-based security, IID_ISecurityCallContext is available.
     * @returns {Pointer<Void>} Address of pointer variable that receives the interface pointer requested in riid. Upon successful return, *<i>ppInterface</i> contains the requested interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cogetcallcontext
     * @since windows5.0
     */
    static CoGetCallContext(riid) {
        result := DllCall("OLE32.dll\CoGetCallContext", "ptr", riid, "ptr*", &ppInterface := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppInterface
    }

    /**
     * Retrieves the authentication information the client uses to make calls on the specified proxy.
     * @param {IUnknown} pProxy A pointer indicating the proxy to query. This parameter cannot be <b>NULL</b>. For more information, see the Remarks section.
     * @param {Pointer<Integer>} pwAuthnSvc A pointer to a variable that receives the current authentication service. This will be a single value taken from the <a href="https://docs.microsoft.com/windows/desktop/com/com-authentication-service-constants">authentication service constants</a>. This parameter cannot be <b>NULL</b>.
     * @param {Pointer<Integer>} pAuthzSvc A pointer to a variable that receives the current authorization service. This will be a single value taken from the <a href="https://docs.microsoft.com/windows/desktop/com/com-authorization-constants">authorization constants</a>. If the caller specifies <b>NULL</b>, the current authorization service is not retrieved.
     * @param {Pointer<PWSTR>} pServerPrincName The current principal name. The string will be allocated by the callee using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>, and must be freed by the caller using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>. The EOAC_MAKE_FULLSIC flag is not accepted in the <i>pCapabilities</i> parameter. For more information about the msstd and fullsic forms, see <a href="https://docs.microsoft.com/windows/desktop/Rpc/principal-names">Principal Names</a>. If the caller specifies <b>NULL</b>, the current principal name is not retrieved.
     * @param {Pointer<Integer>} pAuthnLevel A pointer to a variable that receives the current authentication level. This will be a single value taken from the <a href="https://docs.microsoft.com/windows/desktop/com/com-authentication-level-constants">authentication level constants</a>. If the caller specifies <b>NULL</b>, the current authentication level is not retrieved.
     * @param {Pointer<Integer>} pImpLevel A pointer to a variable that receives the current impersonation level. This will be a single value taken from the <a href="https://docs.microsoft.com/windows/desktop/com/com-impersonation-level-constants">impersonation level constants</a>. If the caller specifies <b>NULL</b>, the current impersonation level is not retrieved.
     * @param {Pointer<Pointer<Void>>} pAuthInfo A pointer to a handle that receives the identity of the client that was passed to the last <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-iclientsecurity-setblanket">IClientSecurity::SetBlanket</a> call (or the default value). Default values are only valid until the proxy is released. If the caller specifies <b>NULL</b>, the client identity is not retrieved. The format of the structure that the handle refers to depends on the authentication service. The application should not write or free the memory. For NTLMSSP and Kerberos, if the client specified a structure in the <i>pAuthInfo</i> parameter to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializesecurity">CoInitializeSecurity</a>, that value is returned. For Schannel, if a certificate for the client could be retrieved from the certificate manager, that value is returned here. Otherwise, <b>NULL</b> is returned. See <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-auth-identity-handle">RPC_AUTH_IDENTITY_HANDLE</a>.
     * @param {Pointer<Integer>} pCapabilites A pointer to a variable that receives the capabilities of the proxy. If the caller specifies <b>NULL</b>, the current capability flags are not retrieved.
     * @returns {HRESULT} This function can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-coqueryproxyblanket
     * @since windows5.0
     */
    static CoQueryProxyBlanket(pProxy, pwAuthnSvc, pAuthzSvc, pServerPrincName, pAuthnLevel, pImpLevel, pAuthInfo, pCapabilites) {
        pwAuthnSvcMarshal := pwAuthnSvc is VarRef ? "uint*" : "ptr"
        pAuthzSvcMarshal := pAuthzSvc is VarRef ? "uint*" : "ptr"
        pServerPrincNameMarshal := pServerPrincName is VarRef ? "ptr*" : "ptr"
        pAuthnLevelMarshal := pAuthnLevel is VarRef ? "uint*" : "ptr"
        pImpLevelMarshal := pImpLevel is VarRef ? "uint*" : "ptr"
        pAuthInfoMarshal := pAuthInfo is VarRef ? "ptr*" : "ptr"
        pCapabilitesMarshal := pCapabilites is VarRef ? "uint*" : "ptr"

        result := DllCall("OLE32.dll\CoQueryProxyBlanket", "ptr", pProxy, pwAuthnSvcMarshal, pwAuthnSvc, pAuthzSvcMarshal, pAuthzSvc, pServerPrincNameMarshal, pServerPrincName, pAuthnLevelMarshal, pAuthnLevel, pImpLevelMarshal, pImpLevel, pAuthInfoMarshal, pAuthInfo, pCapabilitesMarshal, pCapabilites, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the authentication information that will be used to make calls on the specified proxy.
     * @param {IUnknown} pProxy The proxy to be set.
     * @param {Integer} dwAuthnSvc The authentication service to be used. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/com/com-authentication-service-constants">Authentication Service Constants</a>. Use RPC_C_AUTHN_NONE if no authentication is required. If RPC_C_AUTHN_DEFAULT is specified, DCOM will pick an authentication service following its normal security blanket negotiation algorithm.
     * @param {Integer} dwAuthzSvc The authorization service to be used. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/com/com-authorization-constants">Authorization Constants</a>. If RPC_C_AUTHZ_DEFAULT is specified, DCOM will pick an authorization service following its normal security blanket negotiation algorithm. RPC_C_AUTHZ_NONE should be used as the authorization service if NTLMSSP, Kerberos, or Schannel is used as the authentication service.
     * @param {PWSTR} pServerPrincName The server principal name to be used with the authentication service. If COLE_DEFAULT_PRINCIPAL is specified, DCOM will pick a principal name using its security blanket negotiation algorithm. If Kerberos is used as the authentication service, this value must not be <b>NULL</b>. It must be the correct principal name of the server or the call will fail.
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
     * @returns {HRESULT} This function can return the following values.
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
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cosetproxyblanket
     * @since windows5.0
     */
    static CoSetProxyBlanket(pProxy, dwAuthnSvc, dwAuthzSvc, pServerPrincName, dwAuthnLevel, dwImpLevel, pAuthInfo, dwCapabilities) {
        pServerPrincName := pServerPrincName is String ? StrPtr(pServerPrincName) : pServerPrincName

        pAuthInfoMarshal := pAuthInfo is VarRef ? "ptr" : "ptr"

        result := DllCall("OLE32.dll\CoSetProxyBlanket", "ptr", pProxy, "uint", dwAuthnSvc, "uint", dwAuthzSvc, "ptr", pServerPrincName, "uint", dwAuthnLevel, "uint", dwImpLevel, pAuthInfoMarshal, pAuthInfo, "uint", dwCapabilities, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Makes a private copy of the specified proxy.
     * @param {IUnknown} pProxy A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the proxy to be copied. This parameter cannot be <b>NULL</b>.
     * @returns {IUnknown} Address of the pointer variable that receives the interface pointer to the copy of the proxy. This parameter cannot be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cocopyproxy
     * @since windows5.0
     */
    static CoCopyProxy(pProxy) {
        result := DllCall("OLE32.dll\CoCopyProxy", "ptr", pProxy, "ptr*", &ppCopy := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppCopy)
    }

    /**
     * Called by the server to find out about the client that invoked the method executing on the current thread.
     * @param {Pointer<Integer>} pAuthnSvc A pointer to a variable that receives the current authentication service. This will be a single value taken from the <a href="https://docs.microsoft.com/windows/desktop/com/com-authentication-service-constants">authentication service constants</a>. If the caller specifies <b>NULL</b>, the current authentication service is not retrieved.
     * @param {Pointer<Integer>} pAuthzSvc A pointer to a variable that receives the current authorization service. This will be a single value taken from the <a href="https://docs.microsoft.com/windows/desktop/com/com-authorization-constants">authorization constants</a>. If the caller specifies <b>NULL</b>, the current authorization service is not retrieved.
     * @param {Pointer<PWSTR>} pServerPrincName The current principal name. The string will be allocated by the callee using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>, and must be freed by the caller using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>. By default, Schannel principal names will be in the msstd form. The fullsic form will be returned if EOAC_MAKE_FULLSIC is specified in the <i>pCapabilities</i> parameter. For more information about the msstd and fullsic forms, see <a href="https://docs.microsoft.com/windows/desktop/Rpc/principal-names">Principal Names</a>. If the caller specifies <b>NULL</b>, the current principal name is not retrieved.
     * @param {Pointer<Integer>} pAuthnLevel A pointer to a variable that receives the current authentication level. This will be a single value taken from the <a href="https://docs.microsoft.com/windows/desktop/com/com-authentication-level-constants">authentication level constants</a>. If the caller specifies <b>NULL</b>, the current authentication level is not retrieved.
     * @param {Pointer<Integer>} pImpLevel This parameter must be <b>NULL</b>.
     * @param {Pointer<Pointer<Void>>} pPrivs A pointer to a handle that receives the privilege information for the client application. The format of the structure that the handle refers to depends on the authentication service. The application should not write or free the memory. The information is valid only for the duration of the current call. For NTLMSSP and Kerberos, this is a string identifying the client principal. For Schannel, this is a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that represents the client's certificate. If the client has no certificate, <b>NULL</b> is returned. If the caller specifies <b>NULL</b>, the current privilege information is not retrieved. See <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-authz-handle">RPC_AUTHZ_HANDLE</a>.
     * @param {Pointer<Integer>} pCapabilities A pointer to return flags indicating capabilities of the call. To request that the principal name be returned in fullsic form if Schannel is the authentication service, the caller can set the EOAC_MAKE_FULLSIC flag in this parameter. If the caller specifies <b>NULL</b>, the current capabilities are not retrieved.
     * @returns {HRESULT} This function can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-coqueryclientblanket
     * @since windows5.0
     */
    static CoQueryClientBlanket(pAuthnSvc, pAuthzSvc, pServerPrincName, pAuthnLevel, pImpLevel, pPrivs, pCapabilities) {
        pAuthnSvcMarshal := pAuthnSvc is VarRef ? "uint*" : "ptr"
        pAuthzSvcMarshal := pAuthzSvc is VarRef ? "uint*" : "ptr"
        pServerPrincNameMarshal := pServerPrincName is VarRef ? "ptr*" : "ptr"
        pAuthnLevelMarshal := pAuthnLevel is VarRef ? "uint*" : "ptr"
        pImpLevelMarshal := pImpLevel is VarRef ? "uint*" : "ptr"
        pPrivsMarshal := pPrivs is VarRef ? "ptr*" : "ptr"
        pCapabilitiesMarshal := pCapabilities is VarRef ? "uint*" : "ptr"

        result := DllCall("OLE32.dll\CoQueryClientBlanket", pAuthnSvcMarshal, pAuthnSvc, pAuthzSvcMarshal, pAuthzSvc, pServerPrincNameMarshal, pServerPrincName, pAuthnLevelMarshal, pAuthnLevel, pImpLevelMarshal, pImpLevel, pPrivsMarshal, pPrivs, pCapabilitiesMarshal, pCapabilities, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enables the server to impersonate the client of the current call for the duration of the call.
     * @returns {HRESULT} This function supports the standard return values, including S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-coimpersonateclient
     * @since windows5.0
     */
    static CoImpersonateClient() {
        result := DllCall("OLE32.dll\CoImpersonateClient", "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Restores the authentication information on a thread of execution.
     * @returns {HRESULT} This function supports the standard return values, including S_OK to indicate success.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-coreverttoself
     * @since windows5.0
     */
    static CoRevertToSelf() {
        result := DllCall("OLE32.dll\CoRevertToSelf", "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a list of the authentication services registered when the process called CoInitializeSecurity.
     * @param {Pointer<Integer>} pcAuthSvc A pointer to a variable that receives the number of entries returned in the <i>asAuthSvc</i> array.
     * @param {Pointer<Pointer<SOLE_AUTHENTICATION_SERVICE>>} asAuthSvc A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-sole_authentication_service">SOLE_AUTHENTICATION_SERVICE</a> structures. The list is allocated through a call to the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> function. The caller must free the list when finished with it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @returns {HRESULT} This function can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-coqueryauthenticationservices
     * @since windows5.0
     */
    static CoQueryAuthenticationServices(pcAuthSvc, asAuthSvc) {
        pcAuthSvcMarshal := pcAuthSvc is VarRef ? "uint*" : "ptr"
        asAuthSvcMarshal := asAuthSvc is VarRef ? "ptr*" : "ptr"

        result := DllCall("OLE32.dll\CoQueryAuthenticationServices", pcAuthSvcMarshal, pcAuthSvc, asAuthSvcMarshal, asAuthSvc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Switches the call context object used by CoGetCallContext.
     * @param {IUnknown} pNewObject A pointer to an interface on the new call context object. COM stores this pointer without adding a reference to the pointer until <b>CoSwitchCallContext</b> is called with another object. This parameter may be <b>NULL</b> if you are calling <b>CoSwitchCallContext</b> to switch back to the original call context but there was no original call context.
     * @returns {IUnknown} The address of pointer variable that receives a pointer to the call context object of the call currently in progress. This value is returned so that the original call context can be restored by the custom marshaller. The returned pointer will be <b>NULL</b> if there was no call in progress.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-coswitchcallcontext
     * @since windows5.0
     */
    static CoSwitchCallContext(pNewObject) {
        result := DllCall("OLE32.dll\CoSwitchCallContext", "ptr", pNewObject, "ptr*", &ppOldObject := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppOldObject)
    }

    /**
     * Creates a single uninitialized object of the class associated with a specified CLSID.
     * @param {Pointer<Guid>} rclsid The CLSID associated with the data and code that will be used to create the object.
     * @param {IUnknown} pUnkOuter If <b>NULL</b>, indicates that the object is not being created as part of an aggregate. If non-<b>NULL</b>, pointer to the aggregate object's <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface (the controlling <b>IUnknown</b>).
     * @param {Integer} dwClsContext Context in which the code that manages the newly created object will run. The values are taken from the enumeration <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-clsctx">CLSCTX</a>.
     * @param {Pointer<Guid>} riid A reference to the identifier of the interface to be used to communicate with the object.
     * @returns {Pointer<Void>} Address of pointer variable that receives the interface pointer requested in <i>riid</i>. Upon successful return, *<i>ppv</i> contains the requested interface pointer. Upon failure, *<i>ppv</i> contains <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cocreateinstance
     * @since windows5.0
     */
    static CoCreateInstance(rclsid, pUnkOuter, dwClsContext, riid) {
        result := DllCall("OLE32.dll\CoCreateInstance", "ptr", rclsid, "ptr", pUnkOuter, "uint", dwClsContext, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }

    /**
     * Creates an instance of a specific class on a specific computer.
     * @param {Pointer<Guid>} Clsid The CLSID of the object to be created.
     * @param {IUnknown} punkOuter If this parameter non-<b>NULL</b>, indicates the instance is being created as part of an aggregate, and <i>punkOuter</i> is to be used as the new instance's controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>. Aggregation is currently not supported cross-process or cross-computer. When instantiating an object out of process, CLASS_E_NOAGGREGATION will be returned if <i>punkOuter</i> is non-<b>NULL</b>.
     * @param {Integer} dwClsCtx A value from the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-clsctx">CLSCTX</a> enumeration.
     * @param {Pointer<COSERVERINFO>} pServerInfo Information about the computer on which to instantiate the object. See <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-coserverinfo">COSERVERINFO</a>. This parameter can be <b>NULL</b>, in which case the object is instantiated on the local computer or at the computer specified in the registry under the class's <a href="https://docs.microsoft.com/windows/desktop/com/remoteservername">RemoteServerName</a> value, according to the interpretation of the <i>dwClsCtx</i> parameter.
     * @param {Integer} dwCount The number of structures in <i>pResults</i>. This value must be greater than 0.
     * @param {Pointer<MULTI_QI>} pResults An array of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-multi_qi">MULTI_QI</a> structures. Each structure has three members: the identifier for a requested interface (<b>pIID</b>), the location to return the interface pointer (<b>pItf</b>) and the return value of the call to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> (<b>hr</b>).
     * @returns {HRESULT} This function can return the standard return value E_INVALIDARG, as well as the following values.
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
     * A specified class is not registered in the registration database. Also can indicate that the type of server you requested in the <a href="/windows/desktop/api/wtypesbase/ne-wtypesbase-clsctx">CLSCTX</a> enumeration is not registered or the values for the server types in the registry are corrupt.
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
     * At least one, but not all of the interfaces requested in the <i>pResults</i> array were successfully retrieved. The <b>hr</b> member of each of the <a href="/windows/desktop/api/objidl/ns-objidl-multi_qi">MULTI_QI</a> structures in <i>pResults</i> indicates with S_OK or E_NOINTERFACE whether the specific interface was returned.
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
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cocreateinstanceex
     * @since windows5.0
     */
    static CoCreateInstanceEx(Clsid, punkOuter, dwClsCtx, pServerInfo, dwCount, pResults) {
        result := DllCall("OLE32.dll\CoCreateInstanceEx", "ptr", Clsid, "ptr", punkOuter, "uint", dwClsCtx, "ptr", pServerInfo, "uint", dwCount, "ptr", pResults, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates an instance of a specific class on a specific computer from within an app container.
     * @param {Pointer<Guid>} Clsid The CLSID of the object to be created.
     * @param {IUnknown} punkOuter If this parameter non-<b>NULL</b>, indicates the instance is being created as part of an aggregate, and <i>punkOuter</i> is to be used as the new instance's controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>. Aggregation is currently not supported cross-process or cross-computer. When instantiating an object out of process, CLASS_E_NOAGGREGATION will be returned if <i>punkOuter</i> is non-<b>NULL</b>.
     * @param {Integer} dwClsCtx A value from the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-clsctx">CLSCTX</a> enumeration.
     * @param {Pointer<Void>} reserved Reserved for future use.
     * @param {Integer} dwCount The number of structures in <i>pResults</i>. This value must be greater than 0.
     * @param {Pointer<MULTI_QI>} pResults An array of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-multi_qi">MULTI_QI</a> structures. Each structure has three members: the identifier for a requested interface (<b>pIID</b>), the location to return the interface pointer (<b>pItf</b>) and the return value of the call to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> (<b>hr</b>).
     * @returns {HRESULT} This function can return the standard return value E_INVALIDARG, as well as the following values.
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
     * A specified class is not registered in the registration database, or the class is not supported in the app container. Also can indicate that the type of server you requested in the <a href="/windows/desktop/api/wtypesbase/ne-wtypesbase-clsctx">CLSCTX</a> enumeration is not registered or the values for the server types in the registry are corrupt. 
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
     * At least one, but not all of the interfaces requested in the <i>pResults</i> array were successfully retrieved. The <b>hr</b> member of each of the <a href="/windows/desktop/api/objidl/ns-objidl-multi_qi">MULTI_QI</a> structures in <i>pResults</i> indicates with S_OK or E_NOINTERFACE whether the specific interface was returned.
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
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cocreateinstancefromapp
     * @since windows8.0
     */
    static CoCreateInstanceFromApp(Clsid, punkOuter, dwClsCtx, reserved, dwCount, pResults) {
        reservedMarshal := reserved is VarRef ? "ptr" : "ptr"

        result := DllCall("OLE32.dll\CoCreateInstanceFromApp", "ptr", Clsid, "ptr", punkOuter, "uint", dwClsCtx, reservedMarshal, reserved, "uint", dwCount, "ptr", pResults, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Registers a process-wide filter to process activation requests.
     * @param {IActivationFilter} pActivationFilter Pointer to the filter to register.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-coregisteractivationfilter
     * @since windows5.1.2600
     */
    static CoRegisterActivationFilter(pActivationFilter) {
        result := DllCall("OLE32.dll\CoRegisterActivationFilter", "ptr", pActivationFilter, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Obtains a pointer to a call control interface, normally ICancelMethodCalls, on the cancel object corresponding to an outbound COM method call pending on the same or another client thread.
     * @param {Integer} dwThreadId The identifier of the thread on which the pending COM call is to be canceled. If this parameter is 0, the call is on the current thread.
     * @param {Pointer<Guid>} iid The globally unique identifier of an interface on the cancel object for the call to be canceled. This argument is usually IID_ICancelMethodCalls.
     * @returns {Pointer<Void>} Receives the address of a pointer to the interface specified by <i>riid</i>.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cogetcancelobject
     * @since windows5.0
     */
    static CoGetCancelObject(dwThreadId, iid) {
        result := DllCall("OLE32.dll\CoGetCancelObject", "uint", dwThreadId, "ptr", iid, "ptr*", &ppUnk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppUnk
    }

    /**
     * Sets (registers) or resets (unregisters) a cancel object for use during subsequent cancel operations on the current thread.
     * @param {IUnknown} pUnk Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the cancel object to be set or reset on the current thread. If this parameter is <b>NULL</b>, the topmost cancel object is reset.
     * @returns {HRESULT} This function can return the standard return values E_FAIL, E_INVALIDARG, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
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
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cosetcancelobject
     * @since windows5.0
     */
    static CoSetCancelObject(pUnk) {
        result := DllCall("OLE32.dll\CoSetCancelObject", "ptr", pUnk, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Requests cancellation of an outbound DCOM method call pending on a specified thread.
     * @param {Integer} dwThreadId The identifier of the thread on which the pending DCOM call is to be canceled. If this parameter is 0, the call is on the current thread.
     * @param {Integer} ulTimeout The number of seconds <b>CoCancelCall</b> waits for the server to complete the outbound call after the client requests cancellation.
     * @returns {HRESULT} This function can return the standard return values E_FAIL, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
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
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cocancelcall
     * @since windows5.0
     */
    static CoCancelCall(dwThreadId, ulTimeout) {
        result := DllCall("OLE32.dll\CoCancelCall", "uint", dwThreadId, "uint", ulTimeout, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines whether the call being executed on the server has been canceled by the client.
     * @returns {HRESULT} This function can return the standard return values E_FAIL, E_INVALIDARG, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
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
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cotestcancel
     * @since windows5.0
     */
    static CoTestCancel() {
        result := DllCall("OLE32.dll\CoTestCancel", "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enables cancellation of synchronous calls on the calling thread.
     * @returns {HRESULT} This function can return the standard return values S_OK, E_FAIL, E_INVALIDARG, and E_OUTOFMEMORY.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-coenablecallcancellation
     * @since windows5.0
     */
    static CoEnableCallCancellation() {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("OLE32.dll\CoEnableCallCancellation", "ptr", pReserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Undoes the action of a call to CoEnableCallCancellation. Disables cancellation of synchronous calls on the calling thread when all calls to CoEnableCallCancellation are balanced by calls to CoDisableCallCancellation.
     * @returns {HRESULT} This function can return the standard return values E_FAIL, E_INVALIDARG, E_OUTOFMEMORY, and E_UNEXPECTED, as well as the following values.
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
     * There have been more successful calls to <a href="/windows/desktop/api/combaseapi/nf-combaseapi-coenablecallcancellation">CoEnableCallCancellation</a> on the thread than there have been calls to <a href="/windows/desktop/api/combaseapi/nf-combaseapi-codisablecallcancellation">CoDisableCallCancellation</a>. Cancellation is still enabled on the thread.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-codisablecallcancellation
     * @since windows5.0
     */
    static CoDisableCallCancellation() {
        static pReserved := 0 ;Reserved parameters must always be NULL

        result := DllCall("OLE32.dll\CoDisableCallCancellation", "ptr", pReserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Converts a CLSID into a string of printable characters. Different CLSIDs always convert to different strings.
     * @param {Pointer<Guid>} rclsid The CLSID to be converted.
     * @returns {PWSTR} The address of a pointer variable that receives a pointer to the resulting string. The string that represents <i>rclsid</i> includes enclosing braces.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-stringfromclsid
     * @since windows5.0
     */
    static StringFromCLSID(rclsid) {
        result := DllCall("OLE32.dll\StringFromCLSID", "ptr", rclsid, "ptr*", &lplpsz := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lplpsz
    }

    /**
     * Converts a string generated by the StringFromCLSID function back into the original CLSID.
     * @param {PWSTR} lpsz The string representation of the CLSID.
     * @param {Pointer<Guid>} pclsid A pointer to the CLSID.
     * @returns {HRESULT} This function can return the standard return value E_INVALIDARG, as well as the following values.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>REGDB_E_CLASSNOTREG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The CLSID corresponding to the class string was not found in the registry.
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
     * The registry could not be opened for reading.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-clsidfromstring
     * @since windows5.0
     */
    static CLSIDFromString(lpsz, pclsid) {
        lpsz := lpsz is String ? StrPtr(lpsz) : lpsz

        result := DllCall("OLE32.dll\CLSIDFromString", "ptr", lpsz, "ptr", pclsid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Converts an interface identifier into a string of printable characters.
     * @param {Pointer<Guid>} rclsid The interface identifier to be converted.
     * @returns {PWSTR} The address of a pointer variable that receives a pointer to the resulting string. The string that represents <i>rclsid</i> includes enclosing braces.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-stringfromiid
     * @since windows5.0
     */
    static StringFromIID(rclsid) {
        result := DllCall("OLE32.dll\StringFromIID", "ptr", rclsid, "ptr*", &lplpsz := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lplpsz
    }

    /**
     * Converts a string generated by the StringFromIID function back into the original interface identifier (IID).
     * @param {PWSTR} lpsz A pointer to the string representation of the IID.
     * @param {Pointer<Guid>} lpiid A pointer to the requested IID on return.
     * @returns {HRESULT} This function can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-iidfromstring
     * @since windows5.0
     */
    static IIDFromString(lpsz, lpiid) {
        lpsz := lpsz is String ? StrPtr(lpsz) : lpsz

        result := DllCall("OLE32.dll\IIDFromString", "ptr", lpsz, "ptr", lpiid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the ProgID for a given CLSID.
     * @param {Pointer<Guid>} clsid The CLSID for which the ProgID is to be requested.
     * @returns {PWSTR} The address of a pointer variable that receives the ProgID string. The string that represents <i>clsid</i> includes enclosing braces.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-progidfromclsid
     * @since windows5.0
     */
    static ProgIDFromCLSID(clsid) {
        result := DllCall("OLE32.dll\ProgIDFromCLSID", "ptr", clsid, "ptr*", &lplpszProgID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lplpszProgID
    }

    /**
     * Looks up a CLSID in the registry, given a ProgID.
     * @param {PWSTR} lpszProgID A pointer to the ProgID whose CLSID is requested.
     * @param {Pointer<Guid>} lpclsid Receives a pointer to the retrieved CLSID on return.
     * @returns {HRESULT} This function can return the following values.
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
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-clsidfromprogid
     * @since windows5.0
     */
    static CLSIDFromProgID(lpszProgID, lpclsid) {
        lpszProgID := lpszProgID is String ? StrPtr(lpszProgID) : lpszProgID

        result := DllCall("OLE32.dll\CLSIDFromProgID", "ptr", lpszProgID, "ptr", lpclsid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Converts a globally unique identifier (GUID) into a string of printable characters.
     * @param {Pointer<Guid>} rguid The GUID to be converted.
     * @param {PWSTR} lpsz A pointer to a caller-allocated string variable to receive the resulting string. The string that represents <i>rguid</i> includes enclosing braces.
     * @param {Integer} cchMax The number of characters available in the <i>lpsz</i> buffer.
     * @returns {Integer} If the function succeeds, the return value is the number of characters in the returned string, including the null terminator. If the buffer is too small to contain the string, the return value is 0.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-stringfromguid2
     * @since windows5.0
     */
    static StringFromGUID2(rguid, lpsz, cchMax) {
        lpsz := lpsz is String ? StrPtr(lpsz) : lpsz

        result := DllCall("OLE32.dll\StringFromGUID2", "ptr", rguid, "ptr", lpsz, "int", cchMax, "int")
        return result
    }

    /**
     * Creates a GUID, a unique 128-bit integer used for CLSIDs and interface identifiers.
     * @param {Pointer<Guid>} pguid A pointer to the requested GUID.
     * @returns {HRESULT} <table>
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
     * Errors returned by <a href="/windows/desktop/api/rpcdce/nf-rpcdce-uuidcreate">UuidCreate</a> are wrapped as an <b>HRESULT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cocreateguid
     * @since windows5.0
     */
    static CoCreateGuid(pguid) {
        result := DllCall("OLE32.dll\CoCreateGuid", "ptr", pguid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Waits for specified handles to be signaled or for a specified timeout period to elapse.
     * @param {Integer} dwFlags The wait options. Possible values are taken from the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/ne-combaseapi-cowait_flags">COWAIT_FLAGS</a> enumeration.
     * @param {Integer} dwTimeout The timeout period, in milliseconds.
     * @param {Integer} cHandles The number of elements in the <i>pHandles</i> array.
     * @param {Pointer<HANDLE>} pHandles An array of handles.
     * @returns {Integer} A pointer to a variable that, when the returned status is S_OK, receives a value indicating the event that caused the function to return. This value is usually the index into <i>pHandles</i> for the handle that was signaled.
     * 
     * If <i>pHandles</i> includes one or more handles to mutex objects, a value between WAIT_ABANDONED_0 and (WAIT_ABANDONED_0 + nCount - 1) indicates the index into <i>pHandles</i> for the mutex that was abandoned.
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/ne-combaseapi-cowait_flags">COWAIT_ALERTABLE</a> flag is set in <i>dwFlags</i>, a value of WAIT_IO_COMPLETION indicates the wait was ended by one or more user-mode asynchronous procedure calls (APC) queued to the thread.
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-waitformultipleobjectsex">WaitForMultipleObjectsEx</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cowaitformultiplehandles
     * @since windows5.0
     */
    static CoWaitForMultipleHandles(dwFlags, dwTimeout, cHandles, pHandles) {
        result := DllCall("OLE32.dll\CoWaitForMultipleHandles", "uint", dwFlags, "uint", dwTimeout, "uint", cHandles, "ptr", pHandles, "uint*", &lpdwindex := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lpdwindex
    }

    /**
     * A replacement for CoWaitForMultipleHandles. This replacement API hides the options for CoWaitForMultipleHandles that are not supported in ASTA.
     * @param {Integer} dwFlags <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/ne-combaseapi-cwmo_flags">CWMO_FLAGS</a> flag controlling whether call/window message reentrancy is enabled from this wait. By default, neither COM calls nor window messages are dispatched from <b>CoWaitForMultipleObjects</b> in ASTA.
     * @param {Integer} dwTimeout The timeout in milliseconds of the wait.
     * @param {Integer} cHandles The length of the <i>pHandles</i> array. Must be &lt;= 56.
     * @param {Pointer<HANDLE>} pHandles An array of handles to waitable kernel objects.
     * @returns {Integer} Receives the index of the handle that satisfied the wait.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cowaitformultipleobjects
     */
    static CoWaitForMultipleObjects(dwFlags, dwTimeout, cHandles, pHandles) {
        result := DllCall("OLE32.dll\CoWaitForMultipleObjects", "uint", dwFlags, "uint", dwTimeout, "uint", cHandles, "ptr", pHandles, "uint*", &lpdwindex := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lpdwindex
    }

    /**
     * Returns the CLSID of an object that can emulate the specified object.
     * @param {Pointer<Guid>} clsidOld The CLSID of the object that can be emulated (treated as) an object with a different CLSID.
     * @param {Pointer<Guid>} pClsidNew A pointer to where the CLSID that can emulate <i>clsidOld</i> objects is retrieved. This parameter cannot be <b>NULL</b>. If there is no emulation information for <i>clsidOld</i> objects, the <i>clsidOld</i> parameter is supplied.
     * @returns {HRESULT} This function can return the following values, as well as any error values returned by the <a href="/windows/desktop/api/combaseapi/nf-combaseapi-clsidfromstring">CLSIDFromString</a> function.
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
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cogettreatasclass
     * @since windows5.0
     */
    static CoGetTreatAsClass(clsidOld, pClsidNew) {
        result := DllCall("OLE32.dll\CoGetTreatAsClass", "ptr", clsidOld, "ptr", pClsidNew, "int")
        return result
    }

    /**
     * Tells the service control manager to flush any cached RPC binding handles for the specified computer.
     * @param {PWSTR} pszMachineName The computer name for which binding handles should be flushed, or an empty string to signify that all handles in the cache should be flushed.
     * @returns {HRESULT} This function can return the following values.
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
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-coinvalidateremotemachinebindings
     * @since windows5.1.2600
     */
    static CoInvalidateRemoteMachineBindings(pszMachineName) {
        pszMachineName := pszMachineName is String ? StrPtr(pszMachineName) : pszMachineName

        result := DllCall("OLE32.dll\CoInvalidateRemoteMachineBindings", "ptr", pszMachineName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Allocates a block of task memory in the same way that IMalloc::Alloc does.
     * @param {Pointer} cb The size of the memory block to be allocated, in bytes.
     * @returns {Pointer<Void>} If the function succeeds, it returns the allocated memory block. Otherwise, it returns <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cotaskmemalloc
     * @since windows5.0
     */
    static CoTaskMemAlloc(cb) {
        result := DllCall("OLE32.dll\CoTaskMemAlloc", "ptr", cb, "ptr")
        return result
    }

    /**
     * Changes the size of a previously allocated block of task memory.
     * @param {Pointer<Void>} pv A pointer to the memory block to be reallocated. This parameter can be <b>NULL</b>, as discussed in Remarks.
     * @param {Pointer} cb The size of the memory block to be reallocated, in bytes. This parameter can be 0, as discussed in Remarks.
     * @returns {Pointer<Void>} If the function succeeds, it returns the reallocated memory block. Otherwise, it returns <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cotaskmemrealloc
     * @since windows5.0
     */
    static CoTaskMemRealloc(pv, cb) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        result := DllCall("OLE32.dll\CoTaskMemRealloc", pvMarshal, pv, "ptr", cb, "ptr")
        return result
    }

    /**
     * Frees a block of task memory previously allocated through a call to the CoTaskMemAlloc or CoTaskMemRealloc function.
     * @remarks
     * 
     * The <b>CoTaskMemFree</b> function uses the default OLE allocator.
     * 
     * The number of bytes freed equals the number of bytes that were originally allocated or reallocated. After the call, the memory block pointed to by pv is invalid and can no longer be used.
     * 
     * 
     * @param {Pointer<Void>} pv A pointer to the memory block to be freed. If this parameter is <b>NULL</b>, the function has no effect.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//combaseapi/nf-combaseapi-cotaskmemfree
     * @since windows5.0
     */
    static CoTaskMemFree(pv) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        DllCall("OLE32.dll\CoTaskMemFree", pvMarshal, pv)
    }

    /**
     * 
     * @param {PWSTR} deviceInstanceId 
     * @param {Pointer<CO_DEVICE_CATALOG_COOKIE>} cookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-coregisterdevicecatalog
     */
    static CoRegisterDeviceCatalog(deviceInstanceId, cookie) {
        deviceInstanceId := deviceInstanceId is String ? StrPtr(deviceInstanceId) : deviceInstanceId

        result := DllCall("OLE32.dll\CoRegisterDeviceCatalog", "ptr", deviceInstanceId, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {CO_DEVICE_CATALOG_COOKIE} cookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/combaseapi/nf-combaseapi-corevokedevicecatalog
     */
    static CoRevokeDeviceCatalog(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := DllCall("OLE32.dll\CoRevokeDeviceCatalog", "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzURI 
     * @param {Integer} dwFlags 
     * @returns {IUri} 
     */
    static CreateUri(pwzURI, dwFlags) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        pwzURI := pwzURI is String ? StrPtr(pwzURI) : pwzURI

        result := DllCall("URLMON.dll\CreateUri", "ptr", pwzURI, "uint", dwFlags, "ptr", dwReserved, "ptr*", &ppURI := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUri(ppURI)
    }

    /**
     * 
     * @param {PWSTR} pwzURI 
     * @param {PWSTR} pwzFragment 
     * @param {Integer} dwFlags 
     * @returns {IUri} 
     */
    static CreateUriWithFragment(pwzURI, pwzFragment, dwFlags) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        pwzURI := pwzURI is String ? StrPtr(pwzURI) : pwzURI
        pwzFragment := pwzFragment is String ? StrPtr(pwzFragment) : pwzFragment

        result := DllCall("URLMON.dll\CreateUriWithFragment", "ptr", pwzURI, "ptr", pwzFragment, "uint", dwFlags, "ptr", dwReserved, "ptr*", &ppURI := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUri(ppURI)
    }

    /**
     * 
     * @param {PSTR} pszANSIInputUri 
     * @param {Integer} dwEncodingFlags 
     * @param {Integer} dwCodePage 
     * @param {Integer} dwCreateFlags 
     * @returns {IUri} 
     */
    static CreateUriFromMultiByteString(pszANSIInputUri, dwEncodingFlags, dwCodePage, dwCreateFlags) {
        static dwReserved := 0 ;Reserved parameters must always be NULL

        pszANSIInputUri := pszANSIInputUri is String ? StrPtr(pszANSIInputUri) : pszANSIInputUri

        result := DllCall("urlmon.dll\CreateUriFromMultiByteString", "ptr", pszANSIInputUri, "uint", dwEncodingFlags, "uint", dwCodePage, "uint", dwCreateFlags, "ptr", dwReserved, "ptr*", &ppUri := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUri(ppUri)
    }

    /**
     * 
     * @param {IUri} pIUri 
     * @param {Integer} dwFlags 
     * @param {Pointer} dwReserved 
     * @returns {IUriBuilder} 
     */
    static CreateIUriBuilder(pIUri, dwFlags, dwReserved) {
        result := DllCall("URLMON.dll\CreateIUriBuilder", "ptr", pIUri, "uint", dwFlags, "ptr", dwReserved, "ptr*", &ppIUriBuilder := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUriBuilder(ppIUriBuilder)
    }

    /**
     * Sets the error information object for the current logical thread of execution.
     * @param {Integer} dwReserved Reserved for future use. Must be zero.
     * @param {IErrorInfo} perrinfo An error object.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-seterrorinfo
     */
    static SetErrorInfo(dwReserved, perrinfo) {
        result := DllCall("OLEAUT32.dll\SetErrorInfo", "uint", dwReserved, "ptr", perrinfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Obtains the error information pointer set by the previous call to SetErrorInfo in the current logical thread.
     * @param {Integer} dwReserved Reserved for future use. Must be zero.
     * @returns {IErrorInfo} An error object.
     * @see https://docs.microsoft.com/windows/win32/api//oleauto/nf-oleauto-geterrorinfo
     */
    static GetErrorInfo(dwReserved) {
        result := DllCall("OLEAUT32.dll\GetErrorInfo", "uint", dwReserved, "ptr*", &pperrinfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IErrorInfo(pperrinfo)
    }

;@endregion Methods
}
