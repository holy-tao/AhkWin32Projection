#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\NCB.ahk" { NCB }

/**
 * @namespace Windows.Win32.NetworkManagement.NetBios
 */

;@region Functions
/**
 * The Netbios function interprets and executes the specified network control block (NCB).
 * @remarks
 * When an asynchronous network control block finishes and the <b>ncb_post</b> member is nonzero, the routine specified in <b>ncb_post</b> is called with a single parameter. This parameter contains a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/nb30/ns-nb30-ncb">NCB</a> structure, the network control block.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/nb30/ns-nb30-ncb">NCB</a> structure contains a handle of an event (the <b>ncb_event</b> member). The system sets the event to the nonsignaled state when an asynchronous NetBIOS command is accepted, and sets the event to the signaled state when the asynchronous NetBIOS command is completed. Only manual reset events should be used for synchronization. A specified event should not be associated with more than one active asynchronous NetBIOS command.
 * 
 * Using <b>ncb_event</b> to submit asynchronous requests requires fewer system resources than using <b>ncb_post</b>. Also, when <b>ncb_event</b> is nonzero, the pending request is canceled if the thread terminates before the request is processed. This is not true for requests sent by using <b>ncb_post</b>.
 * @param {Pointer<NCB>} pncb A  pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/nb30/ns-nb30-ncb">NCB</a> structure that describes the network control block.
 * @returns {Integer} For synchronous requests, the return value is the return code in the <a href="https://docs.microsoft.com/windows/desktop/api/nb30/ns-nb30-ncb">NCB</a> structure. That value is also returned in the <b>ncb_retcode</b> member of the <b>NCB</b> structure.
 * 
 * For asynchronous requests, there are the following possibilities:
 * 
 * <ul>
 * <li>If the asynchronous command has already completed when <b>Netbios</b> returns to its caller, the return value is the return code of the NCB structure, just as if it were a synchronous <a href="https://docs.microsoft.com/windows/desktop/api/nb30/ns-nb30-ncb">NCB</a> structure.</li>
 * <li>If the asynchronous command is still pending when <b>Netbios</b> returns to its caller, the return value is zero.</li>
 * </ul>
 * If the address specified by the pncb parameter is invalid, the return value is <b>NRC_BADNCB</b>.
 * 
 * If the buffer length specified in the <b>ncb_length</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/nb30/ns-nb30-ncb">NCB</a> structure is incorrect, or if the buffer specified by the <b>ncb_retcode</b> member is protected from write operations, the return value is <b>NRC_BUFLEN</b>.
 * @see https://learn.microsoft.com/windows/win32/api/nb30/nf-nb30-netbios
 * @since windows5.0
 */
export Netbios(pncb) {
    result := DllCall("NETAPI32.dll\Netbios", NCB.Ptr, pncb, Int8)
    return result
}

;@endregion Functions
