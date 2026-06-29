#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HSZ.ahk" { HSZ }

/**
 * Contains a DDE service name and topic name. A DDE server application can use this structure during an XTYP_WILDCONNECT transaction to enumerate the service-topic pairs that it supports.
 * @see https://learn.microsoft.com/windows/win32/api/ddeml/ns-ddeml-hszpair
 * @namespace Windows.Win32.System.DataExchange
 */
export default struct HSZPAIR {
    #StructPack 8

    /**
     * Type: <b>HSZ</b>
     * 
     * A handle to the service name.
     */
    hszSvc : HSZ

    /**
     * Type: <b>HSZ</b>
     * 
     * A handle to the topic name.
     */
    hszTopic : HSZ

}
