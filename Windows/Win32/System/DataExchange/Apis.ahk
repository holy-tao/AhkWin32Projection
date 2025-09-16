#Requires AutoHotkey v2.0.0 64-bit

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
     * @remarks
     * If a quality of service has not been specified for a client window, 
     * 				<i>hwndClient</i>, prior to sending a <a href="https://docs.microsoft.com/windows/desktop/dataxchg/wm-dde-initiate">WM_DDE_INITIATE</a> with the 
     * 				<i>wParam</i> set to 
     * 				<i>hwndClient</i>, the system uses the following default quality of service values for the client window: 
     * 
     * 
     * ```
     * { 
     *    Length = sizeof(SECURITY_QUALITY_OF_SERVICE); 
     *    ImpersonationLevel = SecurityImpersonation; 
     *    ContextTrackingMode = SECURITY_STATIC_TRACKING; 
     *    EffectiveOnly = TRUE; 
     * } 
     * ```
     * 
     * 
     * Use the <b>DdeSetQualityOfService</b> function to associate a different quality of service with the client window. After you change the quality of service, the new settings affect any subsequent conversations that are started. Once an application starts a DDE conversation using a particular quality of service value, it must terminate the conversation and restart the conversation in order to have a different value take effect.
     * @param {Pointer<HWND>} hwndClient Type: <b>HWND</b>
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
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dde/nf-dde-ddesetqualityofservice
     * @since windows5.0
     */
    static DdeSetQualityOfService(hwndClient, pqosNew, pqosPrev) {
        A_LastError := 0

        result := DllCall("USER32.dll\DdeSetQualityOfService", "ptr", hwndClient, "ptr", pqosNew, "ptr", pqosPrev, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enables a Dynamic Data Exchange (DDE) server application to impersonate a DDE client application's security context. This protects secure server data from unauthorized DDE clients.
     * @remarks
     * An application should call the <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-reverttoself">RevertToSelf</a> function to undo the impersonation set by the <b>ImpersonateDdeClientWindow</b> function. 
     * 
     * A DDEML application should use the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeimpersonateclient">DdeImpersonateClient</a> function. 
     * 
     * <h3><a id="Security_Considerations"></a><a id="security_considerations"></a><a id="SECURITY_CONSIDERATIONS"></a>Security Considerations</h3>
     * Using this function incorrectly might compromise the security of your program. It is very important to check the return value of the call. If the function fails for any reason, the client is not impersonated and any subsequent client request is made in the security context of the calling process. If the calling process is running as a highly privileged account, such as LocalSystem or as a member of an administrative group, the user may be able to perform actions that would otherwise be disallowed. Therefore, if the call fails or raises an error do not continue execution of the client request.
     * @param {Pointer<HWND>} hWndClient Type: <b>HWND</b>
     * 
     * A handle to the DDE client window to be impersonated. The client window must have established a DDE conversation with the server window identified by the 
     * 					<i>hWndServer</i> parameter.
     * @param {Pointer<HWND>} hWndServer Type: <b>HWND</b>
     * 
     * A handle to the DDE server window. An application must create the server window before calling this function.
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dde/nf-dde-impersonateddeclientwindow
     * @since windows5.0
     */
    static ImpersonateDdeClientWindow(hWndClient, hWndServer) {
        A_LastError := 0

        result := DllCall("USER32.dll\ImpersonateDdeClientWindow", "ptr", hWndClient, "ptr", hWndServer, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Packs a Dynamic Data Exchange (DDE) lParam value into an internal structure used for sharing DDE data between processes.
     * @remarks
     * The return value must be posted as the <i>lParam</i> parameter of a DDE message; it must not be used for any other purpose. After the application posts a return value, it need not perform any action to dispose of the <i>lParam</i> parameter.
     * 
     * An application should call this function only for posted DDE messages.
     * @param {Integer} msg Type: <b>UINT</b>
     * 
     * The DDE message to be posted.
     * @param {Pointer} uiLo Type: <b>UINT_PTR</b>
     * 
     * A value that corresponds to the 16-bit Windows low-order word of an <i>lParam</i> parameter for the DDE message being posted.
     * @param {Pointer} uiHi Type: <b>UINT_PTR</b>
     * 
     * A value that corresponds to the 16-bit Windows high-order word of an <i>lParam</i> parameter for the DDE message being posted.
     * @returns {Pointer} Type: <b>LPARAM</b>
     * 
     * The return value is the <i>lParam</i> value.
     * @see https://learn.microsoft.com/windows/win32/api/dde/nf-dde-packddelparam
     * @since windows5.0
     */
    static PackDDElParam(msg, uiLo, uiHi) {
        result := DllCall("USER32.dll\PackDDElParam", "uint", msg, "ptr", uiLo, "ptr", uiHi, "ptr")
        return result
    }

    /**
     * Unpacks a Dynamic Data Exchange (DDE)lParam value received from a posted DDE message.
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/dde/nf-dde-packddelparam">PackDDElParam</a> eases the porting of 16-bit DDE applications to 32-bit DDE applications.
     * @param {Integer} msg Type: <b>UINT</b>
     * 
     * The posted DDE message.
     * @param {Pointer} lParam Type: <b>LPARAM</b>
     * 
     * The 
     * 					<i>lParam</i> parameter of the posted DDE message that was received. The application must free the memory object specified by the 
     * 					<i>lParam</i> parameter by calling the <a href="https://docs.microsoft.com/windows/desktop/api/dde/nf-dde-freeddelparam">FreeDDElParam</a> function.
     * @param {Pointer<UIntPtr>} puiLo Type: <b>PUINT_PTR</b>
     * 
     * A pointer to a variable that receives the low-order word of 
     * 					<i>lParam</i>.
     * @param {Pointer<UIntPtr>} puiHi Type: <b>PUINT_PTR</b>
     * 
     * A pointer to a variable that receives the high-order word of 
     * 					<i>lParam</i>.
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/dde/nf-dde-unpackddelparam
     * @since windows5.0
     */
    static UnpackDDElParam(msg, lParam, puiLo, puiHi) {
        result := DllCall("USER32.dll\UnpackDDElParam", "uint", msg, "ptr", lParam, "ptr", puiLo, "ptr", puiHi, "int")
        return result
    }

    /**
     * Frees the memory specified by the lParam parameter of a posted Dynamic Data Exchange (DDE) message. An application receiving a posted DDE message should call this function after it has used the UnpackDDElParam function to unpack the lParam value.
     * @remarks
     * An application should call this function only for posted DDE messages. 
     * 
     * This function frees the memory specified by the 
     * 				<i>lParam</i> parameter. It does not free the contents of 
     * 				<i>lParam</i>.
     * @param {Integer} msg Type: <b>UINT</b>
     * 
     * The posted DDE message.
     * @param {Pointer} lParam Type: <b>LPARAM</b>
     * 
     * The 
     * 					<i>lParam</i> parameter of the posted DDE message.
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/dde/nf-dde-freeddelparam
     * @since windows5.0
     */
    static FreeDDElParam(msg, lParam) {
        result := DllCall("USER32.dll\FreeDDElParam", "uint", msg, "ptr", lParam, "int")
        return result
    }

    /**
     * Enables an application to reuse a packed Dynamic Data Exchange (DDE) lParam parameter, rather than allocating a new packed lParam. Using this function reduces reallocations for applications that pass packed DDE messages.
     * @remarks
     * The return value must be posted as the 
     * 				<i>lParam</i> parameter of a DDE message; it must not be used for any other purpose. Once the return value is posted, the posting application need not perform any action to dispose of the 
     * 				<i>lParam</i> parameter. 
     * 
     * Use <b>ReuseDDElParam</b> instead of <a href="https://docs.microsoft.com/windows/desktop/api/dde/nf-dde-freeddelparam">FreeDDElParam</a> if the 
     * 				<i>lParam</i> parameter will be reused in a responding message. <b>ReuseDDElParam</b> returns the 
     * 				<i>lParam</i> appropriate for reuse. 
     * 
     * This function allocates or frees 
     * 				<i>lParam</i> parameters as needed, depending on the packing requirements of the incoming and outgoing messages. This reduces reallocations in passing DDE messages.
     * @param {Pointer} lParam Type: <b>LPARAM</b>
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
     * @returns {Pointer} Type: <b>LPARAM</b>
     * 
     * The return value is the new 
     * 						<i>lParam</i> value.
     * @see https://learn.microsoft.com/windows/win32/api/dde/nf-dde-reuseddelparam
     * @since windows5.0
     */
    static ReuseDDElParam(lParam, msgIn, msgOut, uiLo, uiHi) {
        result := DllCall("USER32.dll\ReuseDDElParam", "ptr", lParam, "uint", msgIn, "uint", msgOut, "ptr", uiLo, "ptr", uiHi, "ptr")
        return result
    }

    /**
     * Registers an application with the Dynamic Data Exchange Management Library (DDEML). An application must call this function before calling any other Dynamic Data Exchange Management Library (DDEML) function. (ANSI)
     * @remarks
     * An application that uses multiple instances of the DDEML must not pass DDEML objects between instances. 
     * 
     * A DDE monitoring application should not attempt to perform DDE operations (establish conversations, issue transactions, and so on) within the context of the same application instance. 
     * 
     * A synchronous transaction fails with a <b>DMLERR_REENTRANCY</b> error if any instance of the same task has a synchronous transaction already in progress. 
     * 
     * The <b>CBF_FAIL_ALLSVRXACTIONS</b> flag causes the DDEML to filter all server transactions and can be changed by a subsequent call to <b>DdeInitialize</b>. The <b>APPCMD_CLIENTONLY</b> flag prevents the DDEML from creating key resources for the server and cannot be changed by a subsequent call to <b>DdeInitialize</b>. 
     * 
     * There is an ANSI version and a Unicode version of <b>DdeInitialize</b>. The version called determines the type of the window procedures used to control DDE conversations (ANSI or Unicode), and the default value for the 
     * 				<i>iCodePage</i> member of the 
     * 				<a href="https://docs.microsoft.com/windows/desktop/api/ddeml/ns-ddeml-convcontext">CONVCONTEXT</a> structure (<b>CP_WINANSI</b> or <b>CP_WINUNICODE</b>). 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ddeml.h header defines DdeInitialize as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<UInt32>} pidInst Type: <b>LPDWORD</b>
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
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/ddeml/nf-ddeml-ddeinitializea
     * @since windows5.0
     */
    static DdeInitializeA(pidInst, pfnCallback, afCmd) {
        static ulRes := 0 ;Reserved parameters must always be NULL

        DllCall("USER32.dll\DdeInitializeA", "ptr", pidInst, "ptr", pfnCallback, "uint", afCmd, "uint", ulRes)
    }

    /**
     * Registers an application with the Dynamic Data Exchange Management Library (DDEML). An application must call this function before calling any other Dynamic Data Exchange Management Library (DDEML) function. (Unicode)
     * @remarks
     * An application that uses multiple instances of the DDEML must not pass DDEML objects between instances. 
     * 
     * A DDE monitoring application should not attempt to perform DDE operations (establish conversations, issue transactions, and so on) within the context of the same application instance. 
     * 
     * A synchronous transaction fails with a <b>DMLERR_REENTRANCY</b> error if any instance of the same task has a synchronous transaction already in progress. 
     * 
     * The <b>CBF_FAIL_ALLSVRXACTIONS</b> flag causes the DDEML to filter all server transactions and can be changed by a subsequent call to <b>DdeInitialize</b>. The <b>APPCMD_CLIENTONLY</b> flag prevents the DDEML from creating key resources for the server and cannot be changed by a subsequent call to <b>DdeInitialize</b>. 
     * 
     * There is an ANSI version and a Unicode version of <b>DdeInitialize</b>. The version called determines the type of the window procedures used to control DDE conversations (ANSI or Unicode), and the default value for the 
     * 				<i>iCodePage</i> member of the 
     * 				<a href="https://docs.microsoft.com/windows/desktop/api/ddeml/ns-ddeml-convcontext">CONVCONTEXT</a> structure (<b>CP_WINANSI</b> or <b>CP_WINUNICODE</b>). 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ddeml.h header defines DdeInitialize as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<UInt32>} pidInst Type: <b>LPDWORD</b>
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
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/ddeml/nf-ddeml-ddeinitializew
     * @since windows5.0
     */
    static DdeInitializeW(pidInst, pfnCallback, afCmd) {
        static ulRes := 0 ;Reserved parameters must always be NULL

        DllCall("USER32.dll\DdeInitializeW", "ptr", pidInst, "ptr", pfnCallback, "uint", afCmd, "uint", ulRes)
    }

    /**
     * Frees all Dynamic Data Exchange Management Library (DDEML) resources associated with the calling application.
     * @remarks
     * <b>DdeUninitialize</b> terminates any conversations currently open for the application.
     * @param {Integer} idInst Type: <b>DWORD</b>
     * 
     * The application instance identifier obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function.
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/ddeml/nf-ddeml-ddeuninitialize
     * @since windows5.0
     */
    static DdeUninitialize(idInst) {
        result := DllCall("USER32.dll\DdeUninitialize", "uint", idInst, "int")
        return result
    }

    /**
     * Establishes a conversation with all server applications that support the specified service name and topic name pair.
     * @remarks
     * An application must free the conversation list handle returned by the <b>DdeConnectList</b> function, regardless of whether any conversation handles within the list are active. To free the handle, an application can call <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddedisconnectlist">DdeDisconnectList</a>. 
     * 
     * All members of the default <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/ns-ddeml-convcontext">CONVCONTEXT</a> structure are set to zero except 
     * 				<i>cb</i>, specifying the size of the structure, and 
     * 				<i>iCodePage</i>, specifying <b>CP_WINANSI</b> (the default code page) or <b>CP_WINUNICODE</b>, depending on whether the ANSI or Unicode version of the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function was called by the client application.
     * @param {Integer} idInst Type: <b>DWORD</b>
     * 
     * The application instance identifier obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function.
     * @param {Pointer<HSZ>} hszService Type: <b>HSZ</b>
     * 
     * A handle to the string that specifies the service name of the server application with which a conversation is to be established. If this parameter is 0L, the system attempts to establish conversations with all available servers that support the specified topic name.
     * @param {Pointer<HSZ>} hszTopic Type: <b>HSZ</b>
     * 
     * A handle to the string that specifies the name of the topic on which a conversation is to be established. This handle must have been created by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddecreatestringhandlea">DdeCreateStringHandle</a> function. If this parameter is 0L, the system will attempt to establish conversations on all topics supported by the selected server (or servers).
     * @param {Pointer<HCONVLIST>} hConvList Type: <b>HCONVLIST</b>
     * 
     * A handle to the conversation list to be enumerated. This parameter should be 0L if a new conversation list is to be established.
     * @param {Pointer<CONVCONTEXT>} pCC Type: <b>PCONVCONTEXT</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/ns-ddeml-convcontext">CONVCONTEXT</a> structure that contains conversation-context information. If this parameter is <b>NULL</b>, the server receives the default <b>CONVCONTEXT</b> structure during the 
     * 					<a href="https://docs.microsoft.com/windows/desktop/dataxchg/xtyp-connect">XTYP_CONNECT</a> or 
     * 					<a href="https://docs.microsoft.com/windows/desktop/dataxchg/xtyp-wildconnect">XTYP_WILDCONNECT</a> transaction.
     * @returns {Pointer<HCONVLIST>} Type: <b>HCONVLIST</b>
     * 
     * If the function succeeds, the return value is the handle to a new conversation list.
     * 
     * If the function fails, the return value is 0L. The handle to the old conversation list is no longer valid. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://learn.microsoft.com/windows/win32/api/ddeml/nf-ddeml-ddeconnectlist
     * @since windows5.0
     */
    static DdeConnectList(idInst, hszService, hszTopic, hConvList, pCC) {
        result := DllCall("USER32.dll\DdeConnectList", "uint", idInst, "ptr", hszService, "ptr", hszTopic, "ptr", hConvList, "ptr", pCC, "ptr")
        return result
    }

    /**
     * Retrieves the next conversation handle in the specified conversation list.
     * @param {Pointer<HCONVLIST>} hConvList Type: <b>HCONVLIST</b>
     * 
     * A handle to the conversation list. This handle must have been created by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeconnectlist">DdeConnectList</a> function.
     * @param {Pointer<HCONV>} hConvPrev Type: <b>HCONV</b>
     * 
     * A handle to the conversation handle previously returned by this function. If this parameter is 0L, the function returns the first conversation handle in the list.
     * @returns {Pointer<HCONV>} Type: <b>HCONV</b>
     * 
     * If the list contains any more conversation handles, the return value is the next conversation handle in the list; otherwise, it is 0L.
     * @see https://learn.microsoft.com/windows/win32/api/ddeml/nf-ddeml-ddequerynextserver
     * @since windows5.0
     */
    static DdeQueryNextServer(hConvList, hConvPrev) {
        result := DllCall("USER32.dll\DdeQueryNextServer", "ptr", hConvList, "ptr", hConvPrev, "ptr")
        return result
    }

    /**
     * Destroys the specified conversation list and terminates all conversations associated with the list.
     * @remarks
     * An application can use the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddedisconnect">DdeDisconnect</a> function to terminate individual conversations in the list.
     * @param {Pointer<HCONVLIST>} hConvList Type: <b>HCONVLIST</b>
     * 
     * A handle to the conversation list. This handle must have been created by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeconnectlist">DdeConnectList</a> function.
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://learn.microsoft.com/windows/win32/api/ddeml/nf-ddeml-ddedisconnectlist
     * @since windows5.0
     */
    static DdeDisconnectList(hConvList) {
        result := DllCall("USER32.dll\DdeDisconnectList", "ptr", hConvList, "int")
        return result
    }

    /**
     * Establishes a conversation with a server application that supports the specified service name and topic name pair. If more than one such server exists, the system selects only one.
     * @remarks
     * The client application cannot make assumptions regarding the server selected. If an instance-specific name is specified in the 
     * 				<i>hszService</i> parameter, a conversation is established with only the specified instance. Instance-specific service names are passed to an application's Dynamic Data Exchange (DDE) callback function during the <a href="https://docs.microsoft.com/windows/desktop/dataxchg/xtyp-register">XTYP_REGISTER</a> and <a href="https://docs.microsoft.com/windows/desktop/dataxchg/xtyp-unregister">XTYP_UNREGISTER</a> transactions. 
     * 
     * All members of the default <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/ns-ddeml-convcontext">CONVCONTEXT</a> structure are set to zero except 
     * 				<i>cb</i>, which specifies the size of the structure, and 
     * 				<i>iCodePage</i>, which specifies <b>CP_WINANSI</b> (the default code page) or <b>CP_WINUNICODE</b>, depending on whether the ANSI or Unicode version of the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function was called by the client application.
     * @param {Integer} idInst Type: <b>DWORD</b>
     * 
     * The application instance identifier obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function.
     * @param {Pointer<HSZ>} hszService Type: <b>HSZ</b>
     * 
     * A handle to the string that specifies the service name of the server application with which a conversation is to be established. This handle must have been created by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddecreatestringhandlea">DdeCreateStringHandle</a> function. If this parameter is 0L, a conversation is established with any available server.
     * @param {Pointer<HSZ>} hszTopic Type: <b>HSZ</b>
     * 
     * A handle to the string that specifies the name of the topic on which a conversation is to be established. This handle must have been created by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddecreatestringhandlea">DdeCreateStringHandle</a>. If this parameter is 0L, a conversation on any topic supported by the selected server is established.
     * @param {Pointer<CONVCONTEXT>} pCC Type: <b>PCONVCONTEXT</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/ns-ddeml-convcontext">CONVCONTEXT</a> structure that contains conversation context information. If this parameter is <b>NULL</b>, the server receives the default <b>CONVCONTEXT</b> structure during the 
     * 					<a href="https://docs.microsoft.com/windows/desktop/dataxchg/xtyp-connect">XTYP_CONNECT</a> or 
     * 					<a href="https://docs.microsoft.com/windows/desktop/dataxchg/xtyp-wildconnect">XTYP_WILDCONNECT</a> transaction.
     * @returns {Pointer<HCONV>} Type: <b>HCONV</b>
     * 
     * If the function succeeds, the return value is the handle to the established conversation.
     * 
     * If the function fails, the return value is 0L. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://learn.microsoft.com/windows/win32/api/ddeml/nf-ddeml-ddeconnect
     * @since windows5.0
     */
    static DdeConnect(idInst, hszService, hszTopic, pCC) {
        result := DllCall("USER32.dll\DdeConnect", "uint", idInst, "ptr", hszService, "ptr", hszTopic, "ptr", pCC, "ptr")
        return result
    }

    /**
     * Terminates a conversation started by either the DdeConnect or DdeConnectList function and invalidates the specified conversation handle.
     * @remarks
     * Any incomplete transactions started before calling <b>DdeDisconnect</b> are immediately abandoned. The <a href="https://docs.microsoft.com/windows/desktop/dataxchg/xtyp-disconnect">XTYP_DISCONNECT</a> transaction is sent to the Dynamic Data Exchange (DDE) callback function of the partner in the conversation. Generally, only client applications must terminate conversations.
     * @param {Pointer<HCONV>} hConv Type: <b>HCONV</b>
     * 
     * A handle to the active conversation to be terminated.
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://learn.microsoft.com/windows/win32/api/ddeml/nf-ddeml-ddedisconnect
     * @since windows5.0
     */
    static DdeDisconnect(hConv) {
        result := DllCall("USER32.dll\DdeDisconnect", "ptr", hConv, "int")
        return result
    }

    /**
     * Enables a client Dynamic Data Exchange Management Library (DDEML) application to attempt to reestablish a conversation with a service that has terminated a conversation with the client.
     * @param {Pointer<HCONV>} hConv Type: <b>HCONV</b>
     * 
     * A handle to the conversation to be reestablished. A client must have obtained the conversation handle by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeconnect">DdeConnect</a> function or from an <a href="https://docs.microsoft.com/windows/desktop/dataxchg/xtyp-disconnect">XTYP_DISCONNECT</a> transaction.
     * @returns {Pointer<HCONV>} Type: <b>HCONV</b>
     * 
     * If the function succeeds, the return value is the handle to the reestablished conversation.
     * 
     * If the function fails, the return value is 0L. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://learn.microsoft.com/windows/win32/api/ddeml/nf-ddeml-ddereconnect
     * @since windows5.0
     */
    static DdeReconnect(hConv) {
        result := DllCall("USER32.dll\DdeReconnect", "ptr", hConv, "ptr")
        return result
    }

    /**
     * Retrieves information about a Dynamic Data Exchange (DDE) transaction and about the conversation in which the transaction takes place.
     * @remarks
     * An application should not free a string handle referenced by the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/ns-ddeml-convinfo">CONVINFO</a> structure. If an application must use one of these string handles, it should call the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddekeepstringhandle">DdeKeepStringHandle</a> function to create a copy of the handle. 
     * 
     * If the 
     * 				<i>idTransaction</i> parameter is set to QID_SYNC, the 
     * 				<i>hUser</i> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/ns-ddeml-convinfo">CONVINFO</a> structure is associated with the conversation and can be used to hold data associated with the conversation. If 
     * 				<i>idTransaction</i> is the identifier of an asynchronous transaction, the 
     * 				<i>hUser</i> member is associated only with the current transaction and is valid only for the duration of the transaction.
     * @param {Pointer<HCONV>} hConv Type: <b>HCONV</b>
     * 
     * A handle to the conversation.
     * @param {Integer} idTransaction Type: <b>DWORD</b>
     * 
     * The transaction. For asynchronous transactions, this parameter should be a transaction identifier returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeclienttransaction">DdeClientTransaction</a> function. For synchronous transactions, this parameter should be QID_SYNC.
     * @param {Pointer<CONVINFO>} pConvInfo Type: <b>PCONVINFO</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/ns-ddeml-convinfo">CONVINFO</a> structure that receives information about the transaction and conversation. The 
     * 					<i>cb</i> member of the <b>CONVINFO</b> structure must specify the length of the buffer allocated for the structure.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/ddeml/nf-ddeml-ddequeryconvinfo
     * @since windows5.0
     */
    static DdeQueryConvInfo(hConv, idTransaction, pConvInfo) {
        DllCall("USER32.dll\DdeQueryConvInfo", "ptr", hConv, "uint", idTransaction, "ptr", pConvInfo)
    }

    /**
     * Associates an application-defined value with a conversation handle or a transaction identifier. This is useful for simplifying the processing of asynchronous transactions. An application can use the DdeQueryConvInfo function to retrieve this value.
     * @param {Pointer<HCONV>} hConv Type: <b>HCONV</b>
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
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://learn.microsoft.com/windows/win32/api/ddeml/nf-ddeml-ddesetuserhandle
     * @since windows5.0
     */
    static DdeSetUserHandle(hConv, id, hUser) {
        result := DllCall("USER32.dll\DdeSetUserHandle", "ptr", hConv, "uint", id, "ptr", hUser, "int")
        return result
    }

    /**
     * Abandons the specified asynchronous transaction and releases all resources associated with the transaction.
     * @remarks
     * Only a Dynamic Data Exchange (DDE) client application should call <b>DdeAbandonTransaction</b>. If the server application responds to the transaction after the client has called <b>DdeAbandonTransaction</b>, the system discards the transaction results. This function has no effect on synchronous transactions.
     * @param {Integer} idInst Type: <b>DWORD</b>
     * 
     * The application instance identifier obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function.
     * @param {Pointer<HCONV>} hConv Type: <b>HCONV</b>
     * 
     * A handle to the conversation in which the transaction was initiated. If this parameter is 0L, all transactions are abandoned (that is, the 
     * 					<i>idTransaction</i> parameter is ignored).
     * @param {Integer} idTransaction Type: <b>DWORD</b>
     * 
     * The identifier of the transaction to be abandoned. If this parameter is 0L, all active transactions in the specified conversation are abandoned.
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://learn.microsoft.com/windows/win32/api/ddeml/nf-ddeml-ddeabandontransaction
     * @since windows5.0
     */
    static DdeAbandonTransaction(idInst, hConv, idTransaction) {
        result := DllCall("USER32.dll\DdeAbandonTransaction", "uint", idInst, "ptr", hConv, "uint", idTransaction, "int")
        return result
    }

    /**
     * Causes the system to send an XTYP_ADVREQ transaction to the calling (server) application's Dynamic Data Exchange (DDE) callback function for each client with an active advise loop on the specified topic and item.
     * @remarks
     * A server that has nonenumerable topics or items should set the 
     * 				<i>hszTopic</i> and 
     * 				<i>hszItem</i> parameters to <b>NULL</b> so that the system generates transactions for all active advise loops. The server's DDE callback function returns <b>NULL</b> for any advise loops that must not be updated. 
     * 
     * If a server calls <b>DdePostAdvise</b> with a topic, item, and format name set that includes the set currently being handled in an <a href="https://docs.microsoft.com/windows/desktop/dataxchg/xtyp-advreq">XTYP_ADVREQ</a> callback, a stack overflow can result.
     * @param {Integer} idInst Type: <b>DWORD</b>
     * 
     * The application instance identifier obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function.
     * @param {Pointer<HSZ>} hszTopic Type: <b>HSZ</b>
     * 
     * A handle to a string that specifies the topic name. To send notifications for all topics with active advise loops, an application can set this parameter to 0L.
     * @param {Pointer<HSZ>} hszItem Type: <b>HSZ</b>
     * 
     * A handle to a string that specifies the item name. To send notifications for all items with active advise loops, an application can set this parameter to 0L.
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://learn.microsoft.com/windows/win32/api/ddeml/nf-ddeml-ddepostadvise
     * @since windows5.0
     */
    static DdePostAdvise(idInst, hszTopic, hszItem) {
        result := DllCall("USER32.dll\DdePostAdvise", "uint", idInst, "ptr", hszTopic, "ptr", hszItem, "int")
        return result
    }

    /**
     * Enables or disables transactions for a specific conversation or for all conversations currently established by the calling application.
     * @remarks
     * An application can disable transactions for a specific conversation by returning the <b>CBR_BLOCK</b> return code from its Dynamic Data Exchange (DDE) callback function. When you reenable the conversation by using the <b>DdeEnableCallback</b> function, the operating system generates the same transaction that was in process when the conversation was disabled. 
     * 
     * Using the <b>EC_QUERYWAITING</b> flag does not change the enable state of the conversation and does not cause transactions to be issued within the context of the call to <b>DdeEnableCallback</b>. 
     * 
     * If <b>DdeEnableCallback</b> is called with <b>EC_QUERYWAITING</b> and the function returns a nonzero, an application should try to quickly allow message processing, return from its callback, or enable callbacks. Such a result does not guarantee that subsequent callbacks will be made. Calling <b>DdeEnableCallback</b> with <b>EC_QUERYWAITING</b> lets an application with blocked callbacks determine whether there are any transactions pending on the blocked conversation. Of course, even if such a call returns zero, an application should always process messages in a timely manner.
     * @param {Integer} idInst Type: <b>DWORD</b>
     * 
     * The application-instance identifier obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function.
     * @param {Pointer<HCONV>} hConv Type: <b>HCONV</b>
     * 
     * A handle to the conversation to enable or disable. If this parameter is <b>NULL</b>, the function affects all conversations.
     * @param {Integer} wCmd Type: <b>UINT</b>
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. 
     * 
     * If the 
     * 						<i>wCmd</i> parameter is <b>EC_QUERYWAITING</b>, and the application transaction queue contains one or more unprocessed transactions that are not being processed, the return value is <b>TRUE</b>; otherwise, it is <b>FALSE</b>.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://learn.microsoft.com/windows/win32/api/ddeml/nf-ddeml-ddeenablecallback
     * @since windows5.0
     */
    static DdeEnableCallback(idInst, hConv, wCmd) {
        result := DllCall("USER32.dll\DdeEnableCallback", "uint", idInst, "ptr", hConv, "uint", wCmd, "int")
        return result
    }

    /**
     * Impersonates a Dynamic Data Exchange (DDE) client application in a DDE client conversation.
     * @remarks
     * Impersonation is the ability of a process to take on the security attributes of another process. When a client in a DDE conversation requests information from a DDE server, the server impersonates the client. When the server requests access to an object, the system verifies the access against the client's security attributes. 
     * 
     * When the impersonation is complete, the server normally calls the <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-reverttoself">RevertToSelf</a> function. 
     * 
     * <h3><a id="Security_Considerations"></a><a id="security_considerations"></a><a id="SECURITY_CONSIDERATIONS"></a>Security Considerations</h3>
     * If the call to <b>DdeImpersonateClient</b> fails for any reason, the client is not impersonated and the client request is made in the security context of the calling process. If the calling process is running as a highly privileged account, such as LocalSystem, or as a member of an administrative group, the user may be able to perform actions that would otherwise be disallowed. Therefore it is important that you always check the return value of the call, and if it fails to raise an error, do not continue execution of the client request.
     * @param {Pointer<HCONV>} hConv Type: <b>HCONV</b>
     * 
     * A handle to the DDE client conversation to be impersonated.
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/ddeml/nf-ddeml-ddeimpersonateclient
     * @since windows5.0
     */
    static DdeImpersonateClient(hConv) {
        A_LastError := 0

        result := DllCall("USER32.dll\DdeImpersonateClient", "ptr", hConv, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Registers or unregisters the service names a Dynamic Data Exchange (DDE) server supports.
     * @remarks
     * The service name identified by the 
     * 				<i>hsz1</i> parameter should be a base name (that is, the name should contain no instance-specific information). The system generates an instance-specific name and sends it along with the base name during the 
     * 				<a href="https://docs.microsoft.com/windows/desktop/dataxchg/xtyp-register">XTYP_REGISTER</a> and 
     * 				<a href="https://docs.microsoft.com/windows/desktop/dataxchg/xtyp-unregister">XTYP_UNREGISTER</a> transactions. The receiving applications can then connect to the specific application instance.
     * @param {Integer} idInst Type: <b>DWORD</b>
     * 
     * The application instance identifier obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function.
     * @param {Pointer<HSZ>} hsz1 Type: <b>HSZ</b>
     * 
     * A handle to the string that specifies the service name the server is registering or unregistering. An application that is unregistering all of its service names should set this parameter to 0L.
     * @param {Pointer<HSZ>} hsz2 Type: <b>HSZ</b>
     * 
     * Reserved; should be set to 0L.
     * @param {Integer} afCmd Type: <b>UINT</b>
     * @returns {Pointer<HDDEDATA>} Type: <b>HDDEDATA</b>
     * 
     * If the function succeeds, it returns a nonzero value. That value is not a true <b>HDDEDATA</b> value, merely a Boolean indicator of success. The function is typed <b>HDDEDATA</b> to allow for possible future expansion of the function and a more sophisticated return value. 
     * 
     * If the function fails, the return value is 0L. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://learn.microsoft.com/windows/win32/api/ddeml/nf-ddeml-ddenameservice
     * @since windows5.0
     */
    static DdeNameService(idInst, hsz1, hsz2, afCmd) {
        result := DllCall("USER32.dll\DdeNameService", "uint", idInst, "ptr", hsz1, "ptr", hsz2, "uint", afCmd, "ptr")
        return result
    }

    /**
     * Begins a data transaction between a client and a server. Only a Dynamic Data Exchange (DDE) client application can call this function, and the application can use it only after establishing a conversation with the server.
     * @remarks
     * When an application has finished using the data handle returned by <b>DdeClientTransaction</b>, the application should free the handle by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddefreedatahandle">DdeFreeDataHandle</a> function. 
     * 
     * Transactions can be synchronous or asynchronous. During a synchronous transaction, <b>DdeClientTransaction</b> does not return until the transaction either completes successfully or fails. Synchronous transactions cause a client to enter a modal loop while waiting for various asynchronous events. Because of this, a client application can still respond to user input while waiting on a synchronous transaction, but the application cannot begin a second synchronous transaction because of the activity associated with the first. <b>DdeClientTransaction</b> fails if any instance of the same task has a synchronous transaction already in progress. 
     * 
     * During an asynchronous transaction, <b>DdeClientTransaction</b> returns after the transaction has begun, passing a transaction identifier for reference. When the server's DDE callback function finishes processing an asynchronous transaction, the system sends an 
     * 				<a href="https://docs.microsoft.com/windows/desktop/dataxchg/xtyp-xact-complete">XTYP_XACT_COMPLETE</a> transaction to the client. This transaction provides the client with the results of the asynchronous transaction that it initiated by calling <b>DdeClientTransaction</b>. A client application can choose to abandon an asynchronous transaction by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeabandontransaction">DdeAbandonTransaction</a> function.
     * @param {Pointer<Byte>} pData Type: <b>LPBYTE</b>
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
     * @param {Pointer<HCONV>} hConv Type: <b>HCONV</b>
     * 
     * A handle to the conversation in which the transaction is to take place.
     * @param {Pointer<HSZ>} hszItem Type: <b>HSZ</b>
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
     * @param {Pointer<UInt32>} pdwResult Type: <b>LPDWORD</b>
     * 
     * A pointer to a variable that receives the result of the transaction. An application that does not check the result can use <b>NULL</b> for this value. For synchronous transactions, the low-order word of this variable contains any applicable DDE_ flags resulting from the transaction. This provides support for applications dependent on <b>DDE_APPSTATUS</b> bits. It is, however, recommended that applications no longer use these bits because they may not be supported in future versions of the <a href="https://docs.microsoft.com/windows/desktop/dataxchg/dynamic-data-exchange-management-library">Dynamic Data Exchange Management Library</a> (DDEML). For asynchronous transactions, this variable is filled with a unique transaction identifier for use with the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeabandontransaction">DdeAbandonTransaction</a> function and the <a href="https://docs.microsoft.com/windows/desktop/dataxchg/xtyp-xact-complete">XTYP_XACT_COMPLETE</a> transaction.
     * @returns {Pointer<HDDEDATA>} Type: <b>HDDEDATA</b>
     * 
     * If the function succeeds, the return value is a data handle that identifies the data for successful synchronous transactions in which the client expects data from the server. The return value is nonzero for successful asynchronous transactions and for synchronous transactions in which the client does not expect data. The return value is zero for all unsuccessful transactions. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://learn.microsoft.com/windows/win32/api/ddeml/nf-ddeml-ddeclienttransaction
     * @since windows5.0
     */
    static DdeClientTransaction(pData, cbData, hConv, hszItem, wFmt, wType, dwTimeout, pdwResult) {
        result := DllCall("USER32.dll\DdeClientTransaction", "ptr", pData, "uint", cbData, "ptr", hConv, "ptr", hszItem, "uint", wFmt, "uint", wType, "uint", dwTimeout, "ptr", pdwResult, "ptr")
        return result
    }

    /**
     * Creates a Dynamic Data Exchange (DDE) object and fills the object with data from the specified buffer. A DDE application uses this function during transactions that involve passing data to the partner application.
     * @remarks
     * Any unfilled locations in the DDE object are undefined. 
     * 
     * After a data handle has been used as a parameter in another DDEML function or has been returned by a DDE callback function, the handle can be used only for read access to the DDE object identified by the handle.
     * @param {Integer} idInst Type: <b>DWORD</b>
     * 
     * The application instance identifier obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function.
     * @param {Pointer<Byte>} pSrc Type: <b>LPBYTE</b>
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
     * @param {Pointer<HSZ>} hszItem Type: <b>HSZ</b>
     * 
     * A handle to the string that specifies the data item corresponding to the DDE object. This handle must have been created by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddecreatestringhandlea">DdeCreateStringHandle</a> function. If the data handle is to be used in an <a href="https://docs.microsoft.com/windows/desktop/dataxchg/xtyp-execute">XTYP_EXECUTE</a> transaction, this parameter must be 0L.
     * @param {Integer} wFmt Type: <b>UINT</b>
     * 
     * The standard clipboard format of the data.
     * @param {Integer} afCmd Type: <b>UINT</b>
     * 
     * The creation flags. This parameter can be <b>HDATA_APPOWNED</b>, which specifies that the server application calling the <b>DdeCreateDataHandle</b> function owns the data handle this function creates. This flag enables the application to share the data handle with other DDEML applications rather than creating a separate handle to pass to each application. If this flag is specified, the application must eventually free the shared memory object associated with the handle by using the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddefreedatahandle">DdeFreeDataHandle</a> function. If this flag is not specified, the handle becomes invalid in the application that created the handle after the data handle is returned by the application's DDE callback function or is used as a parameter in another DDEML function.
     * @returns {Pointer<HDDEDATA>} Type: <b>HDDEDATA</b>
     * 
     * If the function succeeds, the return value is a data handle.
     * 
     * If the function fails, the return value is 0L. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://learn.microsoft.com/windows/win32/api/ddeml/nf-ddeml-ddecreatedatahandle
     * @since windows5.0
     */
    static DdeCreateDataHandle(idInst, pSrc, cb, cbOff, hszItem, wFmt, afCmd) {
        result := DllCall("USER32.dll\DdeCreateDataHandle", "uint", idInst, "ptr", pSrc, "uint", cb, "uint", cbOff, "ptr", hszItem, "uint", wFmt, "uint", afCmd, "ptr")
        return result
    }

    /**
     * Adds data to the specified Dynamic Data Exchange (DDE) object.
     * @remarks
     * After a data handle has been used as a parameter in another <a href="https://docs.microsoft.com/windows/desktop/dataxchg/dynamic-data-exchange-management-library">Dynamic Data Exchange Management Library</a> function or has been returned by a DDE callback function, the handle can be used only for read access to the DDE object identified by the handle. 
     * 
     * If the amount of memory originally allocated is less than is needed to hold the added data, <b>DdeAddData</b> reallocates a global memory object of the appropriate size.
     * @param {Pointer<HDDEDATA>} hData Type: <b>HDDEDATA</b>
     * 
     * A handle to the DDE object that receives additional data.
     * @param {Pointer<Byte>} pSrc Type: <b>LPBYTE</b>
     * 
     * The data to be added to the DDE object.
     * @param {Integer} cb Type: <b>DWORD</b>
     * 
     * The length, in bytes, of the data to be added to the DDE object, including the terminating <b>NULL</b>, if the data is a string.
     * @param {Integer} cbOff Type: <b>DWORD</b>
     * 
     * An offset, in bytes, from the beginning of the DDE object. The additional data is copied to the object beginning at this offset.
     * @returns {Pointer<HDDEDATA>} Type: <b>HDDEDATA</b>
     * 
     * If the function succeeds, the return value is a new handle to the DDE object. The new handle is used in all references to the object. 
     * 
     * If the function fails, the return value is zero. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://learn.microsoft.com/windows/win32/api/ddeml/nf-ddeml-ddeadddata
     * @since windows5.0
     */
    static DdeAddData(hData, pSrc, cb, cbOff) {
        result := DllCall("USER32.dll\DdeAddData", "ptr", hData, "ptr", pSrc, "uint", cb, "uint", cbOff, "ptr")
        return result
    }

    /**
     * Copies data from the specified Dynamic Data Exchange (DDE) object to the specified local buffer.
     * @param {Pointer<HDDEDATA>} hData Type: <b>HDDEDATA</b>
     * 
     * A handle to the DDE object that contains the data to copy.
     * @param {Pointer<Byte>} pDst Type: <b>LPBYTE</b>
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://learn.microsoft.com/windows/win32/api/ddeml/nf-ddeml-ddegetdata
     * @since windows5.0
     */
    static DdeGetData(hData, pDst, cbMax, cbOff) {
        result := DllCall("USER32.dll\DdeGetData", "ptr", hData, "ptr", pDst, "uint", cbMax, "uint", cbOff, "uint")
        return result
    }

    /**
     * Provides access to the data in the specified Dynamic Data Exchange (DDE) object. An application must call the DdeUnaccessData function when it has finished accessing the data in the object.
     * @remarks
     * If the 
     * 				<i>hData</i> parameter has not been passed to a Dynamic Data Exchange Management Library (DDEML) function, an application can use the pointer returned by <b>DdeAccessData</b> for read-write access to the DDE object. If 
     * 				<i>hData</i> has already been passed to a DDEML function, the pointer should be used only for read access to the memory object.
     * @param {Pointer<HDDEDATA>} hData Type: <b>HDDEDATA</b>
     * 
     * A handle to the DDE object to be accessed.
     * @param {Pointer<UInt32>} pcbDataSize Type: <b>LPDWORD</b>
     * 
     * A pointer to a variable that receives the size, in bytes, of the DDE object identified by the 
     * 					<i>hData</i> parameter. If this parameter is <b>NULL</b>, no size information is returned.
     * @returns {Pointer<Byte>} Type: <b>LPBYTE</b>
     * 
     * If the function succeeds, the return value is a pointer to the first byte of data in the DDE object.
     * 
     * If the function fails, the return value is <b>NULL</b>. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://learn.microsoft.com/windows/win32/api/ddeml/nf-ddeml-ddeaccessdata
     * @since windows5.0
     */
    static DdeAccessData(hData, pcbDataSize) {
        result := DllCall("USER32.dll\DdeAccessData", "ptr", hData, "ptr", pcbDataSize, "ptr")
        return result
    }

    /**
     * Unaccesses a Dynamic Data Exchange (DDE) object. An application must call this function after it has finished accessing the object.
     * @param {Pointer<HDDEDATA>} hData Type: <b>HDDEDATA</b>
     * 
     * A handle to the DDE object.
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://learn.microsoft.com/windows/win32/api/ddeml/nf-ddeml-ddeunaccessdata
     * @since windows5.0
     */
    static DdeUnaccessData(hData) {
        result := DllCall("USER32.dll\DdeUnaccessData", "ptr", hData, "int")
        return result
    }

    /**
     * Frees a Dynamic Data Exchange (DDE) object and deletes the data handle associated with the object.
     * @remarks
     * An application must call <b>DdeFreeDataHandle</b> under the following circumstances: 
     * 
     * <ul>
     * <li>To free a DDE object that the application allocated by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddecreatedatahandle">DdeCreateDataHandle</a> function if the object's data handle was never passed by the application to another Dynamic Data Exchange Management Library (DDEML) function </li>
     * <li>To free a DDE object that the application allocated by specifying the <b>HDATA_APPOWNED</b> flag in a call to <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddecreatedatahandle">DdeCreateDataHandle</a>
     * </li>
     * <li>To free a DDE object whose handle the application received from the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeclienttransaction">DdeClientTransaction</a> function </li>
     * </ul>
     * The system automatically frees an unowned object when its handle is returned by a DDE callback function or is used as a parameter in a DDEML function.
     * @param {Pointer<HDDEDATA>} hData Type: <b>HDDEDATA</b>
     * 
     * A handle to the DDE object to be freed. This handle must have been created by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddecreatedatahandle">DdeCreateDataHandle</a> function or returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeclienttransaction">DdeClientTransaction</a> function.
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://learn.microsoft.com/windows/win32/api/ddeml/nf-ddeml-ddefreedatahandle
     * @since windows5.0
     */
    static DdeFreeDataHandle(hData) {
        result := DllCall("USER32.dll\DdeFreeDataHandle", "ptr", hData, "int")
        return result
    }

    /**
     * Retrieves the most recent error code set by the failure of a Dynamic Data Exchange Management Library (DDEML) function and resets the error code to DMLERR_NO_ERROR.
     * @param {Integer} idInst Type: <b>DWORD</b>
     * 
     * The application instance identifier obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/ddeml/nf-ddeml-ddegetlasterror
     * @since windows5.0
     */
    static DdeGetLastError(idInst) {
        DllCall("USER32.dll\DdeGetLastError", "uint", idInst)
    }

    /**
     * Creates a handle that identifies the specified string. A Dynamic Data Exchange (DDE) client or server application can pass the string handle as a parameter to other Dynamic Data Exchange Management Library (DDEML) functions. (ANSI)
     * @remarks
     * The value of a string handle is not related to the case of the string it identifies. 
     * 
     * When an application either creates a string handle or receives one in the callback function and then uses the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddekeepstringhandle">DdeKeepStringHandle</a> function to keep it, the application must free that string handle when it is no longer needed. 
     * 
     * An instance-specific string handle cannot be mapped from string handle to string and back to string handle. This is shown in the following example, in which the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddequerystringa">DdeQueryString</a> function creates a string from a string handle and <b>DdeCreateStringHandle</b> creates a string handle from that string, but the two handles are not the same: 
     * 
     * 
     * ```
     * DWORD idInst; 
     * DWORD cb; 
     * HSZ hszInst, hszNew; 
     * PSZ pszInst; 
     *  
     * DdeQueryString(idInst, hszInst, pszInst, cb, CP_WINANSI); 
     * hszNew = DdeCreateStringHandle(idInst, pszInst, CP_WINANSI); 
     * // hszNew != hszInst ! 
     * ```
     * 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ddeml.h header defines DdeCreateStringHandle as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} idInst Type: <b>DWORD</b>
     * 
     * The application instance identifier obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function.
     * @param {Pointer<PSTR>} psz Type: <b>LPTSTR</b>
     * 
     * The null-terminated string for which a handle is to be created. This string can be up to 255 characters. The reason for this limit is that DDEML string management functions are implemented using atoms.
     * @param {Integer} iCodePage Type: <b>int</b>
     * 
     * The code page to be used to render the string. This value should be either <b>CP_WINANSI</b> (the default code page) or CP_WINUNICODE, depending on whether the ANSI or Unicode version of <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> was called by the client application.
     * @returns {Pointer<HSZ>} Type: <b>HSZ</b>
     * 
     * If the function succeeds, the return value is a string handle.
     * 
     * If the function fails, the return value is 0L. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://learn.microsoft.com/windows/win32/api/ddeml/nf-ddeml-ddecreatestringhandlea
     * @since windows5.0
     */
    static DdeCreateStringHandleA(idInst, psz, iCodePage) {
        psz := psz is String? StrPtr(psz) : psz

        result := DllCall("USER32.dll\DdeCreateStringHandleA", "uint", idInst, "ptr", psz, "int", iCodePage, "ptr")
        return result
    }

    /**
     * Creates a handle that identifies the specified string. A Dynamic Data Exchange (DDE) client or server application can pass the string handle as a parameter to other Dynamic Data Exchange Management Library (DDEML) functions. (Unicode)
     * @remarks
     * The value of a string handle is not related to the case of the string it identifies. 
     * 
     * When an application either creates a string handle or receives one in the callback function and then uses the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddekeepstringhandle">DdeKeepStringHandle</a> function to keep it, the application must free that string handle when it is no longer needed. 
     * 
     * An instance-specific string handle cannot be mapped from string handle to string and back to string handle. This is shown in the following example, in which the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddequerystringa">DdeQueryString</a> function creates a string from a string handle and <b>DdeCreateStringHandle</b> creates a string handle from that string, but the two handles are not the same: 
     * 
     * 
     * ```
     * DWORD idInst; 
     * DWORD cb; 
     * HSZ hszInst, hszNew; 
     * PSZ pszInst; 
     *  
     * DdeQueryString(idInst, hszInst, pszInst, cb, CP_WINANSI); 
     * hszNew = DdeCreateStringHandle(idInst, pszInst, CP_WINANSI); 
     * // hszNew != hszInst ! 
     * ```
     * 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ddeml.h header defines DdeCreateStringHandle as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} idInst Type: <b>DWORD</b>
     * 
     * The application instance identifier obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function.
     * @param {Pointer<PWSTR>} psz Type: <b>LPTSTR</b>
     * 
     * The null-terminated string for which a handle is to be created. This string can be up to 255 characters. The reason for this limit is that DDEML string management functions are implemented using atoms.
     * @param {Integer} iCodePage Type: <b>int</b>
     * 
     * The code page to be used to render the string. This value should be either <b>CP_WINANSI</b> (the default code page) or CP_WINUNICODE, depending on whether the ANSI or Unicode version of <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> was called by the client application.
     * @returns {Pointer<HSZ>} Type: <b>HSZ</b>
     * 
     * If the function succeeds, the return value is a string handle.
     * 
     * If the function fails, the return value is 0L. 
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddegetlasterror">DdeGetLastError</a> function can be used to get the error code, which can be one of the following values:
     * @see https://learn.microsoft.com/windows/win32/api/ddeml/nf-ddeml-ddecreatestringhandlew
     * @since windows5.0
     */
    static DdeCreateStringHandleW(idInst, psz, iCodePage) {
        psz := psz is String? StrPtr(psz) : psz

        result := DllCall("USER32.dll\DdeCreateStringHandleW", "uint", idInst, "ptr", psz, "int", iCodePage, "ptr")
        return result
    }

    /**
     * Copies text associated with a string handle into a buffer. (ANSI)
     * @remarks
     * The string returned in the buffer is always null-terminated. If the string is longer than (
     * 				<i>cchMax</i>– 1), only the first (
     * 				<i>cchMax</i>– 1) characters of the string are copied. 
     * 
     * If the 
     * 				<i>psz</i> parameter is <b>NULL</b>, the <b>DdeQueryString</b> function obtains the length, in bytes, of the string associated with the string handle. The length does not include the terminating null character. 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ddeml.h header defines DdeQueryString as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} idInst Type: <b>DWORD</b>
     * 
     * The application instance identifier obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function.
     * @param {Pointer<HSZ>} hsz Type: <b>HSZ</b>
     * 
     * A handle to the string to copy. This handle must have been created by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddecreatestringhandlea">DdeCreateStringHandle</a> function.
     * @param {Pointer<PSTR>} psz Type: <b>LPTSTR</b>
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
     * @see https://learn.microsoft.com/windows/win32/api/ddeml/nf-ddeml-ddequerystringa
     * @since windows5.0
     */
    static DdeQueryStringA(idInst, hsz, psz, cchMax, iCodePage) {
        psz := psz is String? StrPtr(psz) : psz

        result := DllCall("USER32.dll\DdeQueryStringA", "uint", idInst, "ptr", hsz, "ptr", psz, "uint", cchMax, "int", iCodePage, "uint")
        return result
    }

    /**
     * Copies text associated with a string handle into a buffer. (Unicode)
     * @remarks
     * The string returned in the buffer is always null-terminated. If the string is longer than (
     * 				<i>cchMax</i>– 1), only the first (
     * 				<i>cchMax</i>– 1) characters of the string are copied. 
     * 
     * If the 
     * 				<i>psz</i> parameter is <b>NULL</b>, the <b>DdeQueryString</b> function obtains the length, in bytes, of the string associated with the string handle. The length does not include the terminating null character. 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The ddeml.h header defines DdeQueryString as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} idInst Type: <b>DWORD</b>
     * 
     * The application instance identifier obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function.
     * @param {Pointer<HSZ>} hsz Type: <b>HSZ</b>
     * 
     * A handle to the string to copy. This handle must have been created by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddecreatestringhandlea">DdeCreateStringHandle</a> function.
     * @param {Pointer<PWSTR>} psz Type: <b>LPTSTR</b>
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
     * @see https://learn.microsoft.com/windows/win32/api/ddeml/nf-ddeml-ddequerystringw
     * @since windows5.0
     */
    static DdeQueryStringW(idInst, hsz, psz, cchMax, iCodePage) {
        psz := psz is String? StrPtr(psz) : psz

        result := DllCall("USER32.dll\DdeQueryStringW", "uint", idInst, "ptr", hsz, "ptr", psz, "uint", cchMax, "int", iCodePage, "uint")
        return result
    }

    /**
     * Frees a string handle in the calling application.
     * @remarks
     * An application can free string handles it creates with <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddecreatestringhandlea">DdeCreateStringHandle</a> but should not free those that the system passed to the application's Dynamic Data Exchange (DDE) callback function or those returned in the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/ns-ddeml-convinfo">CONVINFO</a> structure by the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddequeryconvinfo">DdeQueryConvInfo</a> function.
     * @param {Integer} idInst Type: <b>DWORD</b>
     * 
     * The application instance identifier obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function.
     * @param {Pointer<HSZ>} hsz Type: <b>HSZ</b>
     * 
     * A handle to the string handle to be freed. This handle must have been created by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddecreatestringhandlea">DdeCreateStringHandle</a> function.
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/ddeml/nf-ddeml-ddefreestringhandle
     * @since windows5.0
     */
    static DdeFreeStringHandle(idInst, hsz) {
        result := DllCall("USER32.dll\DdeFreeStringHandle", "uint", idInst, "ptr", hsz, "int")
        return result
    }

    /**
     * Increments the usage count associated with the specified handle.
     * @param {Integer} idInst Type: <b>DWORD</b>
     * 
     * The application instance identifier obtained by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function.
     * @param {Pointer<HSZ>} hsz Type: <b>HSZ</b>
     * 
     * A handle to the string handle to be saved.
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/ddeml/nf-ddeml-ddekeepstringhandle
     * @since windows5.0
     */
    static DdeKeepStringHandle(idInst, hsz) {
        result := DllCall("USER32.dll\DdeKeepStringHandle", "uint", idInst, "ptr", hsz, "int")
        return result
    }

    /**
     * Compares the values of two string handles. The value of a string handle is not related to the case of the associated string.
     * @remarks
     * An application that must do a case-sensitive comparison of two string handles should compare the string handles directly. An application should use <b>DdeCmpStringHandles</b> for all other comparisons to preserve the case-insensitive nature of Dynamic Data Exchange (DDE). 
     * 
     * <b>DdeCmpStringHandles</b> cannot be used to sort string handles alphabetically.
     * @param {Pointer<HSZ>} hsz1 Type: <b>HSZ</b>
     * 
     * A handle to the first string.
     * @param {Pointer<HSZ>} hsz2 Type: <b>HSZ</b>
     * 
     * A handle to the second string.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/ddeml/nf-ddeml-ddecmpstringhandles
     * @since windows5.0
     */
    static DdeCmpStringHandles(hsz1, hsz2) {
        DllCall("USER32.dll\DdeCmpStringHandles", "ptr", hsz1, "ptr", hsz2)
    }

    /**
     * The SetWinMetaFileBits function converts a metafile from the older Windows format to the new enhanced format and stores the new metafile in memory.
     * @remarks
     * Windows uses the reference device context's resolution data and the data in the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-metafilepict">METAFILEPICT</a> structure to scale a picture. If the <i>hdcRef</i> parameter is <b>NULL</b>, the system uses resolution data for the current output device. If the <i>lpmfp</i> parameter is <b>NULL</b>, the system uses the MM_ANISOTROPIC mapping mode to scale the picture so that it fits the entire device surface. The <b>hMF</b> member of the <b>METAFILEPICT</b> structure is not used.
     * 
     * When the application no longer needs the enhanced metafile handle, it should delete it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deleteenhmetafile">DeleteEnhMetaFile</a> function.
     * 
     * The handle returned by this function can be used with other enhanced-metafile functions.
     * 
     * If the reference device context is not identical to the device in which the metafile was originally created, some GDI functions that use device units may not draw the picture correctly.
     * @param {Integer} nSize The size, in bytes, of the buffer that contains the Windows-format metafile.
     * @param {Pointer<Byte>} lpMeta16Data A pointer to a buffer that contains the Windows-format metafile data. (It is assumed that the data was obtained by using the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getmetafilebitsex">GetMetaFileBitsEx</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getwinmetafilebits">GetWinMetaFileBits</a> function.)
     * @param {Pointer<HDC>} hdcRef A handle to a reference device context.
     * @param {Pointer<METAFILEPICT>} lpMFP A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-metafilepict">METAFILEPICT</a> structure that contains the suggested size of the metafile picture and the mapping mode that was used when the picture was created.
     * @returns {Pointer<HENHMETAFILE>} If the function succeeds, the return value is a handle to a memory-based enhanced metafile.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-setwinmetafilebits
     * @since windows5.0
     */
    static SetWinMetaFileBits(nSize, lpMeta16Data, hdcRef, lpMFP) {
        result := DllCall("GDI32.dll\SetWinMetaFileBits", "uint", nSize, "ptr", lpMeta16Data, "ptr", hdcRef, "ptr", lpMFP, "ptr")
        return result
    }

    /**
     * Opens the clipboard for examination and prevents other applications from modifying the clipboard content.
     * @remarks
     * <b>OpenClipboard</b> fails if another window has the clipboard open. 
     * 
     * An application should call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-closeclipboard">CloseClipboard</a> function after every successful call to <b>OpenClipboard</b>. 
     * 
     * The window identified by the 
     * 				<i>hWndNewOwner</i> parameter does not become the clipboard owner unless the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-emptyclipboard">EmptyClipboard</a> function is called. 
     * 
     * If an application calls <b>OpenClipboard</b> with hwnd set to <b>NULL</b>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-emptyclipboard">EmptyClipboard</a> sets the clipboard owner to <b>NULL</b>; this causes <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setclipboarddata">SetClipboardData</a> to fail.
     * @param {Pointer<HWND>} hWndNewOwner Type: <b>HWND</b>
     * 
     * A handle to the window to be associated with the open clipboard. If this parameter is <b>NULL</b>, the open clipboard is associated with the current task.
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-openclipboard
     * @since windows5.0
     */
    static OpenClipboard(hWndNewOwner) {
        A_LastError := 0

        result := DllCall("USER32.dll\OpenClipboard", "ptr", hWndNewOwner, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Closes the clipboard.
     * @remarks
     * When the window has finished examining or changing the clipboard, close the clipboard by calling <b>CloseClipboard</b>. This enables other windows to access the clipboard.
     * 
     * Do not place an object on the clipboard after calling <b>CloseClipboard</b>.
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-closeclipboard
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
     * @remarks
     * The system keeps a serial number for the clipboard for each window station. This number is incremented whenever the contents of the clipboard change or the clipboard is emptied. You can track this value to determine whether the clipboard contents have changed and optimize creating DataObjects. If clipboard rendering is delayed, the sequence number is not incremented until the changes are rendered.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * The return value is the clipboard sequence number. If you do not have <b>WINSTA_ACCESSCLIPBOARD</b> access to the window station, the function returns zero.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getclipboardsequencenumber
     * @since windows5.0
     */
    static GetClipboardSequenceNumber() {
        result := DllCall("USER32.dll\GetClipboardSequenceNumber", "uint")
        return result
    }

    /**
     * Retrieves the window handle of the current owner of the clipboard.
     * @remarks
     * The clipboard can still contain data even if the clipboard is not currently owned. 
     * 
     * In general, the clipboard owner is the window that last placed data in clipboard. The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-emptyclipboard">EmptyClipboard</a> function assigns clipboard ownership.
     * @returns {Pointer<HWND>} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value is the handle to the window that owns the clipboard. 
     * 
     * If the clipboard is not owned, the return value is <b>NULL</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getclipboardowner
     * @since windows5.0
     */
    static GetClipboardOwner() {
        A_LastError := 0

        result := DllCall("USER32.dll\GetClipboardOwner", "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds the specified window to the chain of clipboard viewers. Clipboard viewer windows receive a WM_DRAWCLIPBOARD message whenever the content of the clipboard changes. This function is used for backward compatibility with earlier versions of Windows.
     * @remarks
     * The windows that are part of the clipboard viewer chain, called clipboard viewer windows, must process the clipboard messages <a href="https://docs.microsoft.com/windows/desktop/dataxchg/wm-changecbchain">WM_CHANGECBCHAIN</a> and <a href="https://docs.microsoft.com/windows/desktop/dataxchg/wm-drawclipboard">WM_DRAWCLIPBOARD</a>. Each clipboard viewer window calls the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-sendmessage">SendMessage</a> function to pass these messages to the next window in the clipboard viewer chain.
     * 
     * A clipboard viewer window must eventually remove itself from the clipboard viewer chain by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-changeclipboardchain">ChangeClipboardChain</a> function — for example, in response to the <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-destroy">WM_DESTROY</a> message.
     * 
     * The <b>SetClipboardViewer</b> function exists to provide backward compatibility with earlier versions of Windows. The clipboard viewer chain can be broken by an application that fails to handle the clipboard chain messages properly. New applications should use more robust techniques such as the clipboard sequence number or the registration of a clipboard format listener. For further details on these alternatives techniques, see <a href="https://docs.microsoft.com/windows/desktop/dataxchg/using-the-clipboard">Monitoring Clipboard Contents</a>.
     * @param {Pointer<HWND>} hWndNewViewer Type: <b>HWND</b>
     * 
     * A handle to the window to be added to the clipboard chain.
     * @returns {Pointer<HWND>} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value identifies the next window in the clipboard viewer chain. If an error occurs or there are no other windows in the clipboard viewer chain, the return value is NULL. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-setclipboardviewer
     * @since windows5.0
     */
    static SetClipboardViewer(hWndNewViewer) {
        A_LastError := 0

        result := DllCall("USER32.dll\SetClipboardViewer", "ptr", hWndNewViewer, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the handle to the first window in the clipboard viewer chain.
     * @returns {Pointer<HWND>} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value is the handle to the first window in the clipboard viewer chain. 
     * 
     * If there is no clipboard viewer, the return value is <b>NULL</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getclipboardviewer
     * @since windows5.0
     */
    static GetClipboardViewer() {
        A_LastError := 0

        result := DllCall("USER32.dll\GetClipboardViewer", "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Removes a specified window from the chain of clipboard viewers.
     * @remarks
     * The window identified by 
     *     <i>hWndNewNext</i> replaces the 
     *     <i>hWndRemove</i> window in the chain. The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setclipboardviewer">SetClipboardViewer</a> function sends a <a href="https://docs.microsoft.com/windows/desktop/dataxchg/wm-changecbchain">WM_CHANGECBCHAIN</a> message to the first window in the clipboard viewer chain.
     * 
     * For an example, see <a href="https://docs.microsoft.com/windows/desktop/dataxchg/using-the-clipboard">Removing a Window from the Clipboard Viewer Chain</a>.
     * @param {Pointer<HWND>} hWndRemove Type: <b>HWND</b>
     * 
     * A handle to the window to be removed from the chain. The handle must have been passed to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setclipboardviewer">SetClipboardViewer</a> function.
     * @param {Pointer<HWND>} hWndNewNext Type: <b>HWND</b>
     * 
     * A handle to the window that follows the 
     *      <i>hWndRemove</i> window in the clipboard viewer chain. (This is the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setclipboardviewer">SetClipboardViewer</a>, unless the sequence was changed in response to a <a href="https://docs.microsoft.com/windows/desktop/dataxchg/wm-changecbchain">WM_CHANGECBCHAIN</a> message.)
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * The return value indicates the result of passing the <a href="https://docs.microsoft.com/windows/desktop/dataxchg/wm-changecbchain">WM_CHANGECBCHAIN</a> message to the windows in the clipboard viewer chain. Because a window in the chain typically returns <b>FALSE</b> when it processes <b>WM_CHANGECBCHAIN</b>, the return value from <b>ChangeClipboardChain</b> is typically <b>FALSE</b>. If there is only one window in the chain, the return value is typically <b>TRUE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-changeclipboardchain
     * @since windows5.0
     */
    static ChangeClipboardChain(hWndRemove, hWndNewNext) {
        result := DllCall("USER32.dll\ChangeClipboardChain", "ptr", hWndRemove, "ptr", hWndNewNext, "int")
        return result
    }

    /**
     * Places data on the clipboard in a specified clipboard format.
     * @remarks
     * <b>Windows 8:</b> Bitmaps to be shared with Windows Store app apps must be in the <b>CF_BITMAP</b> format (device-dependent bitmap). 
     * 
     * If an application calls <b>SetClipboardData</b> in response to <a href="https://docs.microsoft.com/windows/desktop/dataxchg/wm-renderformat">WM_RENDERFORMAT</a> or <a href="https://docs.microsoft.com/windows/desktop/dataxchg/wm-renderallformats">WM_RENDERALLFORMATS</a>, the application should not use the handle after <b>SetClipboardData</b> has been called.
     * 
     * If an application calls <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-openclipboard">OpenClipboard</a> with hwnd set to <b>NULL</b>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-emptyclipboard">EmptyClipboard</a> sets the clipboard owner to <b>NULL</b>; this causes <b>SetClipboardData</b> to fail.
     * 
     * The system performs implicit data format conversions between certain clipboard formats when an application calls the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getclipboarddata">GetClipboardData</a> function. For example, if the <b>CF_OEMTEXT</b> format is on the clipboard, a window can retrieve data in the <b>CF_TEXT</b> format. The format on the clipboard is converted to the requested format on demand. For more information, see <a href="https://docs.microsoft.com/windows/desktop/dataxchg/clipboard-formats">Synthesized Clipboard Formats</a>.
     * @param {Integer} uFormat Type: <b>UINT</b>
     * 
     * The clipboard format. This parameter can be a registered format or any of the standard clipboard formats. For more information, see <a href="https://docs.microsoft.com/windows/desktop/dataxchg/standard-clipboard-formats">Standard Clipboard Formats</a> and <a href="https://docs.microsoft.com/windows/desktop/dataxchg/clipboard-formats">Registered Clipboard Formats</a>.
     * @param {Pointer<HANDLE>} hMem Type: <b>HANDLE</b>
     * 
     * A handle to the data in the specified format. This parameter can be <b>NULL</b>, indicating that the window provides data in the specified clipboard format (renders the format) upon request; this is known as [delayed rendering](/windows/win32/dataxchg/clipboard-operations#delayed-rendering). If a window delays rendering, it must process the [WM_RENDERFORMAT](/windows/win32/dataxchg/wm-renderformat) and [WM_RENDERALLFORMATS](/windows/win32/dataxchg/wm-renderallformats) messages.
     * 
     * If <b>SetClipboardData</b> succeeds, the system owns the object identified by the <i>hMem</i> parameter. The application may not write to or free the data once ownership has been transferred to the system, but it can lock and read from the data until the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-closeclipboard">CloseClipboard</a> function is called. (The memory must be unlocked before the Clipboard is closed.) If the <i>hMem</i> parameter identifies a memory object, the object must have been allocated using the function with the <b>GMEM_MOVEABLE</b> flag.
     * @returns {Pointer<HANDLE>} Type: <b>HANDLE</b>
     * 
     * If the function succeeds, the return value is the handle to the data.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-setclipboarddata
     * @since windows5.0
     */
    static SetClipboardData(uFormat, hMem) {
        A_LastError := 0

        result := DllCall("USER32.dll\SetClipboardData", "uint", uFormat, "ptr", hMem, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves data from the clipboard in a specified format. The clipboard must have been opened previously.
     * @remarks
     * <div class="alert"><b>Caution</b>  Clipboard data is not trusted. Parse the data carefully before using it in your application.</div>
     * <div> </div>
     * An application can enumerate the available formats in advance by using the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumclipboardformats">EnumClipboardFormats</a> function. 
     * 
     * The clipboard controls the handle that the <b>GetClipboardData</b> function returns, not the application. The application should copy the data immediately. The application must not free the handle nor leave it locked. The application must not use the handle after the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-emptyclipboard">EmptyClipboard</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-closeclipboard">CloseClipboard</a> function is called, or after the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setclipboarddata">SetClipboardData</a> function is called with the same clipboard format. 
     * 
     * The system performs implicit data format conversions between certain clipboard formats when an application calls the <b>GetClipboardData</b> function. For example, if the <a href="https://docs.microsoft.com/windows/desktop/dataxchg/standard-clipboard-formats">CF_OEMTEXT</a> format is on the clipboard, a window can retrieve data in the <a href="https://docs.microsoft.com/windows/desktop/dataxchg/standard-clipboard-formats">CF_TEXT</a> format. The format on the clipboard is converted to the requested format on demand. For more information, see <a href="https://docs.microsoft.com/windows/desktop/dataxchg/clipboard-formats">Synthesized Clipboard Formats</a>.
     * @param {Integer} uFormat Type: <b>UINT</b>
     * 
     * A clipboard format. For a description of the standard clipboard formats, see <a href="https://docs.microsoft.com/windows/desktop/dataxchg/clipboard-formats">Standard Clipboard Formats</a>.
     * @returns {Pointer<HANDLE>} Type: <b>HANDLE</b>
     * 
     * If the function succeeds, the return value is the handle to a clipboard object in the specified format.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getclipboarddata
     * @since windows5.0
     */
    static GetClipboardData(uFormat) {
        A_LastError := 0

        result := DllCall("USER32.dll\GetClipboardData", "uint", uFormat, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Registers a new clipboard format. This format can then be used as a valid clipboard format. (ANSI)
     * @remarks
     * If a registered format with the specified name already exists, a new format is not registered and the return value identifies the existing format. This enables more than one application to copy and paste data using the same registered clipboard format. Note that the format name comparison is case-insensitive.
     * 
     * Registered clipboard formats are identified by values in the range 0xC000 through 0xFFFF. 
     * 
     * When registered clipboard formats are placed on or retrieved from the clipboard, they must be in the form of an 
     * 				<b>HGLOBAL</b> value.
     * @param {Pointer<PSTR>} lpszFormat Type: <b>LPCTSTR</b>
     * 
     * The name of the new format.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-registerclipboardformata
     * @since windows5.0
     */
    static RegisterClipboardFormatA(lpszFormat) {
        lpszFormat := lpszFormat is String? StrPtr(lpszFormat) : lpszFormat

        A_LastError := 0

        DllCall("USER32.dll\RegisterClipboardFormatA", "ptr", lpszFormat)
        if(A_LastError)
            throw OSError()

    }

    /**
     * Registers a new clipboard format. This format can then be used as a valid clipboard format. (Unicode)
     * @remarks
     * If a registered format with the specified name already exists, a new format is not registered and the return value identifies the existing format. This enables more than one application to copy and paste data using the same registered clipboard format. Note that the format name comparison is case-insensitive.
     * 
     * Registered clipboard formats are identified by values in the range 0xC000 through 0xFFFF. 
     * 
     * When registered clipboard formats are placed on or retrieved from the clipboard, they must be in the form of an 
     * 				<b>HGLOBAL</b> value.
     * @param {Pointer<PWSTR>} lpszFormat Type: <b>LPCTSTR</b>
     * 
     * The name of the new format.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-registerclipboardformatw
     * @since windows5.0
     */
    static RegisterClipboardFormatW(lpszFormat) {
        lpszFormat := lpszFormat is String? StrPtr(lpszFormat) : lpszFormat

        A_LastError := 0

        DllCall("USER32.dll\RegisterClipboardFormatW", "ptr", lpszFormat)
        if(A_LastError)
            throw OSError()

    }

    /**
     * Retrieves the number of different data formats currently on the clipboard.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-countclipboardformats
     * @since windows5.0
     */
    static CountClipboardFormats() {
        A_LastError := 0

        DllCall("USER32.dll\CountClipboardFormats")
        if(A_LastError)
            throw OSError()

    }

    /**
     * Enumerates the data formats currently available on the clipboard.
     * @remarks
     * You must open the clipboard before enumerating its formats. Use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-openclipboard">OpenClipboard</a> function to open the clipboard. The <b>EnumClipboardFormats</b> function fails if the clipboard is not open.
     * 
     * The
     * 				<b>EnumClipboardFormats</b> function enumerates formats in the order that they were placed on the clipboard. If you are copying information to the clipboard, add clipboard objects in order from the most descriptive clipboard format to the least descriptive clipboard format. If you are pasting information from the clipboard, retrieve the first clipboard format that you can handle. That will be the most descriptive clipboard format that you can handle.
     * 
     * The system provides automatic type conversions for certain clipboard formats. In the case of such a format, this function enumerates the specified format, then enumerates the formats to which it can be converted. For more information, see <a href="https://docs.microsoft.com/windows/desktop/dataxchg/clipboard-formats">Standard Clipboard Formats</a>  and <a href="https://docs.microsoft.com/windows/desktop/dataxchg/clipboard-formats">Synthesized Clipboard Formats</a>.
     * @param {Integer} format Type: <b>UINT</b>
     * 
     * A clipboard format that is known to be available.
     * 
     * To start an enumeration of clipboard formats, set 
     * 					<i>format</i> to zero. When 
     * 					<i>format</i> is zero, the function retrieves the first available clipboard format. For subsequent calls during an enumeration, set 
     * 					<i>format</i> to the result of the previous 
     * 					<b>EnumClipboardFormats</b> call.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-enumclipboardformats
     * @since windows5.0
     */
    static EnumClipboardFormats(format) {
        A_LastError := 0

        DllCall("USER32.dll\EnumClipboardFormats", "uint", format)
        if(A_LastError)
            throw OSError()

    }

    /**
     * Retrieves from the clipboard the name of the specified registered format. The function copies the name to the specified buffer. (ANSI)
     * @remarks
     * <h3><a id="Security_Considerations"></a><a id="security_considerations"></a><a id="SECURITY_CONSIDERATIONS"></a>Security Considerations</h3>
     * Using this function incorrectly might compromise the security of your program. For example, miscalculating the proper size of the <i>lpszFormatName</i> buffer, especially when the application is used in both ANSI and Unicode versions, can cause a buffer overflow. Also, note that the string is truncated if it is longer than the <i>cchMaxCount</i> parameter, which can lead to loss of information.
     * @param {Integer} format Type: <b>UINT</b>
     * 
     * The type of format to be retrieved. This parameter must not specify any of the predefined clipboard formats.
     * @param {Pointer<PSTR>} lpszFormatName Type: <b>LPTSTR</b>
     * 
     * The buffer that is to receive the format name.
     * @param {Integer} cchMaxCount Type: <b>int</b>
     * 
     * The maximum length, in 
     * 					characters, of the string to be copied to the buffer. If the name exceeds this limit, it is truncated.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getclipboardformatnamea
     * @since windows5.0
     */
    static GetClipboardFormatNameA(format, lpszFormatName, cchMaxCount) {
        lpszFormatName := lpszFormatName is String? StrPtr(lpszFormatName) : lpszFormatName

        A_LastError := 0

        DllCall("USER32.dll\GetClipboardFormatNameA", "uint", format, "ptr", lpszFormatName, "int", cchMaxCount)
        if(A_LastError)
            throw OSError()

    }

    /**
     * Retrieves from the clipboard the name of the specified registered format. The function copies the name to the specified buffer. (Unicode)
     * @remarks
     * <h3><a id="Security_Considerations"></a><a id="security_considerations"></a><a id="SECURITY_CONSIDERATIONS"></a>Security Considerations</h3>
     * Using this function incorrectly might compromise the security of your program. For example, miscalculating the proper size of the <i>lpszFormatName</i> buffer, especially when the application is used in both ANSI and Unicode versions, can cause a buffer overflow. Also, note that the string is truncated if it is longer than the <i>cchMaxCount</i> parameter, which can lead to loss of information.
     * @param {Integer} format Type: <b>UINT</b>
     * 
     * The type of format to be retrieved. This parameter must not specify any of the predefined clipboard formats.
     * @param {Pointer<PWSTR>} lpszFormatName Type: <b>LPTSTR</b>
     * 
     * The buffer that is to receive the format name.
     * @param {Integer} cchMaxCount Type: <b>int</b>
     * 
     * The maximum length, in 
     * 					characters, of the string to be copied to the buffer. If the name exceeds this limit, it is truncated.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getclipboardformatnamew
     * @since windows5.0
     */
    static GetClipboardFormatNameW(format, lpszFormatName, cchMaxCount) {
        lpszFormatName := lpszFormatName is String? StrPtr(lpszFormatName) : lpszFormatName

        A_LastError := 0

        DllCall("USER32.dll\GetClipboardFormatNameW", "uint", format, "ptr", lpszFormatName, "int", cchMaxCount)
        if(A_LastError)
            throw OSError()

    }

    /**
     * Empties the clipboard and frees handles to data in the clipboard. The function then assigns ownership of the clipboard to the window that currently has the clipboard open.
     * @remarks
     * Before calling <b>EmptyClipboard</b>, an application must open the clipboard by using the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-openclipboard">OpenClipboard</a> function. If the application specifies a <b>NULL</b> window handle when opening the clipboard, <b>EmptyClipboard</b> succeeds but sets the clipboard owner to <b>NULL</b>. Note that this causes <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setclipboarddata">SetClipboardData</a> to fail.
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-emptyclipboard
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
     * @remarks
     * Typically, an application that recognizes only one clipboard format would call this function when processing the <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-initmenu">WM_INITMENU</a> or <a href="https://docs.microsoft.com/windows/desktop/menurc/wm-initmenupopup">WM_INITMENUPOPUP</a> message. The application would then enable or disable the Paste menu item, depending on the return value. Applications that recognize more than one clipboard format should use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpriorityclipboardformat">GetPriorityClipboardFormat</a> function for this purpose.
     * @param {Integer} format Type: <b>UINT</b>
     * 
     * A standard or registered clipboard format. For a description of the standard clipboard formats, see <a href="https://docs.microsoft.com/windows/desktop/dataxchg/standard-clipboard-formats">Standard Clipboard Formats</a> .
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * If the clipboard format is available, the return value is nonzero.
     * 
     * If the clipboard format is not available, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-isclipboardformatavailable
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
     * @param {Pointer<UInt32>} paFormatPriorityList Type: <b>UINT*</b>
     * 
     * The clipboard formats, in priority order. For a description of the standard clipboard formats, see <a href="https://docs.microsoft.com/windows/desktop/dataxchg/standard-clipboard-formats">Standard Clipboard Formats</a> .
     * @param {Integer} cFormats Type: <b>int</b>
     * 
     * The number of entries in the 
     *      <i>paFormatPriorityList</i> array. This value must not be greater than the number of entries in the list.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getpriorityclipboardformat
     * @since windows5.0
     */
    static GetPriorityClipboardFormat(paFormatPriorityList, cFormats) {
        A_LastError := 0

        DllCall("USER32.dll\GetPriorityClipboardFormat", "ptr", paFormatPriorityList, "int", cFormats)
        if(A_LastError)
            throw OSError()

    }

    /**
     * Retrieves the handle to the window that currently has the clipboard open.
     * @remarks
     * If an application or DLL specifies a <b>NULL</b> window handle when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-openclipboard">OpenClipboard</a> function, the clipboard is opened but is not associated with a window. In such a case, <b>GetOpenClipboardWindow</b> returns <b>NULL</b>.
     * @returns {Pointer<HWND>} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value is the handle to the window that has the clipboard open. If no window has the clipboard open, the return value is <b>NULL</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getopenclipboardwindow
     * @since windows5.0
     */
    static GetOpenClipboardWindow() {
        A_LastError := 0

        result := DllCall("USER32.dll\GetOpenClipboardWindow", "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Places the given window in the system-maintained clipboard format listener list.
     * @remarks
     * When a window has been added to the clipboard format listener list, it is posted a <a href="https://docs.microsoft.com/windows/desktop/dataxchg/wm-clipboardupdate">WM_CLIPBOARDUPDATE</a> message whenever the contents of the clipboard have changed.
     * @param {Pointer<HWND>} hwnd Type: <b>HWND</b>
     * 
     * A handle to the window to be placed in the clipboard format listener list.
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * Returns <b>TRUE</b> if successful, <b>FALSE</b> otherwise. Call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for additional details.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-addclipboardformatlistener
     * @since windows6.0.6000
     */
    static AddClipboardFormatListener(hwnd) {
        A_LastError := 0

        result := DllCall("USER32.dll\AddClipboardFormatListener", "ptr", hwnd, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Removes the given window from the system-maintained clipboard format listener list.
     * @remarks
     * When a window has been removed from the clipboard format listener list, it will no longer receive <a href="https://docs.microsoft.com/windows/desktop/dataxchg/wm-clipboardupdate">WM_CLIPBOARDUPDATE</a> messages.
     * @param {Pointer<HWND>} hwnd Type: <b>HWND</b>
     * 
     * A handle to the window to remove from the clipboard format listener list.
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * Returns <b>TRUE</b> if successful, <b>FALSE</b> otherwise. Call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for additional details.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-removeclipboardformatlistener
     * @since windows6.0.6000
     */
    static RemoveClipboardFormatListener(hwnd) {
        A_LastError := 0

        result := DllCall("USER32.dll\RemoveClipboardFormatListener", "ptr", hwnd, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the currently supported clipboard formats.
     * @param {Pointer<UInt32>} lpuiFormats Type: <b>PUINT</b>
     * 
     * An array of clipboard formats. For a description of the standard clipboard formats, see <a href="https://docs.microsoft.com/windows/desktop/dataxchg/standard-clipboard-formats">Standard Clipboard Formats</a>.
     * @param {Integer} cFormats Type: <b>UINT</b>
     * 
     * The number of entries in the array pointed to by <i>lpuiFormats</i>.
     * @param {Pointer<UInt32>} pcFormatsOut Type: <b>PUINT</b>
     * 
     * The actual number of clipboard formats in the array pointed to by <i>lpuiFormats</i>.
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * The function returns <b>TRUE</b> if successful; otherwise, <b>FALSE</b>. Call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for additional details.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getupdatedclipboardformats
     * @since windows6.0.6000
     */
    static GetUpdatedClipboardFormats(lpuiFormats, cFormats, pcFormatsOut) {
        A_LastError := 0

        result := DllCall("USER32.dll\GetUpdatedClipboardFormats", "ptr", lpuiFormats, "uint", cFormats, "ptr", pcFormatsOut, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Decrements the reference count of a global string atom. If the atom's reference count reaches zero, GlobalDeleteAtom removes the string associated with the atom from the global atom table.
     * @remarks
     * A string atom's reference count specifies the number of times the string has been added to the atom table. The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globaladdatoma">GlobalAddAtom</a> function increments the reference count of a string that already exists in the global atom table each time it is called. 
     * 
     * Each call to <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globaladdatoma">GlobalAddAtom</a> should have a corresponding call to <b>GlobalDeleteAtom</b>. Do not call <b>GlobalDeleteAtom</b> more times than you call <b>GlobalAddAtom</b>, or you may delete the atom while other clients are using it. Applications using Dynamic Data Exchange (DDE) should follow the rules on global atom management to prevent leaks and premature deletion.
     * 
     * <b>GlobalDeleteAtom</b> has no effect on an integer atom (an atom whose value is in the range 0x0001 to 0xBFFF). The function always returns zero for an integer atom.
     * @param {Integer} nAtom Type: <b>ATOM</b>
     * 
     * The atom and character string to be deleted.
     * @returns {Integer} Type: <b>ATOM</b>
     * 
     * The function always returns (<b>ATOM</b>) 0. 
     * 
     * To determine whether the function has failed, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a> with <b>ERROR_SUCCESS</b> before calling <b>GlobalDeleteAtom</b>, then call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. If the last error code is still <b>ERROR_SUCCESS</b>, <b>GlobalDeleteAtom</b> has succeeded.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-globaldeleteatom
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
     * @remarks
     * An application need not use this function to use a local atom table. The default number of hash buckets used is 37. If an application does use <b>InitAtomTable</b>, however, it should call the function before any other atom-management function. 
     * 
     * If an application uses a large number of local atoms, it can reduce the time required to add an atom to the local atom table or to find an atom in the table by increasing the size of the table. However, this increases the amount of memory required to maintain the table. 
     * 
     * The number of buckets in the global atom table cannot be changed. If the atom table has already been initialized, either explicitly by a prior call to <b>InitAtomTable</b>, or implicitly by the use of any atom-management function, <b>InitAtomTable</b> returns success without changing the number of hash buckets.
     * @param {Integer} nSize Type: <b>DWORD</b>
     * 
     * The number of hash buckets to use for the atom table. If this parameter is zero, the default number of hash buckets are created.
     * 
     * To achieve better performance, specify a prime number in 
     * 					<i>nSize</i>.
     * @returns {Integer} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-initatomtable
     * @since windows5.0
     */
    static InitAtomTable(nSize) {
        result := DllCall("KERNEL32.dll\InitAtomTable", "uint", nSize, "int")
        return result
    }

    /**
     * Decrements the reference count of a local string atom. If the atom's reference count is reduced to zero, DeleteAtom removes the string associated with the atom from the local atom table.
     * @remarks
     * A string atom's reference count specifies the number of times the atom has been added to the atom table. The <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-addatomw">AddAtom</a> function increments the count on each call. The <b>DeleteAtom</b> function decrements the count on each call but removes the string only if the atom's reference count is zero. 
     * 
     * Each call to <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-addatomw">AddAtom</a> should have a corresponding call to <b>DeleteAtom</b>. Do not call <b>DeleteAtom</b> more times than you call <b>AddAtom</b>, or you may delete the atom while other clients are using it. 
     * 
     * The <b>DeleteAtom</b> function has no effect on an integer atom (an atom whose value is in the range 0x0001 to 0xBFFF). The function always returns zero for an integer atom.
     * @param {Integer} nAtom Type: <b>ATOM</b>
     * 
     * The atom to be deleted.
     * @returns {Integer} Type: <b>ATOM</b>
     * 
     * If the function succeeds, the return value is zero.
     * 
     * If the function fails, the return value is the 
     * 						<i>nAtom</i> parameter. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-deleteatom
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
     * Adds a character string to the global atom table and returns a unique value (an atom) identifying the string. (GlobalAddAtomA)
     * @remarks
     * If the string already exists in the global atom table, the atom for the existing string is returned and the atom's reference count is incremented. 
     * 
     * The string associated with the atom is not deleted from memory until its reference count is zero. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globaldeleteatom">GlobalDeleteAtom</a> function. 
     * 
     * Global atoms are not deleted automatically when the application terminates. For every call to the <b>GlobalAddAtom</b> function, there must be a corresponding call to the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globaldeleteatom">GlobalDeleteAtom</a> function. 
     * 
     * If the 
     * 				<i>lpString</i> parameter has the form "#1234", <b>GlobalAddAtom</b> returns an integer atom whose value is the 16-bit representation of the decimal number specified in the string (0x04D2, in this example). If the decimal value specified is 0x0000 or is greater than or equal to 0xC000, the return value is zero, indicating an error. If 
     * 				<i>lpString</i> was created by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-makeintatom">MAKEINTATOM</a> macro, the low-order word must be in the range 0x0001 through 0xBFFF. If the low-order word is not in this range, the function fails. 
     * 
     * If 
     * 				<i>lpString</i> has any other form, <b>GlobalAddAtom</b> returns a string atom. 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GlobalAddAtom as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PSTR>} lpString Type: <b>LPCTSTR</b>
     * 
     * The null-terminated string to be added. The string can have a maximum size of 255 bytes. Strings that differ only in case are considered identical. The case of the first string of this name added to the table is preserved and returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalgetatomnamea">GlobalGetAtomName</a> function.
     * 
     * Alternatively, you can use an integer atom that has been converted using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-makeintatom">MAKEINTATOM</a> macro. See the Remarks for more information.
     * @returns {Integer} Type: <b>ATOM</b>
     * 
     * If the function succeeds, the return value is the newly created atom.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-globaladdatoma
     * @since windows5.0
     */
    static GlobalAddAtomA(lpString) {
        lpString := lpString is String? StrPtr(lpString) : lpString

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GlobalAddAtomA", "ptr", lpString, "ushort")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds a character string to the global atom table and returns a unique value (an atom) identifying the string. (GlobalAddAtomW)
     * @remarks
     * If the string already exists in the global atom table, the atom for the existing string is returned and the atom's reference count is incremented. 
     * 
     * The string associated with the atom is not deleted from memory until its reference count is zero. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globaldeleteatom">GlobalDeleteAtom</a> function. 
     * 
     * Global atoms are not deleted automatically when the application terminates. For every call to the <b>GlobalAddAtom</b> function, there must be a corresponding call to the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globaldeleteatom">GlobalDeleteAtom</a> function. 
     * 
     * If the 
     * 				<i>lpString</i> parameter has the form "#1234", <b>GlobalAddAtom</b> returns an integer atom whose value is the 16-bit representation of the decimal number specified in the string (0x04D2, in this example). If the decimal value specified is 0x0000 or is greater than or equal to 0xC000, the return value is zero, indicating an error. If 
     * 				<i>lpString</i> was created by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-makeintatom">MAKEINTATOM</a> macro, the low-order word must be in the range 0x0001 through 0xBFFF. If the low-order word is not in this range, the function fails. 
     * 
     * If 
     * 				<i>lpString</i> has any other form, <b>GlobalAddAtom</b> returns a string atom. 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GlobalAddAtom as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} lpString Type: <b>LPCTSTR</b>
     * 
     * The null-terminated string to be added. The string can have a maximum size of 255 bytes. Strings that differ only in case are considered identical. The case of the first string of this name added to the table is preserved and returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalgetatomnamea">GlobalGetAtomName</a> function.
     * 
     * Alternatively, you can use an integer atom that has been converted using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-makeintatom">MAKEINTATOM</a> macro. See the Remarks for more information.
     * @returns {Integer} Type: <b>ATOM</b>
     * 
     * If the function succeeds, the return value is the newly created atom.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-globaladdatomw
     * @since windows5.0
     */
    static GlobalAddAtomW(lpString) {
        lpString := lpString is String? StrPtr(lpString) : lpString

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GlobalAddAtomW", "ptr", lpString, "ushort")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds a character string to the global atom table and returns a unique value (an atom) identifying the string. (GlobalAddAtomExA)
     * @remarks
     * > [!NOTE]
     * > The winbase.h header defines GlobalAddAtomEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PSTR>} lpString The null-terminated string to be added. The string can have a maximum size of 255 bytes. Strings that differ only in case are considered identical. The case of the first string of this name added to the table is preserved and returned by the <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-globalgetatomnamea">GlobalGetAtomName</a> function.
     * 
     * Alternatively, you can use an integer atom that has been converted using the <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-makeintatom">MAKEINTATOM</a> macro. See the Remarks for more information.
     * @param {Integer} Flags 
     * @returns {Integer} If the function succeeds, the return value is the newly created atom.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-globaladdatomexa
     */
    static GlobalAddAtomExA(lpString, Flags) {
        lpString := lpString is String? StrPtr(lpString) : lpString

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GlobalAddAtomExA", "ptr", lpString, "uint", Flags, "ushort")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds a character string to the global atom table and returns a unique value (an atom) identifying the string. (GlobalAddAtomExW)
     * @remarks
     * > [!NOTE]
     * > The winbase.h header defines GlobalAddAtomEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} lpString The null-terminated string to be added. The string can have a maximum size of 255 bytes. Strings that differ only in case are considered identical. The case of the first string of this name added to the table is preserved and returned by the <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-globalgetatomnamea">GlobalGetAtomName</a> function.
     * 
     * Alternatively, you can use an integer atom that has been converted using the <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-makeintatom">MAKEINTATOM</a> macro. See the Remarks for more information.
     * @param {Integer} Flags 
     * @returns {Integer} If the function succeeds, the return value is the newly created atom.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-globaladdatomexw
     */
    static GlobalAddAtomExW(lpString, Flags) {
        lpString := lpString is String? StrPtr(lpString) : lpString

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GlobalAddAtomExW", "ptr", lpString, "uint", Flags, "ushort")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Searches the global atom table for the specified character string and retrieves the global atom associated with that string. (ANSI)
     * @remarks
     * Even though the system preserves the case of a string in an atom table as it was originally entered, the search performed by <b>GlobalFindAtom</b> is not case sensitive. 
     * 
     * If 
     * 				<i>lpString</i> was created by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-makeintatom">MAKEINTATOM</a> macro, the low-order word must be in the range 0x0001 through 0xBFFF. If the low-order word is not in this range, the function fails. 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GlobalFindAtom as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PSTR>} lpString Type: <b>LPCTSTR</b>
     * 
     * The null-terminated character string for which to search. 
     * 
     * Alternatively, you can use an integer atom that has been converted using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-makeintatom">MAKEINTATOM</a> macro. See the Remarks for more information.
     * @returns {Integer} Type: <b>ATOM</b>
     * 
     * If the function succeeds, the return value is the global atom associated with the given string.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-globalfindatoma
     * @since windows5.0
     */
    static GlobalFindAtomA(lpString) {
        lpString := lpString is String? StrPtr(lpString) : lpString

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GlobalFindAtomA", "ptr", lpString, "ushort")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Searches the global atom table for the specified character string and retrieves the global atom associated with that string. (Unicode)
     * @remarks
     * Even though the system preserves the case of a string in an atom table as it was originally entered, the search performed by <b>GlobalFindAtom</b> is not case sensitive. 
     * 
     * If 
     * 				<i>lpString</i> was created by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-makeintatom">MAKEINTATOM</a> macro, the low-order word must be in the range 0x0001 through 0xBFFF. If the low-order word is not in this range, the function fails. 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GlobalFindAtom as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} lpString Type: <b>LPCTSTR</b>
     * 
     * The null-terminated character string for which to search. 
     * 
     * Alternatively, you can use an integer atom that has been converted using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-makeintatom">MAKEINTATOM</a> macro. See the Remarks for more information.
     * @returns {Integer} Type: <b>ATOM</b>
     * 
     * If the function succeeds, the return value is the global atom associated with the given string.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-globalfindatomw
     * @since windows5.0
     */
    static GlobalFindAtomW(lpString) {
        lpString := lpString is String? StrPtr(lpString) : lpString

        A_LastError := 0

        result := DllCall("KERNEL32.dll\GlobalFindAtomW", "ptr", lpString, "ushort")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a copy of the character string associated with the specified global atom. (ANSI)
     * @remarks
     * The string returned for an integer atom (an atom whose value is in the range 0x0001 to 0xBFFF) is a null-terminated string in which the first character is a pound sign (#) and the remaining characters represent the unsigned integer atom value. 
     * 
     * <h3><a id="Security_Considerations"></a><a id="security_considerations"></a><a id="SECURITY_CONSIDERATIONS"></a>Security Considerations</h3>
     * Using this function incorrectly might compromise the security of your program. Incorrect use of this function includes not correctly specifying the size of the <i>lpBuffer</i> parameter. Also, note that a global atom is accessible by anyone; thus, privacy and the integrity of its contents is not assured.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GlobalGetAtomName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} nAtom Type: <b>ATOM</b>
     * 
     * The global atom associated with the character string to be retrieved.
     * @param {Pointer<PSTR>} lpBuffer Type: <b>LPTSTR</b>
     * 
     * The buffer for the character string.
     * @param {Integer} nSize Type: <b>int</b>
     * 
     * The size, in 
     * 					characters, of the buffer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-globalgetatomnamea
     * @since windows5.0
     */
    static GlobalGetAtomNameA(nAtom, lpBuffer, nSize) {
        lpBuffer := lpBuffer is String? StrPtr(lpBuffer) : lpBuffer

        A_LastError := 0

        DllCall("KERNEL32.dll\GlobalGetAtomNameA", "ushort", nAtom, "ptr", lpBuffer, "int", nSize)
        if(A_LastError)
            throw OSError()

    }

    /**
     * Retrieves a copy of the character string associated with the specified global atom. (Unicode)
     * @remarks
     * The string returned for an integer atom (an atom whose value is in the range 0x0001 to 0xBFFF) is a null-terminated string in which the first character is a pound sign (#) and the remaining characters represent the unsigned integer atom value. 
     * 
     * <h3><a id="Security_Considerations"></a><a id="security_considerations"></a><a id="SECURITY_CONSIDERATIONS"></a>Security Considerations</h3>
     * Using this function incorrectly might compromise the security of your program. Incorrect use of this function includes not correctly specifying the size of the <i>lpBuffer</i> parameter. Also, note that a global atom is accessible by anyone; thus, privacy and the integrity of its contents is not assured.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GlobalGetAtomName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} nAtom Type: <b>ATOM</b>
     * 
     * The global atom associated with the character string to be retrieved.
     * @param {Pointer<PWSTR>} lpBuffer Type: <b>LPTSTR</b>
     * 
     * The buffer for the character string.
     * @param {Integer} nSize Type: <b>int</b>
     * 
     * The size, in 
     * 					characters, of the buffer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-globalgetatomnamew
     * @since windows5.0
     */
    static GlobalGetAtomNameW(nAtom, lpBuffer, nSize) {
        lpBuffer := lpBuffer is String? StrPtr(lpBuffer) : lpBuffer

        A_LastError := 0

        DllCall("KERNEL32.dll\GlobalGetAtomNameW", "ushort", nAtom, "ptr", lpBuffer, "int", nSize)
        if(A_LastError)
            throw OSError()

    }

    /**
     * Adds a character string to the local atom table and returns a unique value (an atom) identifying the string. (ANSI)
     * @remarks
     * The <b>AddAtom</b> function stores no more than one copy of a given string in the atom table. If the string is already in the table, the function returns the existing atom and, in the case of a string atom, increments the string's reference count. 
     * 
     * If 
     * 				<i>lpString</i> has the form "#1234", <b>AddAtom</b> returns an integer atom whose value is the 16-bit representation of the decimal number specified in the string (0x04D2, in this example). If the decimal value specified is 0x0000 or is greater than or equal to 0xC000, the return value is zero, indicating an error. If 
     * 				<i>lpString</i> was created by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-makeintatom">MAKEINTATOM</a> macro, the low-order word must be in the range 0x0001 through 0xBFFF. If the low-order word is not in this range, the function fails. 
     * 
     * If 
     * 				<i>lpString</i> has any other form, <b>AddAtom</b> returns a string atom. 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines AddAtom as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PSTR>} lpString Type: <b>LPCTSTR</b>
     * 
     * The null-terminated string to be added. The string can have a maximum size of 255 bytes. Strings differing only in case are considered identical. The case of the first string added is preserved and returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getatomnamea">GetAtomName</a> function. 
     * 
     * Alternatively, you can use an integer atom that has been converted using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-makeintatom">MAKEINTATOM</a> macro. See the Remarks for more information.
     * @returns {Integer} Type: <b>ATOM</b>
     * 
     * If the function succeeds, the return value is the newly created atom.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-addatoma
     * @since windows5.0
     */
    static AddAtomA(lpString) {
        lpString := lpString is String? StrPtr(lpString) : lpString

        A_LastError := 0

        result := DllCall("KERNEL32.dll\AddAtomA", "ptr", lpString, "ushort")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Adds a character string to the local atom table and returns a unique value (an atom) identifying the string. (Unicode)
     * @remarks
     * The <b>AddAtom</b> function stores no more than one copy of a given string in the atom table. If the string is already in the table, the function returns the existing atom and, in the case of a string atom, increments the string's reference count. 
     * 
     * If 
     * 				<i>lpString</i> has the form "#1234", <b>AddAtom</b> returns an integer atom whose value is the 16-bit representation of the decimal number specified in the string (0x04D2, in this example). If the decimal value specified is 0x0000 or is greater than or equal to 0xC000, the return value is zero, indicating an error. If 
     * 				<i>lpString</i> was created by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-makeintatom">MAKEINTATOM</a> macro, the low-order word must be in the range 0x0001 through 0xBFFF. If the low-order word is not in this range, the function fails. 
     * 
     * If 
     * 				<i>lpString</i> has any other form, <b>AddAtom</b> returns a string atom. 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines AddAtom as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} lpString Type: <b>LPCTSTR</b>
     * 
     * The null-terminated string to be added. The string can have a maximum size of 255 bytes. Strings differing only in case are considered identical. The case of the first string added is preserved and returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getatomnamea">GetAtomName</a> function. 
     * 
     * Alternatively, you can use an integer atom that has been converted using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-makeintatom">MAKEINTATOM</a> macro. See the Remarks for more information.
     * @returns {Integer} Type: <b>ATOM</b>
     * 
     * If the function succeeds, the return value is the newly created atom.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-addatomw
     * @since windows5.0
     */
    static AddAtomW(lpString) {
        lpString := lpString is String? StrPtr(lpString) : lpString

        A_LastError := 0

        result := DllCall("KERNEL32.dll\AddAtomW", "ptr", lpString, "ushort")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Searches the local atom table for the specified character string and retrieves the atom associated with that string. (ANSI)
     * @remarks
     * Even though the system preserves the case of a string in an atom table, the search performed by the <b>FindAtom</b> function is not case sensitive. 
     * 
     * If 
     * 				<i>lpString</i> was created by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-makeintatom">MAKEINTATOM</a> macro, the low-order word must be in the range 0x0001 through 0xBFFF. If the low-order word is not in this range, the function fails. 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines FindAtom as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PSTR>} lpString Type: <b>LPCTSTR</b>
     * 
     * The character string for which to search.
     * 
     * Alternatively, you can use an integer atom that has been converted using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-makeintatom">MAKEINTATOM</a> macro. See Remarks for more information.
     * @returns {Integer} Type: <b>ATOM</b>
     * 
     * If the function succeeds, the return value is the atom associated with the given string. 
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-findatoma
     * @since windows5.0
     */
    static FindAtomA(lpString) {
        lpString := lpString is String? StrPtr(lpString) : lpString

        A_LastError := 0

        result := DllCall("KERNEL32.dll\FindAtomA", "ptr", lpString, "ushort")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Searches the local atom table for the specified character string and retrieves the atom associated with that string. (Unicode)
     * @remarks
     * Even though the system preserves the case of a string in an atom table, the search performed by the <b>FindAtom</b> function is not case sensitive. 
     * 
     * If 
     * 				<i>lpString</i> was created by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-makeintatom">MAKEINTATOM</a> macro, the low-order word must be in the range 0x0001 through 0xBFFF. If the low-order word is not in this range, the function fails. 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines FindAtom as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} lpString Type: <b>LPCTSTR</b>
     * 
     * The character string for which to search.
     * 
     * Alternatively, you can use an integer atom that has been converted using the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-makeintatom">MAKEINTATOM</a> macro. See Remarks for more information.
     * @returns {Integer} Type: <b>ATOM</b>
     * 
     * If the function succeeds, the return value is the atom associated with the given string. 
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-findatomw
     * @since windows5.0
     */
    static FindAtomW(lpString) {
        lpString := lpString is String? StrPtr(lpString) : lpString

        A_LastError := 0

        result := DllCall("KERNEL32.dll\FindAtomW", "ptr", lpString, "ushort")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a copy of the character string associated with the specified local atom. (ANSI)
     * @remarks
     * The string returned for an integer atom (an atom whose value is in the range 0x0001 to 0xBFFF) is a null-terminated string in which the first character is a pound sign (#) and the remaining characters represent the unsigned integer atom value. 
     * 
     * <h3><a id="Security_Considerations"></a><a id="security_considerations"></a><a id="SECURITY_CONSIDERATIONS"></a>Security Considerations</h3>
     * Using this function incorrectly might compromise the security of your program. Incorrect use of this function includes not correctly specifying the size of the <i>lpBuffer</i> parameter. 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GetAtomName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} nAtom Type: <b>ATOM</b>
     * 
     * The local atom that identifies the character string to be retrieved.
     * @param {Pointer<PSTR>} lpBuffer Type: <b>LPTSTR</b>
     * 
     * The character string.
     * @param {Integer} nSize Type: <b>int</b>
     * 
     * The size, in 
     * 					characters, of the buffer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getatomnamea
     * @since windows5.0
     */
    static GetAtomNameA(nAtom, lpBuffer, nSize) {
        lpBuffer := lpBuffer is String? StrPtr(lpBuffer) : lpBuffer

        A_LastError := 0

        DllCall("KERNEL32.dll\GetAtomNameA", "ushort", nAtom, "ptr", lpBuffer, "int", nSize)
        if(A_LastError)
            throw OSError()

    }

    /**
     * Retrieves a copy of the character string associated with the specified local atom. (Unicode)
     * @remarks
     * The string returned for an integer atom (an atom whose value is in the range 0x0001 to 0xBFFF) is a null-terminated string in which the first character is a pound sign (#) and the remaining characters represent the unsigned integer atom value. 
     * 
     * <h3><a id="Security_Considerations"></a><a id="security_considerations"></a><a id="SECURITY_CONSIDERATIONS"></a>Security Considerations</h3>
     * Using this function incorrectly might compromise the security of your program. Incorrect use of this function includes not correctly specifying the size of the <i>lpBuffer</i> parameter. 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines GetAtomName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} nAtom Type: <b>ATOM</b>
     * 
     * The local atom that identifies the character string to be retrieved.
     * @param {Pointer<PWSTR>} lpBuffer Type: <b>LPTSTR</b>
     * 
     * The character string.
     * @param {Integer} nSize Type: <b>int</b>
     * 
     * The size, in 
     * 					characters, of the buffer.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getatomnamew
     * @since windows5.0
     */
    static GetAtomNameW(nAtom, lpBuffer, nSize) {
        lpBuffer := lpBuffer is String? StrPtr(lpBuffer) : lpBuffer

        A_LastError := 0

        DllCall("KERNEL32.dll\GetAtomNameW", "ushort", nAtom, "ptr", lpBuffer, "int", nSize)
        if(A_LastError)
            throw OSError()

    }

;@endregion Methods
}
