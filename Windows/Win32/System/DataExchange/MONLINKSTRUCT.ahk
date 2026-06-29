#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\HCONV.ahk" { HCONV }
#Import ".\HSZ.ahk" { HSZ }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains information about a Dynamic Data Exchange (DDE) advise loop. A DDE monitoring application can use this structure to obtain information about an advise loop that has started or ended.
 * @remarks
 * Because string handles are local to the process, the <b>hszSvc</b>, <b>hszTopic</b>, and <b>hszItem</b> members are global atoms. 
 * 
 * The 
 * 				<b>hConvClient</b> and <b>hConvServer</b> members of the <b>MONLINKSTRUCT</b> structure do not hold the same value as would be seen by the applications engaged in the conversation. Instead, they hold a globally unique pair of values that identify the conversation.
 * @see https://learn.microsoft.com/windows/win32/api/ddeml/ns-ddeml-monlinkstruct
 * @namespace Windows.Win32.System.DataExchange
 */
export default struct MONLINKSTRUCT {
    #StructPack 8

    /**
     * Type: <b>UINT</b>
     * 
     * The structure's size, in bytes.
     */
    cb : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The Windows time at which the advise loop was started or ended. Windows time is the number of milliseconds that have elapsed since the system was booted.
     */
    dwTime : UInt32

    /**
     * Type: <b>HANDLE</b>
     * 
     * A handle to a task (application instance) that is a partner in the advise loop.
     */
    hTask : HANDLE

    /**
     * Type: <b>BOOL</b>
     * 
     * Indicates whether an advise loop was successfully established. A value of <b>TRUE</b> indicates an advise loop was established; <b>FALSE</b> indicates it was not.
     */
    fEstablished : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * Indicates whether the XTYPF_NODATA flag is set for the advise loop. A value of <b>TRUE</b> indicates the flag is set; <b>FALSE</b> indicates it is not.
     */
    fNoData : BOOL

    /**
     * Type: <b>HSZ</b>
     * 
     * A handle to the service name of the server in the advise loop.
     */
    hszSvc : HSZ

    /**
     * Type: <b>HSZ</b>
     * 
     * A handle to the topic name on which the advise loop is established.
     */
    hszTopic : HSZ

    /**
     * Type: <b>HSZ</b>
     * 
     * A handle to the item name that is the subject of the advise loop.
     */
    hszItem : HSZ

    /**
     * Type: <b>UINT</b>
     * 
     * The format of the data exchanged (if any) during the advise loop.
     */
    wFmt : UInt32

    /**
     * Type: <b>BOOL</b>
     * 
     * Indicates whether the link notification came from the server. A value of <b>TRUE</b> indicates the notification came from the server; <b>FALSE</b> indicates otherwise.
     */
    fServer : BOOL

    /**
     * Type: <b>HCONV</b>
     * 
     * A handle to the server conversation.
     */
    hConvServer : HCONV

    /**
     * Type: <b>HCONV</b>
     * 
     * A handle to the client conversation.
     */
    hConvClient : HCONV

}
