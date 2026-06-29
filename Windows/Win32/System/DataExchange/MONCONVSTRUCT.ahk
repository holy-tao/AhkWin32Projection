#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\HCONV.ahk" { HCONV }
#Import ".\HSZ.ahk" { HSZ }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains information about a Dynamic Data Exchange (DDE) conversation. A DDE monitoring application can use this structure to obtain information about a conversation that has been established or has terminated.
 * @remarks
 * Because string handles are local to the process, the <b>hszSvc</b> and <b>hszTopic</b> members are global atoms. Similarly, conversation handles are local to the instance; therefore, the <b>hConvClient</b> and <b>hConvServer</b> members are window handles. 
 * 
 * The <b>hConvClient</b> and <b>hConvServer</b> members of the <b>MONCONVSTRUCT</b> structure do not hold the same value as would be seen by the applications engaged in the conversation. Instead, they hold a globally unique pair of values that identify the conversation.
 * @see https://learn.microsoft.com/windows/win32/api/ddeml/ns-ddeml-monconvstruct
 * @namespace Windows.Win32.System.DataExchange
 */
export default struct MONCONVSTRUCT {
    #StructPack 8

    /**
     * Type: <b>UINT</b>
     * 
     * The structure's size, in bytes.
     */
    cb : UInt32

    /**
     * Type: <b>BOOL</b>
     * 
     * Indicates whether the conversation is currently established. A value of <b>TRUE</b> indicates the conversation is established; <b>FALSE</b> indicates it is not.
     */
    fConnect : BOOL

    /**
     * Type: <b>DWORD</b>
     * 
     * The Windows time at which the conversation was established or terminated. Windows time is the number of milliseconds that have elapsed since the system was booted.
     */
    dwTime : UInt32

    /**
     * Type: <b>HANDLE</b>
     * 
     * A handle to a task (application instance) that is a partner in the conversation.
     */
    hTask : HANDLE

    /**
     * Type: <b>HSZ</b>
     * 
     * A handle to the service name on which the conversation is established.
     */
    hszSvc : HSZ

    /**
     * Type: <b>HSZ</b>
     * 
     * A handle to the topic name on which the conversation is established.
     */
    hszTopic : HSZ

    /**
     * Type: <b>HCONV</b>
     * 
     * A handle to the client conversation.
     */
    hConvClient : HCONV

    /**
     * Type: <b>HCONV</b>
     * 
     * A handle to the server conversation.
     */
    hConvServer : HCONV

}
