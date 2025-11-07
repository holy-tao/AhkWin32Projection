#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINEREQMAKECALL structure describes a request initiated by a call to the lineGetRequest function.
 * @remarks
 * 
 * This structure may not be extended.
 * 
 * The <b>szDestAddress</b> member contains the address of the remote party; the other members are useful for logging purposes. An application must use this structure to interpret the request buffer it received from 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetrequest">lineGetRequest</a> with the LINEREQUESTMODE_MAKECALL request mode.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tapi/ns-tapi-linereqmakecall
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 * @charset ANSI
 */
class LINEREQMAKECALL extends Win32Struct
{
    static sizeof => 240

    static packingSize => 1

    /**
     * <b>Null</b>-terminated destination address of the make-call request. The address can use the canonical address format or the dialable address format. The maximum length of the address is TAPIMAXDESTADDRESSSIZE characters, which includes the <b>NULL</b> terminator. Longer strings are truncated.
     * @type {String}
     */
    szDestAddress {
        get => StrGet(this.ptr + 0, 79, "UTF-8")
        set => StrPut(value, this.ptr + 0, 79, "UTF-8")
    }

    /**
     * <b>Null</b>-terminated user-friendly application name or filename of the application that originated the request. The maximum length of the address is TAPIMAXAPPNAMESIZE characters, which includes the <b>NULL</b> terminator.
     * @type {String}
     */
    szAppName {
        get => StrGet(this.ptr + 80, 39, "UTF-8")
        set => StrPut(value, this.ptr + 80, 39, "UTF-8")
    }

    /**
     * <b>Null</b>-terminated user-friendly called-party name. The maximum length of the called-party information is TAPIMAXCALLEDPARTYSIZE characters, which includes the <b>NULL</b> terminator.
     * @type {String}
     */
    szCalledParty {
        get => StrGet(this.ptr + 120, 39, "UTF-8")
        set => StrPut(value, this.ptr + 120, 39, "UTF-8")
    }

    /**
     * <b>Null</b>-terminated comment about the call request. The maximum length of the comment string is TAPIMAXCOMMENTSIZE characters, which includes the <b>NULL</b> terminator.
     * @type {String}
     */
    szComment {
        get => StrGet(this.ptr + 160, 79, "UTF-8")
        set => StrPut(value, this.ptr + 160, 79, "UTF-8")
    }
}
