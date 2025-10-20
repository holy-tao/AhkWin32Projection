#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include .\HCONVLIST.ahk
#Include .\HCONV.ahk
#Include .\HDDEDATA.ahk
#Include .\HSZ.ahk
#Include ..\..\Graphics\Gdi\HENHMETAFILE.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.System.DataExchange
 * @version v4.0.30319
 */
class DataExchange {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static WM_DDE_FIRST => 992

    /**
     * @type {Integer (UInt32)}
     */
    static WM_DDE_INITIATE => 992

    /**
     * @type {Integer (UInt32)}
     */
    static WM_DDE_TERMINATE => 993

    /**
     * @type {Integer (UInt32)}
     */
    static WM_DDE_ADVISE => 994

    /**
     * @type {Integer (UInt32)}
     */
    static WM_DDE_UNADVISE => 995

    /**
     * @type {Integer (UInt32)}
     */
    static WM_DDE_ACK => 996

    /**
     * @type {Integer (UInt32)}
     */
    static WM_DDE_DATA => 997

    /**
     * @type {Integer (UInt32)}
     */
    static WM_DDE_REQUEST => 998

    /**
     * @type {Integer (UInt32)}
     */
    static WM_DDE_POKE => 999

    /**
     * @type {Integer (UInt32)}
     */
    static WM_DDE_EXECUTE => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static WM_DDE_LAST => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static CADV_LATEACK => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static DDE_FACK => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static DDE_FBUSY => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DDE_FDEFERUPD => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DDE_FACKREQ => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static DDE_FRELEASE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DDE_FREQUESTED => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DDE_FAPPSTATUS => 255

    /**
     * @type {Integer (UInt32)}
     */
    static DDE_FNOTPROCESSED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MSGF_DDEMGR => 32769

    /**
     * @type {Integer (Int32)}
     */
    static CP_WINANSI => 1004

    /**
     * @type {Integer (Int32)}
     */
    static CP_WINUNICODE => 1200

    /**
     * @type {Integer (Int32)}
     */
    static CP_WINNEUTRAL => 1200

    /**
     * @type {Integer (UInt32)}
     */
    static XTYPF_NOBLOCK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static XTYPF_NODATA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static XTYPF_ACKREQ => 8

    /**
     * @type {Integer (UInt32)}
     */
    static XCLASS_MASK => 64512

    /**
     * @type {Integer (UInt32)}
     */
    static XCLASS_BOOL => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static XCLASS_DATA => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static XCLASS_FLAGS => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static XCLASS_NOTIFICATION => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static XTYP_MASK => 240

    /**
     * @type {Integer (UInt32)}
     */
    static XTYP_SHIFT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TIMEOUT_ASYNC => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static QID_SYNC => 4294967295

    /**
     * @type {String}
     */
    static SZDDESYS_TOPIC => "System"

    /**
     * @type {String}
     */
    static SZDDESYS_ITEM_TOPICS => "Topics"

    /**
     * @type {String}
     */
    static SZDDESYS_ITEM_SYSITEMS => "SysItems"

    /**
     * @type {String}
     */
    static SZDDESYS_ITEM_RTNMSG => "ReturnMessage"

    /**
     * @type {String}
     */
    static SZDDESYS_ITEM_STATUS => "Status"

    /**
     * @type {String}
     */
    static SZDDESYS_ITEM_FORMATS => "Formats"

    /**
     * @type {String}
     */
    static SZDDESYS_ITEM_HELP => "Help"

    /**
     * @type {String}
     */
    static SZDDE_ITEM_ITEMLIST => "TopicItemList"

    /**
     * @type {Integer (Int32)}
     */
    static APPCMD_MASK => 4080

    /**
     * @type {Integer (Int32)}
     */
    static APPCLASS_MASK => 15

    /**
     * @type {Integer (UInt32)}
     */
    static HDATA_APPOWNED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DMLERR_NO_ERROR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DMLERR_FIRST => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DMLERR_ADVACKTIMEOUT => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DMLERR_BUSY => 16385

    /**
     * @type {Integer (UInt32)}
     */
    static DMLERR_DATAACKTIMEOUT => 16386

    /**
     * @type {Integer (UInt32)}
     */
    static DMLERR_DLL_NOT_INITIALIZED => 16387

    /**
     * @type {Integer (UInt32)}
     */
    static DMLERR_DLL_USAGE => 16388

    /**
     * @type {Integer (UInt32)}
     */
    static DMLERR_EXECACKTIMEOUT => 16389

    /**
     * @type {Integer (UInt32)}
     */
    static DMLERR_INVALIDPARAMETER => 16390

    /**
     * @type {Integer (UInt32)}
     */
    static DMLERR_LOW_MEMORY => 16391

    /**
     * @type {Integer (UInt32)}
     */
    static DMLERR_MEMORY_ERROR => 16392

    /**
     * @type {Integer (UInt32)}
     */
    static DMLERR_NOTPROCESSED => 16393

    /**
     * @type {Integer (UInt32)}
     */
    static DMLERR_NO_CONV_ESTABLISHED => 16394

    /**
     * @type {Integer (UInt32)}
     */
    static DMLERR_POKEACKTIMEOUT => 16395

    /**
     * @type {Integer (UInt32)}
     */
    static DMLERR_POSTMSG_FAILED => 16396

    /**
     * @type {Integer (UInt32)}
     */
    static DMLERR_REENTRANCY => 16397

    /**
     * @type {Integer (UInt32)}
     */
    static DMLERR_SERVER_DIED => 16398

    /**
     * @type {Integer (UInt32)}
     */
    static DMLERR_SYS_ERROR => 16399

    /**
     * @type {Integer (UInt32)}
     */
    static DMLERR_UNADVACKTIMEOUT => 16400

    /**
     * @type {Integer (UInt32)}
     */
    static DMLERR_UNFOUND_QUEUE_ID => 16401

    /**
     * @type {Integer (UInt32)}
     */
    static DMLERR_LAST => 16401

