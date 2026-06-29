#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CONVINFO_STATUS.ahk" { CONVINFO_STATUS }
#Import "..\..\Security\SECURITY_IMPERSONATION_LEVEL.ahk" { SECURITY_IMPERSONATION_LEVEL }
#Import ".\HSZ.ahk" { HSZ }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\HCONVLIST.ahk" { HCONVLIST }
#Import ".\HCONV.ahk" { HCONV }
#Import ".\CONVCONTEXT.ahk" { CONVCONTEXT }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\DDE_CLIENT_TRANSACTION_TYPE.ahk" { DDE_CLIENT_TRANSACTION_TYPE }
#Import "..\..\Security\SECURITY_QUALITY_OF_SERVICE.ahk" { SECURITY_QUALITY_OF_SERVICE }
#Import ".\CONVINFO_CONVERSATION_STATE.ahk" { CONVINFO_CONVERSATION_STATE }

/**
 * Contains information about a Dynamic Data Exchange (DDE) conversation.
 * @see https://learn.microsoft.com/windows/win32/api/ddeml/ns-ddeml-convinfo
 * @namespace Windows.Win32.System.DataExchange
 */
export default struct CONVINFO {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The structure's size, in bytes.
     */
    cb : UInt32

    /**
     * Type: <b>DWORD_PTR</b>
     * 
     * Application-defined data.
     */
    hUser : IntPtr

    /**
     * Type: <b>HCONV</b>
     * 
     * A handle to the partner application in the DDE conversation. This member is zero if the partner has not registered itself (using the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function) to make DDEML function calls. An application should not pass this member to any DDEML function except <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddequeryconvinfo">DdeQueryConvInfo</a>.
     */
    hConvPartner : HCONV

    /**
     * Type: <b>HSZ</b>
     * 
     * A handle to the service name of the partner application.
     */
    hszSvcPartner : HSZ

    /**
     * Type: <b>HSZ</b>
     * 
     * A handle to the service name of the server application that was requested for connection.
     */
    hszServiceReq : HSZ

    /**
     * Type: <b>HSZ</b>
     * 
     * A handle to the name of the requested topic.
     */
    hszTopic : HSZ

    /**
     * Type: <b>HSZ</b>
     * 
     * A handle to the name of the requested item. This member is transaction specific.
     */
    hszItem : HSZ

    /**
     * Type: <b>UINT</b>
     * 
     * The format of the data being exchanged. This member is transaction specific.
     */
    wFmt : UInt32

    /**
     * Type: <b>UINT</b>
     */
    wType : DDE_CLIENT_TRANSACTION_TYPE

    /**
     * Type: <b>UINT</b>
     */
    wStatus : CONVINFO_STATUS

    /**
     * Type: <b>UINT</b>
     */
    wConvst : CONVINFO_CONVERSATION_STATE

    /**
     * Type: <b>UINT</b>
     * 
     * The error value associated with the last transaction.
     */
    wLastError : UInt32

    /**
     * Type: <b>HCONVLIST</b>
     * 
     * A handle to the conversation list if the handle to the current conversation is in a conversation list. This member is <b>NULL</b> if the conversation is not in a conversation list.
     */
    hConvList : HCONVLIST

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ddeml/ns-ddeml-convcontext">CONVCONTEXT</a></b>
     * 
     * The conversation context.
     */
    ConvCtxt : CONVCONTEXT

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window of the calling application involved in the conversation.
     */
    hwnd : HWND

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window of the partner application involved in the current conversation.
     */
    hwndPartner : HWND

}
