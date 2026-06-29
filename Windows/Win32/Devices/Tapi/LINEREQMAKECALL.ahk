#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The LINEREQMAKECALL structure describes a request initiated by a call to the lineGetRequest function.
 * @remarks
 * This structure may not be extended.
 * 
 * The <b>szDestAddress</b> member contains the address of the remote party; the other members are useful for logging purposes. An application must use this structure to interpret the request buffer it received from 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetrequest">lineGetRequest</a> with the LINEREQUESTMODE_MAKECALL request mode.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-linereqmakecall
 * @namespace Windows.Win32.Devices.Tapi
 * @charset ANSI
 */
export default struct LINEREQMAKECALL {
    #StructPack 1

    /**
     * <b>Null</b>-terminated destination address of the make-call request. The address can use the canonical address format or the dialable address format. The maximum length of the address is TAPIMAXDESTADDRESSSIZE characters, which includes the <b>NULL</b> terminator. Longer strings are truncated.
     */
    szDestAddress : CHAR[80]

    /**
     * <b>Null</b>-terminated user-friendly application name or filename of the application that originated the request. The maximum length of the address is TAPIMAXAPPNAMESIZE characters, which includes the <b>NULL</b> terminator.
     */
    szAppName : CHAR[40]

    /**
     * <b>Null</b>-terminated user-friendly called-party name. The maximum length of the called-party information is TAPIMAXCALLEDPARTYSIZE characters, which includes the <b>NULL</b> terminator.
     */
    szCalledParty : CHAR[40]

    /**
     * <b>Null</b>-terminated comment about the call request. The maximum length of the comment string is TAPIMAXCOMMENTSIZE characters, which includes the <b>NULL</b> terminator.
     */
    szComment : CHAR[80]

}