    /**
     * @type {Integer (UInt32)}
     */
    static MH_CREATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MH_KEEP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MH_DELETE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MH_CLEANUP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_MONITORS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MF_MASK => 4278190080
;@endregion Constants

;@region Methods
    /**
     * Specifies the quality of service (QOS) a raw Dynamic Data Exchange (DDE) application desires for future DDE conversations it initiates.
     * @param {HWND} hwndClient Type: <b>HWND</b>
     * 
     * A handle to the DDE client window that specifies the source of <a href="https://docs.microsoft.com/windows/desktop/dataxchg/wm-dde-initiate">WM_DDE_INITIATE</a> messages a client will send to start DDE conversations.
     * @param {Pointer<SECURITY_QUALITY_OF_SERVICE>} pqosNew Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_quality_of_service">SECURITY_QUALITY_OF_SERVICE</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_quality_of_service">SECURITY_QUALITY_OF_SERVICE</a> structure for the desired quality of service values.
     * @param {Pointer<SECURITY_QUALITY_OF_SERVICE>} pqosPrev Type: <b>PSECURITY_QUALITY_OF_SERVICE</b>
     * 
     * A pointer to a 
     * 					<a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_quality_of_service">SECURITY_QUALITY_OF_SERVICE</a> structure that receives the previous quality of service values associated with the window identified by 
     * 					<i>hwndClient</i>. 
     * 
     * This parameter is optional. If an application has no interest in 
     * 					<i>hwndClient</i>'s previous QOS values, it should set 
     * 					<i>pqosPrev</i> to <b>NULL</b>.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dde/nf-dde-ddesetqualityofservice
     * @since windows5.0
     */
    static DdeSetQualityOfService(hwndClient, pqosNew, pqosPrev) {
        hwndClient := hwndClient is Win32Handle ? NumGet(hwndClient, "ptr") : hwndClient

        A_LastError := 0

        result := DllCall("USER32.dll\DdeSetQualityOfService", "ptr", hwndClient, "ptr", pqosNew, "ptr", pqosPrev, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enables a Dynamic Data Exchange (DDE) server application to impersonate a DDE client application's security context. This protects secure server data from unauthorized DDE clients.
     * @param {HWND} hWndClient Type: <b>HWND</b>
     * 
     * A handle to the DDE client window to be impersonated. The client window must have established a DDE conversation with the server window identified by the 
     * 					<i>hWndServer</i> parameter.
     * @param {HWND} hWndServer Type: <b>HWND</b>
     * 
     * A handle to the DDE server window. An application must create the server window before calling this function.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dde/nf-dde-impersonateddeclientwindow
     * @since windows5.0
     */
    static ImpersonateDdeClientWindow(hWndClient, hWndServer) {
        hWndClient := hWndClient is Win32Handle ? NumGet(hWndClient, "ptr") : hWndClient
        hWndServer := hWndServer is Win32Handle ? NumGet(hWndServer, "ptr") : hWndServer

        A_LastError := 0

        result := DllCall("USER32.dll\ImpersonateDdeClientWindow", "ptr", hWndClient, "ptr", hWndServer, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Packs a Dynamic Data Exchange (DDE) lParam value into an internal structure used for sharing DDE data between processes.
     * @param {Integer} msg Type: <b>UINT</b>
     * 
     * The DDE message to be posted.
     * @param {Pointer} uiLo Type: <b>UINT_PTR</b>
     * 
     * A value that corresponds to the 16-bit Windows low-order word of an <i>lParam</i> parameter for the DDE message being posted.
     * @param {Pointer} uiHi Type: <b>UINT_PTR</b>
     * 
     * A value that corresponds to the 16-bit Windows high-order word of an <i>lParam</i> parameter for the DDE message being posted.
     * @returns {LPARAM} Type: <b>LPARAM</b>
     * 
     * The return value is the <i>lParam</i> value.
     * @see https://docs.microsoft.com/windows/win32/api//dde/nf-dde-packddelparam
     * @since windows5.0
     */
    static PackDDElParam(msg, uiLo, uiHi) {
        result := DllCall("USER32.dll\PackDDElParam", "uint", msg, "ptr", uiLo, "ptr", uiHi, "ptr")
        return result
    }

    /**
     * Unpacks a Dynamic Data Exchange (DDE)lParam value received from a posted DDE message.
     * @param {Integer} msg Type: <b>UINT</b>
     * 
     * The posted DDE message.
     * @param {LPARAM} lParam Type: <b>LPARAM</b>
     * 
     * The 
     * 					<i>lParam</i> parameter of the posted DDE message that was received. The application must free the memory object specified by the 
     * 					<i>lParam</i> parameter by calling the <a href="https://docs.microsoft.com/windows/desktop/api/dde/nf-dde-freeddelparam">FreeDDElParam</a> function.
     * @param {Pointer<Pointer>} puiLo Type: <b>PUINT_PTR</b>
     * 
     * A pointer to a variable that receives the low-order word of 
     * 					<i>lParam</i>.
     * @param {Pointer<Pointer>} puiHi Type: <b>PUINT_PTR</b>
     * 
     * A pointer to a variable that receives the high-order word of 
     * 					<i>lParam</i>.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//dde/nf-dde-unpackddelparam
     * @since windows5.0
     */
    static UnpackDDElParam(msg, lParam, puiLo, puiHi) {
        result := DllCall("USER32.dll\UnpackDDElParam", "uint", msg, "ptr", lParam, "ptr*", puiLo, "ptr*", puiHi, "int")
        return result
    }

    /**
     * Frees the memory specified by the lParam parameter of a posted Dynamic Data Exchange (DDE) message. An application receiving a posted DDE message should call this function after it has used the UnpackDDElParam function to unpack the lParam value.
     * @param {Integer} msg Type: <b>UINT</b>
     * 
     * The posted DDE message.
     * @param {LPARAM} lParam Type: <b>LPARAM</b>
     * 
     * The 
     * 					<i>lParam</i> parameter of the posted DDE message.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//dde/nf-dde-freeddelparam
     * @since windows5.0
     */
    static FreeDDElParam(msg, lParam) {
        result := DllCall("USER32.dll\FreeDDElParam", "uint", msg, "ptr", lParam, "int")
        return result
    }

    /**
     * Enables an application to reuse a packed Dynamic Data Exchange (DDE) lParam parameter, rather than allocating a new packed lParam. Using this function reduces reallocations for applications that pass packed DDE messages.
     * @param {LPARAM} lParam Type: <b>LPARAM</b>
     * 
     * The 
     * 					<i>lParam</i> parameter of the posted DDE message being reused.
     * @param {Integer} msgIn Type: <b>UINT</b>
     * 
     * The identifier of the received DDE message.
     * @param {Integer} msgOut Type: <b>UINT</b>
     * 
     * The identifier of the DDE message to be posted. The DDE message will reuse the packed 
     * 					<i>lParam</i> parameter.
     * @param {Pointer} uiLo Type: <b>UINT_PTR</b>
     * 
     * The value to be packed into the low-order word of the reused 
     * 					<i>lParam</i> parameter.
     * @param {Pointer} uiHi Type: <b>UINT_PTR</b>
     * 
     * The value to be packed into the high-order word of the reused 
     * 					<i>lParam</i> parameter.
     * @returns {LPARAM} Type: <b>LPARAM</b>
     * 
     * The return value is the new 
     * 						<i>lParam</i> value.
     * @see https://docs.microsoft.com/windows/win32/api//dde/nf-dde-reuseddelparam
     * @since windows5.0
     */
    static ReuseDDElParam(lParam, msgIn, msgOut, uiLo, uiHi) {
        result := DllCall("USER32.dll\ReuseDDElParam", "ptr", lParam, "uint", msgIn, "uint", msgOut, "ptr", uiLo, "ptr", uiHi, "ptr")
        return result
    }

    /**
     * Registers an application with the Dynamic Data Exchange Management Library (DDEML). An application must call this function before calling any other Dynamic Data Exchange Management Library (DDEML) function.
     * @param {Pointer<Integer>} pidInst Type: <b>LPDWORD</b>
     * 
     * The application instance identifier. At initialization, this parameter should point to 0. If the function succeeds, this parameter points to the instance identifier for the application. This value should be passed as the 
     * 					<i>idInst</i> parameter in all other DDEML functions that require it. If an application uses multiple instances of the DDEML dynamic-link library (DLL), the application should provide a different callback function for each instance. 
     * 
     * If 
     * 					<i>pidInst</i> points to a nonzero value, reinitialization of the DDEML is implied. In this case, 
     * 					<i>pidInst</i> must point to a valid application-instance identifier.
     * @param {Pointer<PFNCALLBACK>} pfnCallback Type: <b>PFNCALLBACK</b>
     * 
     * A pointer to the application-defined DDE callback function. This function processes DDE transactions sent by the system. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nc-ddeml-pfncallback">DdeCallback</a> callback function.
     * @param {Integer} afCmd Type: <b>DWORD</b>
     * 
     * A set of <b>APPCMD_</b>, <b>CBF_</b>, and <b>MF_</b> flags. The <b>APPCMD_</b> flags provide special instructions to <b>DdeInitialize</b>. The <b>CBF_</b> flags specify filters that prevent specific types of transactions from reaching the callback function. The <b>MF_</b> flags specify the types of DDE activity that a DDE monitoring application monitors. Using these flags enhances the performance of a DDE application by eliminating unnecessary calls to the callback function.
     * @returns {Integer} Type: <b>UINT</b>
     * 
     * If the function succeeds, the return value is <b>DMLERR_NO_ERROR</b>. 
     * 
     * If the function fails, the return value is one of the following values:
     * @see https://docs.microsoft.com/windows/win32/api//ddeml/nf-ddeml-ddeinitializea
     * @since windows5.0
     */
    static DdeInitializeA(pidInst, pfnCallback, afCmd) {
        static ulRes := 0 ;Reserved parameters must always be NULL

        result := DllCall("USER32.dll\DdeInitializeA", "uint*", pidInst, "ptr", pfnCallback, "uint", afCmd, "uint", ulRes, "uint")
        return result
    }

    /**
     * Registers an application with the Dynamic Data Exchange Management Library (DDEML). An application must call this function before calling any other Dynamic Data Exchange Management Library (DDEML) function.
     * @param {Pointer<Integer>} pidInst Type: <b>LPDWORD</b>
     * 
     * The application instance identifier. At initialization, this parameter should point to 0. If the function succeeds, this parameter points to the instance identifier for the application. This value should be passed as the 
     * 					<i>idInst</i> parameter in all other DDEML functions that require it. If an application uses multiple instances of the DDEML dynamic-link library (DLL), the application should provide a different callback function for each instance. 
     * 
     * If 
     * 					<i>pidInst</i> points to a nonzero value, reinitialization of the DDEML is implied. In this case, 
     * 					<i>pidInst</i> must point to a valid application-instance identifier.
     * @param {Pointer<PFNCALLBACK>} pfnCallback Type: <b>PFNCALLBACK</b>
     * 
     * A pointer to the application-defined DDE callback function. This function processes DDE transactions sent by the system. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nc-ddeml-pfncallback">DdeCallback</a> callback function.
     * @param {Integer} afCmd Type: <b>DWORD</b>
     * 
     * A set of <b>APPCMD_</b>, <b>CBF_</b>, and <b>MF_</b> flags. The <b>APPCMD_</b> flags provide special instructions to <b>DdeInitialize</b>. The <b>CBF_</b> flags specify filters that prevent specific types of transactions from reaching the callback function. The <b>MF_</b> flags specify the types of DDE activity that a DDE monitoring application monitors. Using these flags enhances the performance of a DDE application by eliminating unnecessary calls to the callback function.
     * @returns {Integer} Type: <b>UINT</b>
     * 
     * If the function succeeds, the return value is <b>DMLERR_NO_ERROR</b>. 
     * 
     * If the function fails, the return value is one of the following values:
     * @see https://docs.microsoft.com/windows/win32/api//ddeml/nf-ddeml-ddeinitializew
     * @since windows5.0
     */
    static DdeInitializeW(pidInst, pfnCallback, afCmd) {
        static ulRes := 0 ;Reserved parameters must always be NULL

        result := DllCall("USER32.dll\DdeInitializeW", "uint*", pidInst, "ptr", pfnCallback, "uint", afCmd, "uint", ulRes, "uint")
        return result
    }

    /**
     * Frees all Dynamic Data Exchange Management Library (DDEML) resources associated with the calling application.
     * @param {Integer} idInst Type: <b>DWORD</b>
     * 
     * The application instance identifier obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//ddeml/nf-ddeml-ddeuninitialize
     * @since windows5.0
     */
    static DdeUninitialize(idInst) {
        result := DllCall("USER32.dll\DdeUninitialize", "uint", idInst, "int")
        return result
    }

    /**
     * Establishes a conversation with all server applications that support the specified service name and topic name pair.
     * @param {Integer} idInst Type: <b>DWORD</b>
     * 
     * The application instance identifier obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function.
     * @param {HSZ} hszService Type: <b>HSZ</b>
     * 
     * A handle to the string that specifies the service name of the server application with which a conversation is to be established. If this parameter is 0L, the system attempts to establish conversations with all available servers that support the specified topic name.
     * @param {HSZ} hszTopic Type: <b>HSZ</b>
     * 
     * A handle to the string that specifies the name of the topic on which a conversation is to be established. This handle must have been created by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddecreatestringhandlea">DdeCreateStringHandle</a> function. If this parameter is 0L, the system will attempt to establish conversations on all topics supported by the selected server (or servers).
     * @param {HCONVLIST} hConvList Type: <b>HCONVLIST</b>
     * 
     * A handle to the conversation list to be enumerated. This parameter should be 0L if a new conversation list is to be established.
     * @param {Pointer<CONVCONTEXT>} pCC Type: <b>PCONVCONTEXT</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/ns-ddeml-convcontext">CONVCONTEXT</a> structure that contains conversation-context information. If this parameter is <b>NULL</b>, the server receives the default <b>CONVCONTEXT</b> structure during the 
     * 					<a href="https://docs.microsoft.com/windows/desktop/dataxchg/xtyp-connect">XTYP_CONNECT</a> or 
     * 					<a href="https://docs.microsoft.com/windows/desktop/dataxchg/xtyp-wildconnect">XTYP_WILDCONNECT</a> transaction.
     * @returns {HCONVLIST} Type: <b>HCONVLIST</b>
     * 
     * If the function succeeds, the return value is the handle to a new conversation list.
     * 
     * If the function fails, the return value is 0L. The handle to the old conversation list is no longer valid. 
     * 
     * The <a href="/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://docs.microsoft.com/windows/win32/api//ddeml/nf-ddeml-ddeconnectlist
     * @since windows5.0
     */
    static DdeConnectList(idInst, hszService, hszTopic, hConvList, pCC) {
        hszService := hszService is Win32Handle ? NumGet(hszService, "ptr") : hszService
        hszTopic := hszTopic is Win32Handle ? NumGet(hszTopic, "ptr") : hszTopic
        hConvList := hConvList is Win32Handle ? NumGet(hConvList, "ptr") : hConvList

        result := DllCall("USER32.dll\DdeConnectList", "uint", idInst, "ptr", hszService, "ptr", hszTopic, "ptr", hConvList, "ptr", pCC, "ptr")
        return HCONVLIST({Value: result}, True)
    }

    /**
     * Retrieves the next conversation handle in the specified conversation list.
     * @param {HCONVLIST} hConvList Type: <b>HCONVLIST</b>
     * 
     * A handle to the conversation list. This handle must have been created by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeconnectlist">DdeConnectList</a> function.
     * @param {HCONV} hConvPrev Type: <b>HCONV</b>
     * 
     * A handle to the conversation handle previously returned by this function. If this parameter is 0L, the function returns the first conversation handle in the list.
     * @returns {HCONV} Type: <b>HCONV</b>
     * 
     * If the list contains any more conversation handles, the return value is the next conversation handle in the list; otherwise, it is 0L.
     * @see https://docs.microsoft.com/windows/win32/api//ddeml/nf-ddeml-ddequerynextserver
     * @since windows5.0
     */
    static DdeQueryNextServer(hConvList, hConvPrev) {
        hConvList := hConvList is Win32Handle ? NumGet(hConvList, "ptr") : hConvList
        hConvPrev := hConvPrev is Win32Handle ? NumGet(hConvPrev, "ptr") : hConvPrev

        result := DllCall("USER32.dll\DdeQueryNextServer", "ptr", hConvList, "ptr", hConvPrev, "ptr")
        return HCONV({Value: result}, True)
    }

    /**
     * Destroys the specified conversation list and terminates all conversations associated with the list.
     * @param {HCONVLIST} hConvList Type: <b>HCONVLIST</b>
     * 
     * A handle to the conversation list. This handle must have been created by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeconnectlist">DdeConnectList</a> function.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. 
     * 
     * The <a href="/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://docs.microsoft.com/windows/win32/api//ddeml/nf-ddeml-ddedisconnectlist
     * @since windows5.0
     */
    static DdeDisconnectList(hConvList) {
        hConvList := hConvList is Win32Handle ? NumGet(hConvList, "ptr") : hConvList

        result := DllCall("USER32.dll\DdeDisconnectList", "ptr", hConvList, "int")
        return result
    }

    /**
     * Establishes a conversation with a server application that supports the specified service name and topic name pair. If more than one such server exists, the system selects only one.
     * @param {Integer} idInst Type: <b>DWORD</b>
     * 
     * The application instance identifier obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function.
     * @param {HSZ} hszService Type: <b>HSZ</b>
     * 
     * A handle to the string that specifies the service name of the server application with which a conversation is to be established. This handle must have been created by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddecreatestringhandlea">DdeCreateStringHandle</a> function. If this parameter is 0L, a conversation is established with any available server.
     * @param {HSZ} hszTopic Type: <b>HSZ</b>
     * 
     * A handle to the string that specifies the name of the topic on which a conversation is to be established. This handle must have been created by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddecreatestringhandlea">DdeCreateStringHandle</a>. If this parameter is 0L, a conversation on any topic supported by the selected server is established.
     * @param {Pointer<CONVCONTEXT>} pCC Type: <b>PCONVCONTEXT</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/ns-ddeml-convcontext">CONVCONTEXT</a> structure that contains conversation context information. If this parameter is <b>NULL</b>, the server receives the default <b>CONVCONTEXT</b> structure during the 
     * 					<a href="https://docs.microsoft.com/windows/desktop/dataxchg/xtyp-connect">XTYP_CONNECT</a> or 
     * 					<a href="https://docs.microsoft.com/windows/desktop/dataxchg/xtyp-wildconnect">XTYP_WILDCONNECT</a> transaction.
     * @returns {HCONV} Type: <b>HCONV</b>
     * 
     * If the function succeeds, the return value is the handle to the established conversation.
     * 
     * If the function fails, the return value is 0L. 
     * 
     * The <a href="/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://docs.microsoft.com/windows/win32/api//ddeml/nf-ddeml-ddeconnect
     * @since windows5.0
     */
    static DdeConnect(idInst, hszService, hszTopic, pCC) {
        hszService := hszService is Win32Handle ? NumGet(hszService, "ptr") : hszService
        hszTopic := hszTopic is Win32Handle ? NumGet(hszTopic, "ptr") : hszTopic

        result := DllCall("USER32.dll\DdeConnect", "uint", idInst, "ptr", hszService, "ptr", hszTopic, "ptr", pCC, "ptr")
        return HCONV({Value: result}, True)
    }

    /**
     * Terminates a conversation started by either the DdeConnect or DdeConnectList function and invalidates the specified conversation handle.
     * @param {HCONV} hConv Type: <b>HCONV</b>
     * 
     * A handle to the active conversation to be terminated.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. 
     * 
     * The <a href="/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://docs.microsoft.com/windows/win32/api//ddeml/nf-ddeml-ddedisconnect
     * @since windows5.0
     */
    static DdeDisconnect(hConv) {
        hConv := hConv is Win32Handle ? NumGet(hConv, "ptr") : hConv

        result := DllCall("USER32.dll\DdeDisconnect", "ptr", hConv, "int")
        return result
    }

    /**
     * Enables a client Dynamic Data Exchange Management Library (DDEML) application to attempt to reestablish a conversation with a service that has terminated a conversation with the client.
     * @param {HCONV} hConv Type: <b>HCONV</b>
     * 
     * A handle to the conversation to be reestablished. A client must have obtained the conversation handle by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeconnect">DdeConnect</a> function or from an <a href="https://docs.microsoft.com/windows/desktop/dataxchg/xtyp-disconnect">XTYP_DISCONNECT</a> transaction.
     * @returns {HCONV} Type: <b>HCONV</b>
     * 
     * If the function succeeds, the return value is the handle to the reestablished conversation.
     * 
     * If the function fails, the return value is 0L. 
     * 
     * The <a href="/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://docs.microsoft.com/windows/win32/api//ddeml/nf-ddeml-ddereconnect
     * @since windows5.0
     */
    static DdeReconnect(hConv) {
        hConv := hConv is Win32Handle ? NumGet(hConv, "ptr") : hConv

        result := DllCall("USER32.dll\DdeReconnect", "ptr", hConv, "ptr")
        return HCONV({Value: result}, True)
    }

    /**
     * Retrieves information about a Dynamic Data Exchange (DDE) transaction and about the conversation in which the transaction takes place.
     * @param {HCONV} hConv Type: <b>HCONV</b>
     * 
     * A handle to the conversation.
     * @param {Integer} idTransaction Type: <b>DWORD</b>
     * 
     * The transaction. For asynchronous transactions, this parameter should be a transaction identifier returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeclienttransaction">DdeClientTransaction</a> function. For synchronous transactions, this parameter should be QID_SYNC.
     * @param {Pointer<CONVINFO>} pConvInfo Type: <b>PCONVINFO</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/ns-ddeml-convinfo">CONVINFO</a> structure that receives information about the transaction and conversation. The 
     * 					<i>cb</i> member of the <b>CONVINFO</b> structure must specify the length of the buffer allocated for the structure.
     * @returns {Integer} Type: <b>UINT</b>
     * 
     * If the function succeeds, the return value is the number of bytes copied into the <a href="/windows/desktop/api/ddeml/ns-ddeml-convinfo">CONVINFO</a> structure.
     * 
     * If the function fails, the return value is <b>FALSE</b>. 
     * 
     * The <a href="/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://docs.microsoft.com/windows/win32/api//ddeml/nf-ddeml-ddequeryconvinfo
     * @since windows5.0
     */
    static DdeQueryConvInfo(hConv, idTransaction, pConvInfo) {
        hConv := hConv is Win32Handle ? NumGet(hConv, "ptr") : hConv

        result := DllCall("USER32.dll\DdeQueryConvInfo", "ptr", hConv, "uint", idTransaction, "ptr", pConvInfo, "uint")
        return result
    }

    /**
     * Associates an application-defined value with a conversation handle or a transaction identifier. This is useful for simplifying the processing of asynchronous transactions. An application can use the DdeQueryConvInfo function to retrieve this value.
     * @param {HCONV} hConv Type: <b>HCONV</b>
     * 
     * A handle to the conversation.
     * @param {Integer} id Type: <b>DWORD</b>
     * 
     * The transaction identifier to associate with the value specified by the 
     * 					<i>hUser</i> parameter. An application should set this parameter to QID_SYNC to associate 
     * 					<i>hUser</i> with the conversation identified by the 
     * 					<i>hConv</i> parameter.
     * @param {Pointer} hUser Type: <b>DWORD_PTR</b>
     * 
     * The value to be associated with the conversation handle.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. 
     * 
     * The <a href="/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://docs.microsoft.com/windows/win32/api//ddeml/nf-ddeml-ddesetuserhandle
     * @since windows5.0
     */
    static DdeSetUserHandle(hConv, id, hUser) {
        hConv := hConv is Win32Handle ? NumGet(hConv, "ptr") : hConv

        result := DllCall("USER32.dll\DdeSetUserHandle", "ptr", hConv, "uint", id, "ptr", hUser, "int")
        return result
    }

    /**
     * Abandons the specified asynchronous transaction and releases all resources associated with the transaction.
     * @param {Integer} idInst Type: <b>DWORD</b>
     * 
     * The application instance identifier obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function.
     * @param {HCONV} hConv Type: <b>HCONV</b>
     * 
     * A handle to the conversation in which the transaction was initiated. If this parameter is 0L, all transactions are abandoned (that is, the 
     * 					<i>idTransaction</i> parameter is ignored).
     * @param {Integer} idTransaction Type: <b>DWORD</b>
     * 
     * The identifier of the transaction to be abandoned. If this parameter is 0L, all active transactions in the specified conversation are abandoned.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. 
     * 
     * The <a href="/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://docs.microsoft.com/windows/win32/api//ddeml/nf-ddeml-ddeabandontransaction
     * @since windows5.0
     */
    static DdeAbandonTransaction(idInst, hConv, idTransaction) {
        hConv := hConv is Win32Handle ? NumGet(hConv, "ptr") : hConv

        result := DllCall("USER32.dll\DdeAbandonTransaction", "uint", idInst, "ptr", hConv, "uint", idTransaction, "int")
        return result
    }

    /**
     * Causes the system to send an XTYP_ADVREQ transaction to the calling (server) application's Dynamic Data Exchange (DDE) callback function for each client with an active advise loop on the specified topic and item.
     * @param {Integer} idInst Type: <b>DWORD</b>
     * 
     * The application instance identifier obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function.
     * @param {HSZ} hszTopic Type: <b>HSZ</b>
     * 
     * A handle to a string that specifies the topic name. To send notifications for all topics with active advise loops, an application can set this parameter to 0L.
     * @param {HSZ} hszItem Type: <b>HSZ</b>
     * 
     * A handle to a string that specifies the item name. To send notifications for all items with active advise loops, an application can set this parameter to 0L.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. 
     * 
     * The <a href="/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://docs.microsoft.com/windows/win32/api//ddeml/nf-ddeml-ddepostadvise
     * @since windows5.0
     */
    static DdePostAdvise(idInst, hszTopic, hszItem) {
        hszTopic := hszTopic is Win32Handle ? NumGet(hszTopic, "ptr") : hszTopic
        hszItem := hszItem is Win32Handle ? NumGet(hszItem, "ptr") : hszItem

        result := DllCall("USER32.dll\DdePostAdvise", "uint", idInst, "ptr", hszTopic, "ptr", hszItem, "int")
        return result
    }

    /**
     * Enables or disables transactions for a specific conversation or for all conversations currently established by the calling application.
     * @param {Integer} idInst Type: <b>DWORD</b>
     * 
     * The application-instance identifier obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function.
     * @param {HCONV} hConv Type: <b>HCONV</b>
     * 
     * A handle to the conversation to enable or disable. If this parameter is <b>NULL</b>, the function affects all conversations.
     * @param {Integer} wCmd Type: <b>UINT</b>
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. 
     * 
     * If the 
     * 						<i>wCmd</i> parameter is <b>EC_QUERYWAITING</b>, and the application transaction queue contains one or more unprocessed transactions that are not being processed, the return value is <b>TRUE</b>; otherwise, it is <b>FALSE</b>.
     * 
     * The <a href="/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://docs.microsoft.com/windows/win32/api//ddeml/nf-ddeml-ddeenablecallback
     * @since windows5.0
     */
    static DdeEnableCallback(idInst, hConv, wCmd) {
        hConv := hConv is Win32Handle ? NumGet(hConv, "ptr") : hConv

        result := DllCall("USER32.dll\DdeEnableCallback", "uint", idInst, "ptr", hConv, "uint", wCmd, "int")
        return result
    }

    /**
     * Impersonates a Dynamic Data Exchange (DDE) client application in a DDE client conversation.
     * @param {HCONV} hConv Type: <b>HCONV</b>
     * 
     * A handle to the DDE client conversation to be impersonated.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//ddeml/nf-ddeml-ddeimpersonateclient
     * @since windows5.0
     */
    static DdeImpersonateClient(hConv) {
        hConv := hConv is Win32Handle ? NumGet(hConv, "ptr") : hConv

        A_LastError := 0

        result := DllCall("USER32.dll\DdeImpersonateClient", "ptr", hConv, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Registers or unregisters the service names a Dynamic Data Exchange (DDE) server supports.
     * @param {Integer} idInst Type: <b>DWORD</b>
     * 
     * The application instance identifier obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function.
     * @param {HSZ} hsz1 Type: <b>HSZ</b>
     * 
     * A handle to the string that specifies the service name the server is registering or unregistering. An application that is unregistering all of its service names should set this parameter to 0L.
     * @param {HSZ} hsz2 Type: <b>HSZ</b>
     * 
     * Reserved; should be set to 0L.
     * @param {Integer} afCmd Type: <b>UINT</b>
     * @returns {HDDEDATA} Type: <b>HDDEDATA</b>
     * 
     * If the function succeeds, it returns a nonzero value. That value is not a true <b>HDDEDATA</b> value, merely a Boolean indicator of success. The function is typed <b>HDDEDATA</b> to allow for possible future expansion of the function and a more sophisticated return value. 
     * 
     * If the function fails, the return value is 0L. 
     * 
     * The <a href="/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://docs.microsoft.com/windows/win32/api//ddeml/nf-ddeml-ddenameservice
     * @since windows5.0
     */
    static DdeNameService(idInst, hsz1, hsz2, afCmd) {
        hsz1 := hsz1 is Win32Handle ? NumGet(hsz1, "ptr") : hsz1
        hsz2 := hsz2 is Win32Handle ? NumGet(hsz2, "ptr") : hsz2

        result := DllCall("USER32.dll\DdeNameService", "uint", idInst, "ptr", hsz1, "ptr", hsz2, "uint", afCmd, "ptr")
        return HDDEDATA({Value: result}, True)
    }

    /**
     * Begins a data transaction between a client and a server. Only a Dynamic Data Exchange (DDE) client application can call this function, and the application can use it only after establishing a conversation with the server.
     * @param {Pointer<Integer>} pData Type: <b>LPBYTE</b>
     * 
     * The beginning of the data the client must pass to the server. 
     * 
     * Optionally, an application can specify the data handle (<b>HDDEDATA</b>) to pass to the server and in that case the 
     * 						<i>cbData</i> parameter should be set to -1. This parameter is required only if the 
     * 						<i>wType</i> parameter is <a href="https://docs.microsoft.com/windows/desktop/dataxchg/xtyp-execute">XTYP_EXECUTE</a> or <a href="https://docs.microsoft.com/windows/desktop/dataxchg/xtyp-poke">XTYP_POKE</a>. Otherwise, this parameter should be <b>NULL</b>. 
     * 
     * For the optional usage of this parameter, <a href="https://docs.microsoft.com/windows/desktop/dataxchg/xtyp-poke">XTYP_POKE</a> transactions where 
     * 						<i>pData</i> is a data handle, the handle must have been created by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddecreatedatahandle">DdeCreateDataHandle</a> function, employing the same data format specified in the 
     * 						<i>wFmt</i> parameter.
     * @param {Integer} cbData Type: <b>DWORD</b>
     * 
     * The length, in bytes, of the data pointed to by the 
     * 					<i>pData</i> parameter, including the terminating <b>NULL</b>, if the data is a string. A value of -1 indicates that 
     * 					<i>pData</i> is a data handle that identifies the data being sent.
     * @param {HCONV} hConv Type: <b>HCONV</b>
     * 
     * A handle to the conversation in which the transaction is to take place.
     * @param {HSZ} hszItem Type: <b>HSZ</b>
     * 
     * A handle to the data item for which data is being exchanged during the transaction. This handle must have been created by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddecreatestringhandlea">DdeCreateStringHandle</a> function. This parameter is ignored (and should be set to 0L) if the 
     * 					<i>wType</i> parameter is 
     * 					<a href="https://docs.microsoft.com/windows/desktop/dataxchg/xtyp-execute">XTYP_EXECUTE</a>.
     * @param {Integer} wFmt Type: <b>UINT</b>
     * 
     * The standard clipboard format in which the data item is being submitted or requested. 
     * 
     * If the transaction specified by the <i>wType</i> parameter does not pass data or is 
     * 						<a href="https://docs.microsoft.com/windows/desktop/dataxchg/xtyp-execute">XTYP_EXECUTE</a>, this parameter should be zero. 
     * 
     * If the transaction specified by the 
     * 						<i>wType</i> parameter references non-execute DDE data (
     * 						<a href="https://docs.microsoft.com/windows/desktop/dataxchg/xtyp-poke">XTYP_POKE</a>, <a href="https://docs.microsoft.com/windows/desktop/dataxchg/xtyp-advstart">XTYP_ADVSTART</a>, <a href="https://docs.microsoft.com/windows/desktop/dataxchg/xtyp-advstop">XTYP_ADVSTOP</a>, 
     * 						<a href="https://docs.microsoft.com/windows/desktop/dataxchg/xtyp-request">XTYP_REQUEST</a>), the 
     * 						<i>wFmt</i> value must be either a valid predefined (CF_) DDE format or a valid registered clipboard format.
     * @param {Integer} wType Type: <b>UINT</b>
     * @param {Integer} dwTimeout Type: <b>DWORD</b>
     * 
     * The maximum amount of time, in milliseconds, that the client will wait for a response from the server application in a synchronous transaction. This parameter should be <b>TIMEOUT_ASYNC</b> for asynchronous transactions.
     * @param {Pointer<Integer>} pdwResult Type: <b>LPDWORD</b>
     * 
     * A pointer to a variable that receives the result of the transaction. An application that does not check the result can use <b>NULL</b> for this value. For synchronous transactions, the low-order word of this variable contains any applicable DDE_ flags resulting from the transaction. This provides support for applications dependent on <b>DDE_APPSTATUS</b> bits. It is, however, recommended that applications no longer use these bits because they may not be supported in future versions of the <a href="https://docs.microsoft.com/windows/desktop/dataxchg/dynamic-data-exchange-management-library">Dynamic Data Exchange Management Library</a> (DDEML). For asynchronous transactions, this variable is filled with a unique transaction identifier for use with the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeabandontransaction">DdeAbandonTransaction</a> function and the <a href="https://docs.microsoft.com/windows/desktop/dataxchg/xtyp-xact-complete">XTYP_XACT_COMPLETE</a> transaction.
     * @returns {HDDEDATA} Type: <b>HDDEDATA</b>
     * 
     * If the function succeeds, the return value is a data handle that identifies the data for successful synchronous transactions in which the client expects data from the server. The return value is nonzero for successful asynchronous transactions and for synchronous transactions in which the client does not expect data. The return value is zero for all unsuccessful transactions. 
     * 
     * The <a href="/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://docs.microsoft.com/windows/win32/api//ddeml/nf-ddeml-ddeclienttransaction
     * @since windows5.0
     */
    static DdeClientTransaction(pData, cbData, hConv, hszItem, wFmt, wType, dwTimeout, pdwResult) {
        hConv := hConv is Win32Handle ? NumGet(hConv, "ptr") : hConv
        hszItem := hszItem is Win32Handle ? NumGet(hszItem, "ptr") : hszItem

        result := DllCall("USER32.dll\DdeClientTransaction", "char*", pData, "uint", cbData, "ptr", hConv, "ptr", hszItem, "uint", wFmt, "uint", wType, "uint", dwTimeout, "uint*", pdwResult, "ptr")
        return HDDEDATA({Value: result}, True)
    }

    /**
     * Creates a Dynamic Data Exchange (DDE) object and fills the object with data from the specified buffer. A DDE application uses this function during transactions that involve passing data to the partner application.
     * @param {Integer} idInst Type: <b>DWORD</b>
     * 
     * The application instance identifier obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function.
     * @param {Pointer} pSrc Type: <b>LPBYTE</b>
     * 
     * The data to be copied to the DDE object. If this parameter is <b>NULL</b>, no data is copied to the object.
     * @param {Integer} cb Type: <b>DWORD</b>
     * 
     * The amount of memory, in bytes, to copy from the buffer pointed to by 
     * 					<i>pSrc</i>. (include the terminating NULL, if the data is a string). If this parameter is zero, the 
     * 					<i>pSrc</i> parameter is ignored.
     * @param {Integer} cbOff Type: <b>DWORD</b>
     * 
     * An offset, in bytes, from the beginning of the buffer pointed to by the 
     * 					<i>pSrc</i> parameter. The data beginning at this offset is copied from the buffer to the DDE object.
     * @param {HSZ} hszItem Type: <b>HSZ</b>
     * 
     * A handle to the string that specifies the data item corresponding to the DDE object. This handle must have been created by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddecreatestringhandlea">DdeCreateStringHandle</a> function. If the data handle is to be used in an <a href="https://docs.microsoft.com/windows/desktop/dataxchg/xtyp-execute">XTYP_EXECUTE</a> transaction, this parameter must be 0L.
     * @param {Integer} wFmt Type: <b>UINT</b>
     * 
     * The standard clipboard format of the data.
     * @param {Integer} afCmd Type: <b>UINT</b>
     * 
     * The creation flags. This parameter can be <b>HDATA_APPOWNED</b>, which specifies that the server application calling the <b>DdeCreateDataHandle</b> function owns the data handle this function creates. This flag enables the application to share the data handle with other DDEML applications rather than creating a separate handle to pass to each application. If this flag is specified, the application must eventually free the shared memory object associated with the handle by using the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddefreedatahandle">DdeFreeDataHandle</a> function. If this flag is not specified, the handle becomes invalid in the application that created the handle after the data handle is returned by the application's DDE callback function or is used as a parameter in another DDEML function.
     * @returns {HDDEDATA} Type: <b>HDDEDATA</b>
     * 
     * If the function succeeds, the return value is a data handle.
     * 
     * If the function fails, the return value is 0L. 
     * 
     * The <a href="/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://docs.microsoft.com/windows/win32/api//ddeml/nf-ddeml-ddecreatedatahandle
     * @since windows5.0
     */
    static DdeCreateDataHandle(idInst, pSrc, cb, cbOff, hszItem, wFmt, afCmd) {
        hszItem := hszItem is Win32Handle ? NumGet(hszItem, "ptr") : hszItem

        result := DllCall("USER32.dll\DdeCreateDataHandle", "uint", idInst, "ptr", pSrc, "uint", cb, "uint", cbOff, "ptr", hszItem, "uint", wFmt, "uint", afCmd, "ptr")
        return HDDEDATA({Value: result}, True)
    }

    /**
     * Adds data to the specified Dynamic Data Exchange (DDE) object.
     * @param {HDDEDATA} hData Type: <b>HDDEDATA</b>
     * 
     * A handle to the DDE object that receives additional data.
     * @param {Pointer} pSrc Type: <b>LPBYTE</b>
     * 
     * The data to be added to the DDE object.
     * @param {Integer} cb Type: <b>DWORD</b>
     * 
     * The length, in bytes, of the data to be added to the DDE object, including the terminating <b>NULL</b>, if the data is a string.
     * @param {Integer} cbOff Type: <b>DWORD</b>
     * 
     * An offset, in bytes, from the beginning of the DDE object. The additional data is copied to the object beginning at this offset.
     * @returns {HDDEDATA} Type: <b>HDDEDATA</b>
     * 
     * If the function succeeds, the return value is a new handle to the DDE object. The new handle is used in all references to the object. 
     * 
     * If the function fails, the return value is zero. 
     * 
     * The <a href="/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://docs.microsoft.com/windows/win32/api//ddeml/nf-ddeml-ddeadddata
     * @since windows5.0
     */
    static DdeAddData(hData, pSrc, cb, cbOff) {
        hData := hData is Win32Handle ? NumGet(hData, "ptr") : hData

        result := DllCall("USER32.dll\DdeAddData", "ptr", hData, "ptr", pSrc, "uint", cb, "uint", cbOff, "ptr")
        return HDDEDATA({Value: result}, True)
    }

    /**
     * Copies data from the specified Dynamic Data Exchange (DDE) object to the specified local buffer.
     * @param {HDDEDATA} hData Type: <b>HDDEDATA</b>
     * 
     * A handle to the DDE object that contains the data to copy.
     * @param {Pointer} pDst Type: <b>LPBYTE</b>
     * 
     * A pointer to the buffer that receives the data. If this parameter is <b>NULL</b>, the <b>DdeGetData</b> function returns the amount of data, in bytes, that would be copied to the buffer.
     * @param {Integer} cbMax Type: <b>DWORD</b>
     * 
     * The maximum amount of data, in bytes, to copy to the buffer pointed to by the 
     * 					<i>pDst</i> parameter. Typically, this parameter specifies the length of the buffer pointed to by 
     * 					<i>pDst</i>.
     * @param {Integer} cbOff Type: <b>DWORD</b>
     * 
     * An offset within the DDE object. Data is copied from the object beginning at this offset.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * If the 
     * 						<i>pDst</i> parameter points to a buffer, the return value is the size, in bytes, of the memory object associated with the data handle or the size specified in the 
     * 						<i>cbMax</i> parameter, whichever is lower. 
     * 
     * If the 
     * 						<i>pDst</i> parameter is <b>NULL</b>, the return value is the size, in bytes, of the memory object associated with the data handle. 
     * 
     * The <a href="/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://docs.microsoft.com/windows/win32/api//ddeml/nf-ddeml-ddegetdata
     * @since windows5.0
     */
    static DdeGetData(hData, pDst, cbMax, cbOff) {
        hData := hData is Win32Handle ? NumGet(hData, "ptr") : hData

        result := DllCall("USER32.dll\DdeGetData", "ptr", hData, "ptr", pDst, "uint", cbMax, "uint", cbOff, "uint")
        return result
    }

    /**
     * Provides access to the data in the specified Dynamic Data Exchange (DDE) object. An application must call the DdeUnaccessData function when it has finished accessing the data in the object.
     * @param {HDDEDATA} hData Type: <b>HDDEDATA</b>
     * 
     * A handle to the DDE object to be accessed.
     * @param {Pointer<Integer>} pcbDataSize Type: <b>LPDWORD</b>
     * 
     * A pointer to a variable that receives the size, in bytes, of the DDE object identified by the 
     * 					<i>hData</i> parameter. If this parameter is <b>NULL</b>, no size information is returned.
     * @returns {Pointer<Integer>} Type: <b>LPBYTE</b>
     * 
     * If the function succeeds, the return value is a pointer to the first byte of data in the DDE object.
     * 
     * If the function fails, the return value is <b>NULL</b>. 
     * 
     * The <a href="/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://docs.microsoft.com/windows/win32/api//ddeml/nf-ddeml-ddeaccessdata
     * @since windows5.0
     */
    static DdeAccessData(hData, pcbDataSize) {
        hData := hData is Win32Handle ? NumGet(hData, "ptr") : hData

        result := DllCall("USER32.dll\DdeAccessData", "ptr", hData, "uint*", pcbDataSize, "char*")
        return result
    }

    /**
     * Unaccesses a Dynamic Data Exchange (DDE) object. An application must call this function after it has finished accessing the object.
     * @param {HDDEDATA} hData Type: <b>HDDEDATA</b>
     * 
     * A handle to the DDE object.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. 
     * 
     * The <a href="/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://docs.microsoft.com/windows/win32/api//ddeml/nf-ddeml-ddeunaccessdata
     * @since windows5.0
     */
    static DdeUnaccessData(hData) {
        hData := hData is Win32Handle ? NumGet(hData, "ptr") : hData

        result := DllCall("USER32.dll\DdeUnaccessData", "ptr", hData, "int")
        return result
    }

    /**
     * Frees a Dynamic Data Exchange (DDE) object and deletes the data handle associated with the object.
     * @param {HDDEDATA} hData Type: <b>HDDEDATA</b>
     * 
     * A handle to the DDE object to be freed. This handle must have been created by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddecreatedatahandle">DdeCreateDataHandle</a> function or returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeclienttransaction">DdeClientTransaction</a> function.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. 
     * 
     * The <a href="/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://docs.microsoft.com/windows/win32/api//ddeml/nf-ddeml-ddefreedatahandle
     * @since windows5.0
     */
    static DdeFreeDataHandle(hData) {
        hData := hData is Win32Handle ? NumGet(hData, "ptr") : hData

        result := DllCall("USER32.dll\DdeFreeDataHandle", "ptr", hData, "int")
        return result
    }

    /**
     * Retrieves the most recent error code set by the failure of a Dynamic Data Exchange Management Library (DDEML) function and resets the error code to DMLERR_NO_ERROR.
     * @param {Integer} idInst Type: <b>DWORD</b>
     * 
     * The application instance identifier obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function.
     * @returns {Integer} Type: <b>UINT</b>
     * 
     * If the function succeeds, the return value is the last error code, which can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMLERR_ADVACKTIMEOUT</b></dt>
     * <dt>0x4000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A request for a synchronous advise transaction has timed out.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMLERR_BUSY</b></dt>
     * <dt>0x4001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The response to the transaction caused the <b>DDE_FBUSY</b> flag to be set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMLERR_DATAACKTIMEOUT</b></dt>
     * <dt>0x4002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A request for a synchronous data transaction has timed out.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMLERR_DLL_NOT_INITIALIZED</b></dt>
     * <dt>0x4003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A DDEML function was called without first calling the <a href="/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function, or an invalid instance identifier was passed to a DDEML function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMLERR_DLL_USAGE</b></dt>
     * <dt>0x4004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An application initialized as <b>APPCLASS_MONITOR</b> has attempted to perform a DDE transaction, or an application initialized as <b>APPCMD_CLIENTONLY</b> has attempted to perform server transactions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMLERR_EXECACKTIMEOUT</b></dt>
     * <dt>0x4005</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A request for a synchronous execute transaction has timed out.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMLERR_INVALIDPARAMETER</b></dt>
     * <dt>0x4006</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter failed to be validated by the DDEML. Some of the possible causes follow: 
     * 
     * The application used a data handle initialized with a different item name handle than was required by the transaction. 
     * 
     * The application used a data handle that was initialized with a different clipboard data format than was required by the transaction. 
     * 
     * The application used a client-side conversation handle with a server-side function or vice versa. 
     * 
     * The application used a freed data handle or string handle. 
     * 
     * More than one instance of the application used the same object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMLERR_LOW_MEMORY</b></dt>
     * <dt>0x4007</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A DDEML application has created a prolonged race condition (in which the server application outruns the client), causing large amounts of memory to be consumed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMLERR_MEMORY_ERROR</b></dt>
     * <dt>0x4008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A memory allocation has failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMLERR_NO_CONV_ESTABLISHED</b></dt>
     * <dt>0x400a</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A client's attempt to establish a conversation has failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMLERR_NOTPROCESSED</b></dt>
     * <dt>0x4009</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A transaction has failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMLERR_POKEACKTIMEOUT</b></dt>
     * <dt>0x400b</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A request for a synchronous poke transaction has timed out.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMLERR_POSTMSG_FAILED</b></dt>
     * <dt>0x400c</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal call to the <a href="/windows/desktop/api/winuser/nf-winuser-postmessagea">PostMessage</a> function has failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMLERR_REENTRANCY</b></dt>
     * <dt>0x400d</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An application instance with a synchronous transaction already in progress attempted to initiate another synchronous transaction, or the <a href="/windows/desktop/api/ddeml/nf-ddeml-ddeenablecallback">DdeEnableCallback</a> function was called from within a DDEML callback function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMLERR_SERVER_DIED</b></dt>
     * <dt>0x400e</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A server-side transaction was attempted on a conversation terminated by the client, or the server terminated before completing a transaction.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMLERR_SYS_ERROR</b></dt>
     * <dt>0x400f</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An internal error has occurred in the DDEML.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMLERR_UNADVACKTIMEOUT</b></dt>
     * <dt>0x4010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A request to end an advise transaction has timed out.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>DMLERR_UNFOUND_QUEUE_ID</b></dt>
     * <dt>0x4011</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid transaction identifier was passed to a DDEML function. Once the application has returned from an <a href="/windows/desktop/dataxchg/xtyp-xact-complete">XTYP_XACT_COMPLETE</a> callback, the transaction identifier for that callback function is no longer valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ddeml/nf-ddeml-ddegetlasterror
     * @since windows5.0
     */
    static DdeGetLastError(idInst) {
        result := DllCall("USER32.dll\DdeGetLastError", "uint", idInst, "uint")
        return result
    }

    /**
     * Creates a handle that identifies the specified string. A Dynamic Data Exchange (DDE) client or server application can pass the string handle as a parameter to other Dynamic Data Exchange Management Library (DDEML) functions.
     * @param {Integer} idInst Type: <b>DWORD</b>
     * 
     * The application instance identifier obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function.
     * @param {PSTR} psz Type: <b>LPTSTR</b>
     * 
     * The null-terminated string for which a handle is to be created. This string can be up to 255 characters. The reason for this limit is that DDEML string management functions are implemented using atoms.
     * @param {Integer} iCodePage Type: <b>int</b>
     * 
     * The code page to be used to render the string. This value should be either <b>CP_WINANSI</b> (the default code page) or CP_WINUNICODE, depending on whether the ANSI or Unicode version of <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> was called by the client application.
     * @returns {HSZ} Type: <b>HSZ</b>
     * 
     * If the function succeeds, the return value is a string handle.
     * 
     * If the function fails, the return value is 0L. 
     * 
     * The <a href="/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://docs.microsoft.com/windows/win32/api//ddeml/nf-ddeml-ddecreatestringhandlea
     * @since windows5.0
     */
    static DdeCreateStringHandleA(idInst, psz, iCodePage) {
        psz := psz is String ? StrPtr(psz) : psz

        result := DllCall("USER32.dll\DdeCreateStringHandleA", "uint", idInst, "ptr", psz, "int", iCodePage, "ptr")
        return HSZ({Value: result}, True)
    }

    /**
     * Creates a handle that identifies the specified string. A Dynamic Data Exchange (DDE) client or server application can pass the string handle as a parameter to other Dynamic Data Exchange Management Library (DDEML) functions.
     * @param {Integer} idInst Type: <b>DWORD</b>
     * 
     * The application instance identifier obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function.
     * @param {PWSTR} psz Type: <b>LPTSTR</b>
     * 
     * The null-terminated string for which a handle is to be created. This string can be up to 255 characters. The reason for this limit is that DDEML string management functions are implemented using atoms.
     * @param {Integer} iCodePage Type: <b>int</b>
     * 
     * The code page to be used to render the string. This value should be either <b>CP_WINANSI</b> (the default code page) or CP_WINUNICODE, depending on whether the ANSI or Unicode version of <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> was called by the client application.
     * @returns {HSZ} Type: <b>HSZ</b>
     * 
     * If the function succeeds, the return value is a string handle.
     * 
     * If the function fails, the return value is 0L. 
     * 
     * The <a href="/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://docs.microsoft.com/windows/win32/api//ddeml/nf-ddeml-ddecreatestringhandlew
     * @since windows5.0
     */
    static DdeCreateStringHandleW(idInst, psz, iCodePage) {
        psz := psz is String ? StrPtr(psz) : psz

        result := DllCall("USER32.dll\DdeCreateStringHandleW", "uint", idInst, "ptr", psz, "int", iCodePage, "ptr")
        return HSZ({Value: result}, True)
    }

    /**
     * Copies text associated with a string handle into a buffer.
     * @param {Integer} idInst Type: <b>DWORD</b>
     * 
     * The application instance identifier obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function.
     * @param {HSZ} hsz Type: <b>HSZ</b>
     * 
     * A handle to the string to copy. This handle must have been created by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddecreatestringhandlea">DdeCreateStringHandle</a> function.
     * @param {PSTR} psz Type: <b>LPTSTR</b>
     * 
     * A pointer to a buffer that receives the string. To obtain the length of the string, this parameter should be set to <b>NULL</b>.
     * @param {Integer} cchMax Type: <b>DWORD</b>
     * 
     * The length, in 
     * 					characters, of the buffer pointed to by the 
     * 					<i>psz</i> parameter. For the ANSI version of the function, this is the number of bytes; for the Unicode version, this is the number of characters. If the string is longer than (
     * 					<i>cchMax</i>– 1), it will be truncated. If the 
     * 					<i>psz</i> parameter is set to <b>NULL</b>, this parameter is ignored.
     * @param {Integer} iCodePage Type: <b>int</b>
     * 
     * The code page used to render the string. This value should be either <b>CP_WINANSI</b> or <b>CP_WINUNICODE</b>.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * If the 
     * 						<i>psz</i> parameter specified a valid pointer, the return value is the length, in 
     * 						characters, of the returned text (not including the terminating null character). If the 
     * 						<i>psz</i> parameter specified a <b>NULL</b> pointer, the return value is the length of the text associated with the 
     * 						<i>hsz</i> parameter (not including the terminating null character). If an error occurs, the return value is 0L.
     * @see https://docs.microsoft.com/windows/win32/api//ddeml/nf-ddeml-ddequerystringa
     * @since windows5.0
     */
    static DdeQueryStringA(idInst, hsz, psz, cchMax, iCodePage) {
        psz := psz is String ? StrPtr(psz) : psz
        hsz := hsz is Win32Handle ? NumGet(hsz, "ptr") : hsz

        result := DllCall("USER32.dll\DdeQueryStringA", "uint", idInst, "ptr", hsz, "ptr", psz, "uint", cchMax, "int", iCodePage, "uint")
        return result
    }

    /**
     * Copies text associated with a string handle into a buffer.
     * @param {Integer} idInst Type: <b>DWORD</b>
     * 
     * The application instance identifier obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function.
     * @param {HSZ} hsz Type: <b>HSZ</b>
     * 
     * A handle to the string to copy. This handle must have been created by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddecreatestringhandlea">DdeCreateStringHandle</a> function.
     * @param {PWSTR} psz Type: <b>LPTSTR</b>
     * 
     * A pointer to a buffer that receives the string. To obtain the length of the string, this parameter should be set to <b>NULL</b>.
     * @param {Integer} cchMax Type: <b>DWORD</b>
     * 
     * The length, in 
     * 					characters, of the buffer pointed to by the 
     * 					<i>psz</i> parameter. For the ANSI version of the function, this is the number of bytes; for the Unicode version, this is the number of characters. If the string is longer than (
     * 					<i>cchMax</i>– 1), it will be truncated. If the 
     * 					<i>psz</i> parameter is set to <b>NULL</b>, this parameter is ignored.
     * @param {Integer} iCodePage Type: <b>int</b>
     * 
     * The code page used to render the string. This value should be either <b>CP_WINANSI</b> or <b>CP_WINUNICODE</b>.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * If the 
     * 						<i>psz</i> parameter specified a valid pointer, the return value is the length, in 
     * 						characters, of the returned text (not including the terminating null character). If the 
     * 						<i>psz</i> parameter specified a <b>NULL</b> pointer, the return value is the length of the text associated with the 
     * 						<i>hsz</i> parameter (not including the terminating null character). If an error occurs, the return value is 0L.
     * @see https://docs.microsoft.com/windows/win32/api//ddeml/nf-ddeml-ddequerystringw
     * @since windows5.0
     */
    static DdeQueryStringW(idInst, hsz, psz, cchMax, iCodePage) {
        psz := psz is String ? StrPtr(psz) : psz
        hsz := hsz is Win32Handle ? NumGet(hsz, "ptr") : hsz

        result := DllCall("USER32.dll\DdeQueryStringW", "uint", idInst, "ptr", hsz, "ptr", psz, "uint", cchMax, "int", iCodePage, "uint")
        return result
    }

    /**
     * Frees a string handle in the calling application.
     * @param {Integer} idInst Type: <b>DWORD</b>
     * 
     * The application instance identifier obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function.
     * @param {HSZ} hsz Type: <b>HSZ</b>
     * 
     * A handle to the string handle to be freed. This handle must have been created by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddecreatestringhandlea">DdeCreateStringHandle</a> function.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//ddeml/nf-ddeml-ddefreestringhandle
     * @since windows5.0
     */
    static DdeFreeStringHandle(idInst, hsz) {
        hsz := hsz is Win32Handle ? NumGet(hsz, "ptr") : hsz

        result := DllCall("USER32.dll\DdeFreeStringHandle", "uint", idInst, "ptr", hsz, "int")
        return result
    }

    /**
     * Increments the usage count associated with the specified handle.
     * @param {Integer} idInst Type: <b>DWORD</b>
     * 
     * The application instance identifier obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function.
     * @param {HSZ} hsz Type: <b>HSZ</b>
     * 
     * A handle to the string handle to be saved.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//ddeml/nf-ddeml-ddekeepstringhandle
     * @since windows5.0
     */
    static DdeKeepStringHandle(idInst, hsz) {
        hsz := hsz is Win32Handle ? NumGet(hsz, "ptr") : hsz

        result := DllCall("USER32.dll\DdeKeepStringHandle", "uint", idInst, "ptr", hsz, "int")
        return result
    }

    /**
     * Compares the values of two string handles. The value of a string handle is not related to the case of the associated string.
     * @param {HSZ} hsz1 Type: <b>HSZ</b>
     * 
     * A handle to the first string.
     * @param {HSZ} hsz2 Type: <b>HSZ</b>
     * 
     * A handle to the second string.
     * @returns {Integer} Type: <b>int</b>
     * 
     * The return value can be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>-1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of <i>hsz1</i> is either 0 or less than the value of <i>hsz2</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The values of <i>hsz1</i> and <i>hsz2</i> are equal (both can be 0).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of <i>hsz2</i> is either 0 or less than the value of <i>hsz1</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ddeml/nf-ddeml-ddecmpstringhandles
     * @since windows5.0
     */
    static DdeCmpStringHandles(hsz1, hsz2) {
        hsz1 := hsz1 is Win32Handle ? NumGet(hsz1, "ptr") : hsz1
        hsz2 := hsz2 is Win32Handle ? NumGet(hsz2, "ptr") : hsz2

        result := DllCall("USER32.dll\DdeCmpStringHandles", "ptr", hsz1, "ptr", hsz2, "int")
        return result
    }

    /**
     * The SetWinMetaFileBits function converts a metafile from the older Windows format to the new enhanced format and stores the new metafile in memory.
     * @param {Integer} nSize The size, in bytes, of the buffer that contains the Windows-format metafile.
     * @param {Pointer} lpMeta16Data A pointer to a buffer that contains the Windows-format metafile data. (It is assumed that the data was obtained by using the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getmetafilebitsex">GetMetaFileBitsEx</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getwinmetafilebits">GetWinMetaFileBits</a> function.)
     * @param {HDC} hdcRef A handle to a reference device context.
     * @param {Pointer<METAFILEPICT>} lpMFP A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-metafilepict">METAFILEPICT</a> structure that contains the suggested size of the metafile picture and the mapping mode that was used when the picture was created.
     * @returns {HENHMETAFILE} If the function succeeds, the return value is a handle to a memory-based enhanced metafile.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setwinmetafilebits
     * @since windows5.0
     */
    static SetWinMetaFileBits(nSize, lpMeta16Data, hdcRef, lpMFP) {
        hdcRef := hdcRef is Win32Handle ? NumGet(hdcRef, "ptr") : hdcRef

        result := DllCall("GDI32.dll\SetWinMetaFileBits", "uint", nSize, "ptr", lpMeta16Data, "ptr", hdcRef, "ptr", lpMFP, "ptr")
        return HENHMETAFILE({Value: result}, True)
    }

    /**
     * Opens the clipboard for examination and prevents other applications from modifying the clipboard content.
     * @param {HWND} hWndNewOwner Type: <b>HWND</b>
     * 
     * A handle to the window to be associated with the open clipboard. If this parameter is <b>NULL</b>, the open clipboard is associated with the current task.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-openclipboard
     * @since windows5.0
     */
    static OpenClipboard(hWndNewOwner) {
        hWndNewOwner := hWndNewOwner is Win32Handle ? NumGet(hWndNewOwner, "ptr") : hWndNewOwner

        A_LastError := 0

        result := DllCall("USER32.dll\OpenClipboard", "ptr", hWndNewOwner, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Closes the clipboard.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-closeclipboard
     * @since windows5.0
     */
    static CloseClipboard() {
        A_LastError := 0

        result := DllCall("USER32.dll\CloseClipboard", "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the clipboard sequence number for the current window station.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * The return value is the clipboard sequence number. If you do not have <b>WINSTA_ACCESSCLIPBOARD</b> access to the window station, the function returns zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getclipboardsequencenumber
     * @since windows5.0
     */
    static GetClipboardSequenceNumber() {
        result := DllCall("USER32.dll\GetClipboardSequenceNumber", "uint")
        return result
    }

    /**
     * Retrieves the window handle of the current owner of the clipboard.
     * @returns {HWND} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value is the handle to the window that owns the clipboard. 
     * 
     * If the clipboard is not owned, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getclipboardowner
     * @since windows5.0
     */
    static GetClipboardOwner() {
        A_LastError := 0

        result := DllCall("USER32.dll\GetClipboardOwner", "ptr")
        if(A_LastError)
            throw OSError()

        return HWND({Value: result}, True)
    }

    /**
     * Adds the specified window to the chain of clipboard viewers. Clipboard viewer windows receive a WM_DRAWCLIPBOARD message whenever the content of the clipboard changes. This function is used for backward compatibility with earlier versions of Windows.
     * @param {HWND} hWndNewViewer Type: <b>HWND</b>
     * 
     * A handle to the window to be added to the clipboard chain.
     * @returns {HWND} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value identifies the next window in the clipboard viewer chain. If an error occurs or there are no other windows in the clipboard viewer chain, the return value is NULL. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setclipboardviewer
     * @since windows5.0
     */
    static SetClipboardViewer(hWndNewViewer) {
        hWndNewViewer := hWndNewViewer is Win32Handle ? NumGet(hWndNewViewer, "ptr") : hWndNewViewer

        A_LastError := 0

        result := DllCall("USER32.dll\SetClipboardViewer", "ptr", hWndNewViewer, "ptr")
        if(A_LastError)
            throw OSError()

        return HWND({Value: result}, True)
    }

    /**
     * Retrieves the handle to the first window in the clipboard viewer chain.
     * @returns {HWND} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value is the handle to the first window in the clipboard viewer chain. 
     * 
     * If there is no clipboard viewer, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getclipboardviewer
     * @since windows5.0
     */
    static GetClipboardViewer() {
        A_LastError := 0

        result := DllCall("USER32.dll\GetClipboardViewer", "ptr")
        if(A_LastError)
            throw OSError()

        return HWND({Value: result}, True)
    }

    /**
     * Removes a specified window from the chain of clipboard viewers.
     * @param {HWND} hWndRemove Type: <b>HWND</b>
     * 
     * A handle to the window to be removed from the chain. The handle must have been passed to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setclipboardviewer">SetClipboardViewer</a> function.
     * @param {HWND} hWndNewNext Type: <b>HWND</b>
     * 
     * A handle to the window that follows the 
     *      <i>hWndRemove</i> window in the clipboard viewer chain. (This is the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setclipboardviewer">SetClipboardViewer</a>, unless the sequence was changed in response to a <a href="https://docs.microsoft.com/windows/desktop/dataxchg/wm-changecbchain">WM_CHANGECBCHAIN</a> message.)
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * The return value indicates the result of passing the <a href="/windows/desktop/dataxchg/wm-changecbchain">WM_CHANGECBCHAIN</a> message to the windows in the clipboard viewer chain. Because a window in the chain typically returns <b>FALSE</b> when it processes <b>WM_CHANGECBCHAIN</b>, the return value from <b>ChangeClipboardChain</b> is typically <b>FALSE</b>. If there is only one window in the chain, the return value is typically <b>TRUE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-changeclipboardchain
     * @since windows5.0
     */
    static ChangeClipboardChain(hWndRemove, hWndNewNext) {
        hWndRemove := hWndRemove is Win32Handle ? NumGet(hWndRemove, "ptr") : hWndRemove
        hWndNewNext := hWndNewNext is Win32Handle ? NumGet(hWndNewNext, "ptr") : hWndNewNext

        result := DllCall("USER32.dll\ChangeClipboardChain", "ptr", hWndRemove, "ptr", hWndNewNext, "int")
        return result
    }

    /**
     * Places data on the clipboard in a specified clipboard format.
     * @param {Integer} uFormat Type: <b>UINT</b>
     * 
     * The clipboard format. This parameter can be a registered format or any of the standard clipboard formats. For more information, see <a href="https://docs.microsoft.com/windows/desktop/dataxchg/standard-clipboard-formats">Standard Clipboard Formats</a> and <a href="https://docs.microsoft.com/windows/desktop/dataxchg/clipboard-formats">Registered Clipboard Formats</a>.
     * @param {HANDLE} hMem Type: <b>HANDLE</b>
     * 
     * A handle to the data in the specified format. This parameter can be <b>NULL</b>, indicating that the window provides data in the specified clipboard format (renders the format) upon request; this is known as [delayed rendering](/windows/win32/dataxchg/clipboard-operations#delayed-rendering). If a window delays rendering, it must process the [WM_RENDERFORMAT](/windows/win32/dataxchg/wm-renderformat) and [WM_RENDERALLFORMATS](/windows/win32/dataxchg/wm-renderallformats) messages.
     * 
     * If <b>SetClipboardData</b> succeeds, the system owns the object identified by the <i>hMem</i> parameter. The application may not write to or free the data once ownership has been transferred to the system, but it can lock and read from the data until the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-closeclipboard">CloseClipboard</a> function is called. (The memory must be unlocked before the Clipboard is closed.) If the <i>hMem</i> parameter identifies a memory object, the object must have been allocated using the function with the <b>GMEM_MOVEABLE</b> flag.
     * @returns {HANDLE} Type: <b>HANDLE</b>
     * 
     * If the function succeeds, the return value is the handle to the data.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setclipboarddata
     * @since windows5.0
     */
    static SetClipboardData(uFormat, hMem) {
        hMem := hMem is Win32Handle ? NumGet(hMem, "ptr") : hMem

        A_LastError := 0

        result := DllCall("USER32.dll\SetClipboardData", "uint", uFormat, "ptr", hMem, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, True)
    }

    /**
     * Retrieves data from the clipboard in a specified format. The clipboard must have been opened previously.
     * @param {Integer} uFormat Type: <b>UINT</b>
     * 
     * A clipboard format. For a description of the standard clipboard formats, see <a href="https://docs.microsoft.com/windows/desktop/dataxchg/clipboard-formats">Standard Clipboard Formats</a>.
     * @returns {HANDLE} Type: <b>HANDLE</b>
     * 
     * If the function succeeds, the return value is the handle to a clipboard object in the specified format.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getclipboarddata
     * @since windows5.0
     */
    static GetClipboardData(uFormat) {
        A_LastError := 0

        result := DllCall("USER32.dll\GetClipboardData", "uint", uFormat, "ptr")
        if(A_LastError)
            throw OSError()

        return HANDLE({Value: result}, False)
    }

    /**
     * Registers a new clipboard format. This format can then be used as a valid clipboard format.
     * @param {PSTR} lpszFormat Type: <b>LPCTSTR</b>
     * 
     * The name of the new format.
     * @returns {Integer} Type: <b>UINT</b>
     * 
     * If the function succeeds, the return value identifies the registered clipboard format.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-registerclipboardformata
     * @since windows5.0
     */
    static RegisterClipboardFormatA(lpszFormat) {
        lpszFormat := lpszFormat is String ? StrPtr(lpszFormat) : lpszFormat

        A_LastError := 0

        result := DllCall("USER32.dll\RegisterClipboardFormatA", "ptr", lpszFormat, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Registers a new clipboard format. This format can then be used as a valid clipboard format.
     * @param {PWSTR} lpszFormat Type: <b>LPCTSTR</b>
     * 
     * The name of the new format.
     * @returns {Integer} Type: <b>UINT</b>
     * 
     * If the function succeeds, the return value identifies the registered clipboard format.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-registerclipboardformatw
     * @since windows5.0
     */
    static RegisterClipboardFormatW(lpszFormat) {
        lpszFormat := lpszFormat is String ? StrPtr(lpszFormat) : lpszFormat

        A_LastError := 0

        result := DllCall("USER32.dll\RegisterClipboardFormatW", "ptr", lpszFormat, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the number of different data formats currently on the clipboard.
     * @returns {Integer} Type: <b>int</b>
     * 
     * If the function succeeds, the return value is the number of different data formats currently on the clipboard.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-countclipboardformats
     * @since windows5.0
     */
    static CountClipboardFormats() {
        A_LastError := 0

        result := DllCall("USER32.dll\CountClipboardFormats", "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates the data formats currently available on the clipboard.
     * @param {Integer} format Type: <b>UINT</b>
     * 
     * A clipboard format that is known to be available.
     * 
     * To start an enumeration of clipboard formats, set 
     * 					<i>format</i> to zero. When 
     * 					<i>format</i> is zero, the function retrieves the first available clipboard format. For subsequent calls during an enumeration, set 
     * 					<i>format</i> to the result of the previous 
     * 					<b>EnumClipboardFormats</b> call.
     * @returns {Integer} Type: <b>UINT</b>
     * 
     * If the function succeeds, the return value is the clipboard format that follows the specified format, namely the next available clipboard format.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the clipboard is not open, the function fails. 
     * 
     * If there are no more clipboard formats to enumerate, the return value is zero. In this case, the 
     * 						<a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns the value <b>ERROR_SUCCESS</b>. This lets you distinguish between function failure and the end of enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-enumclipboardformats
     * @since windows5.0
     */
    static EnumClipboardFormats(format) {
        A_LastError := 0

        result := DllCall("USER32.dll\EnumClipboardFormats", "uint", format, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves from the clipboard the name of the specified registered format. The function copies the name to the specified buffer.
     * @param {Integer} format Type: <b>UINT</b>
     * 
     * The type of format to be retrieved. This parameter must not specify any of the predefined clipboard formats.
     * @param {PSTR} lpszFormatName Type: <b>LPTSTR</b>
     * 
     * The buffer that is to receive the format name.
     * @param {Integer} cchMaxCount Type: <b>int</b>
     * 
     * The maximum length, in 
     * 					characters, of the string to be copied to the buffer. If the name exceeds this limit, it is truncated.
     * @returns {Integer} Type: <b>int</b>
     * 
     * If the function succeeds, the return value is the length, in 
     * 						characters, of the string copied to the buffer.
     * 
     * If the function fails, the return value is zero, indicating that the requested format does not exist or is predefined. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getclipboardformatnamea
     * @since windows5.0
     */
    static GetClipboardFormatNameA(format, lpszFormatName, cchMaxCount) {
        lpszFormatName := lpszFormatName is String ? StrPtr(lpszFormatName) : lpszFormatName

        A_LastError := 0

        result := DllCall("USER32.dll\GetClipboardFormatNameA", "uint", format, "ptr", lpszFormatName, "int", cchMaxCount, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves from the clipboard the name of the specified registered format. The function copies the name to the specified buffer.
     * @param {Integer} format Type: <b>UINT</b>
     * 
     * The type of format to be retrieved. This parameter must not specify any of the predefined clipboard formats.
     * @param {PWSTR} lpszFormatName Type: <b>LPTSTR</b>
     * 
     * The buffer that is to receive the format name.
     * @param {Integer} cchMaxCount Type: <b>int</b>
     * 
     * The maximum length, in 
     * 					characters, of the string to be copied to the buffer. If the name exceeds this limit, it is truncated.
     * @returns {Integer} Type: <b>int</b>
     * 
     * If the function succeeds, the return value is the length, in 
     * 						characters, of the string copied to the buffer.
     * 
     * If the function fails, the return value is zero, indicating that the requested format does not exist or is predefined. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getclipboardformatnamew
     * @since windows5.0
     */
    static GetClipboardFormatNameW(format, lpszFormatName, cchMaxCount) {
        lpszFormatName := lpszFormatName is String ? StrPtr(lpszFormatName) : lpszFormatName

        A_LastError := 0

        result := DllCall("USER32.dll\GetClipboardFormatNameW", "uint", format, "ptr", lpszFormatName, "int", cchMaxCount, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Empties the clipboard and frees handles to data in the clipboard. The function then assigns ownership of the clipboard to the window that currently has the clipboard open.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-emptyclipboard
     * @since windows5.0
     */
    static EmptyClipboard() {
        A_LastError := 0

        result := DllCall("USER32.dll\EmptyClipboard", "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Determines whether the clipboard contains data in the specified format.
     * @param {Integer} format Type: <b>UINT</b>
     * 
     * A standard or registered clipboard format. For a description of the standard clipboard formats, see <a href="https://docs.microsoft.com/windows/desktop/dataxchg/standard-clipboard-formats">Standard Clipboard Formats</a> .
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the clipboard format is available, the return value is nonzero.
     * 
     * If the clipboard format is not available, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-isclipboardformatavailable
     * @since windows5.0
     */
    static IsClipboardFormatAvailable(format) {
        A_LastError := 0

        result := DllCall("USER32.dll\IsClipboardFormatAvailable", "uint", format, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the first available clipboard format in the specified list.
     * @param {Pointer<Integer>} paFormatPriorityList Type: <b>UINT*</b>
     * 
     * The clipboard formats, in priority order. For a description of the standard clipboard formats, see <a href="https://docs.microsoft.com/windows/desktop/dataxchg/standard-clipboard-formats">Standard Clipboard Formats</a> .
     * @param {Integer} cFormats Type: <b>int</b>
     * 
     * The number of entries in the 
     *      <i>paFormatPriorityList</i> array. This value must not be greater than the number of entries in the list.
     * @returns {Integer} Type: <b>int</b>
     * 
     * If the function succeeds, the return value is the first clipboard format in the list for which data is available. If the clipboard is empty, the return value is NULL. If the clipboard contains data, but not in any of the specified formats, the return value is –1. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getpriorityclipboardformat
     * @since windows5.0
     */
    static GetPriorityClipboardFormat(paFormatPriorityList, cFormats) {
        A_LastError := 0

        result := DllCall("USER32.dll\GetPriorityClipboardFormat", "uint*", paFormatPriorityList, "int", cFormats, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the handle to the window that currently has the clipboard open.
     * @returns {HWND} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value is the handle to the window that has the clipboard open. If no window has the clipboard open, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getopenclipboardwindow
     * @since windows5.0
     */
    static GetOpenClipboardWindow() {
        A_LastError := 0

        result := DllCall("USER32.dll\GetOpenClipboardWindow", "ptr")
        if(A_LastError)
            throw OSError()

        return HWND({Value: result}, True)
    }

    /**
     * Places the given window in the system-maintained clipboard format listener list.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * A handle to the window to be placed in the clipboard format listener list.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns <b>TRUE</b> if successful, <b>FALSE</b> otherwise. Call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for additional details.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-addclipboardformatlistener
     * @since windows6.0.6000
     */
    static AddClipboardFormatListener(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        A_LastError := 0

        result := DllCall("USER32.dll\AddClipboardFormatListener", "ptr", hwnd, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Removes the given window from the system-maintained clipboard format listener list.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * A handle to the window to remove from the clipboard format listener list.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns <b>TRUE</b> if successful, <b>FALSE</b> otherwise. Call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for additional details.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-removeclipboardformatlistener
     * @since windows6.0.6000
     */
    static RemoveClipboardFormatListener(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        A_LastError := 0

        result := DllCall("USER32.dll\RemoveClipboardFormatListener", "ptr", hwnd, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the currently supported clipboard formats.
     * @param {Pointer<Integer>} lpuiFormats Type: <b>PUINT</b>
     * 
     * An array of clipboard formats. For a description of the standard clipboard formats, see <a href="https://docs.microsoft.com/windows/desktop/dataxchg/standard-clipboard-formats">Standard Clipboard Formats</a>.
     * @param {Integer} cFormats Type: <b>UINT</b>
     * 
     * The number of entries in the array pointed to by <i>lpuiFormats</i>.
     * @param {Pointer<Integer>} pcFormatsOut Type: <b>PUINT</b>
     * 
     * The actual number of clipboard formats in the array pointed to by <i>lpuiFormats</i>.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * The function returns <b>TRUE</b> if successful; otherwise, <b>FALSE</b>. Call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for additional details.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getupdatedclipboardformats
     * @since windows6.0.6000
     */
    static GetUpdatedClipboardFormats(lpuiFormats, cFormats, pcFormatsOut) {
        A_LastError := 0

        result := DllCall("USER32.dll\GetUpdatedClipboardFormats", "uint*", lpuiFormats, "uint", cFormats, "uint*", pcFormatsOut, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Decrements the reference count of a global string atom. If the atom's reference count reaches zero, GlobalDeleteAtom removes the string associated with the atom from the global atom table.
     * @param {Integer} nAtom Type: <b>ATOM</b>
     * 
     * The atom and character string to be deleted.
     * @returns {Integer} Type: <b>ATOM</b>
     * 
     * The function always returns (<b>ATOM</b>) 0. 
     * 
     * To determine whether the function has failed, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a> with <b>ERROR_SUCCESS</b> before calling <b>GlobalDeleteAtom</b>, then call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the last error code is still <b>ERROR_SUCCESS</b>, <b>GlobalDeleteAtom</b> has succeeded.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-globaldeleteatom
     * @since windows5.0
     */
    static GlobalDeleteAtom(nAtom) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\GlobalDeleteAtom", "ushort", nAtom, "ushort")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Initializes the local atom table and sets the number of hash buckets to the specified size.
     * @param {Integer} nSize Type: <b>DWORD</b>
     * 
     * The number of hash buckets to use for the atom table. If this parameter is zero, the default number of hash buckets are created.
     * 
     * To achieve better performance, specify a prime number in 
     * 					<i>nSize</i>.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-initatomtable
     * @since windows5.0
     */
    static InitAtomTable(nSize) {
        result := DllCall("KERNEL32.dll\InitAtomTable", "uint", nSize, "int")
        return result
    }

    /**
     * Decrements the reference count of a local string atom. If the atom's reference count is reduced to zero, DeleteAtom removes the string associated with the atom from the local atom table.
     * @param {Integer} nAtom Type: <b>ATOM</b>
     * 
     * The atom to be deleted.
     * @returns {Integer} Type: <b>ATOM</b>
     * 
     * If the function succeeds, the return value is zero.
     * 
     * If the function fails, the return value is the 
     * 						<i>nAtom</i> parameter. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-deleteatom
     * @since windows5.0
     */
    static DeleteAtom(nAtom) {
        A_LastError := 0

        result := DllCall("KERNEL32.dll\DeleteAtom", "ushort", nAtom, "ushort")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds a character string to the global atom table and returns a unique value (an atom) identifying the string.
     * @param {PSTR} lpString Type: <b>LPCTSTR</b>
     * 
     * The null-terminated string to be added. The string can have a maximum size of 255 bytes. Strings that differ only in case are considered identical. The case of the first string of this name added to the table is preserved and returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalgetatomnamea">GlobalGetAtomName</a> function.
     * 
     * Alternatively, you can use an integer atom that has been converted using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-makeintatom">MAKEINTATOM</a> macro. See the Remarks for more information.
     * @returns {Integer} Type: <b>ATOM</b>
     * 
     * If the function succeeds, the return value is the newly created atom.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-globaladdatoma
     * @since windows5.0
     */
    static GlobalAddAtomA(lpString) {
        lpString := lpString is String ? StrPtr(lpString) : lpString

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GlobalAddAtomA", "ptr", lpString, "ushort")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds a character string to the global atom table and returns a unique value (an atom) identifying the string.
     * @param {PWSTR} lpString Type: <b>LPCTSTR</b>
     * 
     * The null-terminated string to be added. The string can have a maximum size of 255 bytes. Strings that differ only in case are considered identical. The case of the first string of this name added to the table is preserved and returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalgetatomnamea">GlobalGetAtomName</a> function.
     * 
     * Alternatively, you can use an integer atom that has been converted using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-makeintatom">MAKEINTATOM</a> macro. See the Remarks for more information.
     * @returns {Integer} Type: <b>ATOM</b>
     * 
     * If the function succeeds, the return value is the newly created atom.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-globaladdatomw
     * @since windows5.0
     */
    static GlobalAddAtomW(lpString) {
        lpString := lpString is String ? StrPtr(lpString) : lpString

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GlobalAddAtomW", "ptr", lpString, "ushort")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds a character string to the global atom table and returns a unique value (an atom) identifying the string.
     * @param {PSTR} lpString The null-terminated string to be added. The string can have a maximum size of 255 bytes. Strings that differ only in case are considered identical. The case of the first string of this name added to the table is preserved and returned by the <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-globalgetatomnamea">GlobalGetAtomName</a> function.
     * 
     * Alternatively, you can use an integer atom that has been converted using the <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-makeintatom">MAKEINTATOM</a> macro. See the Remarks for more information.
     * @param {Integer} Flags 
     * @returns {Integer} If the function succeeds, the return value is the newly created atom.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-globaladdatomexa
     */
    static GlobalAddAtomExA(lpString, Flags) {
        lpString := lpString is String ? StrPtr(lpString) : lpString

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GlobalAddAtomExA", "ptr", lpString, "uint", Flags, "ushort")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds a character string to the global atom table and returns a unique value (an atom) identifying the string.
     * @param {PWSTR} lpString The null-terminated string to be added. The string can have a maximum size of 255 bytes. Strings that differ only in case are considered identical. The case of the first string of this name added to the table is preserved and returned by the <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-globalgetatomnamea">GlobalGetAtomName</a> function.
     * 
     * Alternatively, you can use an integer atom that has been converted using the <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-makeintatom">MAKEINTATOM</a> macro. See the Remarks for more information.
     * @param {Integer} Flags 
     * @returns {Integer} If the function succeeds, the return value is the newly created atom.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-globaladdatomexw
     */
    static GlobalAddAtomExW(lpString, Flags) {
        lpString := lpString is String ? StrPtr(lpString) : lpString

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GlobalAddAtomExW", "ptr", lpString, "uint", Flags, "ushort")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Searches the global atom table for the specified character string and retrieves the global atom associated with that string.
     * @param {PSTR} lpString Type: <b>LPCTSTR</b>
     * 
     * The null-terminated character string for which to search. 
     * 
     * Alternatively, you can use an integer atom that has been converted using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-makeintatom">MAKEINTATOM</a> macro. See the Remarks for more information.
     * @returns {Integer} Type: <b>ATOM</b>
     * 
     * If the function succeeds, the return value is the global atom associated with the given string.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-globalfindatoma
     * @since windows5.0
     */
    static GlobalFindAtomA(lpString) {
        lpString := lpString is String ? StrPtr(lpString) : lpString

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GlobalFindAtomA", "ptr", lpString, "ushort")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Searches the global atom table for the specified character string and retrieves the global atom associated with that string.
     * @param {PWSTR} lpString Type: <b>LPCTSTR</b>
     * 
     * The null-terminated character string for which to search. 
     * 
     * Alternatively, you can use an integer atom that has been converted using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-makeintatom">MAKEINTATOM</a> macro. See the Remarks for more information.
     * @returns {Integer} Type: <b>ATOM</b>
     * 
     * If the function succeeds, the return value is the global atom associated with the given string.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-globalfindatomw
     * @since windows5.0
     */
    static GlobalFindAtomW(lpString) {
        lpString := lpString is String ? StrPtr(lpString) : lpString

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GlobalFindAtomW", "ptr", lpString, "ushort")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a copy of the character string associated with the specified global atom.
     * @param {Integer} nAtom Type: <b>ATOM</b>
     * 
     * The global atom associated with the character string to be retrieved.
     * @param {PSTR} lpBuffer Type: <b>LPTSTR</b>
     * 
     * The buffer for the character string.
     * @param {Integer} nSize Type: <b>int</b>
     * 
     * The size, in 
     * 					characters, of the buffer.
     * @returns {Integer} Type: <b>UINT</b>
     * 
     * If the function succeeds, the return value is the length of the string copied to the buffer, in 
     * 						characters, not including the terminating null character.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-globalgetatomnamea
     * @since windows5.0
     */
    static GlobalGetAtomNameA(nAtom, lpBuffer, nSize) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GlobalGetAtomNameA", "ushort", nAtom, "ptr", lpBuffer, "int", nSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a copy of the character string associated with the specified global atom.
     * @param {Integer} nAtom Type: <b>ATOM</b>
     * 
     * The global atom associated with the character string to be retrieved.
     * @param {PWSTR} lpBuffer Type: <b>LPTSTR</b>
     * 
     * The buffer for the character string.
     * @param {Integer} nSize Type: <b>int</b>
     * 
     * The size, in 
     * 					characters, of the buffer.
     * @returns {Integer} Type: <b>UINT</b>
     * 
     * If the function succeeds, the return value is the length of the string copied to the buffer, in 
     * 						characters, not including the terminating null character.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-globalgetatomnamew
     * @since windows5.0
     */
    static GlobalGetAtomNameW(nAtom, lpBuffer, nSize) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GlobalGetAtomNameW", "ushort", nAtom, "ptr", lpBuffer, "int", nSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds a character string to the local atom table and returns a unique value (an atom) identifying the string.
     * @param {PSTR} lpString Type: <b>LPCTSTR</b>
     * 
     * The null-terminated string to be added. The string can have a maximum size of 255 bytes. Strings differing only in case are considered identical. The case of the first string added is preserved and returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getatomnamea">GetAtomName</a> function. 
     * 
     * Alternatively, you can use an integer atom that has been converted using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-makeintatom">MAKEINTATOM</a> macro. See the Remarks for more information.
     * @returns {Integer} Type: <b>ATOM</b>
     * 
     * If the function succeeds, the return value is the newly created atom.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-addatoma
     * @since windows5.0
     */
    static AddAtomA(lpString) {
        lpString := lpString is String ? StrPtr(lpString) : lpString

        A_LastError := 0

        result := DllCall("KERNEL32.dll\AddAtomA", "ptr", lpString, "ushort")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds a character string to the local atom table and returns a unique value (an atom) identifying the string.
     * @param {PWSTR} lpString Type: <b>LPCTSTR</b>
     * 
     * The null-terminated string to be added. The string can have a maximum size of 255 bytes. Strings differing only in case are considered identical. The case of the first string added is preserved and returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getatomnamea">GetAtomName</a> function. 
     * 
     * Alternatively, you can use an integer atom that has been converted using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-makeintatom">MAKEINTATOM</a> macro. See the Remarks for more information.
     * @returns {Integer} Type: <b>ATOM</b>
     * 
     * If the function succeeds, the return value is the newly created atom.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-addatomw
     * @since windows5.0
     */
    static AddAtomW(lpString) {
        lpString := lpString is String ? StrPtr(lpString) : lpString

        A_LastError := 0

        result := DllCall("KERNEL32.dll\AddAtomW", "ptr", lpString, "ushort")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Searches the local atom table for the specified character string and retrieves the atom associated with that string.
     * @param {PSTR} lpString Type: <b>LPCTSTR</b>
     * 
     * The character string for which to search.
     * 
     * Alternatively, you can use an integer atom that has been converted using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-makeintatom">MAKEINTATOM</a> macro. See Remarks for more information.
     * @returns {Integer} Type: <b>ATOM</b>
     * 
     * If the function succeeds, the return value is the atom associated with the given string. 
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-findatoma
     * @since windows5.0
     */
    static FindAtomA(lpString) {
        lpString := lpString is String ? StrPtr(lpString) : lpString

        A_LastError := 0

        result := DllCall("KERNEL32.dll\FindAtomA", "ptr", lpString, "ushort")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Searches the local atom table for the specified character string and retrieves the atom associated with that string.
     * @param {PWSTR} lpString Type: <b>LPCTSTR</b>
     * 
     * The character string for which to search.
     * 
     * Alternatively, you can use an integer atom that has been converted using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-makeintatom">MAKEINTATOM</a> macro. See Remarks for more information.
     * @returns {Integer} Type: <b>ATOM</b>
     * 
     * If the function succeeds, the return value is the atom associated with the given string. 
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-findatomw
     * @since windows5.0
     */
    static FindAtomW(lpString) {
        lpString := lpString is String ? StrPtr(lpString) : lpString

        A_LastError := 0

        result := DllCall("KERNEL32.dll\FindAtomW", "ptr", lpString, "ushort")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a copy of the character string associated with the specified local atom.
     * @param {Integer} nAtom Type: <b>ATOM</b>
     * 
     * The local atom that identifies the character string to be retrieved.
     * @param {PSTR} lpBuffer Type: <b>LPTSTR</b>
     * 
     * The character string.
     * @param {Integer} nSize Type: <b>int</b>
     * 
     * The size, in 
     * 					characters, of the buffer.
     * @returns {Integer} Type: <b>UINT</b>
     * 
     * If the function succeeds, the return value is the length of the string copied to the buffer, in 
     * 						characters, not including the terminating null character.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getatomnamea
     * @since windows5.0
     */
    static GetAtomNameA(nAtom, lpBuffer, nSize) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetAtomNameA", "ushort", nAtom, "ptr", lpBuffer, "int", nSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a copy of the character string associated with the specified local atom.
     * @param {Integer} nAtom Type: <b>ATOM</b>
     * 
     * The local atom that identifies the character string to be retrieved.
     * @param {PWSTR} lpBuffer Type: <b>LPTSTR</b>
     * 
     * The character string.
     * @param {Integer} nSize Type: <b>int</b>
     * 
     * The size, in 
     * 					characters, of the buffer.
     * @returns {Integer} Type: <b>UINT</b>
     * 
     * If the function succeeds, the return value is the length of the string copied to the buffer, in 
     * 						characters, not including the terminating null character.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-getatomnamew
     * @since windows5.0
     */
    static GetAtomNameW(nAtom, lpBuffer, nSize) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GetAtomNameW", "ushort", nAtom, "ptr", lpBuffer, "int", nSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

;@endregion Methods
}
